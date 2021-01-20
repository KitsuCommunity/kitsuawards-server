module Types
    class YearType < Types::BaseObject
        description "Year informations"
        field :id,    Integer, null:false
        field :start, String, null: false
        field :end, String, null: false
        field :description, String, null: false
        field :categories, [Types::CategoryType], null: false
        field :show_results, String, null: false
        field :judges, [Types::JudgeType], null: false
    end
end  