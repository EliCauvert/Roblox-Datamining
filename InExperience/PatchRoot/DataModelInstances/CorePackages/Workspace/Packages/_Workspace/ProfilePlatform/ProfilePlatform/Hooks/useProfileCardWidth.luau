local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local inputUiModule = require(parent.InputUi)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local useNavBarSize = require(parent.AppNavBar).useNavBarSize
local constantsModule = require(profilePlatform.Common.Constants)

return function(p1)
	-- upvalues: useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), useNavBarSize (ref), constantsModule (ref)
	local var1 = getSafeAreaSize(useScreenSize(), useSelector(function(p2)
		return p2.GlobalGuiInset
	end))
	
	return if p1 then math.max(constantsModule.MINIMUN_CONTAINER_WIDTH, math.floor((var1.X.Offset - useNavBarSize()) / 3)) else math.min(var1.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
end