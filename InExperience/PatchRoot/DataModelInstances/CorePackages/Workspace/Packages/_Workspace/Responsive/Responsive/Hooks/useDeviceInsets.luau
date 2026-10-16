local ReactModule = require(script:FindFirstAncestor("Responsive").Parent.React)
local HardwareSafeAreaInsetsModule = require(script.Parent.Parent.HardwareSafeAreaInsets)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy), HardwareSafeAreaInsetsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(HardwareSafeAreaInsetsModule.deviceInsets())
	ReactModule.useLayoutEffect(function() --[[ Line: 8 ]]
		-- upvalues: HardwareSafeAreaInsetsModule (upval), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = HardwareSafeAreaInsetsModule:connect(UseStateResult2)
		
		if HardwareSafeAreaInsetsModule.diffInsets(UseStateResult, HardwareSafeAreaInsetsModule.deviceInsets()) then
			UseStateResult2(HardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function() --[[ Line: 13 ]]
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {})
	
	return UseStateResult
end