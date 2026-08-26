local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("MomentsCommon").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSupportDeviceSafeInsets = sharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and sharedFlagsModule.FFlagLuaAppSupportDeviceSafeInsets

local function _()
	-- upvalues: fFlagLuaAppSupportDeviceSafeInsets (ref), userInputService (ref)
	if fFlagLuaAppSupportDeviceSafeInsets then
		return 0
	end
	local statusBarSize = userInputService.StatusBarSize
	
	return if statusBarSize then statusBarSize.Y else 0
end

return function()
	-- upvalues: reactModule (ref), fFlagLuaAppSupportDeviceSafeInsets (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
		if fFlagLuaAppSupportDeviceSafeInsets then
			return 0
		end
		local statusBarSize = userInputService.StatusBarSize
		
		return if statusBarSize then statusBarSize.Y else 0
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
		local var3
		if fFlagLuaAppSupportDeviceSafeInsets then
			var3 = 0
		else
			local statusBarSize = userInputService.StatusBarSize
			var3 = if statusBarSize then statusBarSize.Y else 0
		end
		var2(var3)
		local var4 = userInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(function()
			-- upvalues: var2 (copy), fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
			local var5
			if fFlagLuaAppSupportDeviceSafeInsets then
				var5 = 0
			else
				local statusBarSize = userInputService.StatusBarSize
				var5 = if statusBarSize then statusBarSize.Y else 0
			end
			var2(var5)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var1
end