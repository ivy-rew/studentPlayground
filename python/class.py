
class Person():

    def __init__(self, name, age, city):
        self.name = name
        self.age = age
        self.city = city

    def run(self):
        print(f'{self.name} is running')

    def printAge(self):
        print(f'{self.name} is {self.age} years old')

jack = Person('Jack', 19, 'Zug')
jack.printAge()

alex = Person('alex', 14, 'Zug')
alex.printAge()

jack.run()