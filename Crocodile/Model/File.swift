
struct Team {
    let image: String
    let teamName: String
    var scores: Int
    var turnsCount: Int
    var yourTurn: Bool
}

struct Theme {
    let ThemeName: String
    let ThemeWords: [String]
}

struct gameModule {
    var team1: Team?
    var team2: Team?
    var words: [String]?
    var count: Int?
    
    let terms = ["Объясни с помощью слов.",
                 "Объясни с помощью жестов.",
                 "Объясни с помощью рисунка.",
                 "Объясняй со злостью.",
                 "Объясняй с помощью мимики.",
                 "Объясняй вульгарно.",
                 "Объясняй сексуально."]
    
    let themes = [
        Theme(ThemeName: "Еда", ThemeWords: ["Картошка", "Паста", "Торт", "Кабачок", "Пирог", "Драконий глаз", "Жаренная печень", "Конфета", "Багет", "Вишня", "Арбуз", "Капуста", "Молоко", "Сливочное Масло", "Соль", "Рыба", "Сосиска в тесте", "Пицца", "Орех", "Куриное мясо"]),
        Theme(ThemeName: "Живтоные", ThemeWords: ["Петух", "Бык", "Овца", "Жеребец", "Мартышка", "Собака", "Питон", "Единорог", "Волк", "Гидра", "Ворон", "Кенгуру", "Медоед", "Тюлень", "Дельфин", "Осьминог", "Мантикора", "Человек", "Ленивец", "Свинья"]),
        Theme(ThemeName: "Личности", ThemeWords: ["Я", "Ты", "Он", "Она", "Все", "Вы", "Мы", "Они", "Юлий Цезарь", "Напалеон Бонапард", "Стивен Хоккинг", "Илон Маск", "Эндрю Тейт", "Роки Бальбоа", "Иосиф Сталин", "Шрек", "Устал", "думать", "я", "да"]),
        Theme(ThemeName: "Хобби", ThemeWords: ["Баскетболл", "Футболл", "Хокей", "Скалолазанье", "Борьба", "Бокс", "Коллекционирование монет", "Шопинг", "Рисование", "Изучение языков", "Чтение журналов", "Игра на гитаре", "Игра на чужих чувствах", "Компьютерные игры", "Весечение фигур из дерева", "Машины", "Езда на велосипеде", "Походы в горы", "Плаванье", "Дайвинг"]),
    ]
    
    var teams = [
        Team(image: "2", teamName: "Лягушки", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "1", teamName: "Смельчаки", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "3", teamName: "Скромняги", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "2", teamName: "Солевые", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "3", teamName: "Принцессы", scores: 0, turnsCount: 0, yourTurn: false),
        Team(image: "1", teamName: "Top G`s", scores: 0, turnsCount: 0, yourTurn: false)
    ]
    
   mutating func getRandomTeam() -> Team {
        let randomInt = Int.random(in: teams.startIndex..<teams.endIndex)
        let randomTeam = teams[randomInt]
        teams.remove(at: randomInt)
        return randomTeam
    }

   mutating func getWordsFromCategory(words: [String]){
        var currentWords = words
        var result: [String] = []
        
        for _ in 1...10 {
            let randomInt = Int.random(in: currentWords.startIndex..<currentWords.endIndex)
            result.append(currentWords[randomInt])
            currentWords.remove(at: randomInt)
        }
        self.words = result
    }
    
   mutating func getRandomWord() -> String {
        let currentWords = words!
        let randomInt = Int.random(in: currentWords.startIndex..<currentWords.endIndex)
        let result = currentWords[randomInt]
        words!.remove(at: randomInt)
        return result
    }
    
    func getRandomTerm() -> String {
        if let term = terms.randomElement() {
            return term
        } else {
            return "show it"
        }
    }
    
    func checkTurn(back: String, forward: String) -> String {
        if team1?.turnsCount == 5 && team2?.turnsCount == 5 {
            return forward
        } else {
            return back
        }
    }
    mutating func increseScores() {
        if team1!.yourTurn{
            team1?.scores += 1
            print(team1?.scores)
        } else if team2!.yourTurn {
            team2?.scores += 1
        }
    }
    mutating func increaseTurnCount() {
        if team1!.yourTurn{
            team1?.turnsCount += 1
            team1?.yourTurn.toggle()
            team2?.yourTurn.toggle()
        } else if team2!.yourTurn {
            team2?.turnsCount += 1
            team1?.yourTurn.toggle()
            team2?.yourTurn.toggle()
        }
    }
}
