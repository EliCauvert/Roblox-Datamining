local Parent = script:FindFirstAncestor("Navigation").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)

return function() --[[ Line: 11 | Named "useNavigation" ]]
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	return ReactModule.useContext(RoactNavigationModule.Context)
end