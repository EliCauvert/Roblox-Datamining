local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local HardwareSafeAreaInsetsModule = require(MomentsCommon.Utils.HardwareSafeAreaInsets)

return function()
	-- upvalues: ReactModule (copy), HardwareSafeAreaInsetsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(HardwareSafeAreaInsetsModule.deviceInsets())
	ReactModule.useLayoutEffect(function()
		-- upvalues: HardwareSafeAreaInsetsModule (upval), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = HardwareSafeAreaInsetsModule:connect(UseStateResult2)
		
		if HardwareSafeAreaInsetsModule.diffInsets(UseStateResult, HardwareSafeAreaInsetsModule.deviceInsets()) then
			UseStateResult2(HardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function()
			-- upvalues: Connection (copy)
			Connection.disconnect()
		end
	end, {})
	
	return UseStateResult
end