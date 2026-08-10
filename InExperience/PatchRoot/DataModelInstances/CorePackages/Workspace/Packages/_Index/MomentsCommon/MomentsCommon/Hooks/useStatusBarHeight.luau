local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("MomentsCommon").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSupportDeviceSafeInsets = sharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and sharedFlagsModule.FFlagLuaAppSupportDeviceSafeInsets

local function _() --[[ line: 39 | named "readStatusBarHeight" ]]
	-- upvalues: fFlagLuaAppSupportDeviceSafeInsets (ref), userInputService (ref)
	if fFlagLuaAppSupportDeviceSafeInsets then
		return 0
	end
	local statusBarSize = userInputService.StatusBarSize
	
	return if statusBarSize then statusBarSize.Y else 0
end

return function() --[[ line: 47 ]]
	-- upvalues: reactModule (ref), fFlagLuaAppSupportDeviceSafeInsets (ref), userInputService (ref)
	local var4, var5 = reactModule.useState(function() --[[ line: 48 ]]
		-- upvalues: fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
		if fFlagLuaAppSupportDeviceSafeInsets then
			return 0
		end
		local statusBarSize = userInputService.StatusBarSize
		
		return if statusBarSize then statusBarSize.Y else 0
	end)
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var5 (ref), fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
		local var6
		if fFlagLuaAppSupportDeviceSafeInsets then
			var6 = 0
		else
			local statusBarSize = userInputService.StatusBarSize
			var6 = if statusBarSize then statusBarSize.Y else 0
		end
		var5(var6)
		local var7 = userInputService:GetPropertyChangedSignal("StatusBarSize"):Connect(function() --[[ line: 57 ]]
			-- upvalues: var5 (copy), fFlagLuaAppSupportDeviceSafeInsets (copy), userInputService (copy)
			local var8
			if fFlagLuaAppSupportDeviceSafeInsets then
				var8 = 0
			else
				local statusBarSize = userInputService.StatusBarSize
				var8 = if statusBarSize then statusBarSize.Y else 0
			end
			var5(var8)
		end)
		
		return function() --[[ line: 61 ]]
			-- upvalues: var7 (ref)
			var7:Disconnect()
		end
	end, {})
	
	return var4
end