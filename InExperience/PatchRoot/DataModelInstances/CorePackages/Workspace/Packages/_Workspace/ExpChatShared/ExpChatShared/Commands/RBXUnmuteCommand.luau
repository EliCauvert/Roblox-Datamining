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
	clientRun = function(p0, p1, p2, p3)
		-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), t (ref), getPlayersFromStringModule (ref), fFlagExpChatUseMessagesStore (ref), userUnmutedModule (ref)
		if fFlagExpChatUseChatMuteStore then
			local var6 = chatMuteModule.resolveUnmuteTarget(string.split(p2, " ")[2], tostring(p1))
			
			if var6.playerInfo then
				chatMuteModule.unmutePlayer(var6.playerInfo)
			end
			return { key = var6.key, args = var6.args, metadata = t[var6.key] }
		else
			local var7 = string.split(p2, " ")[2]
			
			if not var7 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = "" }
				}
			end
			local var8 = getPlayersFromStringModule(p0:getState().Players, var7)
			
			if #var8 == 0 then
				return {
					key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
					metadata = "Roblox.Unmute.Error.PlayerNotFound",
					args = { RBX_NAME = var7 }
				}
			elseif #var8 > 1 then
				return {
					key = "InGame.Chat.Response.DisplayNameMultipleMatches",
					metadata = "Roblox.Unmute.Error.MultipleMatches",
					args = {}
				}
			end
			local var9 = var8[1]
			
			if var9.userId == tostring(p1) then
				return {
					key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
					metadata = "Roblox.Unmute.Error.CannotMuteSelf",
					args = {}
				}
			elseif fFlagExpChatUseMessagesStore then
				if not p3 or not p3.messagesStore then
					return {
						key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
						metadata = "Roblox.Unmute.Error.ContextNotAvailable",
						args = {}
					}
				end
				p3.messagesStore.unmuteUser(var9.userId)
			else
				p0:dispatch(userUnmutedModule(var9.userId))
			end
			return {
				key = "CoreScripts.TextChat.Unmute.Success",
				metadata = "Roblox.Unmute.Info.Success",
				args = { RBX_NAME = var9.nameToDisplay }
			}
		end
	end
}