import numpy as np
import matplotlib.pyplot as plt
import matplotlib
from matplotlib import font_manager, rc

font_name = font_manager.FontProperties(fname='c:/windows/fonts/malgun.ttf').get_name()
matplotlib.rc('font', family=font_name)

def tp(temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,rain_1,rain_2,rain_3,rain_4,rain_5):


    temp_1 = float(temp_1)
    temp_2 = float(temp_2)+float(temp_1)
    temp_3 = float(temp_3)+float(temp_2)
    temp_4 = float(temp_4)+float(temp_3)
    temp_5 = float(temp_5)+float(temp_4)
    temp_6 = float(temp_6)+float(temp_5)

    rain_1 = float(rain_1)
    rain_2 = float(rain_2)+float(rain_1)
    rain_3 = float(rain_3)+float(rain_2)
    rain_4 = float(rain_4)+float(rain_3)
    rain_5 = float(rain_5)+float(rain_4)


    random_temp=np.random.rand(1000)
    random_rain=np.random.rand(1000)

    temp = []
    rain = []
    index = []

    s=0

    for i in random_temp:

        if i < temp_1:
            t=-10+(-10)*(np.random.rand(1))
            temp.append(t)
        elif i >= temp_1 and i < temp_2:
            t = (-10) * (np.random.rand(1))
            temp.append(t)
        elif i >= temp_2 and i < temp_3:
            t = 10 * (np.random.rand(1))
            temp.append(t)
        elif i >= temp_3 and i < temp_4:
            t = 10 + 10 * (np.random.rand(1))
            temp.append(t)
        elif i >= temp_4 and i < temp_5:
            t = 20 + 10 * (np.random.rand(1))
            temp.append(t)
        elif i >= temp_5 and i <= temp_6:
            t = 30 + 10 * (np.random.rand(1))
            temp.append(t)

        index.append(s)
        s+=1

    for j in random_rain:

        if j < rain_1:
            rain.append(0)
        elif j >= rain_1 and j < rain_2:
            r = np.random.rand(1)
            rain.append(r)
        elif j >= rain_2 and j < rain_3:
            r = 1 + 4 * np.random.rand(1)
            rain.append(r)
        elif j >= rain_3 and j < rain_4:
            r = 5 + 5 * np.random.rand(1)
            rain.append(r)
        elif j >= rain_4 and j <= rain_5:
            r = 10 + 10 * np.random.rand(1)
            rain.append(r)

    tourpeople = []

    for k in index:
        tourpeople.append(int(np.round(13645.01+360.39*temp[k]+(-466.75)*rain[k])))

    tourpeople_sum = 0
    for l in tourpeople:
        tourpeople_sum = tourpeople_sum+l

    tourpeople_mean = tourpeople_sum/len(tourpeople)
    tourpeople_mean = int(round(tourpeople_mean))

    print("내일 경복궁 예상 관광객 수는 "+ str(tourpeople_mean) + "명 입니다.")



print("내일 기온의 확률 분포를 합이 1이 되도록 입력해주세요.")
print("매우추움(~-10도), 추움(-10~0도), 쌀쌀(0~10도), 보통(10~20도), 더움(20~30도), 매우더움(30도~)입니다.")
temp_1 = input("매우추움(~-10도): ")
temp_2 = input("추움(-10도~0도): ")
temp_3 = input("쌀쌀(0도~10도): ")
temp_4 = input("보통(10도~20도): ")
temp_5 = input("더움(20도~30도): ")
temp_6 = input("매우더움(30도~): ")

print("내일 강수 확률 분포를 합이 1이 되도록 입력해주세요.")
print("안옴(0mm), 거의 안옴(0~1.0mm), 조금 옴(1.0~5.0mm), 옴(5.0~10.0mm), 많이 옴(10.0mm~).")
rain_1 = input("안옴(0mm): ")
rain_2 = input("거의 안옴(0~1.0mm): ")
rain_3 = input("조금 옴(1.0~5.0mm): ")
rain_4 = input("옴(5.0~10.0mm): ")
rain_5 = input("많이 옴(10.0mm~): ")

tp(temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,rain_1,rain_2,rain_3,rain_4,rain_5)
