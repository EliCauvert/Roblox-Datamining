local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local reactModule = require(parent.React)
local trustedContactsModule = require(parent.TrustedContacts)
local appTabBarRoduxModule = require(parent.AppTabBarRodux)
local _ = appChatNetworkingModule.Constants.ConversationOverlay
local useIsAppChatVerticallyConstrainedModule = require(appChat.App.Hooks.useIsAppChatVerticallyConstrained)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local sharedFlagsModule = require(parent.SharedFlags)
local refreshConversationUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local promiseModule = require(parent.Promise)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local setTabBarVisibleFromChat = appTabBarRoduxModule.Thunks.SetTabBarVisibleFromChat
local conversationOverlayTelemetryModule = require(appChat.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local appTelemetryLayerModule = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local trustedFriendsModalEntry = trustedContactsModule.TrustedFriendsModalEntry
local fFlagAppChatEnableDoubleOptIn = sharedFlagsModule.FFlagAppChatEnableDoubleOptIn
local fFlagAppChatEnableTrustedFriendEntryPointModule = require(appChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local fIntUnfilteredThreadsPvDelayMsModule = require(appChat.Flags.FIntUnfilteredThreadsPvDelayMs)

return function(p1)
	-- upvalues: useIsAppChatVerticallyConstrainedModule (ref), useDispatch (ref), fFlagAppChatEnableDoubleOptIn (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), conversationOverlayTelemetryModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), setTabBarVisibleFromChat (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), modalTelemetryModule (ref), trustedFriendsModalEntry (ref)
	local var1 = useIsAppChatVerticallyConstrainedModule()
	local var2 = useDispatch()
	local var3 = if fFlagAppChatEnableDoubleOptIn then useIsInExperienceModule() else nil
	local analyticsModalVariant = p1.analyticsModalVariant
	local conversationId = p1.conversationId
	local var4 = useTelemetryModule(appTelemetryLayerModule.Context)
	reactModule.useEffect(function()
		-- upvalues: analyticsModalVariant (ref), var4 (ref), conversationOverlayTelemetryModule (copy)
		if analyticsModalVariant == nil then
			return
		end
		var4.emit(conversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = analyticsModalVariant })
	end, { analyticsModalVariant })
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatEnableTrustedFriendEntryPointModule (copy), var2 (ref), setTabBarVisibleFromChat (copy)
		if fFlagAppChatEnableTrustedFriendEntryPointModule then
			var2(setTabBarVisibleFromChat(false))
			
			return function()
				-- upvalues: var2 (copy), setTabBarVisibleFromChat (copy)
				var2(setTabBarVisibleFromChat(true))
			end
		end
	end, { var2 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), conversationId (ref), fFlagAppChatEnableDoubleOptIn (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), var2 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var3 (ref)
		p1.dismissModal()
		
		if conversationId ~= nil and fFlagAppChatEnableDoubleOptIn then
			promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function()
				-- upvalues: var2 (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), conversationId (copy), var3 (copy)
				var2(refreshConversationUnfilteredThreadsDetailsModule(conversationId, var3))
			end)
		end
	end, { conversationId, var2, p1.dismissModal, var3 })
	
	return reactModule.createElement(trustedFriendsModalEntry, {
		userId = p1.userId,
		source = p1.source,
		isVerticallyConstrained = var1,
		modalVariantOverride = p1.modalVariantOverride,
		onRequestSent = p1.onRequestSent,
		onRequestAccepted = p1.onRequestAccepted,
		onAcknowledged = reactModule.useCallback(function()
			-- upvalues: analyticsModalVariant (ref), var4 (ref), conversationOverlayTelemetryModule (copy), modalTelemetryModule (copy), p1 (ref)
			if analyticsModalVariant ~= nil then
				var4.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = analyticsModalVariant,
					action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
				})
			end
			if p1.onAcknowledged ~= nil then
				p1.onAcknowledged()
			end
		end, { var4, analyticsModalVariant, p1.onAcknowledged }),
		onClosed = reactModule.useCallback(function()
			-- upvalues: analyticsModalVariant (ref), var4 (ref), conversationOverlayTelemetryModule (copy), modalTelemetryModule (copy), var5 (ref)
			if analyticsModalVariant ~= nil then
				var4.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = analyticsModalVariant,
					action = modalTelemetryModule.Enums.ModalActions.Dismiss
				})
			end
			var5()
		end, { var5, var4, analyticsModalVariant })
	})
end