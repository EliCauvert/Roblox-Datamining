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

return function(p0)
	-- upvalues: useNavigation (ref), useTrustedFriendActionModule (ref), fFlagTFPassQRCodeSourceModule (ref), fFlagTFUpdateAnalyticsModule (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), appPage (ref), TFActionsEnumModule (ref), roactUtilsModule (ref), foundationModule (ref), iconSize (ref), trustedContactsModalContainerModule (ref)
	local var10 = useNavigation()
	local userId = p0.userId
	local var11 = useTrustedFriendActionModule({
		userId = userId,
		tokens = p0.tokens,
		sentFromQrCode = if fFlagTFPassQRCodeSourceModule then p0.sentFromQrCode else nil
	})
	local isLoading = var11.isLoading
	local enum = var11.enum
	local var12 = if fFlagTFUpdateAnalyticsModule then useTCAnalytics({
		friendId = userId,
		source = p0.source,
		tfActionsEnum = enum
	}).fireAnalyticsEvent else nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var12 (ref), eventNames (copy), p0 (ref), var10 (ref), appPage (copy)
		if fFlagTFUpdateAnalyticsModule then
			var12(eventNames.TCUpsellAgePrecheckTriggered)
		end
		p0.externalNavigation.openFacialAgeEstimationUpsell({
			onSuccess = function()
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var12 (copy), eventNames (copy), var10 (copy), appPage (copy)
				if fFlagTFUpdateAnalyticsModule then
					var12(eventNames.TCUpsellAgePrecheckSucceeded)
				end
				var10.replace(appPage.TrustedFriendsUserModal, {})
			end,
			onFailure = function()
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var12 (copy), eventNames (copy), p0 (copy)
				if fFlagTFUpdateAnalyticsModule then
					var12(eventNames.TCUpsellAgePrecheckFailed)
				end
				p0.externalNavigation.closeModal()
			end
		})
	end, { var10, p0.externalNavigation, var12 })
	local var14 = enum == TFActionsEnumModule.UnlockTrustedFriendByFAE
	roactUtilsModule.Hooks.useEffectOnce(function()
		-- upvalues: var13 (ref)
		var13()
	end, var14)
	
	return if var14 then nil elseif isLoading then reactModule.createElement(foundationModule.View, { tag = "position-center-center auto-xy" }, {
		LoadingIcon = reactModule.createElement(foundationModule.Loading, { LayoutOrder = 1, size = iconSize.Large })
	}) else reactModule.createElement(trustedContactsModalContainerModule, {
		userId = p0.userId,
		source = p0.source,
		tokens = p0.tokens,
		sentFromQrCode = p0.sentFromQrCode,
		isVerticallyConstrained = p0.isVerticallyConstrained,
		onRequestSent = p0.onRequestSent,
		onRequestAccepted = p0.onRequestAccepted,
		onAcknowledged = p0.onAcknowledged,
		externalNavigation = p0.externalNavigation,
		tfActionsEnum = enum
	})
end