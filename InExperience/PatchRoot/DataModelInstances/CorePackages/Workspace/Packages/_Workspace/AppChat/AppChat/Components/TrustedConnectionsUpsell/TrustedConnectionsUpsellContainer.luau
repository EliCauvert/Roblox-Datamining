local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local reactModule = require(parent.React)
local trustedContactsModule = require(parent.TrustedContacts)
local appTabBarRoduxModule = require(parent.AppTabBarRodux)
local conversationOverlay = appChatNetworkingModule.Constants.ConversationOverlay
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
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
local t = {
	[conversationOverlay.TrustedConnectionCreated] = trustedFriendsModalEntry
}

local var18 = function(p0) --[[ line: 60 ]]
	return {
		shouldOverrideNavigation = true,
		onClosed = p0.onClosed,
		isVerticallyConstrained = p0.isVerticallyConstrained,
		userId = p0.userId
	}
end

local t_1 = {
	[conversationOverlay.TrustedConnectionCreated] = {
		component = trustedFriendsModalEntry,
		mapProps = function(p1) --[[ line: 71 ]]
			return {
				shouldOverrideNavigation = true,
				isVerticallyConstrained = p1.isVerticallyConstrained,
				userId = p1.userId,
				onClosed = p1.onClosed,
				onAcknowledged = p1.onAcknowledged
			}
		end
	},
	[conversationOverlay.AddTrustedConnectionU18] = { component = trustedFriendsModalEntry, mapProps = var18 },
	[conversationOverlay.TrustedConnectionRequestU18] = { component = trustedFriendsModalEntry, mapProps = var18 }
}

return function(p2) --[[ line: 102 ]]
	-- upvalues: useGetOneToOneFriendIdFromConversationIdModule (ref), useIsAppChatVerticallyConstrainedModule (ref), useDispatch (ref), fFlagAppChatEnableDoubleOptIn (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), conversationOverlayTelemetryModule (ref), t_1 (ref), t (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), setTabBarVisibleFromChat (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), modalTelemetryModule (ref)
	local var25
	local conversationId = useGetOneToOneFriendIdFromConversationIdModule(p2.conversationId) or ""
	local var21 = useIsAppChatVerticallyConstrainedModule()
	local var22 = useDispatch()
	local modalVariant = p2.modalVariant
	local var23 = if fFlagAppChatEnableDoubleOptIn then useIsInExperienceModule() else nil
	local var24 = useTelemetryModule(appTelemetryLayerModule.Context)
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var24 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref)
		var24.emit(conversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = modalVariant })
	end, { modalVariant })
	
	if fFlagAppChatEnableDoubleOptIn then
		var25 = t_1[modalVariant] ~= nil
		var25 = nil
	else
		var25 = t[modalVariant] ~= nil
	end
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: fFlagAppChatEnableTrustedFriendEntryPointModule (copy), var25 (ref), var22 (ref), setTabBarVisibleFromChat (copy)
		if fFlagAppChatEnableTrustedFriendEntryPointModule and var25 then
			var22(setTabBarVisibleFromChat(false))
			
			return function() --[[ line: 132 ]]
				-- upvalues: var22 (copy), setTabBarVisibleFromChat (copy)
				var22(setTabBarVisibleFromChat(true))
			end
		end
	end, { var22, var25 })
	local var26 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: p2 (ref), fFlagAppChatEnableDoubleOptIn (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), var22 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var23 (ref)
		p2.dismissModal()
		
		if fFlagAppChatEnableDoubleOptIn then
			promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function() --[[ line: 141 ]]
				-- upvalues: var22 (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), p2 (copy), var23 (copy)
				var22(refreshConversationUnfilteredThreadsDetailsModule(p2.conversationId, var23))
			end)
		end
	end, {
		p2.conversationId,
		modalVariant,
		var22,
		p2.dismissModal,
		var23
	})
	local var27 = reactModule.useCallback(function() --[[ line: 154 ]]
		-- upvalues: var24 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var26 (ref)
		var24.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		var26()
	end, { var26, var24, modalVariant })
	local var28 = reactModule.useCallback(function() --[[ line: 161 ]]
		-- upvalues: var24 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var26 (ref)
		var24.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss
		})
		var26()
	end, { var26, var24, modalVariant })
	
	if fFlagAppChatEnableDoubleOptIn then
		local var29 = t_1[modalVariant]
		
		if var29 then
			return reactModule.createElement(var29.component, var29.mapProps({
				isVerticallyConstrained = var21,
				userId = conversationId,
				onClosed = var28,
				onAcknowledged = var27
			}))
		end
	else
		local var30 = t[modalVariant]
		
		return if var30 then reactModule.createElement(var30, {
			shouldOverrideNavigation = true,
			isVerticallyConstrained = var21,
			userId = conversationId,
			onClosed = var28,
			onAcknowledged = var27
		}) else nil
	end
end