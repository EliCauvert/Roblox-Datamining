local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local upsellEntrySurfaceTypeModule = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local FAEUpsellOverlayModule = require(socialUpsell.Components.FAEUpsellOverlay)
local fFlagEnableAEGIS2CommsFAEUpsell = require(parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local t = {
	isInExperience = false,
	upsellEntrySurface = upsellEntrySurfaceTypeModule.Unknown,
	upsellType = socialUpsellTypeModule.Unknown
}

return function(p0) --[[ line: 27 ]]
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), socialUpsellTypeModule (ref), FAEUpsellOverlayModule (ref)
	return reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: cryoModule (copy), t (copy), p0 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), socialUpsellTypeModule (copy), reactModule (copy), FAEUpsellOverlayModule (copy)
		local var7 = nil
		local var8 = cryoModule.Dictionary.union(t, p0.data or {})
		var8.containerRef = p0.containerRef
		
		if not fFlagEnableAEGIS2CommsFAEUpsell then
			var8.isInExperience = false
		end
		if p0.upsellType == socialUpsellTypeModule.FacialAgeEstimation then
			var7 = reactModule.createElement(FAEUpsellOverlayModule, var8)
		end
		return var7
	end, { p0.upsellType, p0.data })
end