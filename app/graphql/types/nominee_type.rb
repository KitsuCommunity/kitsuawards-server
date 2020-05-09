module Types
    class NomineeType < Types::BaseObject
        description "Nominees informations"
        field :id,    Integer, null:false
        field :name,  String, null: false
        field :media, String, null: false
        field :subcategory_id, Integer, null: false
    end
end 