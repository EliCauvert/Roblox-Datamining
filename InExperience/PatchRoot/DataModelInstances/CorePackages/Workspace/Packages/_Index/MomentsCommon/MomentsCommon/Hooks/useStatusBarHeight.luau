local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local ReactModule = require(Parent.React)
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets

local function _()
	-- upvalues: ShouldUseDeviceSafeInsets (copy), UserInputService (copy)
	if ShouldUseDeviceSafeInsets then
		return 0
	else
		local StatusBarSize = UserInputService.StatusBarSize
		
		return if StatusBarSize then StatusBarSize.Y else 0
	end
end

return function()
	-- upvalues: ReactModule (copy), ShouldUseDeviceSafeInsets (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: ShouldUseDeviceSafeInsets (upval), UserInputService (upval)
		if ShouldUseDeviceSafeInsets then
			return 0
		else
			local StatusBarSize = UserInputService.StatusBarSize
			
			return if StatusBarSize then StatusBarSize.Y else 0
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), ShouldUseDeviceSafeInsets (upval), UserInputService (upval)
		local Y = nil
		if ShouldUseDeviceSafeInsets then
			Y = 0
		else
			local StatusBarSize = UserInputService.StatusBarSize
			Y = if StatusBarSize then StatusBarSize.Y else 0
		end
		UseStateResult2(Y)
		local Connection = UserInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), ShouldUseDeviceSafeInsets (upval), UserInputService (upval)
			local Y = nil
			if ShouldUseDeviceSafeInsets then
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