local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local inputUiModule = require(parent.InputUi)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local useNavBarSize = require(parent.AppNavBar).useNavBarSize
local constantsModule = require(profilePlatform.Common.Constants)

return function(p0) --[[ line: 13 ]]
	-- upvalues: useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), useNavBarSize (ref), constantsModule (ref)
	local var3 = getSafeAreaSize(useScreenSize(), useSelector(function(p1) --[[ line: 15 ]]
		return p1.GlobalGuiInset
	end))
	
	return if p0 then math.max(constantsModule.MINIMUN_CONTAINER_WIDTH, math.floor((var3.X.Offset - useNavBarSize()) / 3)) else math.min(var3.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
end