local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local FAEUpsellOverlayModule = require(SocialUpsell.Components.FAEUpsellOverlay)
local FFlagEnableAEGIS2CommsFAEUpsell = require(Parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local config = {
	isInExperience = false,
	upsellEntrySurface = require(SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType).Unknown,
	upsellType = SocialUpsellTypeModule.Unknown
}

return function(p1) --[[ Line: 27 ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), config (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), SocialUpsellTypeModule (copy), FAEUpsellOverlayModule (copy)
	return (ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: CryoModule (upval), config (upval), p1 (copy), FFlagEnableAEGIS2CommsFAEUpsell (upval), SocialUpsellTypeModule (upval), ReactModule (upval), FAEUpsellOverlayModule (upval)
		local Element = nil
		local UnionResult = CryoModule.Dictionary.union(config, p1.data or {})
		UnionResult.containerRef = p1.containerRef
		
		if not FFlagEnableAEGIS2CommsFAEUpsell then
			UnionResult.isInExperience = false
		end
		if p1.upsellType == SocialUpsellTypeModule.FacialAgeEstimation then
			Element = ReactModule.createElement(FAEUpsellOverlayModule, UnionResult)
		end
		return Element
	end, { p1.upsellType, p1.data }))
end