local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactModule = require(Modules.Common.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local GenericTypeModule = require(Modules.LuaApp.Enum.Challenge.GenericType)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local UrlBaseModule = require(Modules.LuaApp.Http.UrlBase)
local PromiseModule = require(Modules.LuaApp.Promise)
local ChallengeNativeWrapperEventModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.ChallengeNativeWrapperEvent)
local DeviceIntegrityTokenChallengeModule = require(Modules.LuaApp.Components.Challenge.DeviceIntegrityTokenChallenge)
local DeviceAccessTokenChallengeModule = require(Modules.LuaApp.Components.Challenge.DeviceAccessTokenChallenge)
local PrivateAccessTokenChallengeModule = require(Modules.LuaApp.Components.Challenge.PrivateAccessTokenChallenge)
local BiometricChallengeModule = require(Modules.LuaApp.Components.Challenge.BiometricChallenge)
local GetFFlagLuaAppChallengeMoreTelemetryEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled)
local GetFFlagEnableNativeToWebviewMiddlewareModule = require(Modules.LuaApp.Flags.GetFFlagEnableNativeToWebviewMiddleware)
local GetFFlagLuaAppSupportOnChallengeContinuedModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppSupportOnChallengeContinued)
local AccountService = nil
pcall(function()
	-- upvalues: AccountService (ref)
	AccountService = game:GetService("AccountService")
end)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = { accountService = AccountService }
local NewUrlBuilder = UrlBuilderModule.new({
	path = "challenge/v1/continue",
	base = UrlBaseModule.APIS
})

function canRenderNativeChallenge(Biometric, _): boolean
	-- upvalues: GenericTypeModule (copy)
	return Biometric == GenericTypeModule.DeviceIntegrity or (Biometric == GenericTypeModule.DeviceAccessToken or (Biometric == GenericTypeModule.PrivateAccessToken or Biometric == GenericTypeModule.Biometric))
end

function ExtendResult.init(p1)
	p1:validateChallengeAndSetState(p1.props.challengeType, p1.props.challengeMetadata)
end

function ExtendResult.render(p1)
	-- upvalues: GenericTypeModule (copy), RoactModule (copy), DeviceIntegrityTokenChallengeModule (copy), DeviceAccessTokenChallengeModule (copy), PrivateAccessTokenChallengeModule (copy), BiometricChallengeModule (copy)
	local ChallengeType = p1.state.challengeType
	local ChallengeMetadata = p1.state.challengeMetadata
	
	return if ChallengeType == GenericTypeModule.DeviceIntegrity then RoactModule.createElement(DeviceIntegrityTokenChallengeModule, {
		challengeId = p1.props.challengeId,
		challengeMetadata = ChallengeMetadata,
		onChallengeCompleted = function(ChallengeMetadata, p2)
			-- upvalues: p1 (copy)
			p1:challengeContinue(ChallengeMetadata, p2)
		end,
		onChallengeFailed = function(p2)
			-- upvalues: p1 (copy)
			p1:failSession(p2)
		end,
		accountService = p1.props.accountService
	}) elseif ChallengeType == GenericTypeModule.DeviceAccessToken then RoactModule.createElement(DeviceAccessTokenChallengeModule, {
		challengeId = p1.props.challengeId,
		challengeMetadata = ChallengeMetadata,
		onChallengeCompleted = function(ChallengeMetadata)
			-- upvalues: p1 (copy)
			p1:challengeContinue(ChallengeMetadata)
		end,
		onChallengeFailed = function(p2)
			-- upvalues: p1 (copy)
			p1:failSession(p2)
		end,
		accountService = p1.props.accountService
	}) elseif ChallengeType == GenericTypeModule.PrivateAccessToken then RoactModule.createElement(PrivateAccessTokenChallengeModule, {
		challengeId = p1.props.challengeId,
		challengeMetadata = ChallengeMetadata,
		onChallengeCompleted = function(ChallengeMetadata)
			-- upvalues: p1 (copy)
			p1:challengeContinue(ChallengeMetadata)
		end,
		onChallengeFailed = function(p2)
			-- upvalues: p1 (copy)
			p1:failSession(p2)
		end,
		accountService = p1.props.accountService
	}) elseif ChallengeType == GenericTypeModule.Biometric then RoactModule.createElement(BiometricChallengeModule, {
		challengeId = p1.props.challengeId,
		challengeMetadata = ChallengeMetadata,
		onChallengeCompleted = function(ChallengeMetadata, p2)
			-- upvalues: p1 (copy)
			p1:challengeContinue(ChallengeMetadata, p2)
		end,
		onChallengeAbandoned = function(p2)
			-- upvalues: p1 (copy)
			p1:abandonSession(p2)
		end,
		onChallengeFailed = function(p2)
			-- upvalues: p1 (copy)
			p1:failSession(p2)
		end
	}) else nil
end

function ExtendResult.clearState(p1)
	p1.props.navigation.goBack()
end

function ExtendResult.failSession(p1, p2)
	p1.props.onSessionFailed(p2)
	p1:clearState()
end

function ExtendResult.abandonSession(p1, p2)
	p1.props.onSessionAbandoned(p2)
	p1:clearState()
