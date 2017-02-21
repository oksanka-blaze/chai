class Cuve
  attr_accessor :name, :volume
  attr_reader :level_of_vine, :recent_activity

  ACTION_DURATIONS = {
      change: 10,
      add_vine: 20,
      remove_vine:  30
  }


  def initialize(name, volume)
    @name, @volume = name, volume
    @recent_activity = []
    @level_of_vine = 0
  end

  def change(employees)
    total_duration = calculate_total_duration(employees, :change)
    # TODO add products, complete with logic
    log_action('change', total_duration)
  end

  def add_vine(vine_count, employees)
    @level_of_vine += vine_count
    total_duration = calculate_total_duration(employees, :add_vine)
    log_action('add_vine', total_duration)
  end

  def remove_vine(vine_count, employees)
    @level_of_vine -= vine_count
    total_duration = calculate_total_duration(employees, :remove_vine)
    log_action('remove_vine', total_duration)
  end

  def transfer(cuve, vine_count, employees)
    cuve.add_vine(vine_count, employees)
    remove_vine(vine_count, employees)
  end

  private

  def calculate_total_duration(employees, action)
    employees = [employees] unless employees.kind_of?(Array)
    ACTION_DURATIONS[action] / employees.count.to_f
  end

  def log_action(action, duration)
    @recent_activity << { action: action, current_time: Time.now, duration: duration }
  end

end