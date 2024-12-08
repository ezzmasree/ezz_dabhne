import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wibsite/home_page/food_page/meals.dart';

class FoodForToday extends StatelessWidget {
  const FoodForToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Food Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<MealProvider>(
        builder: (context, mealProvider, child) {
          // Group meals by category
          final Map<String, List<Meal>> groupedMeals = {};
          for (var meal in mealProvider.meals) {
            if (!groupedMeals.containsKey(meal.category)) {
              groupedMeals[meal.category] = [];
            }
            groupedMeals[meal.category]?.add(meal);
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: groupedMeals.keys.map((category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...groupedMeals[category]!.map((meal) {
                        return MealCard(
                          meal: meal,
                          onRemove: () {
                            // Remove the meal
                            mealProvider.removeMeal(meal);
                          },
                        );
                      // ignore: unnecessary_to_list_in_spreads
                      }).toList(),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback onRemove;

  const MealCard({super.key, 
    required this.meal,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Meal Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${meal.time} | 🔥 ${meal.calories} cal',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),

            // Remove icon
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}


