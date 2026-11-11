local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseNavigationPropsModule = require(script.Parent.useNavigationProps)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), UseNavigationPropsModule (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), CryoModule (upval), UseNavigationPropsModule (upval), p1 (copy)
		return function(p3)
			-- upvalues: ReactModule (upval), p2 (copy), CryoModule (upval), UseNavigationPropsModule (upval), p1 (upval)
			return ReactModule.createElement(p2, CryoModule.Dictionary.join(p3, UseNavigationPropsModule(p1)))
		end
	end
end