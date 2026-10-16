local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChatNetworking).Constants.ConversationOverlay
local UseIsAppChatVerticallyConstrainedModule = require(AppChat.App.Hooks.useIsAppChatVerticallyConstrained)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RefreshConversationUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local PromiseModule = require(Parent.Promise)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local SetTabBarVisibleFromChatFunction = require(Parent.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local ConversationOverlayTelemetryModule = require(AppChat.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local AppTelemetryLayerModule = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local TrustedFriendsModalEntry = require(Parent.TrustedContacts).TrustedFriendsModalEntry
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatEnableTrustedFriendEntryPointModule = require(AppChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local FIntUnfilteredThreadsPvDelayMsModule = require(AppChat.Flags.FIntUnfilteredThreadsPvDelayMs)

return function(p1) --[[ Line: 50 ]]
	-- upvalues: UseIsAppChatVerticallyConstrainedModule (copy), UseDispatchFunction (copy), FFlagAppChatEnableDoubleOptIn (copy), UseIsInExperienceModule (copy), UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ReactModule (copy), ConversationOverlayTelemetryModule (copy), FFlagAppChatEnableTrustedFriendEntryPointModule (copy), SetTabBarVisibleFromChatFunction (copy), PromiseModule (copy), FIntUnfilteredThreadsPvDelayMsModule (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy), ModalTelemetryModule (copy), TrustedFriendsModalEntry (copy)
	local UseIsAppChatVerticallyConstrainedModuleResult = UseIsAppChatVerticallyConstrainedModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseIsInExperienceModuleResult = if FFlagAppChatEnableDoubleOptIn then UseIsInExperienceModule() else nil
	local AnalyticsModalVariant = p1.analyticsModalVariant
	local ConversationId = p1.conversationId
	local UseTelemetryModuleResult = UseTelemetryModule(AppTelemetryLayerModule.Context)
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: AnalyticsModalVariant (copy), UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval)
		if AnalyticsModalVariant ~= nil then
			UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = AnalyticsModalVariant })
			
			return
		end
	end, { AnalyticsModalVariant })
	ReactModule.useEffect(function() --[[ Line: 70 ]]
		-- upvalues: FFlagAppChatEnableTrustedFriendEntryPointModule (upval), UseDispatchResult (copy), SetTabBarVisibleFromChatFunction (upval)
		if not FFlagAppChatEnableTrustedFriendEntryPointModule then return end
		UseDispatchResult(SetTabBarVisibleFromChatFunction(false))
		
		return function() --[[ Line: 75 ]]
			-- upvalues: UseDispatchResult (upval), SetTabBarVisibleFromChatFunction (upval)
			UseDispatchResult(SetTabBarVisibleFromChatFunction(true))
		end
	end, { UseDispatchResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 80 ]]
		-- upvalues: p1 (copy), ConversationId (copy), FFlagAppChatEnableDoubleOptIn (upval), PromiseModule (upval), FIntUnfilteredThreadsPvDelayMsModule (upval), UseDispatchResult (copy), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy)
		p1.dismissModal()
		
		if ConversationId ~= nil and FFlagAppChatEnableDoubleOptIn then
			PromiseModule.delay(FIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function() --[[ Line: 83 ]]
				-- upvalues: UseDispatchResult (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval), ConversationId (upval), UseIsInExperienceModuleResult (upval)
				UseDispatchResult(RefreshConversationUnfilteredThreadsDetailsModule(ConversationId, UseIsInExperienceModuleResult))
			end)
		end
	end, {
		ConversationId,
		UseDispatchResult,
		p1.dismissModal,
		UseIsInExperienceModuleResult
	})
	
	return ReactModule.createElement(TrustedFriendsModalEntry, {
		userId = p1.userId,
		source = p1.source,
		isVerticallyConstrained = UseIsAppChatVerticallyConstrainedModuleResult,
		modalVariantOverride = p1.modalVariantOverride,
		onRequestSent = p1.onRequestSent,
		onRequestAccepted = p1.onRequestAccepted,
		onAcknowledged = ReactModule.useCallback(function() --[[ Line: 97 ]]
			-- upvalues: AnalyticsModalVariant (copy), UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval), ModalTelemetryModule (upval), p1 (copy)
			if AnalyticsModalVariant ~= nil then
				UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = AnalyticsModalVariant,
					action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta
				})
			end
			if p1.onAcknowledged ~= nil then
				p1.onAcknowledged()
			end
		end, {
			UseTelemetryModuleResult,
			AnalyticsModalVariant,
			p1.onAcknowledged
		}),
		onClosed = ReactModule.useCallback(function() --[[ Line: 88 ]]
			-- upvalues: AnalyticsModalVariant (copy), UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval), ModalTelemetryModule (upval), UseResult (copy)
			if AnalyticsModalVariant ~= nil then
				UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalAction, {
					modalVariant = AnalyticsModalVariant,
					action = ModalTelemetryModule.Enums.ModalActions.Dismiss
				})
			end
			UseResult()
		end, {
			UseResult,
			UseTelemetryModuleResult,
			AnalyticsModalVariant
		})
	})
end