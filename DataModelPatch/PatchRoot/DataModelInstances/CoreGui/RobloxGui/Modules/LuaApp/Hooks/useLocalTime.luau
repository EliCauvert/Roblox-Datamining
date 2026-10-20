local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)

return function(p1, p2)
	-- upvalues: UseRoactServiceModule (copy), RoactLocalizationModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactLocalizationModule)
	
	if p1 then
		local _DateTime = DateTime.fromIsoDate(p1)
		
		if _DateTime then
			return _DateTime:FormatLocalTime(p2 or "l", (UseRoactServiceModuleResult:GetLocale()))
		end
	end
	return nil
end