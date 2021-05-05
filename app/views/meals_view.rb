class MealsView

  def list(array_of_meals)
    array_of_meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - #{meal.price}"
    end
  end

  def ask_for(meal_attribute)
    puts "What's the #{meal_attribute}?"
    gets.chomp
  end

  def ask_for_index
    puts "which index?"
    gets.chomp.to_i - 1
  end
end
