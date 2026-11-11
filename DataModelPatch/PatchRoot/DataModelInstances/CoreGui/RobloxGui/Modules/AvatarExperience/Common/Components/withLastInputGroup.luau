local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseInputTypeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useInputType

return function(p1)
	-- upvalues: UseInputTypeFunction (copy), ReactModule (copy), DashModule (copy)
	return function(p2)
		-- upvalues: UseInputTypeFunction (upval), ReactModule (upval), p1 (copy), DashModule (upval)
		return ReactModule.createElement(p1, DashModule.join(p2, { lastInputGroup = UseInputTypeFunction() }))
	end
end