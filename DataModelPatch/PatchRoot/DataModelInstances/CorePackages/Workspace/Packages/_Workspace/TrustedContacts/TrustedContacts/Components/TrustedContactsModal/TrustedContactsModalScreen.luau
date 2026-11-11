local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseOverlayFunction = require(Parent.Foundation).Hooks.useOverlay
local TrustedFriendsCardWithActionsCheckModule = if require(Parent.SharedFlags).FFlagTFWithActionsCheck then require(script.Parent.TrustedFriendsCardWithActionsCheck) else require(script.Parent.TrustedContactsModalContainer)
local FFlagTCModalUseFoundationOverlay = require(Parent.SharedFlags).FFlagTCModalUseFoundationOverlay
local _ = require(TrustedContacts.Common.Types)

return function(p1)
	-- upvalues: FFlagTCModalUseFoundationOverlay (copy), UseOverlayFunction (copy), ReactRobloxModule (copy), ReactModule (copy), TrustedFriendsCardWithActionsCheckModule (copy)
	local ModalProps = p1.screenProps.modalProps
	local ExternalNavigation = p1.screenProps.externalNavigation
	
	if FFlagTCModalUseFoundationOverlay then
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
	else
		return ReactModule.createElement("ScreenGui", {
			Enabled = true,
			DisplayOrder = 11,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			ReactModule.createElement(TrustedFriendsCardWithActionsCheckModule, {
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
			})
		})
	end
end