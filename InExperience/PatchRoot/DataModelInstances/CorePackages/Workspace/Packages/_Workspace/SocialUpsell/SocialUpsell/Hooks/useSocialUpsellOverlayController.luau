local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local reactModule = require(parent.React)
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagEnableAEGIS2CommsFAEUpsell = require(parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local _ = require(socialUpsell.Enum.SocialUpsellType)
local getOverlayStoreModule = require(socialUpsell.Store.getOverlayStore)
local constantsModule = require(socialUpsell.Constants)
local cryoModule = require(parent.Cryo)
local var7 = if fFlagEnableAEGIS2CommsFAEUpsell then getOverlayStoreModule(false) else nil

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), var7 (write), constantsModule (ref), cryoModule (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref)
	local var8 = useDispatch()
	local var9 = reactModule.useCallback(function(p1, p2)
		-- upvalues: p0 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), var7 (copy), constantsModule (copy), cryoModule (copy), var8 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if p0 then
			if fFlagEnableAEGIS2CommsFAEUpsell and var7 then
				var7.setCurrentOverlay(constantsModule.OVERLAY_TYPES.SocialUpsell, {
					upsellType = p1,
					data = cryoModule.Dictionary.join(p2, { isInExperience = p0 })
				})
				
				return
			end
		else
			var8(setCentralOverlay(centralOverlayType.SocialUpsellOverlay, { upsellType = p1, data = p2 }))
		end
	end, { p0 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), var7 (copy), var8 (ref), closeCentralOverlay (copy)
		if p0 then
			if fFlagEnableAEGIS2CommsFAEUpsell and var7 then
				var7.dismissCurrentOverlay()
				
				return
			end
		else
			var8(closeCentralOverlay())
		end
	end, { p0 })
	
	return reactModule.useMemo(function()
		-- upvalues: var9 (ref), var10 (ref)
		return { openSocialOverlay = var9, closeSocialOverlay = var10 }
	end, { var9, var10 })
end