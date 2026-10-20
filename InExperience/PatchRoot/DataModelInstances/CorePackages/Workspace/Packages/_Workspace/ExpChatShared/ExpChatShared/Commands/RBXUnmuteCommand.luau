local GetPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local Parent = script:FindFirstAncestor("ExpChatShared").Parent
local FFlagExpChatUseChatMuteStore = require(Parent.SharedFlags).FFlagExpChatUseChatMuteStore
local ChatMuteModule = require(Parent.ChatMute)
local config = {
	["CoreScripts.TextChat.Mute.Error.TargetDoesNotExist"] = "Roblox.Unmute.Error.PlayerNotFound",
	["CoreScripts.TextChat.Mute.Error.MultipleMatches"] = "Roblox.Unmute.Error.MultipleMatches",
	["CoreScripts.TextChat.Mute.Error.CannotMuteSelf"] = "Roblox.Unmute.Error.CannotMuteSelf",
	["CoreScripts.TextChat.Unmute.Success"] = "Roblox.Unmute.Info.Success"
}
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/unmute", "/um" },
	clientRun = function(p1, p2, Text: string, p3)
		-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), config (copy), GetPlayersFromStringModule (copy)
		if FFlagExpChatUseChatMuteStore then
			local ResolveUnmuteTargetResult = ChatMuteModule.resolveUnmuteTarget(string.split(Text, " ")[2], (tostring(p2)))
			
			if ResolveUnmuteTargetResult.playerInfo then
				ChatMuteModule.unmutePlayer(ResolveUnmuteTargetResult.playerInfo)
			end
			return {
				key = ResolveUnmuteTargetResult.key,
				args = ResolveUnmuteTargetResult.args,
				metadata = config[ResolveUnmuteTargetResult.key]
			}
		else
			local Part = string.split(Text, " ")[2]
			
			if not Part then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = "" }
				}
			end
			local PlayersFromStringModule = GetPlayersFromStringModule(p1:getState().Players, Part)
			
			if #PlayersFromStringModule == 0 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = Part }
				}
			elseif #PlayersFromStringModule > 1 then
				return {
					key = "InGame.Chat.Response.DisplayNameMultipleMatches",
					metadata = "Roblox.Unmute.Error.MultipleMatches",
					args = {}
				}
			else
				local PlayersFromStringModuleEntry = PlayersFromStringModule[1]
				
				if PlayersFromStringModuleEntry.userId == tostring(p2) then
					return {
						key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
						metadata = "Roblox.Unmute.Error.CannotMuteSelf",
						args = {}
					}
				elseif not p3 or not p3.messagesStore then
					return {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.Unmute.Error.ContextNotAvailable",
						args = {}
					}
				else
					p3.messagesStore.unmuteUser(PlayersFromStringModuleEntry.userId)
					return {
						key = "CoreScripts.TextChat.Unmute.Success",
						metadata = "Roblox.Unmute.Info.Success",
						args = { RBX_NAME = PlayersFromStringModuleEntry.nameToDisplay }
					}
				end
			end
		end
	end
}