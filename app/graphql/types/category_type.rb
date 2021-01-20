module Types
    class CategoryType < Types::BaseObject
        description "Categories informations"
        field :id,    Integer, null:false
        field :name, String, null: false
        field :url, String, null: false
        field :start, String, null: false
        field :end, String, null: false
        field :subcategories, [Types::SubcategoryType], null: true
        def subcategories
            if Time.now >= object.start
                object.subcategories
            end
        end
    end
end
