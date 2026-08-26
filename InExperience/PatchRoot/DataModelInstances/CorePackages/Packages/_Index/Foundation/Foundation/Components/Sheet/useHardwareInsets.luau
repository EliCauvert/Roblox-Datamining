local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local getHardwareSafeAreaInsetsModule = require(script.Parent.getHardwareSafeAreaInsets)

return function(value)
	-- upvalues: reactModule (ref), getHardwareSafeAreaInsetsModule (ref)
	local var1, var2 = reactModule.useState(getHardwareSafeAreaInsetsModule)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), getHardwareSafeAreaInsetsModule (copy)
		local var3 = if value then value:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: var2 (copy), getHardwareSafeAreaInsetsModule (copy)
			var2(function(p1)
				-- upvalues: getHardwareSafeAreaInsetsModule (copy)
				local var4 = getHardwareSafeAreaInsetsModule()
				
				return if var4.bottom == p1.bottom and var4.top == p1.top and (var4.left == p1.left and var4.right == p1.right) then p1 else var4
			end)
		end) else nil
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
			end
		end
	end, { value })
	
	return var1
end