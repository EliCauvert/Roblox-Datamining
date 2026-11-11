local GetPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local UserMutedModule = require(ExpChatShared.Actions.UserMuted)
local Parent = ExpChatShared.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatMuteStore = SharedFlagsModule.FFlagExpChatUseChatMuteStore
local ChatMuteModule = require(Parent.ChatMute)
local config = {
	["CoreScripts.TextChat.Mute.Error.TargetDoesNotExist"] = "Roblox.Mute.Error.PlayerNotFound",
	["CoreScripts.TextChat.Mute.Error.MultipleMatches"] = "Roblox.Mute.Error.MultipleMatches",
	["CoreScripts.TextChat.Mute.Error.CannotMuteSelf"] = "Roblox.Mute.Error.CannotMuteSelf",
	["CoreScripts.TextChat.Mute.Success"] = "Roblox.Mute.Info.Success"
}
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/mute", "/m" },
	clientRun = function(p1, p2, Text: string, p3)
		-- upvalues: FFlagExpChatUseChatMuteStore (copy), ChatMuteModule (copy), config (copy), GetPlayersFromStringModule (copy), FFlagExpChatUseMessagesStore (copy), UserMutedModule (copy)
		if FFlagExpChatUseChatMuteStore then
			local ResolveMuteTargetResult = ChatMuteModule.resolveMuteTarget(string.split(Text, " ")[2], (tostring(p2)))
			
			if ResolveMuteTargetResult.playerInfo then
				ChatMuteModule.mutePlayer(ResolveMuteTargetResult.playerInfo)
			end
			return {
				key = ResolveMuteTargetResult.key,
				args = ResolveMuteTargetResult.args,
				metadata = config[ResolveMuteTargetResult.key]
			}
		else
			local Part = string.split(Text, " ")[2]
			
			if not Part then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Mute.Error.PlayerNotFound",
					args = { RBX_NAME = "" }
				}
			end
			local PlayersFromStringModule = GetPlayersFromStringModule(p1:getState().Players, Part)
			
			if #PlayersFromStringModule == 0 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Mute.Error.PlayerNotFound",
					args = { RBX_NAME = Part }
				}
			end
			if #PlayersFromStringModule > 1 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.MultipleMatches",
					metadata = "Roblox.Mute.Error.MultipleMatches",
					args = {}
				}
			end
			local PlayersFromStringModuleEntry = PlayersFromStringModule[1]
			
			if PlayersFromStringModuleEntry.userId == tostring(p2) then
				return {
					key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
					metadata = "Roblox.Mute.Error.CannotMuteSelf",
					args = {}
				}
			end
			if FFlagExpChatUseMessagesStore then
				if not p3 or not p3.messagesStore then
					return {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.Mute.Error.ContextNotAvailable",
						args = {}
					}
				end
				p3.messagesStore.muteUser(PlayersFromStringModuleEntry.userId)
			else
				p1:dispatch(UserMutedModule(PlayersFromStringModuleEntry.userId))
			end
			return {
				key = "CoreScripts.TextChat.Mute.Success",
				metadata = "Roblox.Mute.Info.Success",
				args = { RBX_NAME = PlayersFromStringModuleEntry.nameToDisplay }
			}
		end
	end
}