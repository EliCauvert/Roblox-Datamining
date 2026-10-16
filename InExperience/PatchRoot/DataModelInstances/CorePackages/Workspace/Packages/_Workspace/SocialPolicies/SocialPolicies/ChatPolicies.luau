return function(p1) --[[ Line: 1 | Named "ChatPolicies" ]]
	return {
		getChatConversationHeaderGroupDetails = function() --[[ Line: 3 ]]
			-- upvalues: p1 (copy)
			return p1.ChatConversationHeaderGroupDetails or false
		end,
		getChatHeaderSearch = function() --[[ Line: 6 ]]
			-- upvalues: p1 (copy)
			return p1.ChatHeaderSearch or false
		end,
		getChatHeaderCreateChatGroup = function() --[[ Line: 9 ]]
			-- upvalues: p1 (copy)
			return p1.ChatHeaderCreateChatGroup or false
		end,
		getChatHeaderHomeButton = function() --[[ Line: 12 ]]
			-- upvalues: p1 (copy)
			return p1.ChatHeaderHomeButton or false
		end,
		getChatHeaderNotifications = function() --[[ Line: 15 ]]
			-- upvalues: p1 (copy)
			return p1.ChatHeaderNotifications or false
		end,
		getChatPlayTogether = function() --[[ Line: 18 ]]
			-- upvalues: p1 (copy)
			return p1.ChatPlayTogether or false
		end,
		getChatShareGameToChatFromChat = function() --[[ Line: 21 ]]
			-- upvalues: p1 (copy)
			return p1.ChatShareGameToChatFromChat or false
		end,
		getChatTapConversationThumbnail = function() --[[ Line: 24 ]]
			-- upvalues: p1 (copy)
			return p1.ChatTapConversationThumbnail or false
		end,
		getChatReportingDisabled = function() --[[ Line: 27 ]]
			-- upvalues: p1 (copy)
			return p1.ChatReportingDisabled or false
		end,
		getChatViewProfileOption = function() --[[ Line: 30 ]]
			-- upvalues: p1 (copy)
			return p1.ChatViewProfileOption or false
		end,
		getContactImporterEnabled = function() --[[ Line: 33 ]]
			-- upvalues: p1 (copy)
			return p1.ContactImporterEnabled or false
		end
	}
end