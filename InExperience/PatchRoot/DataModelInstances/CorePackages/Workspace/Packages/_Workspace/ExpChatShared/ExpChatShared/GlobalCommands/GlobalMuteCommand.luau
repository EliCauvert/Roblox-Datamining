local playersService = game:GetService("Players")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/mute", "/m" },
	clientRun = function(_, _, p1, p2)
		-- upvalues: playersService (ref)
		local var1 = string.split(p1, " ")[2]
		local var2 = var1 ~= nil and string.sub(var1, 1, 1) == "@"
		local var3 = if var2 then string.sub(var1, 2) else var1
		
		if not var3 or #var3 < 3 then
			return {
				key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
				metadata = "Roblox.GlobalMute.Error.PlayerNotFound",
				args = { RBX_NAME = var3 or "" }
			}
		elseif not p2 or not p2.globalMutedUsersStore then
			return {
				key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
				metadata = "Roblox.GlobalMute.Error.ContextNotAvailable",
				args = {}
			}
		elseif not var2 then
			p2.globalMutedUsersStore.muteGlobalDisplayName(var3)
			
			return {
				key = "CoreScripts.TextChat.Mute.Success",
				metadata = "Roblox.GlobalMute.Info.Success",
				args = { RBX_NAME = var3 }
			}
		end
		local lowerText = string.lower(var3)
		
		if playersService.LocalPlayer and string.lower(playersService.LocalPlayer.Name) == lowerText then
			return {
				key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
				metadata = "Roblox.GlobalMute.Error.CannotMuteSelf",
				args = {}
			}
		end
		p2.globalMutedUsersStore.muteGlobalUsername(lowerText)
		
		return {
			key = "CoreScripts.TextChat.Mute.Success",
			metadata = "Roblox.GlobalMute.Info.Success",
			args = { RBX_NAME = "@" .. lowerText }
		}
	end
}