end

function ExtendResult.validateChallengeAndSetState(p1, ChallengeType, ChallengeMetadata)
	-- upvalues: GenericTypeModule (copy), GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (copy), ChallengeNativeWrapperEventModule (copy), GetFFlagEnableNativeToWebviewMiddlewareModule (copy)
	local RawValue = GenericTypeModule.toRawValue(ChallengeType)
	
	if ChallengeType == nil or ChallengeType == GenericTypeModule.Denied or ChallengeMetadata == nil or ChallengeMetadata == "" then
		if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
			p1.props.loggingProtocol:logRobloxTelemetryEvent(ChallengeNativeWrapperEventModule, {}, {
				context = "renderFailure",
				challengeId = p1.props.challengeId,
				challengeType = RawValue,
				challengeMetadata = ChallengeMetadata
			})
		end
		p1:failSession()
		
		return
	elseif canRenderNativeChallenge(ChallengeType, ChallengeMetadata) then
		if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
			p1.props.loggingProtocol:logRobloxTelemetryEvent(ChallengeNativeWrapperEventModule, {}, {
				context = "challengeTriggered",
				challengeId = p1.props.challengeId,
				challengeType = RawValue,
				challengeMetadata = ChallengeMetadata
			})
		end
		p1:setState({
			challengeType = ChallengeType,
			challengeMetadata = ChallengeMetadata
		})
		
		return
	elseif GetFFlagEnableNativeToWebviewMiddlewareModule() then
		if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
			p1.props.loggingProtocol:logRobloxTelemetryEvent(ChallengeNativeWrapperEventModule, {}, {
				context = "webviewChallengeTriggered",
				challengeId = p1.props.challengeId,
				challengeType = RawValue,
				challengeMetadata = ChallengeMetadata
			})
		end
		p1:clearState()
		p1.props.onWebViewChallengeIssued(RawValue, ChallengeMetadata)
		
		return
	else
		if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
			p1.props.loggingProtocol:logRobloxTelemetryEvent(ChallengeNativeWrapperEventModule, {}, {
				context = "renderFailure",
				challengeId = p1.props.challengeId,
				challengeType = RawValue,
				challengeMetadata = ChallengeMetadata
			})
		end
		p1:failSession()
	end
end

function ExtendResult.challengeContinue(p1, ChallengeMetadata, Callback)
	-- upvalues: GenericTypeModule (copy), PromiseModule (copy), HttpService (copy), NewUrlBuilder (copy), GetFFlagLuaAppSupportOnChallengeContinuedModule (copy), GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (copy), ChallengeNativeWrapperEventModule (copy)
	local RawValue = GenericTypeModule.toRawValue(p1.state.challengeType)
	
	return PromiseModule.new(function(Callback1, _)
		-- upvalues: HttpService (upval), p1 (copy), RawValue (copy), ChallengeMetadata (copy), NewUrlBuilder (upval), GetFFlagLuaAppSupportOnChallengeContinuedModule (upval), Callback (copy), GenericTypeModule (upval), GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (upval), ChallengeNativeWrapperEventModule (upval)
		local POST, _ = p1.props.networkImpl(NewUrlBuilder(), "POST", {
			postBody = HttpService:JSONEncode({
				challengeId = p1.props.challengeId,
				challengeType = RawValue,
				challengeMetadata = ChallengeMetadata
			})
		})
		
		return POST:andThen(function(Result)
			-- upvalues: GetFFlagLuaAppSupportOnChallengeContinuedModule (upval), Callback (upval), GenericTypeModule (upval), p1 (upval), Callback1 (copy)
			if GetFFlagLuaAppSupportOnChallengeContinuedModule() and Callback ~= nil then
				Callback()
			end
			local ResponseBody = Result.responseBody
			
			if ResponseBody.challengeType == nil or ResponseBody.challengeType == "" then
				p1.props.onSessionCompleted()
				p1:clearState()
				Callback1()
				
				return
			else
				p1:validateChallengeAndSetState(GenericTypeModule.fromRawValue(ResponseBody.challengeType), ResponseBody.challengeMetadata)
				Callback1()
			end
		end, function(p2)
			-- upvalues: GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (upval), p1 (upval), ChallengeNativeWrapperEventModule (upval), RawValue (upval), ChallengeMetadata (upval), Callback1 (copy)
			if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
				p1.props.loggingProtocol:logRobloxTelemetryEvent(ChallengeNativeWrapperEventModule, {}, {
					context = "continueFailure",
					challengeId = p1.props.challengeId,
					challengeType = RawValue,
					challengeMetadata = ChallengeMetadata,
					error = tostring(p2.StatusCode)
				})
			end
			p1:failSession(p2)
			Callback1()
		end)
	end)
end

return (RoactServices.connect({
	networkImpl = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	loggingProtocol = AppLogging
})((RoactRoduxModule.connect(nil, nil)((RoactNavigationModule.withNavigation(function(p1)
	-- upvalues: RoactModule (copy), ExtendResult (copy), CryoModule (copy)
	return RoactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p1, p1.navigation.getParam("extraProps", {})))
end))))))