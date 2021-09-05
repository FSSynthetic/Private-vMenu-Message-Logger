
RegisterNetEvent('vMenu:SendMessageToPlayer', function(reciever, message) -- This is the vMenu event that sends the private message to another player
    local sender = source
    local senderName = GetPlayerName(sender)
    local recieverName = GetPlayerName(reciever)
    local date = os.date(("%A, %m %B, %Y"))
    sendToDiscord(8421504, "New vMenu Private Message", "**Sender:**\n**ID: "..sender.."** | "..senderName.."\n\n**Reciever:**\n**ID: "..reciever.."** | "..recieverName.."\n\n**Message:** `"..message.."`", date)
    -- sendToDiscord(Color of embed, title, description (content inside embed), footer)
end)

function sendToDiscord(color, name, message, footer)
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
  
    PerformHttpRequest('Put Webhook URL here', function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end