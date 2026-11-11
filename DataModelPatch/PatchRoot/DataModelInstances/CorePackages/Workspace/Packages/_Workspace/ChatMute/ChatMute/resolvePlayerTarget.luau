local GetPlayersFromServiceModule = require(script.Parent.getPlayersFromService)

return function(Text: string, UserId, Key)
	-- upvalues: GetPlayersFromServiceModule (copy)
	if not Text or Text == "" then
		return {
			key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
			args = { RBX_NAME = "" }
		}
	end
	local PlayersFromServiceModule = GetPlayersFromServiceModule(Text)
	
	if #PlayersFromServiceModule == 0 then
		return {
			key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
			args = { RBX_NAME = Text }
		}
	elseif #PlayersFromServiceModule > 1 then
		return {
			key = "CoreScripts.TextChat.Mute.Error.MultipleMatches",
			args = {}
		}
	else
		local PlayersFromServiceModuleEntry = PlayersFromServiceModule[1]
		
		return if PlayersFromServiceModuleEntry.userId == UserId then {
			key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
			args = {}
		} else {
			key = Key,
			args = {
				RBX_NAME = if string.sub(string.lower(Text), 1, 1) == "@" then "@" .. PlayersFromServiceModuleEntry.username else PlayersFromServiceModuleEntry.displayName
			},
			playerInfo = PlayersFromServiceModuleEntry
		}
	end
end