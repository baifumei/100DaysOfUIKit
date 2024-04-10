# Selfie Share

## Multipeer Connectivity Framework. Make a multipeer photo sharing app in just 150 lines of code.

💡 what was learned:

- Multipeer Connectivity Framework
- MCBrowserViewControllerDelegate, MCSessionDelegate
- MCSession, MCAdvertiserAssistant, MCPeerID, MCBrowserViewController

<img width="300" alt="P2" src="https://sun9-46.userapi.com/impg/nvsYmV5kWHFK_rUCPjRiSxtllYKM2gGdumn97Q/vDbOKFjmsNo.jpg?size=996x2160&quality=95&sign=0b887cdc56a1fb2f1476b27caf680ffb&type=album"> <img width="300" alt="P2" src="https://sun9-7.userapi.com/impg/iL4sGApg8QsJBakQv0SwaH0Pue4Ji7u69mq2vQ/5MD1VglqQpc.jpg?size=996x2160&quality=95&sign=e8d65f5b5b41c2cbfcc122e0d98e273e&type=album"> 

## Challenge:

- [ ] Show an alert when a user has disconnected from our multipeer network. Something like “Paul’s iPhone has disconnected” is enough.
- [ ] Try sending text messages across the network. You can create a Data from a string using Data(yourString.utf8), and convert a Data back to a string by using String(decoding: yourData, as: UTF8.self).
- [ ] Add a button that shows an alert controller listing the names of all devices currently connected to the session – use the connectedPeers property of your session to find that information.






## Important notes:

Multipeer connectivity requires four new classes:

1) MCSession is the manager class that handles all multipeer connectivity for us.
2) MCPeerID identifies each user uniquely in a session.
3) MCAdvertiserAssistant is used when creating a session, telling others that we exist and handling invitations.
4) MCBrowserViewController is used when looking for sessions, showing users who is nearby and letting them join.
