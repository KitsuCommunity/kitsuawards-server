require 'rest-client'


class Mutations::SubmitVote < Mutations::BaseMutation

    argument :token, String, required: true
    argument :nomineeid, Integer, required: true

    field :vote, Types::VoteType, null: true
    field :errors, [String], null: false
    
    def resolve(token:, nomineeid:)

        response = RestClient.get("https://kitsu.io/api/edge/users?filter[self]=true", {'Authorization': 'Bearer '+token})
        userid = JSON.parse(response.body)['data'][0]['id']
        # We check if the token is correct and if yes there is a userid
        if defined? userid

            subcategoryid = Nominee.find(nomineeid).subcategory_id
            
            if Time.now > Year.last.start && Time.now < Year.last.end
                anticheat = DateTime.parse(JSON.parse(response.body)['data'][0]['attributes']['createdAt']) < Year.last.start
                vote = Vote.new(user_id: userid, nominee_id: nomineeid, subcategories_id: subcategoryid,verified: anticheat)
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


end