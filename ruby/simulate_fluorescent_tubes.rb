require 'matrix'

# In a University, there is a classroom, in that classroom, there are 4 fluorescent tube units, each
# unit contains 4 fluorescent tubes.
# The classroom is used 15 hours a day, 5 times a week, 9 months a year.
# Every fluorescent tube works for a fixed amount of hours, that amount is returned by a function
# called "rand()" that returns an integer number from 100 to 200 that represents the number of
# hours that the fluorescent tube will work before breaking.
# Once 2 fluorescent tubes fail in a single unit, you should replace all 4 tubes.
# Each fluorescent tube costs 7 U$D.

# The algorithm should print:
# 1. How many fluorescent tubes were broken in 1 year in that classroom?
# 2. How much money do fluorescent tubes cost the University per year per classroom?

def random_lifetime
  rand(100..200)
end

# Define a function to replace tubes in a unit
def replace_unit_tubes(unit)
  unit.map { random_lifetime }
end

# Define a function to simulate the cost of replacing fluorescent tubes in a classroom for a year
def simulate_cost_and_broken_tubes_each
  units = 4
  tubes_per_unit = 4
  hours_per_day = 15
  days_per_week = 5
  weeks_per_year = 9 * 4
  cost_per_tube = 7

  total_cost = 0
  total_broken = 0
  change_all = 0

  lifetimes = Array.new(units) { Array.new(tubes_per_unit) { random_lifetime } }
  weeks_per_year.times do
    days_per_week.times do
      hours_per_day.times do
        units.times do |i|
          tubes_per_unit.times do |j|
            lifetimes[i][j] -= 1

            if lifetimes[i][j] == 0
              total_broken += 1
            end
            if lifetimes[i].count { |lt| lt <= 0 } >= 2
              change_all += 1
              total_cost += cost_per_tube * tubes_per_unit
              lifetimes[i] = replace_unit_tubes(lifetimes[i])
            end
          end
        end
      end
    end
  end

  p "We only replace #{change_all} x 4 tube x 7$"
  [total_cost, total_broken]
end


def simulate_cost_and_broken_tubes_matrix
  matrix = Matrix.build(4,4) { |row, col| rand(100..200) }
  sub_matrix = Matrix.build(4,4) { |row, col| 1 }
  total_run_time = 15 * 5 * 4 * 9
  total_cost = 0
  total_broken = 0
  change_all = 0

  total_run_time.times.each do |t|
    matrix = matrix - sub_matrix

    new_matrix = matrix.row_vectors.map do |row, index|
      if row.count(0) == 1
        total_broken += 1
      end

      if row.count{ |n| n <= 0 } >= 2
        change_all += 1
        row = Vector.elements(Array.new(4) { rand(100..200) })
        total_cost += 4 * 7
      end

      row
    end

    matrix = Matrix.rows(new_matrix)
  end

  p "We only replace #{change_all} x 4 tube x 7$"
  [total_cost, total_broken]
end

p "10 times runs, starting ..... "
10.times do |i|
  puts "\n # #{i}"
  total_cost_matrix, total_broken_matrix = simulate_cost_and_broken_tubes_matrix
  total_cost_each, total_broken_each = simulate_cost_and_broken_tubes_each

  puts "\nmatrix:  broken: #{total_broken_matrix} | cost: #{total_cost_matrix} USD"
  puts "each  :  broken: #{total_broken_each} | cost: #{total_cost_each} USD"
end

