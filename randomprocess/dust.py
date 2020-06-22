import json
from xml.etree.ElementTree import fromstring
import requests
import csv
import folium
import pandas as pd
from branca.colormap import linear

def pm10():

    url = 'http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst?'
    ServiceKey = 'NeetkZ6YyEhpSTChEOmjIqgL%2BFaS2TU7kbBRZ36dKf9asSoVGoDEo8S0UVMX1Z7LrgQ1qKuYH1WBEwPE3bt8Qg%3D%3D'
    pageNo = '1'
    numOfRows = '1'
    dataGubun = 'HOUR'
    itemCode = 'PM10'

    url = url + "dataGubun=" + dataGubun
    url = url + "&itemCode=" + itemCode
    url = url + "&pageNo=" + pageNo
    url = url + "&numOfRows=" + numOfRows
    url = url + "&ServiceKey=" + ServiceKey

    response = requests.get(url)
    root_node = fromstring(response.content)
    item = root_node.find('body').find('items').find('item')
    datatime = item.find("dataTime").text

    f = open('pm10.csv','w',newline='')
    wr = csv.writer(f)
    wr.writerow(['ID_1','datatime','sido','PM10'])

    url_sido = ['busan','chungbuk','chungnam','daegu','daejeon','gangwon','gwangju','gyeonggi',
                'gyeongbuk','gyeongnam','incheon','jeju','jeonbuk','jeonnam','seoul','ulsan']

    id = 1

    for i in url_sido:
        pm10 = item.find(i).text
        wr.writerow([str(id),datatime,i,pm10])
        id += 1

    f.close()

    jsonFile = open('skorea-provinces-geo.json','r',encoding='utf-8')
    jsonData = json.load(jsonFile)

    PM10 = open('pm10.csv','r')
    PM10_data = pd.read_csv(PM10)

    colormap = linear.YlGn_09.scale(0,120)

    map_osm = folium.Map(location=[37.566345, 126.977893], zoom_start=7)
    map_osm.choropleth(
        geo_data=jsonData,
        data=PM10_data,
        columns=['ID_1','PM10'],
        key_on='properties.ID_1',
        fill_color='BuPu',
        fill_opacity=0.7,
        line_opacity=0.5,
        legend_name= datatime + ' 실시간 미세먼지 농도',
        highlight=True,
        threshold_scale=[0, 31, 81, 151, 200]
    )

    location = [[35.198362, 129.053922],[36.628503, 127.929344],[36.557229, 126.779757],[35.798838, 128.583052],
                [36.321655, 127.378953],[37.555837, 128.209315],[35.126033, 126.831302],[37.567167, 127.190292],
                [36.248647, 128.664734],[35.259787, 128.664734],[37.469221, 126.573234],[33.364805, 126.542671],
                [35.716705, 127.144185],[34.819400, 126.893113],[37.540705, 126.956764],[35.519301, 129.239078]]

    pm10_popup = []

    for k in PM10_data['PM10']:
        pm10_popup.append(k)

    for z in range(len(location)):

        if pm10_popup[z] <= 30:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 좋음"

        elif pm10_popup[z] <= 80 and pm10_popup[z] > 30:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 보통"

        elif pm10_popup[z] <= 150 and pm10_popup[z] > 80:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 나쁨"

        else:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 매우나쁨"


        folium.Marker(location=location[z], popup= message).add_to(map_osm)


    map_osm.save('실시간 미세먼지 농도.html')



def pm25():

    url = 'http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst?'
    ServiceKey = 'NeetkZ6YyEhpSTChEOmjIqgL%2BFaS2TU7kbBRZ36dKf9asSoVGoDEo8S0UVMX1Z7LrgQ1qKuYH1WBEwPE3bt8Qg%3D%3D'
    pageNo = '1'
    numOfRows = '1'
    dataGubun = 'HOUR'
    itemCode = 'PM25'

    url = url + "dataGubun=" + dataGubun
    url = url + "&itemCode=" + itemCode
    url = url + "&pageNo=" + pageNo
    url = url + "&numOfRows=" + numOfRows
    url = url + "&ServiceKey=" + ServiceKey

    response = requests.get(url)
    root_node = fromstring(response.content)
    item = root_node.find('body').find('items').find('item')
    datatime = item.find("dataTime").text

    f = open('pm25.csv','w',newline='')
    wr = csv.writer(f)
    wr.writerow(['ID_1','datatime','sido','PM10'])

    url_sido = ['busan','chungbuk','chungnam','daegu','daejeon','gangwon','gwangju','gyeonggi',
                'gyeongbuk','gyeongnam','incheon','jeju','jeonbuk','jeonnam','seoul','ulsan']

    id = 1

    for i in url_sido:
        pm10 = item.find(i).text
        wr.writerow([str(id),datatime,i,pm10])
        id += 1

    f.close()

    jsonFile = open('skorea-provinces-geo.json','r',encoding='utf-8')
    jsonData = json.load(jsonFile)

    PM10 = open('pm25.csv','r')
    PM10_data = pd.read_csv(PM10)

    colormap = linear.YlGn_09.scale(0,120)

    map_osm = folium.Map(location=[37.566345, 126.977893], zoom_start=7)
    map_osm.choropleth(
        geo_data=jsonData,
        data=PM10_data,
        columns=['ID_1','PM10'],
        key_on='properties.ID_1',
        fill_color='BuPu',
        fill_opacity=0.7,
        line_opacity=0.5,
        legend_name= datatime + ' 실시간 미세먼지 농도',
        highlight=True,
        threshold_scale=[0, 16, 36, 76, 120]
    )

    location = [[35.198362, 129.053922],[36.628503, 127.929344],[36.557229, 126.779757],[35.798838, 128.583052],
                [36.321655, 127.378953],[37.555837, 128.209315],[35.126033, 126.831302],[37.567167, 127.190292],
                [36.248647, 128.664734],[35.259787, 128.664734],[37.469221, 126.573234],[33.364805, 126.542671],
                [35.716705, 127.144185],[34.819400, 126.893113],[37.540705, 126.956764],[35.519301, 129.239078]]

    pm10_popup = []

    for k in PM10_data['PM10']:
        pm10_popup.append(k)

    for z in range(len(location)):

        if pm10_popup[z] <= 15:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 좋음"

        elif pm10_popup[z] <= 35 and pm10_popup[z] > 15:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 보통"

        elif pm10_popup[z] <= 75 and pm10_popup[z] > 35:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 나쁨"

        else:
            message = str(pm10_popup[z]) + "㎍/㎥  상태: 매우나쁨"


        folium.Marker(location=location[z], popup= message).add_to(map_osm)


    map_osm.save('실시간 초미세먼지 농도.html')



