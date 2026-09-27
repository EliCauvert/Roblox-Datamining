local getPlayersFromStringModule = require(script.Parent.getPlayersFromString)
local parent = script:FindFirstAncestor("ExpChatShared").Parent
local fFlagExpChatUseChatMuteStore = require(parent.SharedFlags).FFlagExpChatUseChatMuteStore
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
		-- upvalues: fFlagExpChatUseChatMuteStore (ref), chatMuteModule (ref), t (ref), getPlayersFromStringModule (ref)
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
			elseif p4 and p4.messagesStore then
				p4.messagesStore.unmuteUser(var4.userId)
			else
				return {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Unmute.Error.ContextNotAvailable",
					args = {}
				}
			end
			return {
				key = "CoreScripts.TextChat.Unmute.Success",
				metadata = "Roblox.Unmute.Info.Success",
				args = { RBX_NAME = var4.nameToDisplay }
			}
		end
	end
}