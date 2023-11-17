# eden_assessment

Few details about the assessment:

API_KEY: zZgLiw.TgBwTw:9m1QhhlD1AgAjhnFA8BA-CpfM0ZX6gvDAvlhUzmkSAw
Channel used: eden_ifeanyi
State management: Riverpod


Steps to take to trigger ably realtime data

- You have to send a message ver terminal with a number from 1-6 to trigger the steps in the Order Tracking. The message structure is below
curl -X POST https://realtime.ably.io/channels/eden_ifeanyi/messages -u "zZgLiw.TgBwTw:9m1QhhlD1AgAjhnFA8BA-CpfM0ZX6gvDAvlhUzmkSAw" -H "Content-Type: application/json"  --data '{ "data": 1 }'

# Please note
- The data object has to be exactly in the format shown above
- The number has to be sequential, that means you have to start from 1 and move according to 2, 3, 4, 5 and 6.