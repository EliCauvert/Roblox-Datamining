local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSupportDeviceSafeInsets = SharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and SharedFlagsModule.FFlagLuaAppSupportDeviceSafeInsets

local function _()
	-- upvalues: FFlagLuaAppSupportDeviceSafeInsets (copy), UserInputService (copy)
	if FFlagLuaAppSupportDeviceSafeInsets then
		return 0
	else
		local StatusBarSize = UserInputService.StatusBarSize
		
		return if StatusBarSize then StatusBarSize.Y else 0
	end
end

return function()
	-- upvalues: ReactModule (copy), FFlagLuaAppSupportDeviceSafeInsets (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: FFlagLuaAppSupportDeviceSafeInsets (upval), UserInputService (upval)
		if FFlagLuaAppSupportDeviceSafeInsets then
			return 0
		else
			local StatusBarSize = UserInputService.StatusBarSize
			
			return if StatusBarSize then StatusBarSize.Y else 0
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), FFlagLuaAppSupportDeviceSafeInsets (upval), UserInputService (upval)
		local Y = nil
		if FFlagLuaAppSupportDeviceSafeInsets then
			Y = 0
		else
			local StatusBarSize = UserInputService.StatusBarSize
			Y = if StatusBarSize then StatusBarSize.Y else 0
		end
		UseStateResult2(Y)
		local Connection = UserInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), FFlagLuaAppSupportDeviceSafeInsets (upval), UserInputService (upval)
			local Y = nil
			if FFlagLuaAppSupportDeviceSafeInsets then
				Y = 0
			else
				local StatusBarSize = UserInputService.StatusBarSize
				Y = if StatusBarSize then StatusBarSize.Y else 0
			end
			UseStateResult2(Y)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end