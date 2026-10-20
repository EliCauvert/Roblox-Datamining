local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local IsComponentModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.isComponent)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), IsComponentModule (copy), RoactModule (copy), CryoModule (copy)
	ArgCheckModule.assert(IsComponentModule(p1), "withMappedNavigationParams must be called with a Roact component (stateful or functional)")
	local P1 = p2 or {}
	
	if P1.forwardRef == nil then
		P1.forwardRef = true
	end
	return function(p3)
		-- upvalues: RoactModule (upval), p1 (copy), CryoModule (upval), P1 (copy)
		return RoactModule.createElement(p1, CryoModule.Dictionary.join(p3, p3.navigation.state.params or {}, {
			[RoactModule.Ref] = P1.forwardRef and p3[RoactModule.Ref] or CryoModule.None
		}))
	end
end