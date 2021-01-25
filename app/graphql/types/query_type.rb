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

    field :fetchvote, [VoteType], null: true do
      description "Get users votes"
      argument :token, String, required: false
    end
    def fetchvote(token:)
      if defined? token
        response = RestClient.get("https://kitsu.io/api/edge/users?filter[self]=true", {'Authorization': 'Bearer '+token})
        if defined? JSON.parse(response.body)['data'][0]['id']
          userid = JSON.parse(response.body)['data'][0]['id']
          Vote.where(user_id:  userid)
        end
      end
    end

  end
end
