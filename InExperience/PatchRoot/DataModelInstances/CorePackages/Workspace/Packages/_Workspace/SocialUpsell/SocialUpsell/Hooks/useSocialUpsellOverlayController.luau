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
local var1 = if fFlagEnableAEGIS2CommsFAEUpsell then getOverlayStoreModule(false) else nil

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), var1 (write), constantsModule (ref), cryoModule (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref)
	local var2 = useDispatch()
	local var3 = reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), var1 (copy), constantsModule (copy), cryoModule (copy), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if p1 then
			if fFlagEnableAEGIS2CommsFAEUpsell and var1 then
				var1.setCurrentOverlay(constantsModule.OVERLAY_TYPES.SocialUpsell, {
					upsellType = p2,
					data = cryoModule.Dictionary.join(p3, { isInExperience = p1 })
				})
				
				return
			end
		else
			var2(setCentralOverlay(centralOverlayType.SocialUpsellOverlay, { upsellType = p2, data = p3 }))
		end
	end, { p1 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), var1 (copy), var2 (ref), closeCentralOverlay (copy)
		if p1 then
			if fFlagEnableAEGIS2CommsFAEUpsell and var1 then
				var1.dismissCurrentOverlay()
				
				return
			end
		else
			var2(closeCentralOverlay())
		end
	end, { p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		return { openSocialOverlay = var3, closeSocialOverlay = var4 }
	end, { var3, var4 })
end