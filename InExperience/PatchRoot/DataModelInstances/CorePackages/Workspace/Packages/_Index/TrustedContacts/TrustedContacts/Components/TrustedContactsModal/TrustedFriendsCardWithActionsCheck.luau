local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local appPage = require(parent.RobloxAppEnums).AppPage
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local useNavigation = require(parent.Navigation).useNavigation
local trustedContactsModalContainerModule = require(script.Parent.TrustedContactsModalContainer)
local useTrustedFriendActionModule = require(trustedContacts.TrustedFriendActions.useTrustedFriendAction)
local TFActionsEnumModule = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local analyticsModule = require(trustedContacts.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)
local fFlagTFPassQRCodeSourceModule = require(trustedContacts.Flags.FFlagTFPassQRCodeSource)
local _ = require(trustedContacts.Common.Types)

return function(p1)
	-- upvalues: useNavigation (ref), useTrustedFriendActionModule (ref), fFlagTFPassQRCodeSourceModule (ref), fFlagTFUpdateAnalyticsModule (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), appPage (ref), TFActionsEnumModule (ref), roactUtilsModule (ref), foundationModule (ref), iconSize (ref), trustedContactsModalContainerModule (ref)
	local var1 = useNavigation()
	local userId = p1.userId
	local var2 = useTrustedFriendActionModule({
		userId = userId,
		tokens = p1.tokens,
		sentFromQrCode = if fFlagTFPassQRCodeSourceModule then p1.sentFromQrCode else nil
	})
	local isLoading = var2.isLoading
	local enum = var2.enum
	local var3 = if fFlagTFUpdateAnalyticsModule then useTCAnalytics({
		friendId = userId,
		source = p1.source,
		tfActionsEnum = enum
	}).fireAnalyticsEvent else nil
	local var4 = reactModule.useCallback(function()
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var3 (ref), eventNames (copy), p1 (ref), var1 (ref), appPage (copy)
		if fFlagTFUpdateAnalyticsModule then
			var3(eventNames.TCUpsellAgePrecheckTriggered)
		end
		p1.externalNavigation.openFacialAgeEstimationUpsell({
			onSuccess = function()
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var3 (copy), eventNames (copy), var1 (copy), appPage (copy)
				if fFlagTFUpdateAnalyticsModule then
					var3(eventNames.TCUpsellAgePrecheckSucceeded)
				end
				var1.replace(appPage.TrustedFriendsUserModal, {})
			end,
			onFailure = function()
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var3 (copy), eventNames (copy), p1 (copy)
				if fFlagTFUpdateAnalyticsModule then
					var3(eventNames.TCUpsellAgePrecheckFailed)
				end
				p1.externalNavigation.closeModal()
			end
		})
	end, { var1, p1.externalNavigation, var3 })
	local var5 = enum == TFActionsEnumModule.UnlockTrustedFriendByFAE
	roactUtilsModule.Hooks.useEffectOnce(function()
		-- upvalues: var4 (ref)
		var4()
	end, var5)
	
	return if var5 then nil elseif isLoading then reactModule.createElement(foundationModule.View, { tag = "position-center-center auto-xy" }, {
		LoadingIcon = reactModule.createElement(foundationModule.Loading, { LayoutOrder = 1, size = iconSize.Large })
	}) else reactModule.createElement(trustedContactsModalContainerModule, {
		userId = p1.userId,
		source = p1.source,
		tokens = p1.tokens,
		sentFromQrCode = p1.sentFromQrCode,
		isVerticallyConstrained = p1.isVerticallyConstrained,
		onRequestSent = p1.onRequestSent,
		onRequestAccepted = p1.onRequestAccepted,
		onAcknowledged = p1.onAcknowledged,
		externalNavigation = p1.externalNavigation,
		tfActionsEnum = enum
	})
end