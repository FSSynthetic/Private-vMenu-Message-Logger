# Private-vMenu-Message-Logger
---
*Hello again, back with another release for you all!*
*This is something I made not too long ago and figured it would be worth releasing to the world.*

#### This is a simple server-sided Lua script that logs all private vMenu sent messages to a Discord channel of your choice.
---
This script will log the person sending the message along with their in-game ID, the person receiving the message along with their in-game ID, the message being sent between them, and the date of the message.

The script works by registering the vMenu event __`"vMenu:SendMessageToPlayer"`__ that sends messages to players and logs them to Discord utilizing the __`"PerformHttpRequest"`__ native (Read more about it [here](https://docs.fivem.net/docs/scripting-reference/runtimes/lua/functions/PerformHttpRequest/))

The only thing you have to do is place the webhook URL of the channel you want it to log to.

**Preview of log:**

![image](https://user-images.githubusercontent.com/73238264/132111748-69c91652-84ea-4825-85fb-0de7ae6cba82.png)

Hope you enjoy!

P.S. Don’t worry, the sender and receiver work properly, I just have no one to test with so I sent a message to myself : (
