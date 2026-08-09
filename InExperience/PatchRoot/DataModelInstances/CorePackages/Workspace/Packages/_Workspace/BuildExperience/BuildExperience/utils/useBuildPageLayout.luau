local parent = script:FindFirstAncestor("BuildExperience").Parent
local appNavBarModule = require(parent.AppNavBar)
local UIBloxModule = require(parent.UIBlox)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getPageMargin = UIBloxModule.App.Container.getPageMargin
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local useNavBarSize = appNavBarModule.useNavBarSize

return function() --[[ line: 21 | named "useBuildPageLayout" ]]
	-- upvalues: useTokens (ref), useNavBarPlacement (ref), useNavBarSize (ref), useSelector (ref), getPageMargin (ref), appNavBarModule (ref)
	return {
		tokens = useTokens(),
		topBarHeight = useNavBarSize(),
		sideMargin = getPageMargin(useSelector(function(p0) --[[ line: 25 ]]
			return p0.ScreenSize
		end).X),
		shouldIncludeBottomBar = useNavBarPlacement() == appNavBarModule.Placement.Bottom and useSelector(function(p1) --[[ line: 28 ]]
			return p1.TabBarVisible
		end) ~= false
	}
end