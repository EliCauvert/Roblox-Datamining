local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)

return require(CorePackages.Packages.Rodux).createReducer({
	viewSetting = "Standard",
	selectedBodyPartIndex = 1,
	rangeIdToBodyPartsToSliderAndColor3Values = {}
}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local RangeIdToBodyPartsToSliderAndColor3Values = p1.rangeIdToBodyPartsToSliderAndColor3Values
		
		return CryoModule.Dictionary.join(p1, {
			rangeIdToBodyPartsToSliderAndColor3Values = CryoModule.Dictionary.join(RangeIdToBodyPartsToSliderAndColor3Values, {
				[p2.rangeId] = CryoModule.Dictionary.join(RangeIdToBodyPartsToSliderAndColor3Values[p2.rangeId] or {}, {
					[p2.bodyPartForSkinColoringId] = { color3 = p2.color3, sliderValue = p2.sliderValue }
				})
			})
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { selectedBodyPartIndex = p2.selectedBodyPartIndex })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { viewSetting = p2.bodyColorViewSetting })
	end
})