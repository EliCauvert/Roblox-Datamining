local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseNavBarSizeFunction = require(Parent.AppNavBar).useNavBarSize
local ConstantsModule = require(ProfilePlatform.Common.Constants)

return function(p1): number --[[ Line: 13 ]]
	-- upvalues: UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetSafeAreaSizeFunction (copy), UseNavBarSizeFunction (copy), ConstantsModule (copy)
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeFunction(), (UseSelectorFunction(function(p2) --[[ Line: 15 ]]
		return p2.GlobalGuiInset
	end)))
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	
	return if p1 then math.max(ConstantsModule.MINIMUN_CONTAINER_WIDTH, (math.floor((SafeAreaSize.X.Offset - UseNavBarSizeResult) / 3))) else math.min(SafeAreaSize.X.Offset, ConstantsModule.MAXIMUM_CONTAINER_WIDTH)
end