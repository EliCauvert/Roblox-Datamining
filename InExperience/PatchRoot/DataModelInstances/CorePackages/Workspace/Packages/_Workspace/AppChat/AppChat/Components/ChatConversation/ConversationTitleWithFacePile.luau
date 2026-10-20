local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ChatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ConversationFacePileModule = require(AppChat.Components.Cells.ConversationFacePile)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseGetUserFromIdModule = require(AppChat.Hooks.useGetUserFromId)
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagUserTileUnfilteredChatIndicator = require(Parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local GetResult = if FFlagUserTileUnfilteredChatIndicator then DataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), ReactModule (copy), ChatConversationTelemetryEventsModule (copy), UseGetConversationFromIdModule (copy), UseLocalUserIdFunction (copy), ConversationModule (copy), GetOtherParticipantsModule (copy), UseGetUserFromIdModule (copy), FFlagUserTileUnfilteredChatIndicator (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy), FoundationModule (copy), ConversationFacePileModule (copy), ConversationChannelsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), p1 (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		p1.navigateToChatDetails()
	end, { p1.navigateToChatDetails, UseTelemetryModuleResult })
	local SubtitleText: string? = nil
	local TitleText = p1.titleText
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1.conversationId)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local IsConversationTypeMatch: boolean = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION
	local OtherParticipantsModuleEntry = if IsConversationTypeMatch then GetOtherParticipantsModule(UseGetConversationFromIdModuleResult, UseLocalUserIdResult)[1] else nil
	local UseGetUserFromIdModuleResult = UseGetUserFromIdModule(OtherParticipantsModuleEntry)
	local UseSignalStateResult = if FFlagUserTileUnfilteredChatIndicator then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), OtherParticipantsModuleEntry (copy), GetResult (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: OtherParticipantsModuleEntry (upval), GetResult (upval)
			return if OtherParticipantsModuleEntry == nil or OtherParticipantsModuleEntry == "" then nil else GetResult.getIsTrustedConnection(OtherParticipantsModuleEntry).data(p2)
		end)
	end, { OtherParticipantsModuleEntry }))) else nil
	
	if UseGetUserFromIdModuleResult then
		TitleText = UseGetConversationFromIdModuleResult.title
		SubtitleText = if FFlagUserTileUnfilteredChatIndicator and UseSignalStateResult then "" else `@{UseGetUserFromIdModuleResult.name}`
	end
	return ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
		TitleContainer = ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}, {
			ConversationFacePile = ReactModule.createElement(ConversationFacePileModule, {
				conversationId = p1.conversationId,
				titleText = TitleText,
				titleStyle = UseTokensResult.Typography.TitleLarge,
				onActivated = UseResult,
				subtitleText = SubtitleText,
				trustedConnectionIndicatorEnabled = if IsConversationTypeMatch then true else false,
				shouldShowUnfilteredChatIndicator = FFlagUserTileUnfilteredChatIndicator and UseGetConversationFromIdModuleResult ~= nil and UseGetConversationFromIdModuleResult.moderationType == ConversationChannelsModule.ModerationType.TrustedComms or nil
			})
		})
	})
end