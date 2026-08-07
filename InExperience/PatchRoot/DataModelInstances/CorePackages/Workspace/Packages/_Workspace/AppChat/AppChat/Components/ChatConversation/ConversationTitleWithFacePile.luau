local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local conversationFacePileModule = require(appChat.Components.Cells.ConversationFacePile)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useGetUserFromIdModule = require(appChat.Hooks.useGetUserFromId)
local conversationModule = require(appChat.Models.Conversation)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId

return function(p0) --[[ line: 24 ]]
	-- upvalues: useTokens (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), useGetConversationFromIdModule (ref), useLocalUserId (ref), conversationModule (ref), getOtherParticipantsModule (ref), useGetUserFromIdModule (ref), foundationModule (ref), conversationFacePileModule (ref)
	local var11 = useTokens()
	local var12 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var13 = reactModule.useCallback(function() --[[ line: 27 ]]
		-- upvalues: var12 (ref), chatConversationTelemetryEventsModule (copy), p0 (ref)
		var12.emit(chatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		p0.navigateToChatDetails()
	end, { p0.navigateToChatDetails, var12 })
	local name = nil
	local _ = nil
	local titleText = p0.titleText
	local var15 = useGetConversationFromIdModule(p0.conversationId)
	local var16 = var15 and var15.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION
	local var17 = useGetUserFromIdModule(if var16 then getOtherParticipantsModule(var15, useLocalUserId())[1] else nil)
	
	if var17 then
		titleText = var15.title
		name = `@{var17.name}`
	end
	return reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
		TitleContainer = reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			cornerRadius = UDim.new(0, var11.Radius.Medium)
		}, {
			ConversationFacePile = reactModule.createElement(conversationFacePileModule, {
				conversationId = p0.conversationId,
				titleText = titleText,
				titleStyle = var11.Typography.TitleLarge,
				onActivated = var13,
				subtitleText = name,
				trustedConnectionIndicatorEnabled = if var16 then true else false
			})
		})
	})
end