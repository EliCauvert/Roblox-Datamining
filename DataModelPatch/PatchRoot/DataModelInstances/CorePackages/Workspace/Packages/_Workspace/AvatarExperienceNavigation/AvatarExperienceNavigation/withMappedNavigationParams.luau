local Parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local ReactIsModule = require(Parent.ReactIs)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), ReactIsModule (copy), RoactModule (copy), CryoModule (copy)
	ArgCheckModule.assert(ReactIsModule.isValidElementType(p1), "withMappedNavigationParams must be called with a Roact component (stateful or functional)")
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