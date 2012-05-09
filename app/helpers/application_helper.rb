module ApplicationHelper
	# Return the title on a per page basis
	def full_title(page_title)
		base_title = "Mozapolis"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def create_artist_css(name, value)
		name + value + "; }" unless value.blank?
	end

	def create_artist_bg(name, value)
		name + value + "); }" unless value.blank?
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
