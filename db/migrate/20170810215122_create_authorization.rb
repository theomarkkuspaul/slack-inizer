class CreateAuthorization < ActiveRecord::Migration[5.1]
  def change
    create_table :authorizations do |t|

      t.string :access_token
      t.string :refresh_token
      t.string :auth_type, null: false

      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end