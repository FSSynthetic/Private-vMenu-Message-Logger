-- This is the webhook URL that will send the log it's configured to.
Webhook = 'Insert webhook URL here'

 -- This is the vMenu event that sends the private message to another player.
RegisterNetEvent('vMenu:SendMessageToPlayer', function(reciever, message)
    local sender = source
    local senderName = GetPlayerName(sender)
    local recieverName = GetPlayerName(reciever)
    local date = os.date(("%A, %m %B, %Y"))

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
    
    -- This is the function that sends the embed above as a Discord webhook message.
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end
