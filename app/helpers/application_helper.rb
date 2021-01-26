module ApplicationHelper

  def full_name(user)
   user.first_name + user.last_name
  end

	def kana_full_name(user)
		user.kana_first_name + user.kana_last_name
	end

end
