local parent = script:FindFirstAncestor("MomentsCommon").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local isVRAppBuild = appCommonLibModule.IsVRAppBuild
local isTenFootInterface = appCommonLibModule.isTenFootInterface
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole

return function()
	-- upvalues: isVRAppBuild (ref), fFlagEnableLeftNavOnConsole (ref), isTenFootInterface (ref)
	local var1 = not isVRAppBuild()
	
	if var1 then
		var1 = not (fFlagEnableLeftNavOnConsole and isTenFootInterface())
	end
	return var1
end