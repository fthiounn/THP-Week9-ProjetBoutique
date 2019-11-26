class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
    	t.text :message
    	t.string :email
    	t.string :first_name
    	t.string :last_name
      t.timestamps
    end
  end
end
