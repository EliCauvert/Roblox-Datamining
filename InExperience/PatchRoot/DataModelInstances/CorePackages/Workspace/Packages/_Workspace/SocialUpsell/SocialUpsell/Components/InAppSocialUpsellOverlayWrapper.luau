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

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), socialUpsellTypeModule (ref), FAEUpsellOverlayModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), t (copy), p1 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), socialUpsellTypeModule (copy), reactModule (copy), FAEUpsellOverlayModule (copy)
		local var1 = nil
		local var2 = cryoModule.Dictionary.union(t, p1.data or {})
		var2.containerRef = p1.containerRef
		
		if not fFlagEnableAEGIS2CommsFAEUpsell then
			var2.isInExperience = false
		end
		if p1.upsellType == socialUpsellTypeModule.FacialAgeEstimation then
			var1 = reactModule.createElement(FAEUpsellOverlayModule, var2)
		end
		return var1
	end, { p1.upsellType, p1.data })
end