class Profile < ActiveRecord::Base
	# un perfil *pertenece* a un usuario
	belongs_to :user
	# para el avatar
	has_attached_file :avatar, :styles => { :small => '150x150' }, :url => "/avatars/:id/:style/:basename.:extension", :path => ":rails_root/public/avatars/:id/:style/:basename.:extension"
	validates_attachment_presence :avatar
	validates_attachment_size :avatar, :less_than => 5.megabyte
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end
