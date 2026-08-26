local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType

return function(p1)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref), socialUpsellTypeModule (ref)
	return function(p2)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), socialUpsellTypeModule (copy)
		p2:dispatch(setCentralOverlay(centralOverlayType.SocialUpsellOverlay, {
			data = p1,
			upsellType = socialUpsellTypeModule.FacialAgeEstimation
		}))
	end
end