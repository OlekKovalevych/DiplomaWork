class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Invitable
      t.string :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer :invitation_limit
      t.integer :invited_by_id
      t.string :invited_by_type

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean :allow_password_change, default: false

      ## Rememberable
      t.datetime :remember_created_at

      # lockable
      t.datetime :locked_at

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## User Info
      t.change :email, :string, null: false, uniq: true

      ## Tokens
      t.text :tokens
    end

    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider], unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end

  def down
    change_table :users do |t|
      t.remove :provider
      t.remove :uid
      t.remove :invitation_token
      t.remove :invitation_created_at
      t.remove :invitation_sent_at
      t.remove :invitation_accepted_at
      t.remove :invitation_limit
      t.remove :invited_by_id
      t.remove :invited_by_type
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :allow_password_change
      t.remove :remember_created_at
      t.remove :locked_at
      t.remove :confirmation_token
      t.remove :confirmed_at
      t.remove :confirmation_sent_at
      t.remove :unconfirmed_email
      t.remove :tokens
    end
    remove_index :users, :email
  end
end