local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local CryoModule = require(Parent.Cryo)
local SetEquippedStaticFacialAnimationModule = require(script.Parent.Parent.Actions.SetEquippedStaticFacialAnimation)
local UpdateDynamicHeadPropsInTryOnModule = require(script.Parent.Parent.Utils.updateDynamicHeadPropsInTryOn)
local SetOutfitTryOnsFunction = require(Parent.AvatarExperienceRodux).Actions.SetOutfitTryOns

return function(StaticFacialAnimation, _)
	-- upvalues: CryoModule (copy), SetEquippedStaticFacialAnimationModule (copy), UpdateDynamicHeadPropsInTryOnModule (copy), SetOutfitTryOnsFunction (copy)
	return function(p1)
		-- upvalues: CryoModule (upval), SetEquippedStaticFacialAnimationModule (upval), StaticFacialAnimation (copy), UpdateDynamicHeadPropsInTryOnModule (upval), SetOutfitTryOnsFunction (upval)
		local OutfitTryOn = p1:getState().AvatarExperience.AvatarScene.OutfitTryOn
		local TryOnItems = OutfitTryOn.TryOnItems or {}
		
		if CryoModule.isEmpty(TryOnItems) then
			p1:dispatch(SetEquippedStaticFacialAnimationModule(StaticFacialAnimation))
			
			return
		else
			p1:dispatch(SetOutfitTryOnsFunction((CryoModule.Dictionary.join(OutfitTryOn, {
				TryOnItems = UpdateDynamicHeadPropsInTryOnModule(TryOnItems, function()
					-- upvalues: StaticFacialAnimation (upval)
					return { staticFacialAnimation = StaticFacialAnimation }
				end)
			}))))
		end
	end
end