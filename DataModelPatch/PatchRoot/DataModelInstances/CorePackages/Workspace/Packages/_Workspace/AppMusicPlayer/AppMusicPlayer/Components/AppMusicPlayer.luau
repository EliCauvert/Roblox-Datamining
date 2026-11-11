local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local AppNavBarModule = require(AppMusicPlayer.Parent.AppNavBar)
local AppSystemBarModule = require(AppMusicPlayer.Parent.AppSystemBar)
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local ReactModule = require(AppMusicPlayer.Parent.React)
local PersistentMusicPlayerModule = require(AppMusicPlayer.Components.PersistentMusicPlayer)
local GetFFlagMusicPlayerUseDynamicNavBarHeightFunction = require(AppMusicPlayer.Parent.SharedFlags).GetFFlagMusicPlayerUseDynamicNavBarHeight
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize

return ReactModule.memo(function()
	-- upvalues: UseNavBarPlacementFunction (copy), GetFFlagMusicPlayerUseDynamicNavBarHeightFunction (copy), UseNavBarSizeFunction (copy), AppSystemBarModule (copy), ReactModule (copy), FoundationModule (copy), AppNavBarModule (copy), PersistentMusicPlayerModule (copy)
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseNavBarSizeResult = if GetFFlagMusicPlayerUseDynamicNavBarHeightFunction() then UseNavBarSizeFunction() else AppSystemBarModule.Constants.BOTTOM_BAR_SIZE
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y anchor-bottom-left",
		Position = if UseNavBarPlacementResult == AppNavBarModule.Placement.Bottom then UDim2.new(0, 0, 1, -UseNavBarSizeResult) else UDim2.fromScale(0, 1)
	}, {
		PersistentMusicPlayer = ReactModule.createElement(PersistentMusicPlayerModule)
	})
end)