local reactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local hardwareSafeAreaInsetsModule = require(script.Parent.Parent.HardwareSafeAreaInsets)

return function()
	-- upvalues: reactModule (ref), hardwareSafeAreaInsetsModule (ref)
	local var2, var3 = reactModule.useState(hardwareSafeAreaInsetsModule.deviceInsets())
	reactModule.useLayoutEffect(function()
		-- upvalues: hardwareSafeAreaInsetsModule (copy), var3 (ref), var2 (ref)
		local var4 = hardwareSafeAreaInsetsModule:connect(var3)
		
		if hardwareSafeAreaInsetsModule.diffInsets(var2, hardwareSafeAreaInsetsModule.deviceInsets()) then
			var3(hardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function()
			-- upvalues: var4 (ref)
			var4:disconnect()
		end
	end, {})
	
	return var2
end