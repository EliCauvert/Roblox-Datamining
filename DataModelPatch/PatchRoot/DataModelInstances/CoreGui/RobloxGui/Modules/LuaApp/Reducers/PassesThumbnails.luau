local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetPassesThumbnailsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetPassesThumbnails)

return function(p1, p2)
	-- upvalues: SetPassesThumbnailsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetPassesThumbnailsModule.name then
		P0 = CryoModule.Dictionary.join(P0, p2.passesThumbnails)
	end
	return P0
end