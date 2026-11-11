local AppNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local Placement = AppNavBarModule.Placement

return function()
	-- upvalues: UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), Placement (copy)
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	
	return if UseNavBarPlacementResult == Placement.Bottom then UseNavBarSizeResult else 0
end