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
local _ = require(appChat.Models.ConversationChannels)
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
	onDismissed = function() --[[ line: 53 ]] end
}

return reactModule.memo(function(p0) --[[ line: 56 | named "ConversationBannerContainer" ]]
	-- upvalues: cryoModule (ref), t_1 (ref), useNavigation (ref), t (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useGetConversationFromIdModule (ref), reactModule (ref), conversationTopModalTelemetryModule (ref), modalTelemetryModule (ref), enumScreensModule (ref), conversationBannerModule (ref)
	local var13 = cryoModule.Dictionary.union(t_1, p0)
	local var14 = useNavigation()
	local modalVariant = t[var13.modalVariant]
	local joined = nil
	local var16 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var17 = useGetConversationFromIdModule(var13.conversationId)
	
	if var17 and var17.participants then
		joined = table.concat(var17.participants, ",")
	end
	reactModule.useEffect(function() --[[ line: 66 ]]
		-- upvalues: var16 (ref), conversationTopModalTelemetryModule (copy), var13 (ref), joined (write)
		var16.emit(conversationTopModalTelemetryModule.Events.ModalRendered, { modalVariant = var13.modalVariant, modalContext = joined })
	end, { var13.modalVariant })
	
	return if modalVariant then reactModule.createElement(conversationBannerModule, {
		actionText = var13.actionText,
		bodyText = var13.bodyText,
		onDismissed = reactModule.useCallback(function() --[[ line: 73 ]]
			-- upvalues: var13 (ref), var16 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			var13.onDismissed()
			var16.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var13.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.Dismiss,
				modalContext = joined
			})
		end, { var13.onDismissed }),
		onActivated = reactModule.useCallback(function() --[[ line: 82 ]]
			-- upvalues: modalVariant (ref), var14 (ref), enumScreensModule (copy), var13 (ref), var16 (ref), conversationTopModalTelemetryModule (copy), modalTelemetryModule (copy), joined (write)
			if modalVariant then
				var14.navigate(enumScreensModule.TrustedConnectionsUpsell, {
					isOverlay = true,
					modalVariant = modalVariant.onActivatedOverlayVariant,
					conversationId = var13.conversationId
				})
			end
			var16.emit(conversationTopModalTelemetryModule.Events.ModalAction, {
				modalVariant = var13.modalVariant,
				action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
				modalContext = joined
			})
		end, { var14, modalVariant }),
		layoutOrder = var13.layoutOrder
	}) else nil
end)