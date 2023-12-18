# Auto Layout in code

## Auto Layout in code: 

💡 what were learned:
- .addConstraints with Visual Format Language
- Auto Layout metrics 
- Auto Layout priorities
- A set of anchors that define its layouts rules


<img width="300" alt="P2" src="https://sun9-4.userapi.com/impg/Cu4T-MnDMRqHyfO-9WchFzniJLPIyiqo_WDC0Q/Uzs16opHh8Q.jpg?size=640x1320&quality=96&sign=c940f5ad48e47a4f5140e834724b4e4b&type=album"> <img width="300" alt="P2" src="https://sun9-43.userapi.com/impg/c7-sV0vfhi9wI53pvXIK8CWZYklDe8VmvRah3g/StVh8w84PzA.jpg?size=640x1320&quality=96&sign=d94257a0d5a40931ceeed6c1ff7d2c91&type=album"> 

When the app is rotated to landscape, there's a message - "Unable to simultaneously satisfy constraints." This means your constraints simply don't work given how much screen space there is, and that's where priority comes in. Constraint priority is a value between 1 and 1000, where 1000 means "this is absolutely required" and anything less is optional. By default, all constraints you have are priority 1000, so Auto Layout will fail to find a solution in our current layout (pic.1). 

<img width="500" alt="P2" src="https://sun9-28.userapi.com/impg/ZyqgdF2jxq7RP0esrRFV71JPX_NwuzmQNoyKMQ/LKenAOY-mM4.jpg?size=1190x720&quality=96&sign=3d85e67bfda72a97c3477194b1cce723&type=album"> <img width="500" alt="P2" src="https://sun9-46.userapi.com/impg/jvd99fkhj7QPHq-LJVYqumLfXJR1VO1Sp09jBg/SktJzrXgEio.jpg?size=1190x718&quality=96&sign=d8a8b0993a6e9b37e726cd441e9e9f78&type=album">

Every UIView has a set of anchors that define its layouts rules. The most important ones are widthAnchor, heightAnchor, topAnchor, bottomAnchor, leftAnchor, rightAnchor, leadingAnchor, trailingAnchor, centerXAnchor, and centerYAnchor.
The best bit about working with anchors is that they can be created relative to other anchors.

<img width="300" alt="P2" src="https://sun9-16.userapi.com/impg/ei-I3G3LqeHlYhb4KFF3bpUu7AVYb4Mio0_5MA/vstQnP3kd7Q.jpg?size=640x1340&quality=96&sign=78ddf6caa6acef006c4585c86f561eec&type=album"> <img width="300" alt="P2" src="https://sun9-28.userapi.com/impg/3aEXff3A6g-eOOBdZsBF_6rEqs4AWt8g7ulY4Q/FLtQx-w-Nag.jpg?size=640x1340&quality=96&sign=f817b5f4e72a8e1f445154e181bc1ebc&type=album">


## Challenge

- [x] Try replacing the widthAnchor of our labels with leadingAnchor and trailingAnchor constraints, which more explicitly pin the label to the edges of its parent.
- [x] Once you’ve completed the first challenge, try using the safeAreaLayoutGuide for those constraints. You can see if this is working by rotating to landscape, because the labels won’t go under the safe area.
- [ ] Try making the height of your labels equal to 1/5th of the main view, minus 10 for the spacing. This is a hard one, but I’ve included hints below!

<img width="500" alt="P2" src="https://sun9-46.userapi.com/impg/_ZQCsCIpB5Y3EUkiql2t8vBjrz98a12bcKxyCg/VRD_l9EPg1M.jpg?size=1220x736&quality=96&sign=ff1b415ed4e4a33459410ab40ca63db1&type=album">
