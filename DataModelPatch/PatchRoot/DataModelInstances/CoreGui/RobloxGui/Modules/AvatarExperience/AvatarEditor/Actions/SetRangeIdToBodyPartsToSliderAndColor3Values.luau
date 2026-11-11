local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(Modules.AvatarExperience.Common.Types)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ColorPickerUtilsModule = require(Modules.AvatarExperience.ColorPicker.ColorPickerUtils)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(RangeId, BodyPartForSkinColoringId, p1, p2)
	-- upvalues: ArgCheckModule (copy), ColorPickerUtilsModule (copy), MutedErrorModule (copy)
	ArgCheckModule.isType(RangeId, "string", "rangeId")
	ArgCheckModule.isType(BodyPartForSkinColoringId, "string", "bodyPartForSkinColoringId")
	ArgCheckModule.isType(p1, "number", "sliderValue")
	local ClampBetween0And1Result, ClampBetween0And1Result2 = ColorPickerUtilsModule.clampBetween0And1(p1)
	
	if ClampBetween0And1Result2 then
		MutedErrorModule(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(p1))))
	end
	ArgCheckModule.isType(p2, "Color3", "color3")
	
	return {
		rangeId = RangeId,
		bodyPartForSkinColoringId = BodyPartForSkinColoringId,
		sliderValue = ClampBetween0And1Result,
		color3 = p2
	}
end)