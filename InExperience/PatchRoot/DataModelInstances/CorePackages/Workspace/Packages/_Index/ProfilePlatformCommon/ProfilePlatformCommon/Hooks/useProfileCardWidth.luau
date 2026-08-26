local parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local inputUiModule = require(parent.InputUi)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local useNavBarSize = require(parent.AppNavBar).useNavBarSize
local getDisplayStore = require(parent.Display).GetDisplayStore
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fixIsWideModeCheck = game:DefineFastFlag("FixIsWideModeCheck", false)

return function()
	-- upvalues: useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fixIsWideModeCheck (ref), getDisplayStore (ref), useNavBarSize (ref), fFlagProfilePlatformNewProfileHeader (ref)
	local var1
	local var2 = getSafeAreaSize(useScreenSize(), useSelector(function(p1)
		return p1.GlobalGuiInset
	end))
	local _ = nil
	
	if fixIsWideModeCheck then
		var1 = var2.Y.Offset < var2.X.Offset
		var1 = nil
	else
		var1 = getDisplayStore(false).getDisplaySize(false) ~= Enum.DisplaySize.Small
	end
	return if fFlagProfilePlatformNewProfileHeader then if var1 then math.max(456, math.floor((var2.X.Offset - useNavBarSize()) / 3)) else math.min(var2.X.Offset, 640) else math.min(var2.X.Offset, 640)
end