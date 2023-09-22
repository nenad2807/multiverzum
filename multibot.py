import random
import re

keywords = {
    'hello': ['Hello!', 'Hi there!', 'Greetings!'],
    'how are you': ['I am doing well, thank you!', 'I am fine!', 'Pretty good!'],
    'goodbye': ['Goodbye!', 'Farewell!', 'Take care!'],
    'how do I purchase a custom phone case': ['To purchase a custom phone case you can use the search bar to type "custom phone case" and select one of the existing posts, or you can just go to our recommended item link: <br> <a href="https://multiverzum.com/item/17">https://multiverzum.com/item/17</a>'],
}

def process_input(user_input):
    for key, value in keywords.items():
        if re.search(r'\b' + re.escape(key) + r'\b', user_input, re.I):
            return random.choice(value)
    return "Sorry, I don't understand."

def askMultibot(user_input):
    response = process_input(user_input)
    return response
