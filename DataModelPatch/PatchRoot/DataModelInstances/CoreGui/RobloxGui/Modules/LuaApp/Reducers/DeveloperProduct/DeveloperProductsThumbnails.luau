local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetDeveloperProductsThumbnailsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.DeveloperProduct.SetDeveloperProductsThumbnails)

return function(p1, p2)
	-- upvalues: SetDeveloperProductsThumbnailsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetDeveloperProductsThumbnailsModule.name then
		P0 = CryoModule.Dictionary.join(P0, p2.developerProductsThumbnails)
	end
	return P0
end