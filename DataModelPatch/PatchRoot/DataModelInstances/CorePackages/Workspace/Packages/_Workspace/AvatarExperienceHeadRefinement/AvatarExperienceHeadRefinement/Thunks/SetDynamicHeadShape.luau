local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local CryoModule = require(Parent.Cryo)
local SetOutfitTryOnsFunction = require(Parent.AvatarExperienceRodux).Actions.SetOutfitTryOns
local SetEquippedDynamicHeadShapeModule = require(script.Parent.Parent.Actions.SetEquippedDynamicHeadShape)
local UpdateDynamicHeadPropsInTryOnModule = require(script.Parent.Parent.Utils.updateDynamicHeadPropsInTryOn)

return function(HeadShape, _)
	-- upvalues: CryoModule (copy), SetEquippedDynamicHeadShapeModule (copy), UpdateDynamicHeadPropsInTryOnModule (copy), SetOutfitTryOnsFunction (copy)
	return function(p1)
		-- upvalues: CryoModule (upval), SetEquippedDynamicHeadShapeModule (upval), HeadShape (copy), UpdateDynamicHeadPropsInTryOnModule (upval), SetOutfitTryOnsFunction (upval)
		local OutfitTryOn = p1:getState().AvatarExperience.AvatarScene.OutfitTryOn
		local TryOnItems = OutfitTryOn.TryOnItems or {}
		
		if CryoModule.isEmpty(TryOnItems) then
			p1:dispatch(SetEquippedDynamicHeadShapeModule(HeadShape))
			
			return
		else
			p1:dispatch(SetOutfitTryOnsFunction((CryoModule.Dictionary.join(OutfitTryOn, {
				TryOnItems = UpdateDynamicHeadPropsInTryOnModule(TryOnItems, function()
					-- upvalues: HeadShape (upval)
					return { headShape = HeadShape }
				end)
			}))))
		end
	end
end