local FFlagOptionalNavigation = require(script:FindFirstAncestor("Navigation").Parent.SharedFlags).FFlagOptionalNavigation
local UseNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: UseNavigationModule (copy), FFlagOptionalNavigation (copy)
	local UseNavigationModuleResult = UseNavigationModule()
	
	return if FFlagOptionalNavigation and UseNavigationModuleResult == nil then nil else UseNavigationModuleResult.state.routeName
end