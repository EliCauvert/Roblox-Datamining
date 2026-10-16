local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseOverlayFunction = require(Parent.Foundation).Hooks.useOverlay
local TrustedFriendsCardWithActionsCheckModule = require(script.Parent.TrustedFriendsCardWithActionsCheck)
local _ = require(TrustedContacts.Common.Types)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: UseOverlayFunction (copy), ReactRobloxModule (copy), ReactModule (copy), TrustedFriendsCardWithActionsCheckModule (copy)
	local ModalProps = p1.screenProps.modalProps
	local ExternalNavigation = p1.screenProps.externalNavigation
	local UseOverlayResult = UseOverlayFunction()
	
	return if UseOverlayResult then ReactRobloxModule.createPortal(ReactModule.createElement(TrustedFriendsCardWithActionsCheckModule, {
		userId = ModalProps.userId,
		onRequestAccepted = ModalProps.onRequestAccepted,
		onRequestSent = ModalProps.onRequestSent,
		source = ModalProps.source,
		modalVariantOverride = ModalProps.modalVariantOverride,
		sentFromQrCode = ModalProps.sentFromQrCode,
		tokens = ModalProps.tokens,
		isVerticallyConstrained = ModalProps.isVerticallyConstrained,
		onAcknowledged = ModalProps.onAcknowledged,
		externalNavigation = ExternalNavigation
	}), UseOverlayResult) else nil
end