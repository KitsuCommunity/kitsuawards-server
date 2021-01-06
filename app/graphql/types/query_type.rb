require 'rest-client'

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :year, [YearType], null: false do
      description "Show current year information"
    end
    def year
      Year.order('start desc').limit(1)
    end

    field :FetchVote, [VoteType], null: true do
      description "Get users votes"
      argument :token, String, required: false
    end
    def fetch_vote(token:)
      if defined? token
        response = RestClient.get("https://kitsu.io/api/edge/users?filter[self]=true", {'Authorization': 'Bearer '+token})
        if defined? JSON.parse(response.body)['data'][0]['id']
          userid = JSON.parse(response.body)['data'][0]['id']
          Vote.where(user_id:  userid)
        end
      end
    end

    field :Results, [String], null: true do
      description "Show current year information"
      argument :token, String, required: false
    end
    def results(token:)
      if Year.last.show_results
        judges=Judge.all.map(&:user_id)
        judges_votes=Vote.where(user_id: judges)
        blacklist=Blacklist.where(acc_too_recent: true).or(Blacklist.where(acc_not_enough_entries: true)).or(Blacklist.where(acc_non_verified_email: true)).or(Blacklist.where(acc_default_pfp: true)).map(&:user_id).uniq
        users_votes=Vote.where.not(user_id: blacklist)
        {
          judges: judges_votes.group(:nominee_id).count(:user_id),
          users: users_votes.group(:nominee_id).count(:user_id)
        }
      elsif defined? token
        response = RestClient.get("https://kitsu.io/api/edge/users?filter[self]=true", {'Authorization': 'Bearer '+token})
        if defined? JSON.parse(response.body)['data'][0]['id']
          userid=JSON.parse(response.body)['data'][0]['id']
          judges=Judge.all.map(&:user_id)
          judges_votes=Vote.where(user_id: judges)
          blacklist=Blacklist.where(acc_too_recent: true).or(Blacklist.where(acc_not_enough_entries: true)).or(Blacklist.where(acc_non_verified_email: true)).or(Blacklist.where(acc_default_pfp: true)).map(&:user_id).uniq
          users_votes=Vote.where.not(user_id: blacklist)
          if userid=="171273" or userid=="195642"
            {
              judges: judges_votes.group(:nominee_id).count(:user_id),
              users: users_votes.group(:nominee_id).count(:user_id)
            }
          end
        end
      end
    end

  end
end
