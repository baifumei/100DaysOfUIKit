# Local Notifications

## Send reminders, prompts and alerts even when your app isn't running.

- UNUserNotificationCenter, 
- UNNotificationRequest, 
- UNMutableNotificationContent, 
- UNCalendarNotificationTrigger, 
- UNTimeIntervalNotificationTrigger

<img width="300" alt="P2" src="https://sun9-58.userapi.com/impg/lApVOi1h-utZ67kPwhUwlym85EGTurnHv58tWA/vSsiTaty-Qc.jpg?size=996x2160&quality=95&sign=899569dd6a90d8d60b2d9979db8ba64c&type=album"> <img width="300" alt="P2" src="https://sun9-78.userapi.com/impg/rECS7bf8IrqLY7zmG6NlkCjwFYWV7Ar5SveWUw/K11Xb2Awx9w.jpg?size=996x2160&quality=95&sign=8ede916e3bfda0d53c35dbca40f22276&type=album"> <img width="300" alt="P2" src="https://sun9-43.userapi.com/impg/ZbqXw6-yNyZ6Z1_9m1NsszMDJSUiKO1GgO1yQA/gxEa9vtGx10.jpg?size=996x2160&quality=95&sign=f010846e68ef4e31eef1d8f8cfd2082e&type=album">

## Challenge

- [x] Update the code in didReceive so that it shows different instances of UIAlertController depending on which action identifier was passed in.
- [x] For a harder challenge, add a second UNNotificationAction to the alarm category of project 21. Give it the title “Remind me later”, and make it call scheduleLocal() so that the same alert is shown in 24 hours. (For the purpose of these challenges, a time interval notification with 86400 seconds is good enough – that’s roughly how many seconds there are in a day, excluding summer time changes and leap seconds.)
- [x] And for an even harder challenge, update project 2 so that it reminds players to come back and play every day. This means scheduling a week of notifications ahead of time, each of which launch the app. When the app is finally launched, make sure you call removeAllPendingNotificationRequests() to clear any un-shown alerts, then make new alerts for future days.

<img width="300" alt="P2" src="https://sun9-33.userapi.com/impg/ut_oM0axu3txlUGzG_OAw0aeoDiOl7Va8dmwuQ/ZA5oRpSebqE.jpg?size=996x2160&quality=95&sign=a22367d323a2b5eab4ddd7bfc733b47d&type=album"> <img width="300" alt="P2" src="https://sun9-42.userapi.com/impg/gHVrKF7Hfga_3bYgqpB5h23zovZu5GkhtpWcUg/ccRlAjhhlp0.jpg?size=996x2160&quality=95&sign=591990cdced7686471663b7bd08d0506&type=album">

<img width="300" alt="P2" src="https://sun9-35.userapi.com/impg/7Iz63NO6sCdcjGEWQd750ifC558av_s8jNkCPw/AezO9ZLXWR0.jpg?size=996x2160&quality=95&sign=bb250fa1a24ee992c804ad36a0b2e65e&type=album"> <img width="300" alt="P2" src="https://sun9-43.userapi.com/impg/Tfr_QE_b4pdF7fjREw9CsKDbE5qpbYagrSBrtg/SadjVF06LDo.jpg?size=996x2160&quality=95&sign=0daabb7b01d3434ce08c5b11c015456b&type=album">
