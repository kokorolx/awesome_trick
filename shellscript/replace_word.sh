// Replace all string ActiveRecord::Migration from .rb file and replace with ActiveRecord::Migration[5.2]

grep -e ActiveRecord::Migration **/*.rb -s -l | xargs sed -i "" "s|ActiveRecord::Migration|ActiveRecord::Migration[5.2]|g"
