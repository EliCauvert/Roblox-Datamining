local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local hardwareSafeAreaInsetsModule = require(momentsCommon.Utils.HardwareSafeAreaInsets)

return function()
	-- upvalues: reactModule (ref), hardwareSafeAreaInsetsModule (ref)
	local var3, var4 = reactModule.useState(hardwareSafeAreaInsetsModule.deviceInsets())
	reactModule.useLayoutEffect(function()
		-- upvalues: hardwareSafeAreaInsetsModule (copy), var4 (ref), var3 (ref)
		local var5 = hardwareSafeAreaInsetsModule:connect(var4)
		
		if hardwareSafeAreaInsetsModule.diffInsets(var3, hardwareSafeAreaInsetsModule.deviceInsets()) then
			var4(hardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function()
			-- upvalues: var5 (ref)
			var5.disconnect()
		end
	end, {})
	
	return var3
end