local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local TutilsModule = require(Parent.tutils)
local config = { navigation = true }

local function arePropsEqualIgnoringNavigation(p1, p2)
	-- upvalues: TutilsModule (copy), config (copy)
	return TutilsModule.shallowEqual(p1, p2, config)
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy), CryoModule (copy), arePropsEqualIgnoringNavigation (copy)
	return ReactModule.memo(RoactNavigationModule.withNavigationFocus(ReactModule.memo(function(p2)
		-- upvalues: ReactModule (upval), p1 (copy), CryoModule (upval)
		return ReactModule.createElement(p1, CryoModule.Dictionary.join(p2, { navigation = CryoModule.None }))
	end, arePropsEqualIgnoringNavigation)))
end