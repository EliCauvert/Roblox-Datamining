local getPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local userUnmutedModule = require(expChatShared.Actions.UserUnmuted)
local parent = expChatShared.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatMuteStore = sharedFlagsModule.FFlagExpChatUseChatMuteStore
local chatMuteModule = require(parent.ChatMute)
local t = {
	["CoreScripts.TextChat.Mute.Error.TargetDoesNotExist"] = "Roblox.Unmute.Error.PlayerNotFound",
	["CoreScripts.TextChat.Mute.Error.MultipleMatches"] = "Roblox.Unmute.Error.MultipleMatches",
	["CoreScripts.TextChat.Mute.Error.CannotMuteSelf"] = "Roblox.Unmute.Error.CannotMuteSelf",
	["CoreScripts.TextChat.Unmute.Success"] = "Roblox.Unmute.Info.Success"
}
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/unmute", "/um" },
	clientRun = function(p1, p2, p3, p4)
		-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), t (ref), getPlayersFromStringModule (ref), fFlagExpChatUseMessagesStore (ref), userUnmutedModule (ref)
		if fFlagExpChatUseChatMuteStore then
			local var1 = chatMuteModule.resolveUnmuteTarget(string.split(p3, " ")[2], tostring(p2))
			
			if var1.playerInfo then
				chatMuteModule.unmutePlayer(var1.playerInfo)
			end
			return { key = var1.key, args = var1.args, metadata = t[var1.key] }
		else
			local var2 = string.split(p3, " ")[2]
			
			if not var2 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = "" }
				}
			end
			local var3 = getPlayersFromStringModule(p1:getState().Players, var2)
			
			if #var3 == 0 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = var2 }
				}
			elseif #var3 > 1 then
				return {
					key = "InGame.Chat.Response.DisplayNameMultipleMatches",
					metadata = "Roblox.Unmute.Error.MultipleMatches",
					args = {}
				}
			end
			local var4 = var3[1]
			
			if var4.userId == tostring(p2) then
				return {
					key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
					metadata = "Roblox.Unmute.Error.CannotMuteSelf",
					args = {}
				}
			elseif fFlagExpChatUseMessagesStore then
				if not p4 or not p4.messagesStore then
					return {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.Unmute.Error.ContextNotAvailable",
						args = {}
					}
				end
				p4.messagesStore.unmuteUser(var4.userId)
			else
				p1:dispatch(userUnmutedModule(var4.userId))
			end
			return {
				key = "CoreScripts.TextChat.Unmute.Success",
				metadata = "Roblox.Unmute.Info.Success",
				args = { RBX_NAME = var4.nameToDisplay }
			}
		end
	end
}