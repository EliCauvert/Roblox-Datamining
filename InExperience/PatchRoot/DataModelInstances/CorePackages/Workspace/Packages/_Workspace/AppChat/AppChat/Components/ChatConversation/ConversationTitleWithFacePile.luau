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
local var1 = if fFlagUserTileUnfilteredChatIndicator then dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p1)
	-- upvalues: useTokens (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), useGetConversationFromIdModule (ref), useLocalUserId (ref), conversationModule (ref), getOtherParticipantsModule (ref), useGetUserFromIdModule (ref), fFlagUserTileUnfilteredChatIndicator (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref), foundationModule (ref), conversationFacePileModule (ref), conversationChannelsModule (ref)
	local var2 = useTokens()
	local var3 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), chatConversationTelemetryEventsModule (copy), p1 (ref)
		var3.emit(chatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		p1.navigateToChatDetails()
	end, { p1.navigateToChatDetails, var3 })
	local var5 = nil
	local _ = nil
	local titleText = p1.titleText
	local var6 = useGetConversationFromIdModule(p1.conversationId)
	local var7 = var6 and var6.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION
	local var8 = if var7 then getOtherParticipantsModule(var6, useLocalUserId())[1] else nil
	local var9 = useGetUserFromIdModule(var8)
	local var10 = if fFlagUserTileUnfilteredChatIndicator then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var8 (ref), var1 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var8 (copy), var1 (copy)
			return if var8 == nil or var8 == "" then nil else var1.getIsTrustedConnection(var8).data(p2)
		end)
	end, { var8 })) else nil
	
	if var9 then
		titleText = var6.title
		var5 = if fFlagUserTileUnfilteredChatIndicator and var10 then "" else `@{var9.name}`
	end
	return reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
		TitleContainer = reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			cornerRadius = UDim.new(0, var2.Radius.Medium)
		}, {
			ConversationFacePile = reactModule.createElement(conversationFacePileModule, {
				conversationId = p1.conversationId,
				titleText = titleText,
				titleStyle = var2.Typography.TitleLarge,
				onActivated = var4,
				subtitleText = var5,
				trustedConnectionIndicatorEnabled = if var7 then true else false,
				shouldShowUnfilteredChatIndicator = if fFlagUserTileUnfilteredChatIndicator and var6 ~= nil and var6.moderationType == conversationChannelsModule.ModerationType.TrustedComms then true else nil
			})
		})
	})
end