local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local HardwareSafeAreaInsetsModule = require(MomentsCommon.Utils.HardwareSafeAreaInsets)

return function() --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), HardwareSafeAreaInsetsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(HardwareSafeAreaInsetsModule.deviceInsets())
	ReactModule.useLayoutEffect(function() --[[ Line: 10 ]]
		-- upvalues: HardwareSafeAreaInsetsModule (upval), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = HardwareSafeAreaInsetsModule:connect(UseStateResult2)
		
		if HardwareSafeAreaInsetsModule.diffInsets(UseStateResult, HardwareSafeAreaInsetsModule.deviceInsets()) then
			UseStateResult2(HardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function() --[[ Line: 15 ]]
			-- upvalues: Connection (copy)
			Connection.disconnect()
		end
	end, {})
	
	return UseStateResult
end