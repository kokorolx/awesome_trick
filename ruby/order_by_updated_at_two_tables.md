# Get record of two tables, order by updated_at

```ruby
  records = ActiveRecord::Base.connection.execute(
      "SELECT posts.created_at, posts.id, 'post' as flag FROM posts " \
      "WHERE (posts.type = 'Post::UserStep' OR posts.type IS NULL) UNION ALL " \
      "SELECT users.created_at, users.id, 'user' as flag FROM users WHERE confirmed_at IS NOT NULL UNION ALL " \
      "SELECT challenges.created_at, challenges.id, 'challenges' as flag FROM challenges " \
      "ORDER BY created_at DESC LIMIT #{@items_per_page} OFFSET #{@items_per_page * (@page - 1)}"
    )
```

## Result:
```json
[{"created_at"=>"2020-03-19 10:44:12.090779", "id"=>53, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:44:10.526124", "id"=>52, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:44:05.739823", "id"=>51, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:44:03.69406", "id"=>50, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:44:02.089942", "id"=>49, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:42:55.928963", "id"=>48, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:42:50.872023", "id"=>47, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:42:46.368693", "id"=>46, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:42:44.845971", "id"=>45, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 10:42:43.130621", "id"=>44, "flag"=>"challenges"},
 {"created_at"=>"2020-03-19 08:14:15.452851", "id"=>98, "flag"=>"user"},
 {"created_at"=>"2020-03-18 08:51:18.635794", "id"=>9, "flag"=>"user"},
 {"created_at"=>"2020-03-18 07:14:16.37076", "id"=>7, "flag"=>"user"},
 {"created_at"=>"2020-03-18 07:12:36.07622", "id"=>6, "flag"=>"user"},
 {"created_at"=>"2020-03-18 07:07:59.806351", "id"=>5, "flag"=>"user"},
 {"created_at"=>"2020-03-18 05:23:09.723142", "id"=>4, "flag"=>"user"},
 {"created_at"=>"2020-03-17 08:24:11.612964", "id"=>3, "flag"=>"user"},
 {"created_at"=>"2020-03-17 07:19:29.690574", "id"=>43, "flag"=>"challenges"},
 {"created_at"=>"2020-03-17 07:19:24.864771", "id"=>42, "flag"=>"challenges"},
 {"created_at"=>"2020-03-17 07:19:21.683196", "id"=>41, "flag"=>"challenges"}]
```
