local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local SendAXCounterV2Function = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function(p1, Text)
	-- upvalues: MutedErrorModule (copy), ConstantsModule (copy), SendAXCounterV2Function (copy)
	MutedErrorModule(`[AXNilGuard] {p1}{if Text == nil then "" else " :: " .. Text}`)
	local NilGuardEntry = ConstantsModule.Counter.NilGuard[p1]
	
	if NilGuardEntry ~= nil then
		SendAXCounterV2Function(NilGuardEntry)
	end
end