import librosa
import  numpy as np
import wave
import pyaudio

wav_read = wave.open('강형원.mp3','rb')
x, sr = librosa.load('강형원.mp3')

delay = 0.5
alpha = 0.65
D = delay*sr
D = round(D)
y = np.zeros((len(x)))
y[0:D] = x[0:D]

for i in range(D,len(x)):
    y[i] = x[i] + alpha*x[i-D]

p = pyaudio.PyAudio()

#f= open('강형원에코.wav','w')
wav_file = wave.open('강형원에코.wav','wb')
wav_file.setnchannels(wav_read.getnchannels())
wav_file.setframerate(sr)
wav_file.setsampwidth(p.get_sample_size(pyaudio.paInt16))
wav_file.writeframes(y)
wav_file.close()
