Hanami::Model.migration do
  change do
    create_table :projects do
      primary_key :id
      foreign_key :account_id, :accounts, on_delete: :cascade, null: false

      column :url,         String
      column :name,        String, null: false
      column :owner,       String
      column :language,    String, default: 'undefined'
      column :description, String
      column :private,     FalseClass, default: false
      column :topics,      "text[]"

      column :stargazers_count, Integer

      column :starred_at, DateTime, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
