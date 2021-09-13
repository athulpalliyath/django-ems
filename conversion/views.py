from django.shortcuts import render
from num2words import num2words
from gtts import gTTS
import os


# Create your views here.

def convert(request):
    language = 'en'
    music = ''
    if request.method=="POST":
        number = request.POST['number']
        text = num2words(number)
        voice = text
        language = 'en'
        speech = gTTS(text = voice, lang = language, slow = False) 
        speech.save('static/speech.mp3')
        music = 'ok'
        context = {
            'text':text,
            'music': music,
        }
        return render(request, 'conversion.html', context)

    context = {
        'music': music,
    }
    return render(request, 'conversion.html', context)
