local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AppNavBarModule = require(Parent.AppNavBar)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement

return function()
	-- upvalues: UseTokensFunction (copy), UseNavBarPlacementFunction (copy), UseSelectorFunction (copy), AppNavBarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.TabBarVisible
	end)
	
	return {
		tokens = UseTokensResult,
		topBarHeight = 56 * UseTokensResult.Config.UI.Scale,
		shouldIncludeBottomBar = UseNavBarPlacementResult == AppNavBarModule.Placement.Bottom and UseSelectorResult ~= false
	}
end