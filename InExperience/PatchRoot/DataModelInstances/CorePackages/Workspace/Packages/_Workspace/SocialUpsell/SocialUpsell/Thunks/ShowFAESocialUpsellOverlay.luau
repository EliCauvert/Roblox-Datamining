local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType

return function(Data) --[[ Line: 15 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy), SocialUpsellTypeModule (copy)
	return function(p1) --[[ Line: 16 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), Data (copy), SocialUpsellTypeModule (upval)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.SocialUpsellOverlay, {
			data = Data,
			upsellType = SocialUpsellTypeModule.FacialAgeEstimation
		}))
	end
end