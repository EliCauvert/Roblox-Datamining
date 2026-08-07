local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)

if require(expChat.Flags.FFlagExpChatUseChatMuteStore) then
	local chatMuteModule = require(parent.ChatMute)
	
	return signalsModule.createComputed(function() --[[ line: 11 ]]
		-- upvalues: chatMuteModule (ref)
		return {
			getMutedGlobalUsernames = chatMuteModule.getMutedUsernames(),
			getMutedGlobalDisplayNames = chatMuteModule.getMutedDisplayNames(),
			getMutedGlobalUserIds = chatMuteModule.getMutedUserIds(),
			muteGlobalUsername = function(p0) --[[ line: 16 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ username = p0 })
			end,
			unmuteGlobalUsername = function(p1) --[[ line: 19 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ username = p1 })
			end,
			muteGlobalDisplayName = function(p2) --[[ line: 22 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ displayName = p2 })
			end,
			unmuteGlobalDisplayName = function(p3) --[[ line: 25 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ displayName = p3 })
			end,
			isUsernameMuted = chatMuteModule.isUsernameMuted,
			isDisplayNameMuted = chatMuteModule.isDisplayNameMuted,
			muteGlobalUserId = function(p4) --[[ line: 30 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.mutePlayer({ userId = tostring(p4) })
			end,
			unmuteGlobalUserId = function(p5) --[[ line: 33 ]]
				-- upvalues: chatMuteModule (copy)
				chatMuteModule.unmutePlayer({ userId = tostring(p5) })
			end,
			isUserIdMuted = chatMuteModule.isUserIdMuted
		}
	end)
end
return signalsModule.createComputed(require(script.createGlobalMutedUsersStore))