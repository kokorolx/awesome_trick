Check sidekiq job running or in schedule job?

```ruby
require 'sidekiq/api'

namespace :check_job_sidekiq do
  desc "Please refactor this code :D"
  task hello: :environment do
    working = Sidekiq::Workers.new.map do |_process_id, _thread_id, work|
      work.dig("payload", "wrapped") == "TestJob"
    end.reject(&:blank?).uniq

    schedule = Sidekiq::ScheduledSet.new.map do |queue|
        queue.value.scan("TestJob").reject(&:blank?).uniq.present?
    end

    if [working, schedule].flatten.uniq.reject(&:blank?).present?
      p "Job still running"
    else
      TestJob.perform_later
      p "Job will start later"
    end
  end
end

# bundle exec rake check_job_sidekiq:hello
```