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

local var1 = function(p1)
	return {
		shouldOverrideNavigation = true,
		onClosed = p1.onClosed,
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId
	}
end

local t_1 = {
	[conversationOverlay.TrustedConnectionCreated] = {
		component = trustedFriendsModalEntry,
		mapProps = function(p1)
			return {
				shouldOverrideNavigation = true,
				isVerticallyConstrained = p1.isVerticallyConstrained,
				userId = p1.userId,
				onClosed = p1.onClosed,
				onAcknowledged = p1.onAcknowledged
			}
		end
	},
	[conversationOverlay.AddTrustedConnectionU18] = { component = trustedFriendsModalEntry, mapProps = var1 },
	[conversationOverlay.TrustedConnectionRequestU18] = { component = trustedFriendsModalEntry, mapProps = var1 }
}

return function(p1)
	-- upvalues: useGetOneToOneFriendIdFromConversationIdModule (ref), useIsAppChatVerticallyConstrainedModule (ref), useDispatch (ref), fFlagAppChatEnableDoubleOptIn (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), conversationOverlayTelemetryModule (ref), t_1 (ref), t (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), setTabBarVisibleFromChat (ref), promiseModule (ref), fIntUnfilteredThreadsPvDelayMsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), modalTelemetryModule (ref)
	local var2
	local conversationId = useGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) or ""
	local var3 = useIsAppChatVerticallyConstrainedModule()
	local var4 = useDispatch()
	local modalVariant = p1.modalVariant
	local var5 = if fFlagAppChatEnableDoubleOptIn then useIsInExperienceModule() else nil
	local var6 = useTelemetryModule(appTelemetryLayerModule.Context)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref)
		var6.emit(conversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = modalVariant })
	end, { modalVariant })
	
	if fFlagAppChatEnableDoubleOptIn then
		var2 = t_1[modalVariant] ~= nil
		var2 = nil
	else
		var2 = t[modalVariant] ~= nil
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatEnableTrustedFriendEntryPointModule (copy), var2 (ref), var4 (ref), setTabBarVisibleFromChat (copy)
		if fFlagAppChatEnableTrustedFriendEntryPointModule and var2 then
			var4(setTabBarVisibleFromChat(false))
			
			return function()
				-- upvalues: var4 (copy), setTabBarVisibleFromChat (copy)
				var4(setTabBarVisibleFromChat(true))
			end
		end
	end, { var4, var2 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagAppChatEnableDoubleOptIn (copy), promiseModule (copy), fIntUnfilteredThreadsPvDelayMsModule (copy), var4 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var5 (ref)
		p1.dismissModal()
		
		if fFlagAppChatEnableDoubleOptIn then
			promiseModule.delay(fIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function()
				-- upvalues: var4 (copy), refreshConversationUnfilteredThreadsDetailsModule (copy), p1 (copy), var5 (copy)
				var4(refreshConversationUnfilteredThreadsDetailsModule(p1.conversationId, var5))
			end)
		end
	end, {
		p1.conversationId,
		modalVariant,
		var4,
		p1.dismissModal,
		var5
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var7 (ref)
		var6.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		var7()
	end, { var7, var6, modalVariant })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), conversationOverlayTelemetryModule (copy), modalVariant (ref), modalTelemetryModule (copy), var7 (ref)
		var6.emit(conversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = modalVariant,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss
		})
		var7()
	end, { var7, var6, modalVariant })
	
	if fFlagAppChatEnableDoubleOptIn then
		local var10 = t_1[modalVariant]
		
		if var10 then
			return reactModule.createElement(var10.component, var10.mapProps({
				isVerticallyConstrained = var3,
				userId = conversationId,
				onClosed = var9,
				onAcknowledged = var8
			}))
		end
	else
		local var11 = t[modalVariant]
		
		return if var11 then reactModule.createElement(var11, {
			shouldOverrideNavigation = true,
			isVerticallyConstrained = var3,
			userId = conversationId,
			onClosed = var9,
			onAcknowledged = var8
		}) else nil
	end
end