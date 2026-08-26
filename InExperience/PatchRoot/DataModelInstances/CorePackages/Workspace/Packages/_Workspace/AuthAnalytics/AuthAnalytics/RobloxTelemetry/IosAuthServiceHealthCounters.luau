local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AuthAnalytics").Parent
local default = require(parent.LoggingProtocol).default
local telemetryConfigsModule = require(script.Parent.TelemetryConfigs)
local getFFlagEnableIosAuthServiceLuaIXP = require(parent.SharedFlags).GetFFlagEnableIosAuthServiceLuaIXP

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetPlatform() == Enum.Platform.IOS
end

local _ = function(a)
	if a == nil or a == "" then
		return nil
	end
	local parts = string.split(a, ".")
	
	return if #parts == 0 then nil elseif #parts == 1 then parts[1] else parts[1] .. "." .. parts[2]
end

local function buildCustomFields(p1, p2, p3, p4)
	-- upvalues: runService (ref)
	local t = {
		source = "lua",
		surface = p1,
		iosAuthServiceEnabled = if p4 then "true" else "false"
	}
	
	if p2 ~= nil and p2 ~= "" then
		t.credentialType = p2
	end
	if p3 ~= nil and p3 ~= "" then
		t.errorCode = p3
	end
	local var1
	local robloxVersion = runService:GetRobloxVersion()
	
	if robloxVersion == nil or robloxVersion == "" then
		var1 = nil
	else
		local parts = string.split(robloxVersion, ".")
		var1 = if #parts == 0 then nil elseif #parts == 1 then parts[1] else parts[1] .. "." .. parts[2]
	end
	if var1 ~= nil and var1 ~= "" then
		t.robloxVersion = var1
	end
	return t
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
	if not getFFlagEnableIosAuthServiceLuaIXP() then return end
	if userInputService:GetPlatform() == Enum.Platform.IOS then
		default:logRobloxTelemetryCounter(p1, 1, buildCustomFields(p2, p3, p4, p5))
		
		return
	end
end

return {
	reportLoginSuccess = function(p1)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginSuccessConfig = telemetryConfigsModule.IosAuthServiceLoginSuccessConfig
		local credentialType = p1.credentialType
		local iosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceLoginSuccessConfig, 1, buildCustomFields("login", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportLoginFailure = function(p1)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginFailureConfig = telemetryConfigsModule.IosAuthServiceLoginFailureConfig
		local credentialType = p1.credentialType
		local errorCode = p1.errorCode
		local iosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceLoginFailureConfig, 1, buildCustomFields("login", credentialType, errorCode, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportLoginTwoStepRequired = function(p1)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginTwoStepRequiredConfig = telemetryConfigsModule.IosAuthServiceLoginTwoStepRequiredConfig
		local credentialType = p1.credentialType
		local iosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceLoginTwoStepRequiredConfig, 1, buildCustomFields("login", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportSignupSuccess = function(value)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceSignupSuccessConfig = telemetryConfigsModule.IosAuthServiceSignupSuccessConfig
		local credentialType = value.credentialType
		local iosAuthServiceEnabled = value.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceSignupSuccessConfig, 1, buildCustomFields("signup", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportSignupFailure = function(value)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceSignupFailureConfig = telemetryConfigsModule.IosAuthServiceSignupFailureConfig
		local credentialType = value.credentialType
		local errorCode = value.errorCode
		local iosAuthServiceEnabled = value.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceSignupFailureConfig, 1, buildCustomFields("signup", credentialType, errorCode, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportPasswordSaveSuccess = function(p1)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServicePasswordSaveSuccessConfig = telemetryConfigsModule.IosAuthServicePasswordSaveSuccessConfig
		local credentialType = p1.credentialType
		local iosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServicePasswordSaveSuccessConfig, 1, buildCustomFields("passwordSave", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportPasswordSaveFailure = function(p1)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServicePasswordSaveFailureConfig = telemetryConfigsModule.IosAuthServicePasswordSaveFailureConfig
		local credentialType = p1.credentialType
		local errorCode = p1.errorCode
		local iosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServicePasswordSaveFailureConfig, 1, buildCustomFields("passwordSave", credentialType, errorCode, iosAuthServiceEnabled))
			
			return
		end
	end
}