# Whitehouse Petitions

## This app is about UITabBarController and a data format called JSON, which is a popular way to send and receive data online. 

💡 what were learned:
- Grand Central Dispatch (GCD)
- DispatchQueue.main.async
- DispatchQueue.global(qos:)
- async()
- QoS (userInteractive, userInitiated, utility, background)
- "it's never OK to do user interface work on the background thread"
- performSelector(inBackground:) and performSelector(onMainThread:)

From the Projict7:

<img width="300" alt="P2" src="https://sun9-25.userapi.com/impg/K984Nd07EFd09hhFVxnz6J5LyI586IiqLzEpYg/fH20EiGPJbE.jpg?size=640x1340&quality=96&sign=ae667ba1a460976f009647d0e7352657&type=album"> <img width="300" alt="P2" src="https://sun9-63.userapi.com/impg/mgDtW46mgJeg90tsIMLz6wEoDeTSvQd9aGSrTA/ut2z5jNqN20.jpg?size=640x1340&quality=96&sign=b6247496d7f16f354265e0527e26ed4b&type=album">


## Challenge

- [x] Modify project 1 so that loading the list of NSSL images from our bundle happens in the background. Make sure you call reloadData() on the table view once loading has finished!
- [x] Modify project 8 so that loading and parsing a level takes place in the background. Once you’re done, make sure you update the UI on the main thread!
- [x] Modify project 7 so that your filtering code takes place in the background. This filtering code was added in one of the challenges for the project, so hopefully you didn’t skip it!


