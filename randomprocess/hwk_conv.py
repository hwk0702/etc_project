def conv(x,h):

    nx=len(x)   #x[n]의 길이
    nh=len(h)   #h[n]의 길이

    cl=nx+nh-1  #convolved signal length

    # zero padding
    for i in range(cl-nx):
        x.append(0)
    for j in range(cl-nh):
        h.append(0)

    conv=[] #convolution 리스트 생성

    #convolution 값 리스트에 추가
    for k in range(cl):
        s=0
        for l in range(k+1):
            s=s+x[l]*h[k-l]

        conv.append(s)


    return conv     #convolution 값 리턴




