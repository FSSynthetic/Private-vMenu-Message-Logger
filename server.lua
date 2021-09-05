--------------------------------
----Created by FSSynthetic------
--------------------------------

    --[[ 
    This is the webhook URL that will send the log it's configured to.
    You must change this to your webhook URL you have set to your logging channel.
     ]]
local Webhook = 'Insert webhook URL here'

 -- This is the vMenu event that sends the private message to another player.
RegisterNetEvent('vMenu:SendMessageToPlayer', function(reciever, message)
    -- sender is the senders ID that will be logged.
    -- senderName is the senders name that will be logged.
    -- recieverName is the recievers name that will be logged.
    -- date is simply the date of the embed being posted.
    local sender = source
    local senderName = GetPlayerName(sender)
    local recieverName = GetPlayerName(reciever)
    local date = os.date(("%A, %m %B, %Y"))

    -- Reciever doesn't need to be assigned a value as it already gets assigned the recievers ID with the function so it makes life easier.

    --[[ 
        This is the function that sends the webhook with all it's content.
        The main message is separated by a plentiful of escape sequences in order to make it look nice and organized.
     ]]
    sendToDiscord(8421504, "New vMenu Private Message", "**Sender:**\n**ID: "..sender.."** | "..senderName.."\n\n**Reciever:**\n**ID: "..reciever.."** | "..recieverName.."\n\n**Message:** `"..message.."`", date)
    -- sendToDiscord(Color of embed, title, description content inside embed, footer)
end)

function sendToDiscord(color, name, message, footer)
    -- This is the embed configuration that will be sent in the http request below.
    local embed = {
          {
              ["color"] = color,

              ["title"] = "**".. name .."**",

              ["description"] = message,

              ["footer"] = {

                  ["text"] = footer,

              },
          }
      }
    
    -- This is the function that sends the embed above as a Discord webhook message. You can use this in any server-sided Lua script.
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end
