# frozen_string_literal: true

require 'rest-client'

module Types
  class NomineeType < Types::BaseObject
    description 'Nominees information'
    field :id, Integer, null: false
    field :name, String, null: false
    field :media, String, null: false
    field :subcategory_id, Integer, null: false
    field :judges_results, Integer, null: true do
      argument :token, String, required: false
    end

    def judges_results(token: nil)
      if Year.last.show_results
        judges = Judge.all.map(&:user_id)

        Vote.where(nominee: object, user_id: judges).count
      elsif defined?(token)
        response = RestClient.get('https://kitsu.io/api/edge/users?filter[self]=true', { Authorization: "Bearer #{token}" })

        if defined?(JSON.parse(response.body)['data'][0]['id'])
          user_id = JSON.parse(response.body)['data'][0]['id']

          if %w[195642 171273].include?(user_id)
            judges = Judge.all.map(&:user_id)

            Vote.where(nominee: object, user_id: judges).count
          end
        end
      end
    end

    field :users_results, Integer, null: true do
      argument :token, String, required: false
    end

    def users_results(token: nil)
      if Year.last.show_results
        blacklist = Blacklist.where(acc_too_recent: true).or(Blacklist.where(acc_not_enough_entries: true)).or(Blacklist.where(acc_non_verified_email: true)).or(Blacklist.where(acc_default_pfp: true)).map(&:user_id).uniq
        judges = Judge.all.map(&:user_id)
        judges_votes = Vote.where(user_id: judges)

        Vote.where.not(id: judges_votes, user_id: blacklist).where(nominee: object).count
      elsif defined?(token)
        response = RestClient.get('https://kitsu.io/api/edge/users?filter[self]=true', { Authorization: "Bearer #{token}" })

        if defined?(JSON.parse(response.body)['data'][0]['id'])
          user_id = JSON.parse(response.body)['data'][0]['id']

          if %w[195642 171273].include?(user_id)
            judges = Judge.all.map(&:user_id)

            Vote.where(nominee: object, user_id: judges).count
          end
        end
      end
    end
  end
end
