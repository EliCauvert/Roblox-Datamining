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
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagUserTileUnfilteredChatIndicator = require(parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local var15 = if fFlagUserTileUnfilteredChatIndicator then dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p0) --[[ line: 33 ]]
	-- upvalues: useTokens (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), useGetConversationFromIdModule (ref), useLocalUserId (ref), conversationModule (ref), getOtherParticipantsModule (ref), useGetUserFromIdModule (ref), fFlagUserTileUnfilteredChatIndicator (ref), signalsModule (ref), var15 (ref), signalsReactModule (ref), foundationModule (ref), conversationFacePileModule (ref), conversationChannelsModule (ref)
	local var16 = useTokens()
	local var17 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var18 = reactModule.useCallback(function() --[[ line: 36 ]]
		-- upvalues: var17 (ref), chatConversationTelemetryEventsModule (copy), p0 (ref)
		var17.emit(chatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		p0.navigateToChatDetails()
	end, { p0.navigateToChatDetails, var17 })
	local var19 = nil
	local _ = nil
	local titleText = p0.titleText
	local var20 = useGetConversationFromIdModule(p0.conversationId)
	local var21 = var20 and var20.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION
	local var22 = if var21 then getOtherParticipantsModule(var20, useLocalUserId())[1] else nil
	local var23 = useGetUserFromIdModule(var22)
	local var24 = if fFlagUserTileUnfilteredChatIndicator then signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: signalsModule (copy), var22 (ref), var15 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 57 ]]
			-- upvalues: var22 (copy), var15 (copy)
			return if var22 == nil or var22 == "" then nil else var15.getIsTrustedConnection(var22).data(p1)
		end)
	end, { var22 })) else nil
	
	if var23 then
		titleText = var20.title
		var19 = if fFlagUserTileUnfilteredChatIndicator and var24 then "" else `@{var23.name}`
	end
	return reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
		TitleContainer = reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			cornerRadius = UDim.new(0, var16.Radius.Medium)
		}, {
			ConversationFacePile = reactModule.createElement(conversationFacePileModule, {
				conversationId = p0.conversationId,
				titleText = titleText,
				titleStyle = var16.Typography.TitleLarge,
				onActivated = var18,
				subtitleText = var19,
				trustedConnectionIndicatorEnabled = if var21 then true else false,
				shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator and var20 ~= nil and var20.moderationType == conversationChannelsModule.ModerationType.TrustedComms then true else nil
			})
		})
	})
end