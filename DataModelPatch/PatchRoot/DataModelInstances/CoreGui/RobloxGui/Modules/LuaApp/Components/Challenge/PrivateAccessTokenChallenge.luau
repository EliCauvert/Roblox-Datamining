local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local TModule = require(CorePackages.Packages.t)
local PrivateAccessTokenChallengeEventModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.PrivateAccessTokenChallengeEvent)
local ChallengeEventConstantsModule = require(Modules.LuaApp.Components.Challenge.ChallengeEventConstants)
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

function ExtendResult.init(p1)
	-- upvalues: PrivateAccessTokenChallengeEventModule (copy), ChallengeEventConstantsModule (copy), HttpService (copy)
	p1.props.loggingProtocol:logRobloxTelemetryEvent(PrivateAccessTokenChallengeEventModule, {}, {
		context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
		challengeId = p1.props.challengeId
	})
	local AccountService = p1.props.accountService
	
	if not AccountService or not AccountService:DeviceIntegrityAvailable() then
		p1:onRetrieveTokenFailure()
		
		return
	end
	local DeviceIntegrityTokenYield = AccountService:GetDeviceIntegrityTokenYield((HttpService:JSONEncode({ challengeId = p1.props.challengeId })))
	
	if DeviceIntegrityTokenYield == nil or DeviceIntegrityTokenYield == "" then
		p1:onRetrieveTokenFailure()
		
		return
	end
	local Data = HttpService:JSONDecode(DeviceIntegrityTokenYield)
	
	if Data.errorCode == nil then
		p1.props.onChallengeCompleted(HttpService:JSONEncode({ redemptionToken = Data.redemptionToken }))
		p1.props.loggingProtocol:logRobloxTelemetryEvent(PrivateAccessTokenChallengeEventModule, {}, {
			context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p1.props.challengeId
		})
		
		return
	else
		p1:onRetrieveTokenFailure()
	end
end

function ExtendResult.onRetrieveTokenFailure(p1)
	-- upvalues: PrivateAccessTokenChallengeEventModule (copy), ChallengeEventConstantsModule (copy), HttpService (copy)
	p1.props.loggingProtocol:logRobloxTelemetryEvent(PrivateAccessTokenChallengeEventModule, {}, {
		context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
		challengeId = p1.props.challengeId
	})
	p1.props.onChallengeCompleted(HttpService:JSONEncode({ redemptionToken = "" }))
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