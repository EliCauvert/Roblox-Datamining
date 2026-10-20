local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local TModule = require(CorePackages.Packages.t)
local DeviceIntegrityChallengeEventModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.DeviceIntegrityChallengeEvent)
local ChallengeEventConstantsModule = require(Modules.LuaApp.Components.Challenge.ChallengeEventConstants)
local GetFFlagEnableDualNativeCallAppleIntegrityModule = require(Modules.LuaApp.Flags.GetFFlagEnableDualNativeCallAppleIntegrity)
game:DefineFastInt("DeviceIntegrityNativeTimeoutMilliseconds", 450)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.validateProps = TModule.intersection(TModule.interface({
	challengeId = TModule.string,
	challengeMetadata = TModule.string,
	onChallengeCompleted = TModule.callback,
	onChallengeFailed = TModule.callback,
	accountService = TModule.interface({
		DeviceIntegrityAvailable = TModule.callback,
		GetDeviceIntegrityToken = TModule.optional(TModule.callback)
	}),
	loggingProtocol = TModule.interface({ logRobloxTelemetryEvent = TModule.callback })
}))

function ExtendResult.onRetrieveTokenFailure(p1, p2)
	-- upvalues: DeviceIntegrityChallengeEventModule (copy), ChallengeEventConstantsModule (copy), HttpService (copy)
	p1.props.loggingProtocol:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
		context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
		challengeId = p1.props.challengeId,
		integrityType = p2.integrityType
	})
	p1.props.onChallengeCompleted(HttpService:JSONEncode({ redemptionToken = "", integrityType = p2.integrityType }))
end

function ExtendResult.init(p1)
	-- upvalues: HttpService (copy), DeviceIntegrityChallengeEventModule (copy), ChallengeEventConstantsModule (copy), GetFFlagEnableDualNativeCallAppleIntegrityModule (copy)
	local Data = HttpService:JSONDecode(p1.props.challengeMetadata)
	p1.props.loggingProtocol:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
		context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
		challengeId = p1.props.challengeId,
		integrityType = Data.integrityType
	})
	local AccountService = p1.props.accountService
	
	if not AccountService or not AccountService:DeviceIntegrityAvailable() then
		p1:onRetrieveTokenFailure(Data)
		
		return
	end
	local DeviceIntegrityTokenYield = if GetFFlagEnableDualNativeCallAppleIntegrityModule() and Data.integrityType == "appleintegrity" then AccountService:GetDeviceIntegrityTokenYield((HttpService:JSONEncode({ challengeId = p1.props.challengeId }))) else nil
	local DeviceIntegrityTokenYield1 = AccountService:GetDeviceIntegrityTokenYield((HttpService:JSONEncode({
		requestHash = Data.requestHash,
		tokenType = Data.integrityType,
		timeoutMillis = game:GetFastInt("DeviceIntegrityNativeTimeoutMilliseconds")
	})))
	
	if GetFFlagEnableDualNativeCallAppleIntegrityModule() and Data.integrityType == "appleintegrity" then
		if (DeviceIntegrityTokenYield1 == nil or DeviceIntegrityTokenYield1 == "") and (DeviceIntegrityTokenYield == nil or DeviceIntegrityTokenYield == "") then
			p1:onRetrieveTokenFailure(Data)
			
			return
		end
	elseif DeviceIntegrityTokenYield1 == nil or DeviceIntegrityTokenYield1 == "" then
		p1:onRetrieveTokenFailure(Data)
		
		return
	end
	local Data1 = if DeviceIntegrityTokenYield1 ~= nil and DeviceIntegrityTokenYield1 ~= "" then HttpService:JSONDecode(DeviceIntegrityTokenYield1) else { token = "", result = "" }
	
	if GetFFlagEnableDualNativeCallAppleIntegrityModule() and Data.integrityType == "appleintegrity" then
		p1.props.onChallengeCompleted(HttpService:JSONEncode({
			redemptionToken = Data1.token,
			integrityType = Data.integrityType,
			attestationToken = (if DeviceIntegrityTokenYield == nil or DeviceIntegrityTokenYield == "" then { redemptionToken = "" } else HttpService:JSONDecode(DeviceIntegrityTokenYield)).redemptionToken
		}), function()
			-- upvalues: Data (copy), AccountService (copy), HttpService (upval)
			if Data.refreshProvider then
				AccountService:GetDeviceIntegrityTokenYield(HttpService:JSONEncode({ refreshTokenProvider = true }))
			end
		end)
	else
		p1.props.onChallengeCompleted(HttpService:JSONEncode({
			redemptionToken = Data1.token,
			integrityType = Data.integrityType
		}), function()
			-- upvalues: Data (copy), AccountService (copy), HttpService (upval)
			if Data.refreshProvider then
				AccountService:GetDeviceIntegrityTokenYield(HttpService:JSONEncode({ refreshTokenProvider = true }))
			end
		end)
	end
	p1.props.loggingProtocol:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
		context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
		challengeId = p1.props.challengeId,
		integrityType = Data.integrityType,
		result = Data1.result
	})
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y)
	})
end

return (RoactServices.connect({ loggingProtocol = AppLogging })((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, nil)(ExtendResult))))