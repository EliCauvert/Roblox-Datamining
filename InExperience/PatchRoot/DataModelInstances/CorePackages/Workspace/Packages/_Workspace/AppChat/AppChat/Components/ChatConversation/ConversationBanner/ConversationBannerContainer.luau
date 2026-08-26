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
	onDismissed = function() end
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t_1 (ref), useNavigation (ref), t (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useGetConversationFromIdModule (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), reactModule (ref), conversationTopModalTelemetryModule (ref), modalTelemetryModule (ref), enumScreensModule (ref), conversationBannerModule (ref)
	local var1 = cryoModule.Dictionary.union(t_1, p1)
	local var2 = useNavigation()
	local modalVariant = t[var1.modalVariant]
	local joined = nil
	local var3 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var4 = useGetConversationFromIdModule(var1.conversationId)
	
	if var4 and var4.participants then
		joined = table.concat(var4.participants, ",")
	end
	local var5 = if fFlagAppChatConsolidateTrustedFriendsModalModule then useGetOneToOneFriendIdFromConversationIdModule(var1.conversationId) else nil
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), conversationTopModalTelemetryModule (copy), var1 (ref), joined (write)
		var3.emit(conversationTopModalTelemetryModule.Events.ModalRendered, { modalVariant = var1.modalVariant, modalContext = joined })
	end, { var1.modalVariant })
	
	return if modalVariant then reactModule.createElement(conversationBannerModule, {
		actionText = var1.actionText,
		bodyText = var1.bodyText,
		onDismissed = reactModule.useCallback(function()
			-- upvalues: var1 (ref), var3 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			var1.onDismissed()
			var3.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var1.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.Dismiss,
				modalContext = joined
			})
		end, { var1.onDismissed }),
		onActivated = reactModule.useCallback(function()
			-- upvalues: modalVariant (ref), var2 (ref), enumScreensModule (copy), fFlagAppChatConsolidateTrustedFriendsModalModule (copy), var5 (ref), var1 (ref), var3 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			if modalVariant then
				var2.navigate(enumScreensModule.TrustedConnectionsUpsell, {
					isOverlay = true,
					userId = if fFlagAppChatConsolidateTrustedFriendsModalModule then var5 else nil,
					modalVariant = modalVariant.onActivatedOverlayVariant,
					conversationId = var1.conversationId
				})
			end
			var3.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var1.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
				modalContext = joined
			})
		end, { var2, modalVariant, var5 }),
		layoutOrder = var1.layoutOrder
	}) else nil
end)