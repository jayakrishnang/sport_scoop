ActiveAdmin.register Vault do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :raw_input
  #
  # or
  #
  # permit_params do
  #   permitted = [:team_1_id, :team_2_id, :team_1_score, :team_1_wickets, :team_1_overs, :team_1_run_rate, :team_1_extras, :team_2_score, :team_2_wickets, :team_2_overs, :team_2_run_rate, :team_2_extras, :victory_margin, :team_1_batting, :team_2_bowling, :team_2_batting, :team_1_bowling, :raw_input]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    id_column
    column :team_1
    column :team_2
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.input :raw_input
    f.input :url
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
