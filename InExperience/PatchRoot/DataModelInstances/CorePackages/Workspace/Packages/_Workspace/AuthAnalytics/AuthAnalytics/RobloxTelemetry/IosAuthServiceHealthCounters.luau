local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("AuthAnalytics").Parent
local Default = require(Parent.LoggingProtocol).default
local TelemetryConfigsModule = require(script.Parent.TelemetryConfigs)
local GetFFlagEnableIosAuthServiceLuaIXPFunction = require(Parent.SharedFlags).GetFFlagEnableIosAuthServiceLuaIXP

local function _(): boolean --[[ Line: 33 | Named "isIos" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService:GetPlatform() == Enum.Platform.IOS
end

local _ = function(Text: string) --[[ Line: 40 | Named "majorMinor" ]]
	if Text == nil or Text == "" then
		return nil
	else
		local Parts = string.split(Text, ".")
		
		return if #Parts == 0 then nil elseif #Parts == 1 then Parts[1] else Parts[1] .. "." .. Parts[2]
	end
end

local function buildCustomFields(Surface, CredentialType, ErrorCode, IosAuthServiceEnabled) --[[ Line: 55 ]]
	-- upvalues: RunService (copy)
	local config = {
		source = "lua",
		surface = Surface,
		iosAuthServiceEnabled = if IosAuthServiceEnabled then "true" else "false"
	}
	
	if CredentialType ~= nil and CredentialType ~= "" then
		config.credentialType = CredentialType
	end
	if ErrorCode ~= nil and ErrorCode ~= "" then
		config.errorCode = ErrorCode
	end
	local RobloxVersion: string = RunService:GetRobloxVersion()
	local RobloxVersion1 = nil
	
	if RobloxVersion == nil or RobloxVersion == "" then
		RobloxVersion1 = nil
	else
		local Parts = string.split(RobloxVersion, ".")
		RobloxVersion1 = if #Parts == 0 then nil elseif #Parts == 1 then Parts[1] else Parts[1] .. "." .. Parts[2]
	end
	if RobloxVersion1 ~= nil and RobloxVersion1 ~= "" then
		config.robloxVersion = RobloxVersion1
	end
	return config
end

local _ = function(p1, Surface, CredentialType, ErrorCode, p2) --[[ Line: 82 | Named "logCounter" ]]
	-- upvalues: GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
	if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
	if UserInputService:GetPlatform() == Enum.Platform.IOS then
		Default:logRobloxTelemetryCounter(p1, 1, (buildCustomFields(Surface, CredentialType, ErrorCode, p2)))
		
		return
	end
end

return {
	reportLoginSuccess = function(p1) --[[ Line: 106 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServiceLoginSuccessConfig = TelemetryConfigsModule.IosAuthServiceLoginSuccessConfig
		local CredentialType = p1.credentialType
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServiceLoginSuccessConfig, 1, (buildCustomFields("login", CredentialType, nil, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportLoginFailure = function(p1) --[[ Line: 116 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServiceLoginFailureConfig = TelemetryConfigsModule.IosAuthServiceLoginFailureConfig
		local CredentialType = p1.credentialType
		local ErrorCode = p1.errorCode
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServiceLoginFailureConfig, 1, (buildCustomFields("login", CredentialType, ErrorCode, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportLoginTwoStepRequired = function(p1) --[[ Line: 128 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServiceLoginTwoStepRequiredConfig = TelemetryConfigsModule.IosAuthServiceLoginTwoStepRequiredConfig
		local CredentialType = p1.credentialType
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServiceLoginTwoStepRequiredConfig, 1, (buildCustomFields("login", CredentialType, nil, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportSignupSuccess = function(p1) --[[ Line: 138 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServiceSignupSuccessConfig = TelemetryConfigsModule.IosAuthServiceSignupSuccessConfig
		local CredentialType = p1.credentialType
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServiceSignupSuccessConfig, 1, (buildCustomFields("signup", CredentialType, nil, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportSignupFailure = function(p1) --[[ Line: 148 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServiceSignupFailureConfig = TelemetryConfigsModule.IosAuthServiceSignupFailureConfig
		local CredentialType = p1.credentialType
		local ErrorCode = p1.errorCode
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServiceSignupFailureConfig, 1, (buildCustomFields("signup", CredentialType, ErrorCode, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportPasswordSaveSuccess = function(p1) --[[ Line: 158 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServicePasswordSaveSuccessConfig = TelemetryConfigsModule.IosAuthServicePasswordSaveSuccessConfig
		local CredentialType = p1.credentialType
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServicePasswordSaveSuccessConfig, 1, (buildCustomFields("passwordSave", CredentialType, nil, IosAuthServiceEnabled)))
			
			return
		end
	end,
	reportPasswordSaveFailure = function(p1) --[[ Line: 168 ]]
		-- upvalues: TelemetryConfigsModule (copy), GetFFlagEnableIosAuthServiceLuaIXPFunction (copy), UserInputService (copy), Default (copy), buildCustomFields (copy)
		local IosAuthServicePasswordSaveFailureConfig = TelemetryConfigsModule.IosAuthServicePasswordSaveFailureConfig
		local CredentialType = p1.credentialType
		local ErrorCode = p1.errorCode
		local IosAuthServiceEnabled = p1.iosAuthServiceEnabled
		
		if not GetFFlagEnableIosAuthServiceLuaIXPFunction() then return end
		if UserInputService:GetPlatform() == Enum.Platform.IOS then
			Default:logRobloxTelemetryCounter(IosAuthServicePasswordSaveFailureConfig, 1, (buildCustomFields("passwordSave", CredentialType, ErrorCode, IosAuthServiceEnabled)))
			
			return
		end
	end
}