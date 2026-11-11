local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetExperienceNotificationsEnabledCountModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount)
local SetExperienceNotificationsEnabledLimitModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit)

return function(p1, p2)
	-- upvalues: SetExperienceNotificationsEnabledCountModule (copy), CryoModule (copy), SetExperienceNotificationsEnabledLimitModule (copy)
	local P0 = p1 or { count = 0, limit = 0 }
	assert(P0, "")
	
	if p2.type == SetExperienceNotificationsEnabledCountModule.name then
		P0 = CryoModule.Dictionary.join(P0, { count = p2.count })
		
		return P0
	end
	if p2.type == SetExperienceNotificationsEnabledLimitModule.name then
		P0 = CryoModule.Dictionary.join(P0, { limit = p2.limit })
	end
	return P0
end