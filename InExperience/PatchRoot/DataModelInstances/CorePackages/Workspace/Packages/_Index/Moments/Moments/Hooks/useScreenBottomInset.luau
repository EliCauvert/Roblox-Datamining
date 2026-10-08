local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appNavBarModule = require(parent.AppNavBar)
local appSystemBarModule = require(parent.AppSystemBar)
local fFlagMomentsFeedAboveNavBarModule = require(moments.Flags.FFlagMomentsFeedAboveNavBar)
local useNavBarSize = appNavBarModule.useNavBarSize
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local placement = appNavBarModule.Placement

return function()
	-- upvalues: useNavBarPlacement (ref), useNavBarSize (ref), fFlagMomentsFeedAboveNavBarModule (ref), appSystemBarModule (ref), placement (ref)
	return if useNavBarPlacement() == placement.Bottom then if fFlagMomentsFeedAboveNavBarModule then appSystemBarModule.Constants.BOTTOM_BAR_SIZE else useNavBarSize() else 0
end