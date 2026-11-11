local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local IsComponentModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.isComponent)
local _ = require(CorePackages.Packages.Dash)
local config = { forwardRef = true, required = true }

return function(p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), IsComponentModule (copy), CryoModule (copy), config (copy), RoactModule (copy)
	ArgCheckModule.assert(IsComponentModule(p1), "withContextValue must be called with a Roact component (stateful or functional)")
	ArgCheckModule.assert(IsComponentModule(p2), "withContextValue must be called with a Roact component for contextConsumer")
	ArgCheckModule.isType(p3, "string", "withContextValue propName")
	local JoinResult = CryoModule.Dictionary.join(config, p4 or {})
	
	return function(p5)
		-- upvalues: p3 (copy), RoactModule (upval), p2 (copy), JoinResult (copy), ArgCheckModule (upval), p1 (copy), CryoModule (upval)
		local v1 = p5[p3]
		
		return RoactModule.createElement(p2, {
			render = function(p6)
				-- upvalues: v1 (copy), JoinResult (upval), ArgCheckModule (upval), p1 (upval), p3 (upval), RoactModule (upval), CryoModule (upval), p5 (copy)
				local V8 = v1 or p6
				
				if JoinResult.required then
					ArgCheckModule.assert(V8, string.format("withContextValue can only be used within the context provider hierarchy. The wrapped component %q is unable to get access to %q from props or context.", tostring(p1), p3))
				end
				return RoactModule.createElement(p1, CryoModule.Dictionary.join(p5, {
					[p3] = V8,
					[RoactModule.Ref] = JoinResult.forwardRef and p5[RoactModule.Ref] or nil
				}))
			end
		})
	end
end