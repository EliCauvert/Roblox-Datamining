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
local _ = require(trustedContacts.Common.Types)

return function(p0) --[[ line: 32 | named "TrustedFriendsCardWithActionsCheck" ]]
	-- upvalues: useNavigation (ref), useTrustedFriendActionModule (ref), fFlagTFUpdateAnalyticsModule (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), appPage (ref), TFActionsEnumModule (ref), roactUtilsModule (ref), foundationModule (ref), iconSize (ref), trustedContactsModalContainerModule (ref)
	local var9 = useNavigation()
	local userId = p0.userId
	local var10 = useTrustedFriendActionModule({ userId = userId, tokens = p0.tokens })
	local isLoading = var10.isLoading
	local enum = var10.enum
	local var11 = if fFlagTFUpdateAnalyticsModule then useTCAnalytics({
		friendId = userId,
		source = p0.source,
		tfActionsEnum = enum
	}).fireAnalyticsEvent else nil
	local var12 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var11 (ref), eventNames (copy), p0 (ref), var9 (ref), appPage (copy)
		if fFlagTFUpdateAnalyticsModule then
			var11(eventNames.TCUpsellAgePrecheckTriggered)
		end
		p0.externalNavigation.openFacialAgeEstimationUpsell({
			onSuccess = function() --[[ line: 58 ]]
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var11 (copy), eventNames (copy), var9 (copy), appPage (copy)
				if fFlagTFUpdateAnalyticsModule then
					var11(eventNames.TCUpsellAgePrecheckSucceeded)
				end
				var9.replace(appPage.TrustedFriendsUserModal, {})
			end,
			onFailure = function() --[[ line: 64 ]]
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), var11 (copy), eventNames (copy), p0 (copy)
				if fFlagTFUpdateAnalyticsModule then
					var11(eventNames.TCUpsellAgePrecheckFailed)
				end
				p0.externalNavigation.closeModal()
			end
		})
	end, { var9, p0.externalNavigation, var11 })
	local var13 = enum == TFActionsEnumModule.UnlockTrustedFriendByFAE
	roactUtilsModule.Hooks.useEffectOnce(function() --[[ line: 75 ]]
		-- upvalues: var12 (ref)
		var12()
	end, var13)
	
	return if var13 then nil elseif isLoading then reactModule.createElement(foundationModule.View, { tag = "position-center-center auto-xy" }, {
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