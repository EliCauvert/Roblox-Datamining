local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local SetBodyPartRangeIdsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds)
local SetRangeIdToBodyPartsToSliderAndColor3ValuesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values)

return function(p1)
	-- upvalues: UtilsModule (copy), SetBodyPartRangeIdsModule (copy), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), UtilsModule (upval), SetBodyPartRangeIdsModule (upval), SetRangeIdToBodyPartsToSliderAndColor3ValuesModule (upval)
		local DefaultBodyColorRanges = p2:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges
		assert(DefaultBodyColorRanges ~= nil, "defaultBodyColorRanges is nil")
		local t = {}
		local t1 = {}
		
		for i, value in p1 do
			t[i], t1[i] = UtilsModule.findRangeAndSliderValueForColor3(value, DefaultBodyColorRanges)
		end
		p2:dispatch(SetBodyPartRangeIdsModule(t))
		
		for i1, value1 in t1 do
			p2:dispatch(SetRangeIdToBodyPartsToSliderAndColor3ValuesModule(t[i1], i1, value1, p1[i1]))
		end
	end
end