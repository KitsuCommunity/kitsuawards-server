# frozen_string_literal: true

require 'rest-client'

module Mutations
  class SubmitVote < Mutations::BaseMutation
    argument :nominee_id, Integer, required: true
    argument :token, String, required: true

    field :errors, [String], null: false
    field :vote, Types::VoteType, null: true

    def anticheat(response, user_id)
      date_creation = Date.parse(JSON.parse(response.body)['data'][0]['attributes']['createdAt']) > Year.last.start
      number_entries = JSON.parse(response.body)['data'][0]['attributes']['ratingsCount'] <= 10
      pfp = JSON.parse(response.body)['data'][0]['attributes']['avatar'].nil?
      username = JSON.parse(response.body)['data'][0]['attributes']['name']
      verified_email = !JSON.parse(response.body)['data'][0]['attributes']['confirmed']

      return unless verified_email || date_creation || number_entries || pfp

      blacklisted = Blacklist.new(acc_default_pfp: pfp, acc_non_verified_email: verified_email, acc_not_enough_entries: number_entries, acc_too_recent: date_creation, user_id: user_id, username: username)

      blacklisted.save
    end

    def resolve(token:, nominee_id:)
      response = RestClient.get('https://kitsu.io/api/edge/users?filter[self]=true', { Authorization: "Bearer #{token}" })

      if defined?(JSON.parse(response.body)['data'][0]['id'])
        subcategory_id = Nominee.find(nominee_id).subcategory_id
        user_id = JSON.parse(response.body)['data'][0]['id']

        if Time.zone.now > Year.last.start && Time.zone.now < Year.last.end && Time.zone.now > Subcategory.find(subcategory_id).category.start && Time.zone.now < Subcategory.find(subcategory_id).category.end
          if Vote.where(subcategories_id: subcategory_id, user_id: user_id).count.zero?
            vote = Vote.new(nominee_id: nominee_id, subcategories_id: subcategory_id, user_id: user_id)
          else
            vote = Vote.where(subcategories_id: subcategory_id, user_id: user_id).last
            vote.nominee_id = nominee_id
          end

          anticheat(response, user_id)

          if vote.save
            {
              errors: [],
              vote: vote
            }
          else
            {
              errors: vote.errors.full_messages,
              vote: nil
            }
          end
        else
          {
            errors: ['Currently no awards'],
            vote: nil
          }
        end
      else
        {
          errors: ['Invalid token'],
          vote: nil
        }
      end
    end
  end
end
