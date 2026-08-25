local parent = script:FindFirstAncestor("BuildExperience").Parent
local appNavBarModule = require(parent.AppNavBar)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavBarPlacement = appNavBarModule.useNavBarPlacement

return function()
	-- upvalues: useTokens (ref), useNavBarPlacement (ref), useSelector (ref), appNavBarModule (ref)
	local var1 = useTokens()
	
	return {
		tokens = var1,
		topBarHeight = 56 * var1.Config.UI.Scale,
		shouldIncludeBottomBar = useNavBarPlacement() == appNavBarModule.Placement.Bottom and useSelector(function(p0)
			return p0.TabBarVisible
		end) ~= false
	}
end