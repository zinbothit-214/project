ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
filter :apps

index do 
	selectable_column
	column :email do |email|
		link_to(email.email, admin_user_path(email))
	end
	column :apps
	column :created_at
	column :updated_at
end

config.batch_actions = false
	permit_params :email, :password, :app_id

form partial: 'form'
form do |f|
    f.inputs "App" do  
      f.inputs :email
      f.inputs :password
    end
    f.actions
  end

end
