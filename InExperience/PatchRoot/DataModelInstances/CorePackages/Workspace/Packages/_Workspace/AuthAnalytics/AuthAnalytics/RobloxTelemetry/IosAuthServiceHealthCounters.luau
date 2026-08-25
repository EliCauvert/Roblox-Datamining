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

local function buildCustomFields(p0, p1, p2, p3)
	-- upvalues: runService (ref)
	local t = {
		source = "lua",
		surface = p0,
		iosAuthServiceEnabled = if p3 then "true" else "false"
	}
	
	if p1 ~= nil and p1 ~= "" then
		t.credentialType = p1
	end
	if p2 ~= nil and p2 ~= "" then
		t.errorCode = p2
	end
	local var8
	local robloxVersion = runService:GetRobloxVersion()
	
	if robloxVersion == nil or robloxVersion == "" then
		var8 = nil
	else
		local parts = string.split(robloxVersion, ".")
		var8 = if #parts == 0 then nil elseif #parts == 1 then parts[1] else parts[1] .. "." .. parts[2]
	end
	if var8 ~= nil and var8 ~= "" then
		t.robloxVersion = var8
	end
	return t
end

local _ = function(p4, p5, p6, p7, p8)
	-- upvalues: getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
	if not getFFlagEnableIosAuthServiceLuaIXP() then return end
	if userInputService:GetPlatform() == Enum.Platform.IOS then
		default:logRobloxTelemetryCounter(p4, 1, buildCustomFields(p5, p6, p7, p8))
		
		return
	end
end

return {
	reportLoginSuccess = function(p9)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginSuccessConfig = telemetryConfigsModule.IosAuthServiceLoginSuccessConfig
		local credentialType = p9.credentialType
		local iosAuthServiceEnabled = p9.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceLoginSuccessConfig, 1, buildCustomFields("login", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportLoginFailure = function(p10)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginFailureConfig = telemetryConfigsModule.IosAuthServiceLoginFailureConfig
		local credentialType = p10.credentialType
		local errorCode = p10.errorCode
		local iosAuthServiceEnabled = p10.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServiceLoginFailureConfig, 1, buildCustomFields("login", credentialType, errorCode, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportLoginTwoStepRequired = function(p11)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServiceLoginTwoStepRequiredConfig = telemetryConfigsModule.IosAuthServiceLoginTwoStepRequiredConfig
		local credentialType = p11.credentialType
		local iosAuthServiceEnabled = p11.iosAuthServiceEnabled
		
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
	reportPasswordSaveSuccess = function(p12)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServicePasswordSaveSuccessConfig = telemetryConfigsModule.IosAuthServicePasswordSaveSuccessConfig
		local credentialType = p12.credentialType
		local iosAuthServiceEnabled = p12.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServicePasswordSaveSuccessConfig, 1, buildCustomFields("passwordSave", credentialType, nil, iosAuthServiceEnabled))
			
			return
		end
	end,
	reportPasswordSaveFailure = function(p13)
		-- upvalues: telemetryConfigsModule (ref), getFFlagEnableIosAuthServiceLuaIXP (ref), userInputService (ref), default (ref), buildCustomFields (ref)
		local iosAuthServicePasswordSaveFailureConfig = telemetryConfigsModule.IosAuthServicePasswordSaveFailureConfig
		local credentialType = p13.credentialType
		local errorCode = p13.errorCode
		local iosAuthServiceEnabled = p13.iosAuthServiceEnabled
		
		if not getFFlagEnableIosAuthServiceLuaIXP() then return end
		if userInputService:GetPlatform() == Enum.Platform.IOS then
			default:logRobloxTelemetryCounter(iosAuthServicePasswordSaveFailureConfig, 1, buildCustomFields("passwordSave", credentialType, errorCode, iosAuthServiceEnabled))
			
			return
		end
	end
}