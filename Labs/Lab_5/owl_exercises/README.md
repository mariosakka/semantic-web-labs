# OWL Exercise Files

Each .owl file is a standalone Turtle/RDF ontology snapshot for the matching tutorial exercise.
The files are cumulative: for example, exercise_32.owl includes the work from exercises 2 through 32.

Exercise 16 is included as its own snapshot, but the tutorial only opens the restriction editor in that step.
The actual hasBase some PizzaBase axiom is committed in exercise_17.owl.

Reasoner-only exercises are included as separate snapshots even when they do not change asserted axioms.
No Exercise 44 screenshot was provided, so exercise_44.owl preserves the same asserted ontology state as exercise_43.owl.

Generated files:

- exercise_02.owl: Created a new OWL ontology using the tutorial ontology IRI.
- exercise_03.owl: Added the tutorial ontology comment annotation.
- exercise_04.owl: Added Pizza, PizzaTopping, and PizzaBase as classes.
- exercise_05.owl: Made Pizza, PizzaTopping, and PizzaBase disjoint.
- exercise_06.owl: Added ThinAndCrispyBase and DeepPanBase as disjoint subclasses of PizzaBase.
- exercise_07.owl: Added the pizza topping hierarchy and made sibling toppings disjoint.
- exercise_08.owl: Created the hasIngredient object property.
- exercise_09.owl: Created hasTopping and hasBase as sub-properties of hasIngredient.
- exercise_10.owl: Created inverse properties for hasIngredient, hasBase, and hasTopping.
- exercise_11.owl: Made hasIngredient and its inverse isIngredientOf transitive.
- exercise_12.owl: Made hasBase functional.
- exercise_13.owl: Set the range of hasTopping to PizzaTopping.
- exercise_14.owl: Set the domain of hasTopping to Pizza.
- exercise_15.owl: Set domains and ranges for hasBase and isBaseOf.
- exercise_16.owl: Opened the restriction editor for Pizza; no committed OWL axiom yet.
- exercise_17.owl: Added the hasBase some PizzaBase restriction to Pizza.
- exercise_18.owl: Added NamedPizza and MargheritaPizza, with a comment on MargheritaPizza.
- exercise_19.owl: Added hasTopping some MozzarellaTopping to MargheritaPizza.
- exercise_20.owl: Added hasTopping some TomatoTopping to MargheritaPizza.
- exercise_21.owl: Created AmericanaPizza by cloning MargheritaPizza and adding a pepperoni topping restriction.
- exercise_22.owl: Created AmericanHotPizza and SohoPizza with their additional topping restrictions.
- exercise_23.owl: Made subclasses of NamedPizza disjoint from each other.
- exercise_24.owl: Added ProbeInconsistentTopping as a subclass of both CheeseTopping and VegetableTopping.
- exercise_25.owl: Classified the ontology to show ProbeInconsistentTopping as inconsistent.
- exercise_26.owl: Removed the disjoint axiom between CheeseTopping and VegetableTopping.
- exercise_27.owl: Restored the disjoint axiom between CheeseTopping and VegetableTopping.
- exercise_28.owl: Created CheesyPizza as a pizza with at least one CheeseTopping.
- exercise_29.owl: Converted CheesyPizza into a defined class.
- exercise_30.owl: Classified the ontology to compute subclasses of CheesyPizza.
- exercise_31.owl: Created VegetarianPizza with an only restriction over cheese or vegetable toppings.
- exercise_32.owl: Converted VegetarianPizza into a defined class.
- exercise_33.owl: Classified the ontology while demonstrating open world reasoning.
- exercise_34.owl: Added a hasTopping closure axiom to MargheritaPizza.
- exercise_35.owl: Added a hasTopping closure axiom to SohoPizza.
- exercise_36.owl: Automatically added a hasTopping closure axiom to AmericanaPizza.
- exercise_37.owl: Automatically added a hasTopping closure axiom to AmericanHotPizza.
- exercise_38.owl: Classified the ontology after adding closure axioms.
- exercise_39.owl: Created a spiciness value partition and the hasSpiciness property.
- exercise_40.owl: Specified hasSpiciness restrictions on bottom-level pizza toppings.
- exercise_41.owl: Created SpicyPizza as a defined class.
- exercise_42.owl: Classified the ontology to identify spicy pizzas.
- exercise_43.owl: Created InterestingPizza with a minimum cardinality of three toppings.
- exercise_44.owl: No provided screenshot; preserved the exercise 43 asserted ontology state.
- exercise_45.owl: Created FourCheesePizza with exactly four cheese toppings.
- exercise_46.owl: Created the hasCalorificContentValue datatype property.
- exercise_47.owl: Created example pizza individuals with calorific content values.
- exercise_48.owl: Added a datatype restriction stating that all pizzas have an integer calorific value.
- exercise_49.owl: Created HighCaloriePizza and LowCaloriePizza as defined classes using datatype ranges.
- exercise_50.owl: Classified pizza individuals based on hasCalorificContentValue.
- exercise_51.owl: Made hasCalorificContentValue functional and added a temporary inconsistent test individual.
- exercise_52.owl: Created NonVegetarianPizza as a subclass of Pizza and disjoint with VegetarianPizza.
- exercise_53.owl: Constrained NonVegetarianPizza to Pizza and not VegetarianPizza.
- exercise_54.owl: Converted NonVegetarianPizza into a defined class.
- exercise_55.owl: Classified the ontology after defining NonVegetarianPizza.
- exercise_56.owl: Created UnclosedPizza as a NamedPizza with a mozzarella topping.
- exercise_57.owl: Classified the ontology after creating UnclosedPizza.
- exercise_58.owl: Created Country and populated it with country individuals.
- exercise_59.owl: Created hasCountryOfOrigin and specified that MozzarellaTopping has value Italy.
- exercise_60.owl: Converted Country into an enumerated class.
