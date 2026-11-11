local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXColorAdjustmentButtonShouldAccountForTryOns = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.Types)
local SelectHasBodyTryOn = if FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectHasBodyTryOn else require(Modules.AvatarExperience.Common.Selectors.selectHasBodyTryOn)
local SelectAvatarPreviewColors = if FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectAvatarPreviewColors else require(Modules.AvatarExperience.Common.Selectors.selectAvatarPreviewColors)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetBodyPartRangeIdsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds)
local SetBodyColor3sModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s)
local TryOnColorUpdatedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.TryOnColorUpdated
local SetRangeIdToBodyPartsToSliderAndColor3ValuesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)

return function(p1, p2, p3, p4)
	-- upvalues: ConstantsModule (copy), SelectAvatarPreviewColors (copy), SelectHasBodyTryOn (copy), TryOnColorUpdatedFunction (copy), SetBodyColor3sModule (copy), SetBodyPartRangeIdsModule (copy), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (copy), SendAnalyticsModule (copy)
	return function(p5)
		-- upvalues: ConstantsModule (upval), SelectAvatarPreviewColors (upval), p1 (copy), p2 (copy), SelectHasBodyTryOn (upval), TryOnColorUpdatedFunction (upval), SetBodyColor3sModule (upval), SetBodyPartRangeIdsModule (upval), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (upval), p3 (copy), SendAnalyticsModule (upval), p4 (copy)
		local State = p5:getState()
		local AvatarEditor = State.AvatarExperience.AvatarEditor
		local BodyPartForSkinColoringIds = ConstantsModule.BodyPartButtonData[AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds
		local SelectAvatarPreviewColorsResult = SelectAvatarPreviewColors(State)
		local BodyPartRangeIds = AvatarEditor.Character.BodyPartRangeIds
		local t = {}
		local t1 = {}
		
		if BodyPartForSkinColoringIds and #BodyPartForSkinColoringIds > 0 then
			t = table.clone(SelectAvatarPreviewColorsResult)
			t1 = table.clone(BodyPartRangeIds)
			
			for _, bodyPartForSkinColoringId in BodyPartForSkinColoringIds do
				t[bodyPartForSkinColoringId] = p1
				t1[bodyPartForSkinColoringId] = p2
			end
		else
			for _, allBodyPartForSkinColoringId in ConstantsModule.allBodyPartForSkinColoringIds do
				t[allBodyPartForSkinColoringId] = p1
				t1[allBodyPartForSkinColoringId] = p2
			end
		end
		if SelectHasBodyTryOn(State) then
			p5:dispatch(TryOnColorUpdatedFunction(t, t1))
		else
			p5:dispatch(SetBodyColor3sModule(t))
			p5:dispatch(SetBodyPartRangeIdsModule(t1))
		end
		for _, bodyPartForSkinColoringId1 in BodyPartForSkinColoringIds do
			p5:dispatch(SetRangeIdToBodyPartsToSliderAndColor3ValuesModule(p2, bodyPartForSkinColoringId1, p3, p1))
		end
		p5:dispatch(SendAnalyticsModule(p4.setBodyColor3s, t))
	end
end