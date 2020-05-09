module Types
    class VoteType < Types::BaseObject
        description "Votes informations"
        field :id,    Integer, null:false
        field :user_id, Integer, null: false
        field :date, String, null: false
        field :nominee, Types::NomineeType, null: false
    end
end