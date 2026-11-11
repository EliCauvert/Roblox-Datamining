local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function()
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), ConstantsModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	
	return function(Text)
		-- upvalues: UseRoactServiceModuleResult (copy), ConstantsModule (upval)
		UseRoactServiceModuleResult.sendCounter(ConstantsModule.Counter.PREFIX .. Text)
	end
end