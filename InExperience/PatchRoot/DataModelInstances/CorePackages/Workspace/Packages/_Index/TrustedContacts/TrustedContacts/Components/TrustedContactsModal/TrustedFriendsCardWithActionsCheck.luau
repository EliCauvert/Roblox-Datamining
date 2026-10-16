local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local TrustedContactsModalContainerModule = require(script.Parent.TrustedContactsModalContainer)
local UseTrustedFriendActionModule = require(TrustedContacts.TrustedFriendActions.useTrustedFriendAction)
local TFActionsEnumModule = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local AnalyticsModule = require(TrustedContacts.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local FFlagTFUpdateAnalyticsModule = require(TrustedContacts.Flags.FFlagTFUpdateAnalytics)
local FFlagTFPassQRCodeSourceModule = require(TrustedContacts.Flags.FFlagTFPassQRCodeSource)
local _ = require(TrustedContacts.Common.Types)

return function(p1) --[[ Line: 33 | Named "TrustedFriendsCardWithActionsCheck" ]]
	-- upvalues: UseNavigationFunction (copy), UseTrustedFriendActionModule (copy), FFlagTFPassQRCodeSourceModule (copy), FFlagTFUpdateAnalyticsModule (copy), UseTCAnalyticsFunction (copy), ReactModule (copy), EventNames (copy), AppPage (copy), TFActionsEnumModule (copy), RoactUtilsModule (copy), FoundationModule (copy), IconSize (copy), TrustedContactsModalContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UserId = p1.userId
	local UseTrustedFriendActionModuleResult = UseTrustedFriendActionModule({
		userId = UserId,
		tokens = p1.tokens,
		sentFromQrCode = if FFlagTFPassQRCodeSourceModule then p1.sentFromQrCode else nil
	})
	local IsLoading = UseTrustedFriendActionModuleResult.isLoading
	local UseTrustedFriendActionModuleResultEnum = UseTrustedFriendActionModuleResult.enum
	local FireAnalyticsEvent = if FFlagTFUpdateAnalyticsModule then UseTCAnalyticsFunction({
		friendId = UserId,
		source = p1.source,
		tfActionsEnum = UseTrustedFriendActionModuleResultEnum
	}).fireAnalyticsEvent else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 54 ]]
		-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEvent (copy), EventNames (upval), p1 (copy), UseNavigationResult (copy), AppPage (upval)
		if FFlagTFUpdateAnalyticsModule then
			FireAnalyticsEvent(EventNames.TCUpsellAgePrecheckTriggered)
		end
		p1.externalNavigation.openFacialAgeEstimationUpsell({
			onSuccess = function() --[[ Line: 60 ]]
				-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEvent (upval), EventNames (upval), UseNavigationResult (upval), AppPage (upval)
				if FFlagTFUpdateAnalyticsModule then
					FireAnalyticsEvent(EventNames.TCUpsellAgePrecheckSucceeded)
				end
				UseNavigationResult.replace(AppPage.TrustedFriendsUserModal, {})
			end,
			onFailure = function() --[[ Line: 66 ]]
				-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEvent (upval), EventNames (upval), p1 (upval)
				if FFlagTFUpdateAnalyticsModule then
					FireAnalyticsEvent(EventNames.TCUpsellAgePrecheckFailed)
				end
				p1.externalNavigation.closeModal()
			end
		})
	end, {
		UseNavigationResult,
		p1.externalNavigation,
		FireAnalyticsEvent
	})
	local IsUseTrustedFriendActionModuleResultEnumMatch = UseTrustedFriendActionModuleResultEnum == TFActionsEnumModule.UnlockTrustedFriendByFAE
	RoactUtilsModule.Hooks.useEffectOnce(function() --[[ Line: 77 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, IsUseTrustedFriendActionModuleResultEnumMatch)
	
	return if IsUseTrustedFriendActionModuleResultEnumMatch then nil elseif IsLoading then ReactModule.createElement(FoundationModule.View, { tag = "position-center-center auto-xy" }, {
		LoadingIcon = ReactModule.createElement(FoundationModule.Loading, { LayoutOrder = 1, size = IconSize.Large })
	}) else ReactModule.createElement(TrustedContactsModalContainerModule, {
		userId = p1.userId,
		source = p1.source,
		tokens = p1.tokens,
		sentFromQrCode = p1.sentFromQrCode,
		isVerticallyConstrained = p1.isVerticallyConstrained,
		onRequestSent = p1.onRequestSent,
		onRequestAccepted = p1.onRequestAccepted,
		onAcknowledged = p1.onAcknowledged,
		externalNavigation = p1.externalNavigation,
		tfActionsEnum = UseTrustedFriendActionModuleResultEnum
	})
end