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

    field :FetchVote, [VoteType], null: false do
      description "Get users votes"
      argument :userid, Integer, required: true
    end
    def fetch_vote(userid:)
      Vote.where(user_id:  userid)
    end

  end
end
