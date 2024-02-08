# Capital Cities

## Teach users about geography while you learn about MKMapView and annotations.

- MKMapView, 
- MKAnnotation, 
- MKPinAnnotationView, 
- CLLocationCoordinate2D


<img width="300" alt="P2" src="https://sun9-39.userapi.com/impg/HibXzNvvC2y9TCgpgzIsV67Erfl5H5Dnk2krcA/5j566rBBz9Y.jpg?size=996x2160&quality=95&sign=959c02acdba0bc79f8aaf33695c77c66&type=album"> <img width="300" alt="P2" src="https://sun9-14.userapi.com/impg/U5i7LkeZwdO0BoP3iU7SoI7Pjij5zMN2dyLqPg/QM0mpVqsrek.jpg?size=996x2160&quality=95&sign=7f9ef2bff963a1cdb735c6c6ec666c13&type=album"> <img width="300" alt="P2" src="https://sun9-62.userapi.com/impg/Kkdc59KchyKyR3JJdvSHIoB2SfVvS2_8YVQfHw/F_F0jrtnGe4.jpg?size=828x1792&quality=95&sign=0565fbc3e4a0278ea05328ace3749856&type=album"> <img width="300" alt="P2" src="https://sun9-13.userapi.com/impg/i7m09H3FTiXPHJTQrWl2BqHzdVDjrRVgqnlWqA/IFZty2QVSXI.jpg?size=828x1792&quality=95&sign=5354794b7dec493f6b041f959d6903cd&type=album"> 
 
 
If you wanna choose from multiple map styles, such as satellite maps, you need to write .mapType property that lets us control this (mapView.mapType = .satellite)

<img width="300" alt="P2" src="https://sun9-19.userapi.com/impg/rcK36bhDr5Ms_tjI4Mc4L8bs1bjfJaj9XmIi1w/xT4euk_jWis.jpg?size=828x1792&quality=95&sign=4eca7b2c7823c46992b0dada5aee86bd&type=album"> <img width="300" alt="P2" src="https://sun9-12.userapi.com/impg/KTywGSpeDXGZ-7dOKmkYIDrm3ZG674PUXvg7Tw/QybV1oRcu_A.jpg?size=828x1792&quality=95&sign=c48038fd4a9ed8d977722845494e0393&type=album"> <img width="300" alt="P2" src="https://sun9-37.userapi.com/impg/iI5sKxIl66ef4-koILAMN6Kv-VsErics82sK-A/TA39IEPPCbk.jpg?size=828x1792&quality=95&sign=fac047d9f55ed3335db18186d8f96aa4&type=album">


## Challenge

- [ ] Try typecasting the return value from dequeueReusableAnnotationView() so that it's an MKPinAnnotationView. Once that’s done, change the pinTintColor property to your favorite UIColor.
- [ ] Add a UIAlertController that lets users specify how they want to view the map. There's a mapType property that draws the maps in different ways. For example, .satellite gives a satellite view of the terrain.
- [ ] Modify the callout button so that pressing it shows a new view controller with a web view, taking users to the Wikipedia entry for that city.
