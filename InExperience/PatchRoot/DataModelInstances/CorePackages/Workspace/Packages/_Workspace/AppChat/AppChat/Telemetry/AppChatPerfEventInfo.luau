local appChat = script:FindFirstAncestor("AppChat")
local appChatPerfEventModule = require(appChat.Telemetry.AppChatPerfEvent)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local t = {
	ChatLandingTTI = {
		baseName = "AppChat_TTI_ChatLanding",
		page = "ChatLanding"
	},
	ChatConversationTTI = {
		baseName = "AppChat_TTI_ChatConversation",
		page = "ChatConversation"
	},
	MessageSendTTI = {
		baseName = "AppChat_TTI_MessageSend",
		page = "ChatConversation"
	},
	MessageReceiveTTI = {
		baseName = "AppChat_TTI_MessageReceive",
		page = "ChatConversation"
	}
}
local t_1 = {
	ScrollConversationList = {
		name = "AppChat_Scroll_ConversationList",
		parentTTI = appChatPerfEventModule.ChatLandingTTI
	},
	PaginationConversationList = {
		name = "AppChat_Pagination_ConversationList",
		parentTTI = appChatPerfEventModule.ChatLandingTTI
	},
	ScrollMessageList = {
		name = "AppChat_Scroll_MessageList",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	PaginationMessageList = {
		name = "AppChat_Pagination_MessageList",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	MessageSendToPendingRender = {
		name = "AppChat_Message_SendToPendingRender",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	MessageSendResponseToFinalRender = {
		name = "AppChat_Message_SendResponseToFinalRender",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	MessageSendToFinalRender = {
		name = "AppChat_Message_SendToFinalRender",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	MessageReceiveToRender = {
		name = "AppChat_Message_ReceiveToRender",
		parentTTI = appChatPerfEventModule.ChatConversationTTI
	},
	TopBarRenderInterval = {
		name = "AppChat_TopBar_RenderInterval",
		parentTTI = appChatPerfEventModule.ChatLandingTTI
	}
}

return {
	TTI_CATEGORY = "AppChat",
	Events = appChatPerfEventModule,
	isTTIEvent = function(p0) --[[ line: 104 ]]
		-- upvalues: t (ref)
		return t[p0] ~= nil
	end,
	isIntervalEvent = function(p1) --[[ line: 108 ]]
		-- upvalues: t_1 (ref)
		return t_1[p1] ~= nil
	end,
	getTTIBaseName = function(p2) --[[ line: 116 ]]
		-- upvalues: t (ref)
		return t[p2].baseName
	end,
	getTTIPage = function(p3) --[[ line: 120 ]]
		-- upvalues: t (ref)
		return t[p3].page
	end,
	getTTICategory = function() --[[ line: 124 ]]
		return "AppChat"
	end,
	buildTTIEventName = function(p4, p5, p6) --[[ line: 129 ]]
		-- upvalues: t (ref), chatPlacementContextModule (ref)
		return t[p4].baseName .. (if chatPlacementContextModule.isPlacementInExperience(p5) then "_InExp" else "_UA") .. (if p6 then "_Cold" else "_Warm")
	end,
	getIntervalName = function(p7) --[[ line: 145 ]]
		-- upvalues: t_1 (ref)
		return t_1[p7].name
	end,
	getParentTTI = function(p8) --[[ line: 149 ]]
		-- upvalues: t_1 (ref)
		return t_1[p8].parentTTI
	end,
	getIntervalsForTTI = function(p9) --[[ line: 154 ]]
		-- upvalues: t_1 (ref)
		local t = {}
		
		for i, v in t_1 do
			if v.parentTTI == p9 then
				table.insert(t, i)
			end
		end
		return t
	end
}