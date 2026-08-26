local reactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local hardwareSafeAreaInsetsModule = require(script.Parent.Parent.HardwareSafeAreaInsets)

return function()
	-- upvalues: reactModule (ref), hardwareSafeAreaInsetsModule (ref)
	local var1, var2 = reactModule.useState(hardwareSafeAreaInsetsModule.deviceInsets())
	reactModule.useLayoutEffect(function()
		-- upvalues: hardwareSafeAreaInsetsModule (copy), var2 (ref), var1 (ref)
		local var3 = hardwareSafeAreaInsetsModule:connect(var2)
		
		if hardwareSafeAreaInsetsModule.diffInsets(var1, hardwareSafeAreaInsetsModule.deviceInsets()) then
			var2(hardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function()
			-- upvalues: var3 (ref)
			var3:disconnect()
		end
	end, {})
	
	return var1
end