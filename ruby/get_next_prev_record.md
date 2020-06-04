I'm using PostgreSQL and UUID for primary key, so we cant use the last_id + 1 or last_id - 1 to get next and prev record:

```ruby
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def next_previous
    sql = "select *
      from (
          select  id, created_at,
                  lag(id) over (order by created_at asc, updated_at asc, id asc) as prev,
                  lead(id) over (order by created_at asc, updated_at asc, id asc) as next
          from #{self.class.table_name}
          ) x
      where id = '#{id}';"

    ActiveRecord::Base.connection.execute(sql).try(:first)
  end

  def next_record
    sql = "select *
      from (
          select id, lead(id) over (order by created_at asc, updated_at asc, id asc) as next
          from #{self.class.table_name}
          ) x
      where id = '#{id}';"

    ActiveRecord::Base.connection.execute(sql).try(:first)
  end

  def prev_record
    sql = "select *
      from (
          select id, lag(id) over (order by created_at asc, updated_at asc, id asc) as next
          from #{self.class.table_name}
          ) x
      where id = '#{id}';"

    ActiveRecord::Base.connection.execute(sql).try(:first)
  end
end
```

When using:
```ruby
### To check the record is the last
Listing.order(created_at: :asc, updated_at: :asc).last.next_previous
 => {"id"=>"312425fe-9a3d-4f88-ac4c-fbf515ca780d", "created_at"=>2020-06-04 02:10:35 UTC, "prev"=>"533e3dbf-6c30-4b23-a7ac-878c4494dacd", "next"=>nil}
 ### To check the record is the first
Listing.order(created_at: :asc, updated_at: :asc).first.next_previous
 => {"id"=>"97652b4e-a15b-4229-bfda-0aaa7dc29954", "created_at"=>2020-05-26 03:33:52 UTC, "prev"=>nil, "next"=>"d404ce5e-021b-4cf2-b586-0c4e6c38fd01"}
```

The SQL will be:
```sql
  Listing Load (23.9ms)  SELECT "listings".* FROM "listings" ORDER BY "listings"."created_at" DESC, "listings"."updated_at" DESC LIMIT $1  [["LIMIT", 1]]
   (133.4ms)  select *
      from (
          select id, lag(id) over (order by created_at asc, updated_at asc, id asc) as next
          from listings
          ) x
      where id = '312425fe-9a3d-4f88-ac4c-fbf515ca780d';
```
