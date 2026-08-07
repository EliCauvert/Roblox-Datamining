local reactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)
local getHardwareSafeAreaInsetsModule = require(script.Parent.getHardwareSafeAreaInsets)

return function(value) --[[ line: 7 | named "useHardwareInsets" ]]
	-- upvalues: reactModule (ref), getHardwareSafeAreaInsetsModule (ref)
	local var2, var3 = reactModule.useState(getHardwareSafeAreaInsetsModule)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: value (ref), var3 (ref), getHardwareSafeAreaInsetsModule (copy)
		local var4 = if value then value:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 14 ]]
			-- upvalues: var3 (copy), getHardwareSafeAreaInsetsModule (copy)
			var3(function(p0) --[[ line: 15 ]]
				-- upvalues: getHardwareSafeAreaInsetsModule (copy)
				local var5 = getHardwareSafeAreaInsetsModule()
				
				return if var5.bottom == p0.bottom and var5.top == p0.top and (var5.left == p0.left and var5.right == p0.right) then p0 else var5
			end)
		end) else nil
		
		return function() --[[ line: 31 ]]
			-- upvalues: var4 (write)
			if var4 then
				var4:Disconnect()
			end
		end
	end, { value })
	
	return var2
end