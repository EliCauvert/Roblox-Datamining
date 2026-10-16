local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useOverlay = require(parent.Foundation).Hooks.useOverlay
local var1 = if require(parent.SharedFlags).FFlagTFWithActionsCheck then require(script.Parent.TrustedFriendsCardWithActionsCheck) else require(script.Parent.TrustedContactsModalContainer)
local fFlagTCModalUseFoundationOverlay = require(parent.SharedFlags).FFlagTCModalUseFoundationOverlay
local _ = require(trustedContacts.Common.Types)

return function(p1)
	-- upvalues: fFlagTCModalUseFoundationOverlay (ref), useOverlay (ref), reactRobloxModule (ref), reactModule (ref), var1 (ref)
	local modalProps = p1.screenProps.modalProps
	local externalNavigation = p1.screenProps.externalNavigation
	
	if not fFlagTCModalUseFoundationOverlay then
		return reactModule.createElement("ScreenGui", {
			Enabled = true,
			DisplayOrder = 11,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			reactModule.createElement(var1, {
				userId = modalProps.userId,
				onRequestAccepted = modalProps.onRequestAccepted,
				onRequestSent = modalProps.onRequestSent,
				source = modalProps.source,
				modalVariantOverride = modalProps.modalVariantOverride,
				sentFromQrCode = modalProps.sentFromQrCode,
				tokens = modalProps.tokens,
				isVerticallyConstrained = modalProps.isVerticallyConstrained,
				onAcknowledged = modalProps.onAcknowledged,
				externalNavigation = externalNavigation
			})
		})
	end
	local var2 = useOverlay()
	
	return if var2 then reactRobloxModule.createPortal(reactModule.createElement(var1, {
		userId = modalProps.userId,
		onRequestAccepted = modalProps.onRequestAccepted,
		onRequestSent = modalProps.onRequestSent,
		source = modalProps.source,
		modalVariantOverride = modalProps.modalVariantOverride,
		sentFromQrCode = modalProps.sentFromQrCode,
		tokens = modalProps.tokens,
		isVerticallyConstrained = modalProps.isVerticallyConstrained,
		onAcknowledged = modalProps.onAcknowledged,
		externalNavigation = externalNavigation
	}), var2) else nil
end