local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local MutedErrorModule = require(Modules.LuaApp.mutedError)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SelectedBodyPartIndex: number)
	-- upvalues: ConstantsModule (copy), MutedErrorModule (copy)
	if SelectedBodyPartIndex < 0 or #ConstantsModule.BodyPartButtonData < SelectedBodyPartIndex then
		MutedErrorModule("selectedBodyPartIndex is out of range")
	end
	return { selectedBodyPartIndex = SelectedBodyPartIndex }
end)