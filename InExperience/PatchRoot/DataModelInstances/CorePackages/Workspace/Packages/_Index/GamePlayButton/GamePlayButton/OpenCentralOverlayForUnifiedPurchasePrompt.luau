local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1) --[[ Line: 6 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p2) --[[ Line: 7 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.UnifiedProductPurchaseModal, p1))
	end
end