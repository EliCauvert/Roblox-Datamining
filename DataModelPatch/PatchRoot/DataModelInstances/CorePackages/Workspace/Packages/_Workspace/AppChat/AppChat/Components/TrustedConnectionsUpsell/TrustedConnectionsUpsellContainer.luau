local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local ReactModule = require(Parent.React)
local ConversationOverlay = require(Parent.AppChatNetworking).Constants.ConversationOverlay
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
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
local config = {
	[ConversationOverlay.TrustedConnectionCreated] = TrustedFriendsModalEntry
}

local function MapProps(p1)
	return {
		shouldOverrideNavigation = true,
		onClosed = p1.onClosed,
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId
	}
end

local config1 = {
	[ConversationOverlay.TrustedConnectionCreated] = {
		component = TrustedFriendsModalEntry,
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
	[ConversationOverlay.AddTrustedConnectionU18] = {
		component = TrustedFriendsModalEntry,
		mapProps = MapProps
	},
	[ConversationOverlay.TrustedConnectionRequestU18] = {
		component = TrustedFriendsModalEntry,
		mapProps = MapProps
	}
}

return function(p1)
	-- upvalues: UseGetOneToOneFriendIdFromConversationIdModule (copy), UseIsAppChatVerticallyConstrainedModule (copy), UseDispatchFunction (copy), FFlagAppChatEnableDoubleOptIn (copy), UseIsInExperienceModule (copy), UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ReactModule (copy), ConversationOverlayTelemetryModule (copy), config1 (copy), config (copy), FFlagAppChatEnableTrustedFriendEntryPointModule (copy), SetTabBarVisibleFromChatFunction (copy), PromiseModule (copy), FIntUnfilteredThreadsPvDelayMsModule (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy), ModalTelemetryModule (copy)
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) or ""
	local UseIsAppChatVerticallyConstrainedModuleResult = UseIsAppChatVerticallyConstrainedModule()
	local UseDispatchResult = UseDispatchFunction()
	local ModalVariant = p1.modalVariant
	local UseIsInExperienceModuleResult = if FFlagAppChatEnableDoubleOptIn then UseIsInExperienceModule() else nil
	local UseTelemetryModuleResult = UseTelemetryModule(AppTelemetryLayerModule.Context)
	ReactModule.useEffect(function()
		-- upvalues: UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval), ModalVariant (copy)
		UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalRendered, { modalVariant = ModalVariant })
	end, { ModalVariant })
	local HasEntry: boolean = if FFlagAppChatEnableDoubleOptIn then config1[ModalVariant] ~= nil else config[ModalVariant] ~= nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatEnableTrustedFriendEntryPointModule (upval), HasEntry (copy), UseDispatchResult (copy), SetTabBarVisibleFromChatFunction (upval)
		if not FFlagAppChatEnableTrustedFriendEntryPointModule or not HasEntry then return end
		UseDispatchResult(SetTabBarVisibleFromChatFunction(false))
		
		return function()
			-- upvalues: UseDispatchResult (upval), SetTabBarVisibleFromChatFunction (upval)
			UseDispatchResult(SetTabBarVisibleFromChatFunction(true))
		end
	end, { UseDispatchResult, HasEntry })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagAppChatEnableDoubleOptIn (upval), PromiseModule (upval), FIntUnfilteredThreadsPvDelayMsModule (upval), UseDispatchResult (copy), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy)
		p1.dismissModal()
		
		if FFlagAppChatEnableDoubleOptIn then
			PromiseModule.delay(FIntUnfilteredThreadsPvDelayMsModule / 1000):andThen(function()
				-- upvalues: UseDispatchResult (upval), RefreshConversationUnfilteredThreadsDetailsModule (upval), p1 (upval), UseIsInExperienceModuleResult (upval)
				UseDispatchResult(RefreshConversationUnfilteredThreadsDetailsModule(p1.conversationId, UseIsInExperienceModuleResult))
			end)
		end
	end, {
		p1.conversationId,
		ModalVariant,
		UseDispatchResult,
		p1.dismissModal,
		UseIsInExperienceModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval), ModalVariant (copy), ModalTelemetryModule (upval), UseResult (copy)
		UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta
		})
		UseResult()
	end, { UseResult, UseTelemetryModuleResult, ModalVariant })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ConversationOverlayTelemetryModule (upval), ModalVariant (copy), ModalTelemetryModule (upval), UseResult (copy)
		UseTelemetryModuleResult.emit(ConversationOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.Dismiss
		})
		UseResult()
	end, { UseResult, UseTelemetryModuleResult, ModalVariant })
	
	if FFlagAppChatEnableDoubleOptIn then
		local Entry = config1[ModalVariant]
		
		if Entry then
			return ReactModule.createElement(Entry.component, Entry.mapProps({
				isVerticallyConstrained = UseIsAppChatVerticallyConstrainedModuleResult,
				userId = UseGetOneToOneFriendIdFromConversationIdModuleResult,
				onClosed = UseResult2,
				onAcknowledged = UseResult1
			}))
		end
	else
		local Entry1 = config[ModalVariant]
		
		if Entry1 then
			return ReactModule.createElement(Entry1, {
				shouldOverrideNavigation = true,
				isVerticallyConstrained = UseIsAppChatVerticallyConstrainedModuleResult,
				userId = UseGetOneToOneFriendIdFromConversationIdModuleResult,
				onClosed = UseResult2,
				onAcknowledged = UseResult1
			})
		end
	end
	return nil
end