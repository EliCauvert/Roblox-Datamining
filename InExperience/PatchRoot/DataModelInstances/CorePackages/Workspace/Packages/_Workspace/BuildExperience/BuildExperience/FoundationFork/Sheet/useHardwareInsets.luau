local ReactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)
local GetHardwareSafeAreaInsetsModule = require(script.Parent.getHardwareSafeAreaInsets)

return function(Object) --[[ Line: 7 | Named "useHardwareInsets" ]]
	-- upvalues: ReactModule (copy), GetHardwareSafeAreaInsetsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GetHardwareSafeAreaInsetsModule)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: Object (copy), UseStateResult2 (copy), GetHardwareSafeAreaInsetsModule (upval)
		local Connection = if Object then Object:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 14 ]]
			-- upvalues: UseStateResult2 (upval), GetHardwareSafeAreaInsetsModule (upval)
			UseStateResult2(function(p1) --[[ Line: 15 ]]
				-- upvalues: GetHardwareSafeAreaInsetsModule (upval)
				local HardwareSafeAreaInsetsModule = GetHardwareSafeAreaInsetsModule()
				
				return if HardwareSafeAreaInsetsModule.bottom == p1.bottom and HardwareSafeAreaInsetsModule.top == p1.top and HardwareSafeAreaInsetsModule.left == p1.left and HardwareSafeAreaInsetsModule.right == p1.right then p1 else HardwareSafeAreaInsetsModule
			end)
		end) else nil
		
		return function() --[[ Line: 31 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { Object })
	
	return UseStateResult
end