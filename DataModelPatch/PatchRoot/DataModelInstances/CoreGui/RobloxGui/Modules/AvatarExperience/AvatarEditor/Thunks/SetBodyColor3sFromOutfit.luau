local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)
local SetBodyPartRangeIdsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds)
local SetBodyColor3sModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s)
local SetRangeIdToBodyPartsToSliderAndColor3ValuesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)

return function(p1, p2)
	-- upvalues: UtilsModule (copy), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (copy), SetBodyColor3sModule (copy), SetBodyPartRangeIdsModule (copy)
	return function(p3)
		-- upvalues: p1 (copy), UtilsModule (upval), p2 (copy), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (upval), SetBodyColor3sModule (upval), SetBodyPartRangeIdsModule (upval)
		local t = {}
		
		for i, value in pairs(p1) do
			local RangeAndSliderValueForColor3, RangeAndSliderValueForColor32 = UtilsModule.findRangeAndSliderValueForColor3(value, p2)
			SetRangeIdToBodyPartsToSliderAndColor3ValuesModule(RangeAndSliderValueForColor3, i, RangeAndSliderValueForColor32, value)
			t[i] = RangeAndSliderValueForColor3
		end
		p3:dispatch(SetBodyColor3sModule(p1))
		p3:dispatch(SetBodyPartRangeIdsModule(t))
	end
end