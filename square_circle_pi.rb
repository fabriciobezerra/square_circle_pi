require 'benchmark'

class CalculatePi
  attr_accessor :total_darts, :darts_inside

  def initialize
    @total_darts = 0
    @darts_inside = 0
  end

  def do_pi
    30000000.times do
      x = rand
      y = rand
      inside = ((x ** 2) + (y ** 2)) ** 0.5 <= 1
      @total_darts += 1
      @darts_inside += 1 if inside
    end

    puts "PI:           #{((darts_inside.to_f/total_darts.to_f) * 4)}"
  end

  def do_pi_sqrt
    30000000.times do
      x = rand
      y = rand
      inside = Math.sqrt((x ** 2) + (y ** 2)) <= 1
      @total_darts += 1
      @darts_inside += 1 if inside
    end

    puts "PI:           #{((darts_inside.to_f/total_darts.to_f) * 4)}"
  end
end

Benchmark.bmbm do |x|
  x.report('** 0.5   ') { CalculatePi.new.do_pi }
  x.report('Math.sqrt') { CalculatePi.new.do_pi_sqrt }
end

