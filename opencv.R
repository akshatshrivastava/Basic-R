library(opencv)

nish<-ocv_read('C:/Users/PC 6/Downloads/nish.jpg')
trump<-ocv_read("D:/Rmlearning/CSV files/trump_family.jpg")

ocv_face(trump)
ocv_face(nish)

ocv_edges(nish)

ocv_markers(nish)

ocv_read(path)

ocv_bitmap(image)

ocv_resize(image, width = 0, height = 0)

ocv_mog2(nish)

ocv_knn(nish)

ocv_hog(nish)

ocv_blur(nish, ksize = 14)

ocv_sketch(nish, color = TRUE)

ocv_stylize(nish)

ocv_info(nish)

ocv_copyto(image, target, mask)

ocv_display(image)

facemask <- ocv_facemask(nish)
attr(facemask, 'faces')
