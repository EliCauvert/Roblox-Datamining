local PreHomePage = script:FindFirstAncestor("PreHomePage")
local HttpService = game:GetService("HttpService")
local Parent = PreHomePage.Parent
local PasskeyCheckFunction = require(Parent.PasskeyUpsell).Utils.PasskeyCheck
local Logger = require(Parent.Loggers).Logger
local SharedFlagsModule = require(Parent.SharedFlags)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local PromiseModule = require(Parent.Promise)
local Default = require(Parent.LoggingProtocol).default
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local UserJustLoggedInFunction = require(PreHomePage.Common).Checks.userJustLoggedIn
local FFlagPasskeySilentUpgradeEnabled = SharedFlagsModule.FFlagPasskeySilentUpgradeEnabled
local FFlagEnableSilentUpgradeOnSignUp = SharedFlagsModule.FFlagEnableSilentUpgradeOnSignUp
local Default1 = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local RegisterPasskeyFunction = require(Parent.AuthCommon).Thunks.RegisterPasskey
local SilentUpgradeReauthDelaySeconds = game:DefineFastInt("SilentUpgradeReauthDelaySeconds", 4)
local FFlagEmitPasskeyRegistrationSourceOnFinish = SharedFlagsModule.FFlagEmitPasskeyRegistrationSourceOnFinish
local SilentUpgradeOnSignupIXPBypass = game:DefineFastFlag("SilentUpgradeOnSignupIXPBypass", false)

local function getShouldUseSilentPasskeyUpgrade(Source)
	-- upvalues: FFlagEnableSilentUpgradeOnSignUp (copy), LaunchContext (copy), IXPServiceWrapper (copy), AppBtidLayers (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), SilentUpgradeOnSignupIXPBypass (copy)
	if not FFlagEnableSilentUpgradeOnSignUp or Source ~= LaunchContext.SignUp then
		return Source == LaunchContext.Login and IXPServiceWrapper:GetBTIDLayerData(AppBtidLayers.LoginLayer).shouldUseSilentPasskeyUpgrade
	end
	local BTIDLayerData = IXPServiceWrapper:GetBTIDLayerData(AppBtidLayers.SignupLayer)
	
	if BTIDLayerData and BTIDLayerData.shouldUseSilentPasskeyUpgradeForSignup ~= nil then
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.SignupLayerExposure)
	end
	return SilentUpgradeOnSignupIXPBypass or BTIDLayerData and BTIDLayerData.shouldUseSilentPasskeyUpgradeForSignup
end

local function checkDeviceSupportsSilentPasskeyUpgrade(Source)
	-- upvalues: FFlagEnableSilentUpgradeOnSignUp (copy), Default1 (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), Default (copy), TelemetryConfigs (copy), PromiseModule (copy), Logger (copy)
	local Config = if FFlagEnableSilentUpgradeOnSignUp then { source = Source } else nil
	
	return Default1:isAvailable(Default1.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
		-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval), Default (upval), TelemetryConfigs (upval), Config (copy), PromiseModule (upval)
		if Result and not Result.FIDO2 then
			AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByNoPasskeySupport)
		end
		if Result and Result.FIDO2 and not Result.FIDO2.supportsSilentPasskeyUpgrade then
			AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByNoSilentUpgradeSupport)
		end
		local SupportsSilentPasskeyUpgrade = Result and (Result.FIDO2 and Result.FIDO2.supportsSilentPasskeyUpgrade)
		
		if SupportsSilentPasskeyUpgrade then
			Default:logRobloxTelemetryCounter(TelemetryConfigs.SilentPasskeyUpgradeAvailableConfig, 1, Config)
		end
		return PromiseModule.resolve(SupportsSilentPasskeyUpgrade)
	end):catch(function(Err)
		-- upvalues: Logger (upval), PromiseModule (upval)
		Logger:warning("Failed to check device availability for silent upgrade: " .. tostring(Err))
		
		return PromiseModule.resolve(false)
	end)
end

