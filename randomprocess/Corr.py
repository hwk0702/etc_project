def hw_corr(x,y):

    corl=len(x)+len(y)-1    #correlation 길이

    #zero padding
    for i in range(corl-len(x)):
        x.insert(0,0)
    for j in range(corl - len(y)):
        y.append(0)

    crr=[]  #correlation 값 리스트 생성

    #correlation 값 계산
    for k in range(corl):
        s=0
        for l in range(k+1):
            s=s+x[len(y)-1-k+l]*y[l]

        crr.append(s)

    return crr      #correlation 값 리턴


