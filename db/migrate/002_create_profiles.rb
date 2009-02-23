class CreateProfiles < ActiveRecord::Migration
	def self.up
		create_table :profiles do |t|
			t.column 'first_name', :string
			t.column 'last_name', :string
			t.column 'corporation', :string
			t.column 'occupation', :string
			t.column 'weblog_url', :string
			t.column 'twitter', :string
			t.column 'user_id', :integer
			t.timestamps
		end
	end
	def self.down
		drop_table :profiles
	end
end
