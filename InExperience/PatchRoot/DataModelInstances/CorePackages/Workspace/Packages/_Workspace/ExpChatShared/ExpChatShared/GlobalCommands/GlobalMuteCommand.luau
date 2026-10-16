local Players = game:GetService("Players")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/mute", "/m" },
	clientRun = function(_, _, Text: string, p1) --[[ Line: 8 ]]
		-- upvalues: Players (copy)
		local Part: string = string.split(Text, " ")[2]
		local IsSegmentMatch: boolean = Part ~= nil and string.sub(Part, 1, 1) == "@"
		local Segment: string = if IsSegmentMatch then string.sub(Part, 2) else Part
		
		if not Segment or #Segment < 3 then
			return {
				key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
				metadata = "Roblox.GlobalMute.Error.PlayerNotFound",
				args = { RBX_NAME = Segment or "" }
			}
		elseif not p1 or not p1.globalMutedUsersStore then
			return {
				key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
				metadata = "Roblox.GlobalMute.Error.ContextNotAvailable",
				args = {}
			}
		elseif not IsSegmentMatch then
			p1.globalMutedUsersStore.muteGlobalDisplayName(Segment)
			
			return {
				key = "CoreScripts.TextChat.Mute.Success",
				metadata = "Roblox.GlobalMute.Info.Success",
				args = { RBX_NAME = Segment }
			}
		else
			local Lowered = string.lower(Segment)
			
			if Players.LocalPlayer and string.lower(Players.LocalPlayer.Name) == Lowered then
				return {
					key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
					metadata = "Roblox.GlobalMute.Error.CannotMuteSelf",
					args = {}
				}
			else
				p1.globalMutedUsersStore.muteGlobalUsername(Lowered)
				
				return {
					key = "CoreScripts.TextChat.Mute.Success",
					metadata = "Roblox.GlobalMute.Info.Success",
					args = { RBX_NAME = "@" .. Lowered }
				}
			end
		end
	end
}