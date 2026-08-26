local getPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local userMutedModule = require(expChatShared.Actions.UserMuted)
local parent = expChatShared.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatMuteStore = sharedFlagsModule.FFlagExpChatUseChatMuteStore
local chatMuteModule = require(parent.ChatMute)
local t = {
	["CoreScripts.TextChat.Mute.Error.TargetDoesNotExist"] = "Roblox.Mute.Error.PlayerNotFound",
	["CoreScripts.TextChat.Mute.Error.MultipleMatches"] = "Roblox.Mute.Error.MultipleMatches",
	["CoreScripts.TextChat.Mute.Error.CannotMuteSelf"] = "Roblox.Mute.Error.CannotMuteSelf",
	["CoreScripts.TextChat.Mute.Success"] = "Roblox.Mute.Info.Success"
}
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/mute", "/m" },
	clientRun = function(p1, p2, p3, p4)
		-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), t (ref), getPlayersFromStringModule (ref), fFlagExpChatUseMessagesStore (ref), userMutedModule (ref)
		if fFlagExpChatUseChatMuteStore then
			local var1 = chatMuteModule.resolveMuteTarget(string.split(p3, " ")[2], tostring(p2))
			
			if var1.playerInfo then
				chatMuteModule.mutePlayer(var1.playerInfo)
			end
			return { key = var1.key, args = var1.args, metadata = t[var1.key] }
		else
			local var2 = string.split(p3, " ")[2]
			
			if not var2 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Mute.Error.PlayerNotFound",
					args = { RBX_NAME = "" }
				}
			end
			local var3 = getPlayersFromStringModule(p1:getState().Players, var2)
			
			if #var3 == 0 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Mute.Error.PlayerNotFound",
					args = { RBX_NAME = var2 }
				}
			elseif #var3 > 1 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.MultipleMatches",
					metadata = "Roblox.Mute.Error.MultipleMatches",
					args = {}
				}
			end
			local var4 = var3[1]
			
			if var4.userId == tostring(p2) then
				return {
					key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
					metadata = "Roblox.Mute.Error.CannotMuteSelf",
					args = {}
				}
			elseif fFlagExpChatUseMessagesStore then
				if not p4 or not p4.messagesStore then
					return {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.Mute.Error.ContextNotAvailable",
						args = {}
					}
				end
				p4.messagesStore.muteUser(var4.userId)
			else
				p1:dispatch(userMutedModule(var4.userId))
			end
			return {
				key = "CoreScripts.TextChat.Mute.Success",
				metadata = "Roblox.Mute.Info.Success",
				args = { RBX_NAME = var4.nameToDisplay }
			}
		end
	end
}