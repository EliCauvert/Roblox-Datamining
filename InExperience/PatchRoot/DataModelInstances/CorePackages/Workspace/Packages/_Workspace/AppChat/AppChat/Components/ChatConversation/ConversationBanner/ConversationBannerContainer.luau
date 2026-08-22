local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local conversationTopModal = appChatNetworkingModule.Constants.ConversationTopModal
local conversationOverlay = appChatNetworkingModule.Constants.ConversationOverlay
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local conversationTopModalTelemetryModule = require(script.Parent.Parent.ConversationTopModalTelemetry)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local _ = require(appChat.Models.ConversationChannels)
local fFlagAppChatConsolidateTrustedFriendsModalModule = require(appChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local conversationBannerModule = require(script.Parent.ConversationBanner)
local t = {
	[conversationTopModal.AddTrustedConnection] = {
		onActivatedOverlayVariant = conversationOverlay.AddTrustedConnectionU18
	},
	[conversationTopModal.TrustedConnectionRequest] = {
		onActivatedOverlayVariant = conversationOverlay.TrustedConnectionRequestU18
	}
}
local t_1 = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	onDismissed = function() --[[ line: 56 ]] end
}

return reactModule.memo(function(p0) --[[ line: 59 | named "ConversationBannerContainer" ]]
	-- upvalues: cryoModule (ref), t_1 (ref), useNavigation (ref), t (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useGetConversationFromIdModule (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), reactModule (ref), conversationTopModalTelemetryModule (ref), modalTelemetryModule (ref), enumScreensModule (ref), conversationBannerModule (ref)
	local var15 = cryoModule.Dictionary.union(t_1, p0)
	local var16 = useNavigation()
	local modalVariant = t[var15.modalVariant]
	local joined = nil
	local var18 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var19 = useGetConversationFromIdModule(var15.conversationId)
	
	if var19 and var19.participants then
		joined = table.concat(var19.participants, ",")
	end
	local var20 = if fFlagAppChatConsolidateTrustedFriendsModalModule then useGetOneToOneFriendIdFromConversationIdModule(var15.conversationId) else nil
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var18 (ref), conversationTopModalTelemetryModule (copy), var15 (ref), joined (write)
		var18.emit(conversationTopModalTelemetryModule.Events.ModalRendered, { modalVariant = var15.modalVariant, modalContext = joined })
	end, { var15.modalVariant })
	
	return if modalVariant then reactModule.createElement(conversationBannerModule, {
		actionText = var15.actionText,
		bodyText = var15.bodyText,
		onDismissed = reactModule.useCallback(function() --[[ line: 79 ]]
			-- upvalues: var15 (ref), var18 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			var15.onDismissed()
			var18.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var15.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.Dismiss,
				modalContext = joined
			})
		end, { var15.onDismissed }),
		onActivated = reactModule.useCallback(function() --[[ line: 88 ]]
			-- upvalues: modalVariant (ref), var16 (ref), enumScreensModule (copy), fFlagAppChatConsolidateTrustedFriendsModalModule (copy), var20 (ref), var15 (ref), var18 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			if modalVariant then
				var16.navigate(enumScreensModule.TrustedConnectionsUpsell, {
					isOverlay = true,
					userId = if fFlagAppChatConsolidateTrustedFriendsModalModule then var20 else nil,
					modalVariant = modalVariant.onActivatedOverlayVariant,
					conversationId = var15.conversationId
				})
			end
			var18.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var15.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
				modalContext = joined
			})
		end, { var16, modalVariant, var20 }),
		layoutOrder = var15.layoutOrder
	}) else nil
end)