local function performSilentPasskeyUpgrade(p1, Source)
	-- upvalues: FFlagEnableSilentUpgradeOnSignUp (copy), RegisterPasskeyFunction (copy), Default (copy), TelemetryConfigs (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), FFlagEmitPasskeyRegistrationSourceOnFinish (copy), AuthMsgShownFunction (copy), PromiseModule (copy), HttpService (copy), Logger (copy), AuthClientErrorFunction (copy)
	local Config = if FFlagEnableSilentUpgradeOnSignUp then { source = Source } else nil
	
	return RegisterPasskeyFunction(p1, "passkeySilentUpgrade", true):andThen(function()
		-- upvalues: Default (upval), TelemetryConfigs (upval), Config (copy), AuthPageloadFunction (upval), EventStreamConstants (upval), FFlagEmitPasskeyRegistrationSourceOnFinish (upval), AuthMsgShownFunction (upval)
		Default:logRobloxTelemetryCounter(TelemetryConfigs.SilentPasskeyUpgradeSuccessConfig, 1, Config)
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.UpgradeSuccess)
		
		if FFlagEmitPasskeyRegistrationSourceOnFinish then
			AuthMsgShownFunction(EventStreamConstants.Context.PasskeyCreationSource, EventStreamConstants.State.FinishRegistration, "passkeySilentUpgrade")
		end
	end, function(p2)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p2)
	end):catch(function(Err)
		-- upvalues: HttpService (upval), Logger (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), Default (upval), TelemetryConfigs (upval), Config (copy), AuthPageloadFunction (upval), PromiseModule (upval)
		local Json = HttpService:JSONEncode(Err)
		Logger:warning("Silent passkey upgrade failed: " .. Json)
		AuthClientErrorFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, Json)
		Default:logRobloxTelemetryCounter(TelemetryConfigs.SilentPasskeyUpgradeFailureConfig, 1, Config)
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.UpgradeFailure)
		
		return PromiseModule.resolve()
	end)
end

local function attemptSilentPasskeyUpgrade(p1, p2, Source)
	-- upvalues: FFlagPasskeySilentUpgradeEnabled (copy), getShouldUseSilentPasskeyUpgrade (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), LinkingProtocol (copy), Logger (copy), FFlagEnableSilentUpgradeOnSignUp (copy), UserJustLoggedInFunction (copy), Default (copy), TelemetryConfigs (copy), checkDeviceSupportsSilentPasskeyUpgrade (copy), PasskeyCheckFunction (copy), PromiseModule (copy), SilentUpgradeReauthDelaySeconds (copy), performSilentPasskeyUpgrade (copy), HttpService (copy), AuthClientErrorFunction (copy)
	if not FFlagPasskeySilentUpgradeEnabled then return end
	if not getShouldUseSilentPasskeyUpgrade(Source) then
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByIXP)
		
		return
	end
	if LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= "" then
		Logger:info("Skipping passkey silent upgrade due to deep link")
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByDeepLink)
		
		return
	end
	if FFlagEnableSilentUpgradeOnSignUp or UserJustLoggedInFunction(p2) then
		local Config = if FFlagEnableSilentUpgradeOnSignUp then { source = Source } else nil
		Default:logRobloxTelemetryCounter(TelemetryConfigs.SilentPasskeyUpgradeAttemptedConfig, 1, Config)
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.UpgradeAttempted)
		checkDeviceSupportsSilentPasskeyUpgrade(Source):andThen(function(Result)
			-- upvalues: Logger (upval), PasskeyCheckFunction (upval), p1 (copy), AuthPageloadFunction (upval), EventStreamConstants (upval), Default (upval), TelemetryConfigs (upval), Config (copy), PromiseModule (upval), SilentUpgradeReauthDelaySeconds (upval), performSilentPasskeyUpgrade (upval), Source (copy)
			if Result then
				return PasskeyCheckFunction(p1):andThen(function(Result)
					-- upvalues: Logger (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), Default (upval), TelemetryConfigs (upval), Config (upval), PromiseModule (upval), SilentUpgradeReauthDelaySeconds (upval), performSilentPasskeyUpgrade (upval), p1 (upval), Source (upval)
					if Result then
						Logger:info("User already has a passkey, skipping silent upgrade")
						AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByExistingPasskey)
						
						return
					else
						Default:logRobloxTelemetryCounter(TelemetryConfigs.SilentPasskeyUpgradeNoPasskeyConfig, 1, Config)
						
						return PromiseModule.delay(SilentUpgradeReauthDelaySeconds):andThen(function()
							-- upvalues: performSilentPasskeyUpgrade (upval), p1 (upval), Source (upval)
							return performSilentPasskeyUpgrade(p1, Source)
						end)
					end
				end)
			else
				Logger:info("Device does not support silent upgrade, skipping")
			end
		end):catch(function(Err)
			-- upvalues: HttpService (upval), Logger (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), PromiseModule (upval)
			local Json = HttpService:JSONEncode(Err)
			Logger:warning("Silent passkey upgrade failed: " .. Json)
			AuthClientErrorFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, Json)
			
			return PromiseModule.resolve()
		end)
		
		return
	else
		Logger:info("Skipping passkey silent upgrade due to cached login")
		AuthPageloadFunction(EventStreamConstants.Context.HandleSilentPasskeyUpgrade, EventStreamConstants.State.FilteredByCachedLogin)
	end
end

return function(p1, p2, p3)
	-- upvalues: attemptSilentPasskeyUpgrade (copy), LaunchContext (copy)
	attemptSilentPasskeyUpgrade(p1, p2, p3 or LaunchContext.Login)
end