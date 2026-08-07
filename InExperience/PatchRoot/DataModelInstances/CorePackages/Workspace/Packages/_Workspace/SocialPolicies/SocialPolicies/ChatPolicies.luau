return function(p0) --[[ line: 1 | named "ChatPolicies" ]]
	return {
		getChatConversationHeaderGroupDetails = function() --[[ line: 3 ]]
			-- upvalues: p0 (ref)
			return p0.ChatConversationHeaderGroupDetails or false
		end,
		getChatHeaderSearch = function() --[[ line: 6 ]]
			-- upvalues: p0 (ref)
			return p0.ChatHeaderSearch or false
		end,
		getChatHeaderCreateChatGroup = function() --[[ line: 9 ]]
			-- upvalues: p0 (ref)
			return p0.ChatHeaderCreateChatGroup or false
		end,
		getChatHeaderHomeButton = function() --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0.ChatHeaderHomeButton or false
		end,
		getChatHeaderNotifications = function() --[[ line: 15 ]]
			-- upvalues: p0 (ref)
			return p0.ChatHeaderNotifications or false
		end,
		getChatPlayTogether = function() --[[ line: 18 ]]
			-- upvalues: p0 (ref)
			return p0.ChatPlayTogether or false
		end,
		getChatShareGameToChatFromChat = function() --[[ line: 21 ]]
			-- upvalues: p0 (ref)
			return p0.ChatShareGameToChatFromChat or false
		end,
		getChatTapConversationThumbnail = function() --[[ line: 24 ]]
			-- upvalues: p0 (ref)
			return p0.ChatTapConversationThumbnail or false
		end,
		getChatReportingDisabled = function() --[[ line: 27 ]]
			-- upvalues: p0 (ref)
			return p0.ChatReportingDisabled or false
		end,
		getChatViewProfileOption = function() --[[ line: 30 ]]
			-- upvalues: p0 (ref)
			return p0.ChatViewProfileOption or false
		end,
		getContactImporterEnabled = function() --[[ line: 33 ]]
			-- upvalues: p0 (ref)
			return p0.ContactImporterEnabled or false
		end
	}
end