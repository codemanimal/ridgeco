class Contact < MailForm::Base
	attribute :name, :validate => true
	attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :phone, :validate => true
	attribute :listing_id
	attribute :message
	attribute :nickname, :captcha => true

	def headers
		{
			:subject => 'RidgeCo Contact Form Message',
			:to => 'ridgecopropertiesinfo@gmail.com <ridgecopropertiesinfo@gmail.com>',
			:from => %("#{name}" <#{email}>),
			:reply_to => %("#{name}" <#{email}>)
		}
	end
end 