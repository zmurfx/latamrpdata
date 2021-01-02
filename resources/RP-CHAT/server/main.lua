
function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

  AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = getIdentity(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name.firstname, message)
      end
      CancelEvent()
  end)

  TriggerEvent('es:addCommand', 'me', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname .. " " .. name.lastname, table.concat(args, " "))
  end)

  TriggerEvent('es:addCommand', 'do', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name.firstname, table.concat(args, " "))
  end)

  TriggerEvent('es:addCommand', 'twt', function(source, args, user)
	local name = getIdentity(source)
  	TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. name.firstname .. " " .. name.lastname .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = ' [IC]'})

  TriggerEvent('es:addCommand', 'ooc', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "OOC | " .. GetPlayerName(source), {128, 128, 128}, table.concat(args, " "))
  end, {help = 'Send an out of character message to the whole server.'})
   
   TriggerEvent('es:addCommand', 'darkweb', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^6Darkweb^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = ' [IC]'})

    TriggerEvent('es:addCommand', 'news', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^2Weazel_News^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = ' [IC]'}) 
  
     TriggerEvent('es:addCommand', 'wanted', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^5Wanted^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = ' [IC]'})
  
     TriggerEvent('es:addCommand', 'darkweb', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^2Darkweb^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = 'Wyslij darka [IC]'})
  
     TriggerEvent('es:addCommand', 'warning', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^3Warning^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, {help = ' [OOC]'})
  
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
