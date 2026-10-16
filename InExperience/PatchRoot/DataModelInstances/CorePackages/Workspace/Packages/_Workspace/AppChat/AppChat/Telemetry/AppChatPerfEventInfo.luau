local AppChat = script:FindFirstAncestor("AppChat")
local AppChatPerfEventModule = require(AppChat.Telemetry.AppChatPerfEvent)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local config = {
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
local config1 = {
	ScrollConversationList = {
		name = "AppChat_Scroll_ConversationList",
		parentTTI = AppChatPerfEventModule.ChatLandingTTI
	},
	PaginationConversationList = {
		name = "AppChat_Pagination_ConversationList",
		parentTTI = AppChatPerfEventModule.ChatLandingTTI
	},
	ScrollMessageList = {
		name = "AppChat_Scroll_MessageList",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	PaginationMessageList = {
		name = "AppChat_Pagination_MessageList",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	MessageSendToPendingRender = {
		name = "AppChat_Message_SendToPendingRender",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	MessageSendResponseToFinalRender = {
		name = "AppChat_Message_SendResponseToFinalRender",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	MessageSendToFinalRender = {
		name = "AppChat_Message_SendToFinalRender",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	MessageReceiveToRender = {
		name = "AppChat_Message_ReceiveToRender",
		parentTTI = AppChatPerfEventModule.ChatConversationTTI
	},
	TopBarRenderInterval = {
		name = "AppChat_TopBar_RenderInterval",
		parentTTI = AppChatPerfEventModule.ChatLandingTTI
	}
}

return {
	TTI_CATEGORY = "AppChat",
	Events = AppChatPerfEventModule,
	isTTIEvent = function(p1): boolean --[[ Line: 104 ]]
		-- upvalues: config (copy)
		return config[p1] ~= nil
	end,
	isIntervalEvent = function(p1): boolean --[[ Line: 108 ]]
		-- upvalues: config1 (copy)
		return config1[p1] ~= nil
	end,
	getTTIBaseName = function(p1) --[[ Line: 116 ]]
		-- upvalues: config (copy)
		return config[p1].baseName
	end,
	getTTIPage = function(p1) --[[ Line: 120 ]]
		-- upvalues: config (copy)
		return config[p1].page
	end,
	getTTICategory = function(): string --[[ Line: 124 ]]
		return "AppChat"
	end,
	buildTTIEventName = function(p1, p2, p3): string --[[ Line: 129 ]]
		-- upvalues: config (copy), ChatPlacementContextModule (copy)
		return config[p1].baseName .. (if ChatPlacementContextModule.isPlacementInExperience(p2) then "_InExp" else "_UA") .. (if p3 then "_Cold" else "_Warm")
	end,
	getIntervalName = function(p1) --[[ Line: 145 ]]
		-- upvalues: config1 (copy)
		return config1[p1].name
	end,
	getParentTTI = function(p1) --[[ Line: 149 ]]
		-- upvalues: config1 (copy)
		return config1[p1].parentTTI
	end,
	getIntervalsForTTI = function(ParentTTI) --[[ Line: 154 ]]
		-- upvalues: config1 (copy)
		local List = {}
		
		for i, value in config1 do
			if value.parentTTI == ParentTTI then
				table.insert(List, i)
			end
		end
		return List
	end
}