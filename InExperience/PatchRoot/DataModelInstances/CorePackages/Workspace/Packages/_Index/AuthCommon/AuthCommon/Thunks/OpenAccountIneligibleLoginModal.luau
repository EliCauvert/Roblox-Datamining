local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(OnDismiss, PortalToFoundationOverlay, p1) --[[ Line: 13 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p2) --[[ Line: 14 ]]
		-- upvalues: p1 (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), OnDismiss (copy), PortalToFoundationOverlay (copy)
		local P2 = p1 or {}
		p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.AccountIneligibleLoginModal, {
			onDismiss = OnDismiss,
			portalToFoundationOverlay = PortalToFoundationOverlay,
			titleKey = P2.titleKey,
			descriptionKey = P2.descriptionKey,
			actionKey = P2.actionKey
		}))
	end
end