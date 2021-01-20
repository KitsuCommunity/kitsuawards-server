require 'rest-client'

class Mutations::SubmitVote < Mutations::BaseMutation

    argument :token, String, required: true
    argument :nomineeid, Integer, required: true

    field :vote, Types::VoteType, null: true
    field :errors, [String], null: false
    
    def resolve(token:, nomineeid:)

        response = RestClient.get("https://kitsu.io/api/edge/users?filter[self]=true", {'Authorization': 'Bearer '+token})
        # We check if the token is correct and if yes there is a userid
        if defined? JSON.parse(response.body)['data'][0]['id']
            userid = JSON.parse(response.body)['data'][0]['id']

            subcategoryid = Nominee.find(nomineeid).subcategory_id
            if Time.now > Year.last.start && Time.now < Year.last.end && Time.now > Subcategory.find(subcategoryid).category.start && Time.now < Subcategory.find(subcategoryid).category.end
                if Vote.where(user_id: userid, subcategories_id: subcategoryid).count == 0
                    vote = Vote.new(user_id: userid, nominee_id: nomineeid, subcategories_id: subcategoryid)
                else
                    vote = Vote.where(user_id: userid, subcategories_id: subcategoryid).last
                    vote.nominee_id=nomineeid
                end
                anticheat(response,userid)
                #We create the vote
                if vote.save
                    {
                        vote: vote,
                        errors: []
                    }
                #We reply with a error in case something went wrong
                else
                    {
                        vote: nil,
                        errors: vote.errors.full_messages
                    }
                end
            else
                {
                    vote: nil,
                    errors: ["Currently no awards"]
                }               
            end
        else
            {
                vote: nil,
                errors: ["Invalid token"]
            }
        end
        
    end

    def anticheat(response,userid)
        verified_email=!JSON.parse(response.body)['data'][0]['attributes']['confirmed']
        date_creation=Date.parse(JSON.parse(response.body)['data'][0]['attributes']['createdAt'])> Year.last.start
        number_entries=!(JSON.parse(response.body)['data'][0]['attributes']['ratingsCount']>10)
        username=JSON.parse(response.body)['data'][0]['attributes']['name']
        pfp=JSON.parse(response.body)['data'][0]['attributes']['avatar']==nil
        if verified_email || date_creation || number_entries || pfp
            blacklisted=Blacklist.new(user_id: userid, username: username, acc_non_verified_email: verified_email, acc_too_recent: date_creation, acc_not_enough_entries: number_entries, acc_default_pfp: pfp)
            blacklisted.save
        end
    end

end