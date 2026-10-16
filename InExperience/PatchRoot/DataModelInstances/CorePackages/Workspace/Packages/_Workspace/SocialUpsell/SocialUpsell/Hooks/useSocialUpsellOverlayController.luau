local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local ReactModule = require(Parent.React)
local CentralOverlayModule = require(Parent.CentralOverlay)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagEnableAEGIS2CommsFAEUpsell = require(Parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local _ = require(SocialUpsell.Enum.SocialUpsellType)
local GetOverlayStoreModule = require(SocialUpsell.Store.getOverlayStore)
local ConstantsModule = require(SocialUpsell.Constants)
local CryoModule = require(Parent.Cryo)
local OverlayStoreModule = if FFlagEnableAEGIS2CommsFAEUpsell then GetOverlayStoreModule(false) else nil

return function(IsInExperience) --[[ Line: 32 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), OverlayStoreModule (ref), ConstantsModule (copy), CryoModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(UpsellType, Data) --[[ Line: 35 ]]
		-- upvalues: IsInExperience (copy), FFlagEnableAEGIS2CommsFAEUpsell (upval), OverlayStoreModule (upval), ConstantsModule (upval), CryoModule (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		if not IsInExperience then
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SocialUpsellOverlay, { upsellType = UpsellType, data = Data }))
		elseif FFlagEnableAEGIS2CommsFAEUpsell and OverlayStoreModule then
			OverlayStoreModule.setCurrentOverlay(ConstantsModule.OVERLAY_TYPES.SocialUpsell, {
				upsellType = UpsellType,
				data = CryoModule.Dictionary.join(Data, { isInExperience = IsInExperience })
			})
			
			return
		end
	end, { IsInExperience })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 53 ]]
		-- upvalues: IsInExperience (copy), FFlagEnableAEGIS2CommsFAEUpsell (upval), OverlayStoreModule (upval), UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		if not IsInExperience then
			UseDispatchResult(CloseCentralOverlayFunction())
		elseif FFlagEnableAEGIS2CommsFAEUpsell and OverlayStoreModule then
			OverlayStoreModule.dismissCurrentOverlay()
			
			return
		end
	end, { IsInExperience })
	
	return ReactModule.useMemo(function() --[[ Line: 63 ]]
		-- upvalues: UseResult (copy), UseResult1 (copy)
		return {
			openSocialOverlay = UseResult,
			closeSocialOverlay = UseResult1
		}
	end, { UseResult, UseResult1 })
end