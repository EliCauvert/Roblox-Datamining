local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local IsComponentModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.isComponent)
local _ = require(CorePackages.Packages.Dash)

return function(p1, Callback)
	-- upvalues: ArgCheckModule (copy), IsComponentModule (copy), RoactModule (copy)
	ArgCheckModule.assert(IsComponentModule(p1), "withMappedProps must be called with a Roact component (stateful or functional)")
	ArgCheckModule.isType(Callback, "function", "withMappedProps mapper")
	
	return function(p2)
		-- upvalues: Callback (copy), RoactModule (upval), p1 (copy)
		return RoactModule.createElement(p1, (Callback(p2)))
	end
end