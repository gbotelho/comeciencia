# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_gabi = User.create(email: "gabriela.cbotelho@gmail.com", user_type: "admin", password: "afelicidadeeocaminho")

hipertensao = Disease.create(name: "Hipertensao")
alzheimer = Disease.create(name: "Alzheimer")
colesterol = Disease.create(name: "Colesterol")
ovulacao = Disease.create(name: "Baixa ovulacao (somente mulheres)")

pao_integral = Food.create(name: "pão integral", calories: 68,
	carbohydrate: 12.27, protein: 2.37, fat: 1.07, size: 26, unit: "g",
	breakfast: true, lunch: true, dinner: true, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/pao-integral.jpg"))
aveia = Food.create(name: "aveia", calories: 104,
	carbohydrate: 17, protein: 4.3, fat: 2.2, size: 30, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/aveia.jpg"))
feijao_preto = Food.create(name: "feijão preto", calories: 339,
	carbohydrate: 63, protein: 21, fat: 0.9, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/feijao-preto.jpg"))
arroz_integral = Food.create(name: "arroz integral", calories: 111,
	carbohydrate: 22.96, protein: 2.58, fat: 0.9, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/arroz-integral.jpg"))
macarrao_integral = Food.create(name: "macarrão integral", calories: 270,
	carbohydrate: 56, protein: 9.2, fat: 1.1, size: 80, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/macarrao-integral.jpg"))
cookies_de_aveia = Food.create(name: "cookies de aveia", calories: 112,
	carbohydrate: 17.18, protein: 1.55, fat: 4.52, size: 25, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/cookies-aveia.jpg"))
maca = Food.create(name: "maca", calories: 72,
	carbohydrate: 19.06, protein: 0.36, fat: 0.23, size: 150, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/maca.jpg"))
pera = Food.create(name: "pera", calories: 96,
	carbohydrate: 25.66, protein: 0.63, fat: 0.2, size: 180, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/pera.jpg"))
morango = Food.create(name: "morango", calories: 33,
	carbohydrate: 8, protein: 0.7, fat: 0.3, size: 100, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/morango.jpg"))
alface = Food.create(name: "alface",calories: 15,
	carbohydrate: 2.9, protein: 1.4, fat: 0.2, size: 100, unit: "g", 
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/alface.jpg"))
cenoura = Food.create(name: "cenoura", calories: 41,
	carbohydrate: 10, protein: 0.9, fat: 0.2, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/cenoura.jpg"))

vinho = Food.create(name: "vinho", calories: 83,
	carbohydrate: 2.7, protein: 0.1, fat: 0, size: 100, unit: "g",
	breakfast: false, lunch: false, dinner: false, snack: false, 
	high_carbohydrate: true, high_protein: false, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/vinho.jpg"))

leite_desnatado = Food.create(name: "leite desnatado", calories: 74,
	carbohydrate: 10, protein: 6.4, fat: 0.8, size: 200, unit: "ml",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/leite-desnatado.jpg"))
ovo = Food.create(name: "ovo", calories: 74,
	carbohydrate: 0.38, protein: 6.29, fat: 4.97, size: 50, unit: "g",
	breakfast: true, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/ovo.jpg"))
iogurte_desnatado = Food.create(name: "iogurte desnatado", calories: 57,
	carbohydrate: 7.8, protein: 5.8, fat: 0, size: 160, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/iogurte-desnatado.jpg"))
bife_file_mignon = Food.create(name: "bife file mignon", calories: 169,
	carbohydrate: 0, protein: 20.78, fat: 8.85, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/bife-filet-mignon.jpg"))
frango = Food.create(name: "frango", calories: 195,
	carbohydrate: 0, protein: 29.55, fat: 7.72, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/frango.jpg"))
salmao = Food.create(name: "salmão", calories: 146,
	carbohydrate: 0, protein: 21.62, fat: 5.93, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/salmao.jpg"))
atum = Food.create(name: "atum", calories: 54,
	carbohydrate: 0, protein: 12, fat: 0.7, size: 60, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: false,
	image: File.new("#{Rails.root}/app/assets/images/atum.jpg"))

castanhas_de_caju = Food.create(name: "castanhas de caju", calories: 90,
	carbohydrate: 2.9, protein: 3.3, fat: 7.3, size: 15, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: true,
	image: File.new("#{Rails.root}/app/assets/images/castanhas-de-caju.jpg"))
pasta_de_amendoim = Food.create(name: "pasta de amendoim", calories: 88,
	carbohydrate: 2.99, protein: 3.67, fat: 7.48, size: 15, unit: "g",
	breakfast: true, lunch: false, dinner: false, snack: true, 
	high_carbohydrate: false, high_protein: true, high_fat: true,
	image: File.new("#{Rails.root}/app/assets/images/pasta-de-amendoim.jpg"))
azeite = Food.create(name: "azeite", calories: 119,
	carbohydrate: 0, protein: 0, fat: 13.5, size: 14, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: false, high_fat: true,
	image: File.new("#{Rails.root}/app/assets/images/azeite.jpg"))
semente_de_girassol = Food.create(name: "semente de girassol", calories: 570,
	carbohydrate: 18.76, protein: 22.78, fat: 49.57, size: 100, unit: "g",
	breakfast: false, lunch: true, dinner: true, snack: false, 
	high_carbohydrate: false, high_protein: true, high_fat: true,
	image: File.new("#{Rails.root}/app/assets/images/semente-de-girassol.jpg"))

frutas = [maca, pera, morango]
frutas_vermelhas = [morango]
folhas_verdes = [alface]
vegetais = [alface, cenoura]
cereais_integrais = [pao_integral, aveia, arroz_integral, macarrao_integral]
peixes = [salmao, atum]
proteinas_magras = [salmao, atum, frango, ovo, bife_file_mignon]
laticinios_baixa_gordura = [iogurte_desnatado, leite_desnatado]
laticinios_integrais = []
castanhas = [castanhas_de_caju, pasta_de_amendoim]
feijoes = [feijao_preto]

def createMeal (name, foods)
	meal = Meal.create(name: name)
	foods.each do |food|
		meal.portions.push(Portion.create(food: food, size: food.size))
	end
	return meal
end

dash_diet = Diet.create(name: "DASH", 
			goal: hipertensao.name,
			description: "Chamada de DASH Diet, tem como objetivo prevenir e tratar a hipertensão.\n\nA dieta DASH foi considerada "\
				"por médicos americanos como a mais adequada para beneficiar o corpo de diferentes maneiras, já que também promove "\
				"perda de peso e estimula uma alimentação mais nutritiva.\n\nA ideia é simples: enfatizar nutrientes que previnem a hipertensão, "\
				"como potássio, proteína, fibra e cálcio – encontrados em vegetais e alimentos integrais – e evitar aqueles que aumentam "\
				"a pressão arterial, especialmente os ricos em sal, calorias e gordura, como os industrializados, doces e carne vermelha.",
			image: File.new("#{Rails.root}/app/assets/images/dieta-dash.jpg")
			)
dash_diet.foods.push(
	frutas,
	vegetais,
	cereais_integrais,
	proteinas_magras,
	laticinios_baixa_gordura
)
dash_diet.meals.push(createMeal("Cafe da Manha", [aveia, maca, iogurte_desnatado]))
dash_diet.meals.push(createMeal("Almoco", [alface, frango, arroz_integral]))
dash_diet.meals.push(createMeal("Lanche", [leite_desnatado, morango, pao_integral]))
dash_diet.meals.push(createMeal("Jantar", [cenoura, atum, macarrao_integral]))

mind_diet = Diet.create(name: "MIND", 
			goal: alzheimer.name,
			description: "O plano tem como objetivo prevenir o Alzheimer com alimentos benéficos para o cérebro.\n\nA dieta MIND "\
				"(sigla de Mediterranean-DASH Intervention for Neurodegenerative Delay, em tradução livre, foi desenvolvida a partir "\
				"da união entre o regime DASH e a mediterrânea. Sendo assim, o programa prioriza o consumo de 10 alimentos presentes "\
				"nas duas dietas, que são benéficos para a saúde cerebral: folhas verdes, vegetais, nozes, frutas, grãos, cereais integrais, "\
				"peixe, aves, azeite e vinho.",
			image: File.new("#{Rails.root}/app/assets/images/dieta-mind.jpg")
			)
mind_diet.foods.push(
	folhas_verdes,
	vegetais,
	castanhas,
	frutas_vermelhas,
	feijoes,
	cereais_integrais,
	peixes,
	frango,
	azeite,
	vinho
)
mind_diet.meals.push(createMeal("Cafe da Manha", [cookies_de_aveia, pasta_de_amendoim, morango]))
mind_diet.meals.push(createMeal("Almoco", [alface, frango, arroz_integral, feijao_preto]))
mind_diet.meals.push(createMeal("Lanche", [cenoura, atum, pao_integral, castanhas_de_caju]))
mind_diet.meals.push(createMeal("Jantar", [salmao, macarrao_integral, vinho, azeite]))

tlc_diet = Diet.create(name: "TLC", 
			goal: colesterol.name,
			description: "Conhecido como dieta TLC (sigla para “terapia para mudança do estilo de vida”), o plano tem como principal "\
				"objetivo reduzir a taxa de LDL, o “colesterol ruim”, prevenindo doenças cardiovasculares.\n\nO foco desse tipo de alimentação "\
				"é diminuir significativamente o consumo de gordura, principalmente a saturada, encontrada nas carnes mais gordurosas, "\
				"laticínios integrais e frituras, por exemplo. Recomenda-se que a gordura passe a representar até 7% do total de calorias "\
				"consumidas ao longo do dia.\n\nA dieta ainda prevê a ingestão de fibras, presentes nos vegetais e alimentos integrais, que também "\
				"contribuem com o combate ao colesterol alto.",
			image: File.new("#{Rails.root}/app/assets/images/dieta-tlc.jpg")
			)
tlc_diet.foods.push(
	frutas,
	vegetais,
	cereais_integrais,
	laticinios_baixa_gordura,
	peixes,
	frango
)
tlc_diet.meals.push(createMeal("Cafe da Manha", [aveia, maca, iogurte_desnatado]))
tlc_diet.meals.push(createMeal("Almoco", [alface, frango, arroz_integral]))
tlc_diet.meals.push(createMeal("Lanche", [leite_desnatado, morango, cookies_de_aveia]))
tlc_diet.meals.push(createMeal("Jantar", [salmao, macarrao_integral, cenoura]))

fertility_diet = Diet.create(name: "Dieta da Fertilidade", 
			goal:ovulacao.name,
			description: "A dieta da fertilidade tem como objetivo aumentar a ovulação. É para mulheres, portanto.\n\nCriado por pesquisadores "\
				"de Harvard, o plano alimentar prioriza a ingestão de gordura “boa”, grãos integrais, proteínas, óleos de origem vegetal e "\
				"laticínios integrais e evita o consumo de gordura “ruim”, carboidratos refinados e carne vermelha. ",
			image: File.new("#{Rails.root}/app/assets/images/dieta-da-fertilidade.jpg")
			)
fertility_diet.foods.push(
	frutas,
	azeite,
	vegetais,
	cereais_integrais,
	peixes,
	ovo,
	feijoes,
	castanhas,
	laticinios_integrais
)
fertility_diet.meals.push(createMeal("Cafe da Manha", [maca, ovo, pao_integral, castanhas_de_caju]))
fertility_diet.meals.push(createMeal("Almoco", [alface, frango, arroz_integral, feijao_preto]))
fertility_diet.meals.push(createMeal("Lanche", [pasta_de_amendoim, morango, cookies_de_aveia]))
fertility_diet.meals.push(createMeal("Jantar", [salmao, macarrao_integral, cenoura]))

mayo_diet = Diet.create(name: "Dieta da Clínica Mayo", 
			goal: "emagrecimento",
			description: "O regime foi desenvolvido pela Clínica Mayo, instituição dos Estados Unidos que realiza pesquisas na área da saúde e "\
					"oferece recomendações sobre prevenção de doenças. O objetivo é emagrecer. Os criadores afirmam que ela resulta na perda de 2,5 "\
					"e 4,5 quilos nos primeiros quinze dias e, depois, de 0,5 a 1 quilo por semana.\n\nA dieta se baseia na adoção ou eliminação de "\
					"hábitos do dia a dia associados aos quilos a mais. Exemplos: é proibido comer em frente à TV ou consumir açúcar nas primeiras "\
					"duas semanas.\n\nO plano também recomenda que as refeições contenham todos os grupos alimentares, de vegetais a carboidratos e "\
					"gorduras, mas nas quantidades indicadas pela pirâmide alimentar. Estudos já demonstraram que a dieta é eficaz na perda de peso "\
					"e ajuda a proteger a saúde cardiovascular. Exercícios também estão incluídos -- de 30 minutos a 60 minutos diariamente.",
			image: File.new("#{Rails.root}/app/assets/images/dieta-mayo.jpg")
			)
mayo_diet.foods.push(
	frutas,
	vegetais,
	cereais_integrais,
	castanhas,
	feijoes,
	salmao,
	atum,
	azeite
)
mayo_diet.meals.push(createMeal("Cafe da Manha", [maca, pao_integral, pasta_de_amendoim]))
mayo_diet.meals.push(createMeal("Almoco", [alface, salmao, arroz_integral, feijao_preto]))
mayo_diet.meals.push(createMeal("Lanche", [pasta_de_amendoim, morango, cookies_de_aveia]))
mayo_diet.meals.push(createMeal("Jantar", [atum, macarrao_integral, cenoura]))

mediterranean_diet = Diet.create(name: "Mediterrânea", 
			goal: "cronicas",
			description: "A Dieta do Mediterrâneo se baseia na alimentação seguida por habitantes de países banhados pelo Mar Mediterrâneo.\n\n"\
					"O programa tem como objetivo a perda e a manutenção do peso e a prevenção de doenças crônicas com a baixa ingestão de carne "\
					"vermelha, açúcar e gordura saturada.\n\nPor outro lado, o plano prevê um maior consumo de alimentos como nozes e castanhas, "\
					"vegetais, grãos integrais, azeite de oliva e peixe. O vinho tinto também é indicado, com moderação.\n\nRequer a prática de "\
					"exercícios leves, ao menos três vezes por semana, como caminhadas e a prática da jardinagem. ",
			image: File.new("#{Rails.root}/app/assets/images/dieta-mediterranea.jpg")
			)
mediterranean_diet.foods.push(
	frutas,
	vegetais,
	cereais_integrais,
	castanhas,
	feijoes,
	azeite,
	peixes,
	ovo,
	laticinios_integrais,
	vinho
)
mediterranean_diet.meals.push(createMeal("Cafe da Manha", [maca, pao_integral, ovo, castanhas_de_caju]))
mediterranean_diet.meals.push(createMeal("Almoco", [alface, salmao, arroz_integral, feijao_preto]))
mediterranean_diet.meals.push(createMeal("Lanche", [pasta_de_amendoim, morango, cookies_de_aveia]))
mediterranean_diet.meals.push(createMeal("Jantar", [atum, macarrao_integral, cenoura, vinho]))

weight_watchers_diet = Diet.create(name: "Dieta Vigilantes do Peso", 
			goal: "emagrecimento",
			description: "O Vigilantes do Peso faz parte da organização Weight Watchers, que surgiu nos Estados Unidos e ajuda na peso por "\
					"meio de programas pagos de emagrecimento.\n\nOs participantes se inscrevem em um dos métodos disponíveis que consistem em "\
					"reuniões de acompanhamento, sugestão de cardápios e receitas saudáveis com base no controle da quantidade de calorias "\
					"consumidas diariamente",
			image: File.new("#{Rails.root}/app/assets/images/dieta-vigilantes-do-peso.jpg")
			)
weight_watchers_diet.foods.push(
	Food.all
)
weight_watchers_diet.meals.push(createMeal("Cafe da Manha", [maca, leite_desnatado, pao_integral, ovo]))
weight_watchers_diet.meals.push(createMeal("Almoco", [alface, salmao, arroz_integral, feijao_preto]))
weight_watchers_diet.meals.push(createMeal("Lanche", [leite_desnatado, morango, cookies_de_aveia]))
weight_watchers_diet.meals.push(createMeal("Jantar", [atum, macarrao_integral, cenoura]))

flexitarian_diet = Diet.create(name: "Dieta Flexitariana", 
			goal: "emagrecimento",
			description: "É um programa alimentar que objetiva a perda de peso e a melhora da saúde por meio de dois conceitos: flexibilidade "\
					"e vegetarianismo.\n\nO termo foi usado pela primeira vez em 2009 pela nutricionista Americana Dawn Jackson Blatner. Segundo "\
					"a especialista, não seria necessário eliminar completamente o consumo de carne para alcançar os benefícios do vegetarianismo. "\
					"Bastaria adotar a prática na maior parte do tempo, sem deixar de comer um bife ou um hambúrguer de vez enquando, quando desse "\
					"muita vontade.\n\nA dieta consiste em adicionar cinco grupos de alimentos à mesa - “novas carnes” (tofu, , feijão, lentilhas, "\
					"ervilhas, nozes e sementes, e ovos ), frutas e vegetais, grãos integrais, laticínios, açúcares e pimentas. Além disso, a prática "\
					"de exercícios é fortemente encorajada: recomenda-se 30 minutos diários de exercícios físicos moderados ou 20 minutos de "\
					"exercícios intensos, cinco vezes por semana.\n\nEstudos mostraram que os adeptos perdem 15% do peso corporal, além de reduzir "\
					"risco de doenças cardíacas, diabetes e câncer e vivem, em média, 3,6 anos mais em relação aos que não seguem o programa. ",
			image: File.new("#{Rails.root}/app/assets/images/dieta-flexitariana.jpg")
			)
flexitarian_diet.foods.push(
	castanhas,
	semente_de_girassol,
	feijoes,
	ovo,
	frutas,
	vegetais,
	laticinios_integrais,
	laticinios_baixa_gordura,
	cereais_integrais,
)	
flexitarian_diet.meals.push(createMeal("Cafe da Manha", [maca, pao_integral, pasta_de_amendoim]))
flexitarian_diet.meals.push(createMeal("Almoco", [alface, ovo, arroz_integral, feijao_preto]))
flexitarian_diet.meals.push(createMeal("Lanche", [iogurte_desnatado, morango, castanhas_de_caju]))
flexitarian_diet.meals.push(createMeal("Jantar", [macarrao_integral, cenoura, semente_de_girassol]))

volumetrics_diet = Diet.create(name: "Dieta Volumétrica", 
			goal: "emagrecimento",
			description: "O conceito da dieta volumétrica consiste em estimular o consumo de alimentos pouco calóricos que promovem a saciedade.\n\n"\
					"Eles são divididos em categorias: os chamados de baixíssima densidade, como frutas (figo, melancia, meão, uva, laranja e "\
					"frutas vermelhas), e vegetais (folhas verdes, cenoura, beterraba, abóbora, berinjela) sem amido, leite desnatado e sopa à "\
					"base de caldo; os de baixa densidade, como frutas e vegetais com amido, grãos, cereal matinal, carnes magras, legumes e pratos "\
					"com baixo teor de gordura; alimentos de média densidade como carne, queijo, pizza, batata frita, molho de salada, pão, sorvete "\
					"e bolo; e alimentos de alta densidade como biscoitos, salgadinho, doces de chocolate, biscoitos, nozes, manteiga e óleo.\n\nAs "\
					"comidas das categorias 1 e 2 podem ser ingeridas em grandes quantidades, o consumo dos alimentos da categoria 3 deve ser moderado "\
					"e da categoria 4, evitado.\n\nEmbora esta dieta seja mais um plano alimentar do que um programa de emagrecimento, para aqueles que "\
					"querem um resultado melhor, a prática de exercícios – 30 minutos de caminhada na maior parte da semana – é encorajada. ",
			image: File.new("#{Rails.root}/app/assets/images/missing.jpg")
			)
volumetrics_diet.foods.push(
	Food.all
)	
volumetrics_diet.meals.push(createMeal("Cafe da Manha", [morango, leite_desnatado, pao_integral, ovo]))
volumetrics_diet.meals.push(createMeal("Almoco", [alface, frango, arroz_integral, feijao_preto]))
volumetrics_diet.meals.push(createMeal("Lanche", [iogurte_desnatado, maca, cookies_de_aveia]))
volumetrics_diet.meals.push(createMeal("Jantar", [macarrao_integral, cenoura, atum]))

recipe_bolo_de_cenoura = Recipe.create(title: "Bolo de Cenoura - Farinha de Aveia")

portion_cenoura = Portion.create(food: cenoura, size: 100)
portion_ovo = Portion.create(food: ovo, size: 100)

recipe_bolo_de_cenoura.portions.push(portion_cenoura)
recipe_bolo_de_cenoura.portions.push(portion_ovo)
recipe_bolo_de_cenoura.description = "1. Coloque no liquidificador.<br>2. Bate tudo.<br>3. Põe na forma."
recipe_bolo_de_cenoura.tips = "Use cenoura orgânica."
recipe_bolo_de_cenoura.save