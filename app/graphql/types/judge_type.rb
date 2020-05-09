module Types
    class JudgeType < Types::BaseObject
        description "Judges informations"
        field :id,    Integer, null:false
        field :user_id, ID, null: false
    end
end