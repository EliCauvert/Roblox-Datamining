local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local AppNavBarModule = require(Parent.AppNavBar)
local AppSystemBarModule = require(Parent.AppSystemBar)
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local Placement = AppNavBarModule.Placement

return function() --[[ Line: 37 | Named "useScreenBottomInset" ]]
	-- upvalues: UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), FFlagMomentsFeedAboveNavBarModule (copy), AppSystemBarModule (copy), Placement (copy)
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	local BOTTOMBARSIZE = if FFlagMomentsFeedAboveNavBarModule then AppSystemBarModule.Constants.BOTTOM_BAR_SIZE else UseNavBarSizeResult
	
	return if UseNavBarPlacementResult == Placement.Bottom then BOTTOMBARSIZE else 0
end