ActiveAdmin.register Match do
  permit_params :home_team_id, :away_team_id, :game_date, :status

  filter :name

  form do |f|
    f.inputs do
      f.input :home_team_id
      f.input :away_team_id
      f.input :game_date
      f.input :status
    end
    f.actions
  end
end
