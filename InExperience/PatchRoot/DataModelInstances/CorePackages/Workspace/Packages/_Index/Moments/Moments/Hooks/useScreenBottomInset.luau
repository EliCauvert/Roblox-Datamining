local appNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)
local useNavBarSize = appNavBarModule.useNavBarSize
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local placement = appNavBarModule.Placement

return function() --[[ line: 35 | named "useScreenBottomInset" ]]
	-- upvalues: useNavBarPlacement (ref), useNavBarSize (ref), placement (ref)
	return if useNavBarPlacement() == placement.Bottom then useNavBarSize() else 0
end