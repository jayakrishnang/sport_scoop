ActiveAdmin.register Team do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :logo, :wins, :losses, :no_results, :net_run_rate, :short_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :logo, :wins, :losses, :no_results, :net_run_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :logo, :short_name

  form partial: 'admin/teams'

  show do
    attributes_table do
      row :name
      row :short_name
      row :logo do |team|
        image_tag url_for(team.logo)
      end
    end
  end
end
