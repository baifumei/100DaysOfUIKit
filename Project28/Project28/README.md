# Secret Swift

## Touch ID and Face ID, device keychain

💡 What's new to know:
- LocalAuthentication;
- NotificationCenter.default and its .addObserver();
- NSError;
- LAContext() and .canEvaluatePolicy(), .evaluatePolicy();
- KeychainWrapper.standard.string().

<img width="300" alt="P2" src="https://sun9-67.userapi.com/impg/TheVQM6DfY4MLapsuXKMolvCVSN-cqKYJZzhoA/Lm8rRm-XTSc.jpg?size=996x2160&quality=95&sign=0efd7a9adea5f4161ab27723fbb10b8d&type=album"> <img width="300" alt="P2" src="https://sun9-66.userapi.com/impg/d1A8hO32nPM2jHkUNMq6-AFsIktQGznfklhNXw/jjlS6yA3o20.jpg?size=996x2160&quality=95&sign=4f589dd6ed53315ccf845ef6b2cd0a2a&type=album"> <img width="300" alt="P2" src="https://sun9-29.userapi.com/impg/l0fBM7a9Dm0j9pxAG3cm3P0PJTxvZvdIdZe9Fw/8ae1GXqxxPI.jpg?size=996x2160&quality=95&sign=714e595101a9d0452401d39992d1b8de&type=album"> <img width="300" alt="P2" src="https://sun9-54.userapi.com/impg/2P9boNoVJT-sq-x2RSjpV_yonhdgW0psUFH-Zw/ruQ2EDZm55E.jpg?size=996x2160&quality=95&sign=f4573bf95203cf040168951b8bddf091&type=album"> <img width="300" alt="P2" src="https://sun9-80.userapi.com/impg/CBGNHPrA9-9tkgJMVMxK0ig5pjcTe1ih-chHgw/Axo_nv_lKp8.jpg?size=996x2160&quality=95&sign=1e4f4fce6921ed61c0f92db7f2fb999e&type=album"> <img width="300" alt="P2" src="https://sun9-71.userapi.com/impg/zzmf5MzEg2bEOKYtX7ly7Kzl7rR0u7hegA0Fyw/Cluosb9ikZA.jpg?size=996x2160&quality=95&sign=89b2cc700f34ff90646c87b964a61ee3&type=album"> <img width="300" alt="P2" src="https://sun9-15.userapi.com/impg/wgNLtiBDE2IjmfbLRBgkF8zqUbSXNbaP7MuK0A/QPC2m1vsv3w.jpg?size=996x2160&quality=95&sign=09049ddef0b0127b2c6c46554be78b9e&type=album"> 

## Challenge:

- [x] Add a Done button as a navigation bar item that causes the app to re-lock immediately rather than waiting for the user to quit. This should only be shown when the app is unlocked.
- [x] Create a password system for your app so that the Touch ID/Face ID fallback is more useful. You'll need to use an alert controller with a text field like we did in project 5, and I suggest you save the password in the keychain!
- [ ] Go back to project 10 (Names to Faces) and add biometric authentication so the user’s pictures are shown only when they have unlocked the app. You’ll need to give some thought to how you can hide the pictures – perhaps leave the array empty until they are authenticated?

<img width="300" alt="P2" src="https://sun9-55.userapi.com/impg/GVFpYQ6FCKmk577DRn9Z_gGdU4673S66Kcnxbg/7dXgRkcCIhg.jpg?size=996x2160&quality=95&sign=a3823527f62d6dbbf9b96c13040cee27&type=album"> <img width="300" alt="P2" src="https://sun9-78.userapi.com/impg/J5xbyhDS0Vuz_XGJakeUN99gbeooxCrUBmxlJg/XNivmZHDNgM.jpg?size=996x2160&quality=95&sign=b80e8bbc5ce7b295a1675aea081db271&type=album"> <img width="300" alt="P2" src="https://sun9-13.userapi.com/impg/YeNfXld6LkpDN5dyxvaK33rHtN2tOmgdnNtYjg/JU4IeJ9ZbA4.jpg?size=996x2160&quality=95&sign=87746f5e5781a06b982216983d361550&type=album"> 
