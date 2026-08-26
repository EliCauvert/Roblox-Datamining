local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)

if require(expChat.Flags.FFlagExpChatUseChatMuteStore) then
	local chatMuteModule = require(parent.ChatMute)
	
	return signalsModule.createComputed(function()
		-- upvalues: chatMuteModule (ref)
		return {
			getMutedGlobalUsernames = chatMuteModule.getMutedUsernames(),
			getMutedGlobalDisplayNames = chatMuteModule.getMutedDisplayNames(),
			getMutedGlobalUserIds = chatMuteModule.getMutedUserIds(),
			muteGlobalUsername = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ username = p1 })
			end,
			unmuteGlobalUsername = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ username = p1 })
			end,
			muteGlobalDisplayName = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ displayName = p1 })
			end,
			unmuteGlobalDisplayName = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ displayName = p1 })
			end,
			isUsernameMuted = chatMuteModule.isUsernameMuted,
			isDisplayNameMuted = chatMuteModule.isDisplayNameMuted,
			muteGlobalUserId = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ userId = tostring(p1) })
			end,
			unmuteGlobalUserId = function(p1)
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ userId = tostring(p1) })
			end,
			isUserIdMuted = chatMuteModule.isUserIdMuted
		}
	end)
end
return signalsModule.createComputed(require(script.createGlobalMutedUsersStore))