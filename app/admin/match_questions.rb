ActiveAdmin.register MatchQuestion do
  permit_params :match_id, :question, :winner_id

  filter :name

  form do |f|
    f.inputs do
      f.input :match_id
      f.input :question
      f.input :winner_id
    end
    f.actions
  end

end
