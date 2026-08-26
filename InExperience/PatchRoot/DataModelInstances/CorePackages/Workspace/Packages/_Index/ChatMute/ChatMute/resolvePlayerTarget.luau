local getPlayersFromServiceModule = require(script.Parent.getPlayersFromService)

return function(p1, p2, p3)
	-- upvalues: getPlayersFromServiceModule (ref)
	if not p1 or p1 == "" then
		return {
			key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
			args = { RBX_NAME = "" }
		}
	end
	local var1 = getPlayersFromServiceModule(p1)
	
	if #var1 == 0 then
		return {
			key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
			args = { RBX_NAME = p1 }
		}
	elseif #var1 > 1 then
		return {
			key = "CoreScripts.TextChat.Mute.Error.MultipleMatches",
			args = {}
		}
	end
	local var2 = var1[1]
	
	return if var2.userId == p2 then {
		key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
		args = {}
	} else {
		key = p3,
		args = {
			RBX_NAME = if string.sub(string.lower(p1), 1, 1) == "@" then "@" .. var2.username else var2.displayName
		},
		playerInfo = var2
	}
end