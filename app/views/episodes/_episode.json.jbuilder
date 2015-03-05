json.number episode.number
json.title episode.title
json.description episode.description
json.actions render partial: "actions.html.erb", locals: { episode: episode }
