local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local ConversationTopModal = AppChatNetworkingModule.Constants.ConversationTopModal
local ConversationOverlay = AppChatNetworkingModule.Constants.ConversationOverlay
local EnumScreensModule = require(AppChat.EnumScreens)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ConversationTopModalTelemetryModule = require(script.Parent.Parent.ConversationTopModalTelemetry)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local _ = require(AppChat.Models.ConversationChannels)
local FFlagAppChatConsolidateTrustedFriendsModalModule = require(AppChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local ConversationBannerModule = require(script.Parent.ConversationBanner)
local config = {
	[ConversationTopModal.AddTrustedConnection] = {
		onActivatedOverlayVariant = ConversationOverlay.AddTrustedConnectionU18
	},
	[ConversationTopModal.TrustedConnectionRequest] = {
		onActivatedOverlayVariant = ConversationOverlay.TrustedConnectionRequestU18
	}
}
local config1 = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	onDismissed = function() --[[ Line: 56 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 59 | Named "ConversationBannerContainer" ]]
	-- upvalues: CryoModule (copy), config1 (copy), UseNavigationFunction (copy), config (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseGetConversationFromIdModule (copy), FFlagAppChatConsolidateTrustedFriendsModalModule (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), ReactModule (copy), ConversationTopModalTelemetryModule (copy), ModalTelemetryModule (copy), EnumScreensModule (copy), ConversationBannerModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config1, p1)
	local UseNavigationResult = UseNavigationFunction()
	local Entry = config[UnionResult.modalVariant]
	local ModalContext: string? = nil
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(UnionResult.conversationId)
	
	if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.participants then
		ModalContext = table.concat(UseGetConversationFromIdModuleResult.participants, ",")
	end
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = if FFlagAppChatConsolidateTrustedFriendsModalModule then UseGetOneToOneFriendIdFromConversationIdModule(UnionResult.conversationId) else nil
	ReactModule.useEffect(function() --[[ Line: 72 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ConversationTopModalTelemetryModule (upval), UnionResult (copy), ModalContext (ref)
		UseTelemetryModuleResult.emit(ConversationTopModalTelemetryModule.Events.ModalRendered, {
			modalVariant = UnionResult.modalVariant,
			modalContext = ModalContext
		})
	end, { UnionResult.modalVariant })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 79 ]]
		-- upvalues: UnionResult (copy), UseTelemetryModuleResult (copy), ConversationTopModalTelemetryModule (upval), ModalTelemetryModule (upval), ModalContext (ref)
		UnionResult.onDismissed()
		UseTelemetryModuleResult.emit(ConversationTopModalTelemetryModule.Events.ModalAction, {
			modalVariant = UnionResult.modalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.Dismiss,
			modalContext = ModalContext
		})
	end, { UnionResult.onDismissed })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 88 ]]
		-- upvalues: Entry (copy), UseNavigationResult (copy), EnumScreensModule (upval), FFlagAppChatConsolidateTrustedFriendsModalModule (upval), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy), UnionResult (copy), UseTelemetryModuleResult (copy), ConversationTopModalTelemetryModule (upval), ModalTelemetryModule (upval), ModalContext (ref)
		if Entry then
			UseNavigationResult.navigate(EnumScreensModule.TrustedConnectionsUpsell, {
				isOverlay = true,
				userId = if FFlagAppChatConsolidateTrustedFriendsModalModule then UseGetOneToOneFriendIdFromConversationIdModuleResult else nil,
				modalVariant = Entry.onActivatedOverlayVariant,
				conversationId = UnionResult.conversationId
			})
		end
		UseTelemetryModuleResult.emit(ConversationTopModalTelemetryModule.Events.ModalAction, {
			modalVariant = UnionResult.modalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta,
			modalContext = ModalContext
		})
	end, {
		UseNavigationResult,
		Entry,
		UseGetOneToOneFriendIdFromConversationIdModuleResult
	})
	
	return if Entry then ReactModule.createElement(ConversationBannerModule, {
		actionText = UnionResult.actionText,
		bodyText = UnionResult.bodyText,
		onDismissed = UseResult,
		onActivated = UseResult1,
		layoutOrder = UnionResult.layoutOrder
	}) else nil
end)