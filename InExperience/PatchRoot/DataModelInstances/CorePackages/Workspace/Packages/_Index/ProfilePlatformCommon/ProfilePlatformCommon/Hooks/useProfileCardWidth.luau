local Parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseNavBarSizeFunction = require(Parent.AppNavBar).useNavBarSize
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FixIsWideModeCheck = game:DefineFastFlag("FixIsWideModeCheck", false)

return function(): number --[[ Line: 19 ]]
	-- upvalues: UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetSafeAreaSizeFunction (copy), FixIsWideModeCheck (copy), GetDisplayStoreFunction (copy), UseNavBarSizeFunction (copy), FFlagProfilePlatformNewProfileHeader (copy)
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeFunction(), (UseSelectorFunction(function(p1) --[[ Line: 21 ]]
		return p1.GlobalGuiInset
	end)))
	local IsOffsetBelow: boolean = if FixIsWideModeCheck then SafeAreaSize.Y.Offset < SafeAreaSize.X.Offset else GetDisplayStoreFunction(false).getDisplaySize(false) ~= Enum.DisplaySize.Small
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	
	return if FFlagProfilePlatformNewProfileHeader and IsOffsetBelow then math.max(456, (math.floor((SafeAreaSize.X.Offset - UseNavBarSizeResult) / 3))) else math.min(SafeAreaSize.X.Offset, 640)
end