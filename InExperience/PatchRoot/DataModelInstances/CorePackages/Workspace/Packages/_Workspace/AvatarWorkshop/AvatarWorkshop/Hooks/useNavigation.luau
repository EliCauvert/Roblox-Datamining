local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local _ = require(AvatarWorkshop.Navigation.NavigationTypes)

return function()
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	return ReactModule.useContext(RoactNavigationModule.Context)
end