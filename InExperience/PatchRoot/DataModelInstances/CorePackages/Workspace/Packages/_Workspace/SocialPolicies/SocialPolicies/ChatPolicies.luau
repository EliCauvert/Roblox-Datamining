return function(p1)
	return {
		getChatConversationHeaderGroupDetails = function()
			-- upvalues: p1 (ref)
			return p1.ChatConversationHeaderGroupDetails or false
		end,
		getChatHeaderSearch = function()
			-- upvalues: p1 (ref)
			return p1.ChatHeaderSearch or false
		end,
		getChatHeaderCreateChatGroup = function()
			-- upvalues: p1 (ref)
			return p1.ChatHeaderCreateChatGroup or false
		end,
		getChatHeaderHomeButton = function()
			-- upvalues: p1 (ref)
			return p1.ChatHeaderHomeButton or false
		end,
		getChatHeaderNotifications = function()
			-- upvalues: p1 (ref)
			return p1.ChatHeaderNotifications or false
		end,
		getChatPlayTogether = function()
			-- upvalues: p1 (ref)
			return p1.ChatPlayTogether or false
		end,
		getChatShareGameToChatFromChat = function()
			-- upvalues: p1 (ref)
			return p1.ChatShareGameToChatFromChat or false
		end,
		getChatTapConversationThumbnail = function()
			-- upvalues: p1 (ref)
			return p1.ChatTapConversationThumbnail or false
		end,
		getChatReportingDisabled = function()
			-- upvalues: p1 (ref)
			return p1.ChatReportingDisabled or false
		end,
		getChatViewProfileOption = function()
			-- upvalues: p1 (ref)
			return p1.ChatViewProfileOption or false
		end,
		getContactImporterEnabled = function()
			-- upvalues: p1 (ref)
			return p1.ContactImporterEnabled or false
		end
	}
end