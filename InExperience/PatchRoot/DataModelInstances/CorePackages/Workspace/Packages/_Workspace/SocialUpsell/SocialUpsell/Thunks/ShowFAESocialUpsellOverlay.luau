local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType

return function(p0) --[[ line: 15 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref), socialUpsellTypeModule (ref)
	return function(p1) --[[ line: 16 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), socialUpsellTypeModule (copy)
		p1:dispatch(setCentralOverlay(centralOverlayType.SocialUpsellOverlay, {
			data = p0,
			upsellType = socialUpsellTypeModule.FacialAgeEstimation
		}))
	end
end