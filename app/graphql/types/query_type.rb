# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :fetch_vote, [VoteType], null: true do
      description 'Get user\'s vote'
      argument :token, String, required: false
    end

    def fetch_vote(token:)
      return unless defined?(token)

      response = RestClient.get('https://kitsu.io/api/edge/users?filter[self]=true', { Authorization: "Bearer #{token}" })

      return unless defined?(JSON.parse(response.body)['data'][0]['id'])

      user_id = JSON.parse(response.body)['data'][0]['id']

      Vote.where(user_id: user_id)
    end

    field :year, [YearType], null: false do
      description 'Show current year information'
    end

    def year
      Year.order('start desc').limit(1)
    end
  end
end
