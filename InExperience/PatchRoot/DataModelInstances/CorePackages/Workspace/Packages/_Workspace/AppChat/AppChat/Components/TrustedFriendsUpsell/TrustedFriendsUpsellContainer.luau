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

return function(p0) --[[ line: 50 ]]
	-- upvalues: useIsAppChatVerticallyConstrainedModule (ref), useDispatch (ref), fFlagAppChatEnableDoubleOptIn (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), conversationOverlayTelemetryModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), setTabBarVisibleFromChat (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), modalTelemetryModule (ref), trustedFriendsModalEntry (ref)
	local var16 = useIsAppChatVerticallyConstrainedModule()
	local var17 = useDispatch()
	local var18 = if fFlagAppChatEnableDoubleOptIn then useIsInExperienceModule() else nil
	local analyticsModalVariant = p0.analyticsModalVariant
	local conversationId = p0.conversationId
	local var19 = useTelemetryModule(appTelemetryLayerModule.Context)
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: analyticsModalVariant (ref), var19 (ref), conversationOverlayTelemetryModule (copy)
		if analyticsModalVariant == nil then
			return
		end
		var19.emit(conversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = analyticsModalVariant })
	end, { analyticsModalVariant })
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: fFlagAppChatEnableTrustedFriendEntryPointModule (copy), var17 (ref), setTabBarVisibleFromChat (copy)
		if fFlagAppChatEnableTrustedFriendEntryPointModule then
			var17(setTabBarVisibleFromChat(false))
			
			return function() --[[ line: 75 ]]
				-- upvalues: var17 (copy), setTabBarVisibleFromChat (copy)
				var17(setTabBarVisibleFromChat(true))
			end
		end
	end, { var17 })
	local var20 = reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: p0 (ref), conversationId (ref), fFlagAppChatEnableDoubleOptIn (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), var17 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var18 (ref)
		p0.dismissModal()
		
		if conversationId ~= nil and fFlagAppChatEnableDoubleOptIn then
			promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function() --[[ line: 83 ]]
				-- upvalues: var17 (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), conversationId (copy), var18 (copy)
				var17(refreshConversationUnfilteredThreadsDetailsModule(conversationId, var18))
			end)
		end
	end, { conversationId, var17, p0.dismissModal, var18 })
	
	return reactModule.createElement(trustedFriendsModalEntry, {
		userId = p0.userId,
		source = p0.source,
		isVerticallyConstrained = var16,
		modalVariantOverride = p0.modalVariantOverride,
		onRequestSent = p0.onRequestSent,
		onRequestAccepted = p0.onRequestAccepted,
		onAcknowledged = reactModule.useCallback(function() --[[ line: 97 ]]
			-- upvalues: analyticsModalVariant (ref), var19 (ref), conversationOverlayTelemetryModule (copy), modalTelemetryModule (copy), p0 (ref)
			if analyticsModalVariant ~= nil then
				var19.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = analyticsModalVariant,
					action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
				})
			end
			if p0.onAcknowledged ~= nil then
				p0.onAcknowledged()
			end
		end, { var19, analyticsModalVariant, p0.onAcknowledged }),
		onClosed = reactModule.useCallback(function() --[[ line: 88 ]]
			-- upvalues: analyticsModalVariant (ref), var19 (ref), conversationOverlayTelemetryModule (copy), modalTelemetryModule (copy), var20 (ref)
			if analyticsModalVariant ~= nil then
				var19.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = analyticsModalVariant,
					action = modalTelemetryModule.Enums.ModalActions.Dismiss
				})
			end
			var20()
		end, { var20, var19, analyticsModalVariant })
	})
end