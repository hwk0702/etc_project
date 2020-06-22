import json
from xml.etree.ElementTree import fromstring
import folium
import csv
import requests
import urllib.request


f = open('인천의료기관현황.csv','w', newline='')
wr = csv.writer(f)

page = 1

while True:

    try:
        url = 'http://open.incheon.go.kr/openapi/medicalinstitution.do?'
        key = '0a785b12c08e3e37ee162ae3dda67e57'
        url = url + 'key=' + key
        url = url + '&page=' + str(page)
        response = requests.get(url)
        root_node = fromstring(response.content)
        items = root_node.find('list').findall('item')

        for item in items:

            if item.find('subTy').text != '약국':
                wr.writerow([item.find('hsptlNm').text, item.find('subTy').text,
                             item.find('telNo').text, item.find('adres').text])

    except:
        print('exception= ', page)
        break

    page += 1

f = open('인천의료기관현황.csv','r')
rdr = csv.reader(f)

name = []
tel = []
address = []

for line in rdr:
    name.append(line[0])
    tel.append(line[2])
    address.append(line[3])

client_id = "hXN3xCNbsW6hAan6US3M"
client_secret = "iHjqc1jECX"

map = folium.Map(location=[37.469221, 126.573234], zoom_start=13)

for i in range(90):

    try:
        encText = urllib.parse.quote(address[i])
        url = "https://openapi.naver.com/v1/map/geocode?query=" + encText  # json 결과
        # url = "https://openapi.naver.com/v1/map/geocode.xml?query=" + encText # xml 결과
        request = urllib.request.Request(url)
        request.add_header("X-Naver-Client-Id", client_id)
        request.add_header("X-Naver-Client-Secret", client_secret)
        response = urllib.request.urlopen(request)
        rescode = response.getcode()
        if (rescode == 200):
            response_body = response.read()
            response_body = response_body.decode('utf-8')
            dict = json.loads(response_body)
            items = dict['result']['items']

            for item in items:
                points = item['point']
                x = points['y']
                y = points['x']

        else:
            print("Error Code:" + rescode)

        try:
            hpname = '인천 ' +  name[i]
            encText1 = urllib.parse.quote(hpname)
            url = "https://openapi.naver.com/v1/search/blog?display=1&query=" + encText1  # json 결과
            # url = "https://openapi.naver.com/v1/search/blog.xml?query=" + encText # xml 결과
            request = urllib.request.Request(url)
            request.add_header("X-Naver-Client-Id", client_id)
            request.add_header("X-Naver-Client-Secret", client_secret)
            response = urllib.request.urlopen(request)
            rescode = response.getcode()

            if (rescode == 200):
                response_body = response.read()
                response_body = response_body.decode('utf-8')
                dict = json.loads(response_body)
                items = dict['items']

                title = items[0]['title']
                title = title.replace('<b>','')
                title = title.replace('</b>', '')

                link = items[0]['link']
                link = '<a href="'+link+'">'+title+'</a>'

                popup = '이름: ' + hpname + '\n주소: ' + address[i] + '\n번호: ' + tel[i] + '\n링크주소: ' + link

                folium.Circle(location=[x, y],
                              radius=30,
                              color='blue', 
                              fill=False,
                              popup=popup).add_to(map)

            else:
                print("Error Code:" + rescode)


        except:
            folium.Circle(location=[x, y],
                          radius=30,
                          color='blue',
                          fill=False,
                          popup='이름: ' + name[i] + '\n주소: ' + address[i] + '\n번호: ' + tel[i]).add_to(map)

    except:
        print('exception= ', name[i])

map.save('인천의료기관.html')

