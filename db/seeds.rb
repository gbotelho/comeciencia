# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Food.create(name: "carb_breakfast", calories: 100,
	carbohydrate: 50, protein: 10, fat: 10, size: 100, 
	breakfast: true, lunch: false, dinner: false, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false)
Food.create(name: "protein_breakfast", calories: 100,
	carbohydrate: 10, protein: 50, fat: 10, size: 100, 
	breakfast: true, lunch: false, dinner: false, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false)
Food.create(name: "fat_breakfast", calories: 100,
	carbohydrate: 10, protein: 10, fat: 50, size: 100, 
	breakfast: true, lunch: false, dinner: false, snack: false, 
	high_carbohydrate: false, high_protein: false, high_fat: true)

Food.create(name: "carb_lunch", calories: 100,
	carbohydrate: 50, protein: 10, fat: 10, size: 100, 
	breakfast: false, lunch: true, dinner: false, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false)
Food.create(name: "protein_lunch", calories: 100,
	carbohydrate: 10, protein: 50, fat: 10, size: 100, 
	breakfast: false, lunch: true, dinner: false, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false)
Food.create(name: "fat_lunch", calories: 100,
	carbohydrate: 10, protein: 10, fat: 50, size: 100, 
	breakfast: false, lunch: true, dinner: false, snack: false, 
	high_carbohydrate: false, high_protein: false, high_fat: true)

Food.create(name: "carb_dinner", calories: 100,
	carbohydrate: 50, protein: 10, fat: 10, size: 100, 
	breakfast: false, lunch: false, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false)
Food.create(name: "protein_dinner", calories: 100,
	carbohydrate: 10, protein: 50, fat: 10, size: 100, 
	breakfast: false, lunch: false, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false)
Food.create(name: "fat_dinner", calories: 100,
	carbohydrate: 10, protein: 10, fat: 50, size: 100, 
	breakfast: false, lunch: false, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: false, high_fat: true)

Food.create(name: "carb_snack", calories: 100,
	carbohydrate: 50, protein: 10, fat: 10, size: 100, 
	breakfast: false, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false)
Food.create(name: "protein_snack", calories: 100,
	carbohydrate: 10, protein: 50, fat: 10, size: 100, 
	breakfast: false, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: false)
Food.create(name: "fat_snack", calories: 100,
	carbohydrate: 10, protein: 10, fat: 50, size: 100, 
	breakfast: false, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: false, high_fat: true)

Food.create(name: "carb_breakfast_snack", calories: 100,
	carbohydrate: 50, protein: 10, fat: 10, size: 100, 
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false)
Food.create(name: "protein_lunch_dinner", calories: 100,
	carbohydrate: 10, protein: 50, fat: 10, size: 100, 
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false)
Food.create(name: "fat_breakfast_dinner", calories: 100,
	carbohydrate: 10, protein: 10, fat: 50, size: 100, 
	breakfast: true, lunch: false, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: false, high_fat: true)