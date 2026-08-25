local parent = script:FindFirstAncestor("Navigation").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)

return function()
	-- upvalues: reactModule (ref), roactNavigationModule (ref)
	return reactModule.useContext(roactNavigationModule.Context)
end