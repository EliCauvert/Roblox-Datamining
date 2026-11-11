local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NotificationService = game:GetService("NotificationService")
local UserInputService = game:GetService("UserInputService")
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TModule = require(CorePackages.Packages.t)
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local BrowserServiceWrapperModule = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local ActionTypeModule = require(Modules.LuaApp.Enum.Challenge.Captcha.ActionType)
local TypeModule = require(Modules.LuaApp.Enum.Challenge.Type)
local ExecuteJavaScriptInWebViewModule = require(Modules.LuaApp.Util.ExecuteJavaScriptInWebView)
local GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView)
local GetFFlagLuaAppChallengeForceInvisibleCaptchaDevModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeForceInvisibleCaptchaDev)
local GetFFlagLuaAppChallengeForceVisibleCaptchaDevModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeForceVisibleCaptchaDev)
local GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled)
local GetFFlagLuaAppEnableCredentialsProtocolFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local GetFIntLuaAppCredentialsProtocolTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFIntLuaAppChallengeHybridWebViewTimeoutSecondsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds)
local GetFFlagReplaceBrowserServiceWrapperModule = require(Modules.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper)
local GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled)
local GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSecondsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds)
local EnableGCSWebViewLaunchFlowLogging = game:DefineFastFlag("EnableGCSWebViewLaunchFlowLogging", false)
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local JavascriptHybridModule = require(Modules.LuaApp.Enum.JavascriptHybrid)
local RoactModule = require(Modules.Common.Roact)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local ActionTypeModule1 = require(Modules.LuaApp.Enum.Challenge.TwoStepVerification.ActionType)
local UrlModule = require(Modules.LuaApp.Http.Url)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local Default1 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local AccountService = nil
pcall(function()
	-- upvalues: AccountService (ref)
	AccountService = game:GetService("AccountService")
end)
ExtendResult.validateProps = TModule.intersection(TModule.interface({
	appContainerNavigation = TModule.interface({
		isVisible = TModule.boolean,
		displayOrder = TModule.integer
	}),
	onChallengeAbandoned = TModule.callback,
	onChallengeLoadFailed = TModule.callback,
	forceWebViewVisible = TModule.optional(TModule.boolean),
	onChallengeDisplayed = TModule.optional(TModule.callback),
	onChallengeUnmounted = TModule.optional(TModule.callback)
}), TModule.union(TModule.interface({
	challengeType = TModule.literal(TypeModule.Captcha),
	challengeParameters = TModule.strictInterface({
		actionType = ActionTypeModule.isEnumValue,
		dataExchangeBlob = TModule.string,
		captchaId = TModule.string,
		onChallengeCompleted = TModule.callback,
		onChallengeInvalidated = TModule.callback
	})
}), TModule.interface({
	challengeType = TModule.literal(TypeModule.SecurityQuestions),
	challengeParameters = TModule.strictInterface({
		userId = TModule.string,
		sessionId = TModule.string,
		onChallengeCompleted = TModule.callback,
		onChallengeInvalidated = TModule.callback
	})
}), TModule.interface({
	challengeType = TModule.literal(TypeModule.TwoStepVerification),
	challengeParameters = TModule.strictInterface({
		challengeId = TModule.string,
		userId = TModule.string,
		actionType = ActionTypeModule1.isEnumValue,
		allowRememberDevice = TModule.boolean,
		onChallengeCompleted = TModule.callback,
		onChallengeInvalidated = TModule.callback,
		clientSupports2svRecovery = TModule.optional(TModule.boolean),
		recoverySessionId = TModule.optional(TModule.string)
	})
}), TModule.interface({
	challengeType = TModule.literal(TypeModule.Reauthentication),
	challengeParameters = TModule.strictInterface({
		onChallengeCompleted = TModule.callback,
		onChallengeInvalidated = TModule.callback
	})
}), TModule.interface({
	challengeType = TModule.literal(TypeModule.Generic),
	challengeParameters = TModule.strictInterface({
		genericChallengeId = TModule.string,
		genericChallengeType = TModule.string,
		genericChallengeMetadata = TModule.string,
		onChallengeCompleted = TModule.callback,
		onChallengeInvalidated = TModule.callback
	})
})))

function ExtendResult.init(p1)
	-- upvalues: UserInputService (copy)
	p1:setState({
		challengeDisplayed = false,
		forceWebViewVisibleOnLoadFailure = false
	})
	p1.webViewLoaded = false
	p1.challengeInitializationFailed = false
	p1.completionData = nil
	p1.invalidationData = nil
	p1.appType = (function(): string
		-- upvalues: UserInputService (upval)
		local Platform = UserInputService:GetPlatform()
		local v1 = "unknown"
		
		if Platform == Enum.Platform.Android then
			v1 = "android"
			
			return v1
		end
		if Platform == Enum.Platform.IOS then
			v1 = "ios"
			
			return v1
		end
		if Platform == Enum.Platform.Windows then
			v1 = "windows"
			
			return v1
		end
		if Platform == Enum.Platform.OSX then
			v1 = "osx"
			
			return v1
		end
		if Platform == Enum.Platform.UWP then
			v1 = "uwp"
			
			return v1
		end
		if Platform == Enum.Platform.XBoxOne then
			v1 = "xbox"
		end
		return v1
	end)()
end

function ExtendResult.didMount(p1)
	-- upvalues: GetFIntLuaAppChallengeHybridWebViewTimeoutSecondsModule (copy), GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabledModule (copy), GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSecondsModule (copy), EnableGCSWebViewLaunchFlowLogging (copy), Default1 (copy)
	p1.isMounted = true
	local Analytics = p1.props.analytics
	local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
	spawn(function()
		-- upvalues: UnixTimestampMillis (copy), GetFIntLuaAppChallengeHybridWebViewTimeoutSecondsModule (upval), p1 (copy), GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabledModule (upval), GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSecondsModule (upval), Analytics (copy), EnableGCSWebViewLaunchFlowLogging (upval), Default1 (upval)
		local UnixTimestampMillis1 = DateTime.now().UnixTimestampMillis
		while UnixTimestampMillis1 - UnixTimestampMillis < GetFIntLuaAppChallengeHybridWebViewTimeoutSecondsModule() * 1000 do
			wait(1)
			
			if p1.webViewLoaded then return end
			if GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabledModule() and GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSecondsModule() * 1000 <= UnixTimestampMillis1 - UnixTimestampMillis and not p1.state.forceWebViewVisibleOnLoadFailure then
				p1:setState({ forceWebViewVisibleOnLoadFailure = true })
			end
			UnixTimestampMillis1 = DateTime.now().UnixTimestampMillis
		end
		if Analytics ~= nil and Analytics.Diag ~= nil then
			Analytics.Diag:reportCounter("ChallengeHybridWebView_Timeout", 1)
		end
		if p1.isMounted then
			if EnableGCSWebViewLaunchFlowLogging then
				Default1:logEventOnce("challenge_launch_fail")
			end
			p1:navigateBack()
		end
	end)
end

function ExtendResult.willUnmount(p2)
	-- upvalues: TypeModule (copy)
	p2.isMounted = false
	
	if p2.props.onChallengeUnmounted ~= nil then
		p2.props.onChallengeUnmounted()
	end
	local InitializationFailed = nil
	if p2.completionData == nil then
		if p2.invalidationData == nil then
			if p2.webViewLoaded and not p2.challengeInitializationFailed then
				InitializationFailed = "Abandoned"
				p2.props.onChallengeAbandoned()
			else
				InitializationFailed = if p2.webViewLoaded then "InitializationFailed" else "LoadFailed"
				p2.props.onChallengeLoadFailed()
			end
		else
			InitializationFailed = "Invalidated"
			p2.props.challengeParameters.onChallengeInvalidated(p2.invalidationData)
		end
	else
		InitializationFailed = "Completed"
		p2.props.challengeParameters.onChallengeCompleted(p2.completionData)
	end
	if p2.props.analytics ~= nil then
		local ChallengeType = TypeModule.toRawValue(p2.props.challengeType):gsub("%-", "")
		
		if p2.props.analytics.Diag ~= nil then
			p2.props.analytics.Diag:reportCounter(string.format("ChallengeHybridWebView_Result_%s_%s_%s", InitializationFailed, p2.appType, ChallengeType), 1)
		end
		if p2.props.analytics.EventStream ~= nil then
			p2.props.analytics.EventStream:setRBXEventStream(InitializationFailed, "challengeHybridWebViewResult", {
				appType = p2.appType,
				challengeType = ChallengeType,
				queryParameters = p2:getBaseQueryParameters() .. p2:getChallengeTypeQueryParameters()
			})
		end
	end
end

local function buildQueryParametersFromTable(List): string
	local Text = ""
	
	for i, value in pairs(List) do
		Text ..= string.format("%s=%s&", i, value)
	end
	return Text
end

function ExtendResult.getChallengeTypeQueryParameters(p2)
	-- upvalues: TypeModule (copy), buildQueryParametersFromTable (copy), ActionTypeModule (copy), ActionTypeModule1 (copy)
	return ({
		[TypeModule.Captcha] = function()
			-- upvalues: buildQueryParametersFromTable (upval), ActionTypeModule (upval), p2 (copy)
			return (buildQueryParametersFromTable({
				["action-type"] = ActionTypeModule.toRawValue(p2.props.challengeParameters.actionType),
				["data-exchange-blob"] = p2.props.challengeParameters.dataExchangeBlob,
				["captcha-id"] = p2.props.challengeParameters.captchaId
			}))
		end,
		[TypeModule.TwoStepVerification] = function()
			-- upvalues: p2 (copy), ActionTypeModule1 (upval), buildQueryParametersFromTable (upval)
			local config = {
				["challenge-id"] = p2.props.challengeParameters.challengeId,
				["user-id"] = p2.props.challengeParameters.userId,
				["action-type"] = ActionTypeModule1.toRawValue(p2.props.challengeParameters.actionType),
				["allow-remember-device"] = if p2.props.challengeParameters.allowRememberDevice then "true" else "false",
				["client-supports-2sv-recovery"] = if p2.props.challengeParameters.clientSupports2svRecovery then "true" else "false"
			}
			local RecoverySessionId: string = p2.props.challengeParameters.recoverySessionId
			
			if RecoverySessionId ~= nil and string.len(RecoverySessionId) > 0 then
				config["recovery-session-id"] = RecoverySessionId
			end
			return (buildQueryParametersFromTable(config))
		end,
		[TypeModule.SecurityQuestions] = function()
			-- upvalues: buildQueryParametersFromTable (upval), p2 (copy)
			return (buildQueryParametersFromTable({
				["user-id"] = p2.props.challengeParameters.userId,
				["session-id"] = p2.props.challengeParameters.sessionId
			}))
		end,
		[TypeModule.Reauthentication] = function()
			-- upvalues: buildQueryParametersFromTable (upval)
			return (buildQueryParametersFromTable({}))
		end,
		[TypeModule.Generic] = function()
			-- upvalues: buildQueryParametersFromTable (upval), p2 (copy)
			return (buildQueryParametersFromTable({
				["generic-challenge-id"] = p2.props.challengeParameters.genericChallengeId,
				["generic-challenge-type"] = p2.props.challengeParameters.genericChallengeType,
				["challenge-metadata-json"] = p2.props.challengeParameters.genericChallengeMetadata
			}))
		end
	})[p2.props.challengeType]()
end

function ExtendResult.getBaseQueryParameters(p2)
	-- upvalues: NotificationService (copy), Constants (copy), TypeModule (copy), GetFFlagLuaAppChallengeForceVisibleCaptchaDevModule (copy), GetFFlagLuaAppChallengeForceInvisibleCaptchaDevModule (copy), buildQueryParametersFromTable (copy)
	local IsSelectedThemeMatch = NotificationService.SelectedTheme == Constants.ThemeName.Dark
	local config = {
		["challenge-type"] = TypeModule.toRawValue(p2.props.challengeType),
		["app-type"] = p2.appType,
		["dark-mode"] = if IsSelectedThemeMatch then "true" else "false"
	}
	
	if GetFFlagLuaAppChallengeForceVisibleCaptchaDevModule() then
		config.fc_nosuppress = "1"
	end
	if GetFFlagLuaAppChallengeForceInvisibleCaptchaDevModule() then
		config.fc_suppress = "1"
	end
	return (buildQueryParametersFromTable(config))
end

function ExtendResult.navigateBack(p2)
	p2.props.navigation.goBack()
end

function ExtendResult.render(p2)
	-- upvalues: GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule (copy), UrlModule (copy), EnableGCSWebViewLaunchFlowLogging (copy), Default1 (copy), WithLocalizationModule (copy), RoactModule (copy), BrowserServiceWrapperModule (copy), GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabledModule (copy), GetFFlagReplaceBrowserServiceWrapperModule (copy), HttpService (copy), JavascriptHybridModule (copy), GetFFlagLuaAppEnableCredentialsProtocolFunction (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), ExecuteJavaScriptInWebViewModule (copy), GetFIntLuaAppCredentialsProtocolTimeoutFunction (copy), Logging (copy), AccountService (ref)
	local IsVisible = p2.props.appContainerNavigation.isVisible
	local DisplayOrder = p2.props.appContainerNavigation.displayOrder
	local v1: boolean = p2.props.forceWebViewVisible and true
	local ChallengeDisplayed = p2.state.challengeDisplayed
	local ForceWebViewVisibleOnLoadFailure = p2.state.forceWebViewVisibleOnLoadFailure
	local Formatted = string.format("%schallenge/cdn/hybrid?%s%s", GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebViewModule(p2.props.challengeParameters.userId) and UrlModule.STATIC_CDN_URL or UrlModule.WWW_URL, p2:getBaseQueryParameters(), p2:getChallengeTypeQueryParameters())
	
	if EnableGCSWebViewLaunchFlowLogging then
		Default1:logEventOnce("challenge_launch_begin")
	end
	return WithLocalizationModule({ title = "Feature.AccountSettings.Heading.Tab.Security" })(function(p3)
		-- upvalues: RoactModule (upval), BrowserServiceWrapperModule (upval), IsVisible (copy), DisplayOrder (copy), GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabledModule (upval), v1 (copy), ChallengeDisplayed (copy), ForceWebViewVisibleOnLoadFailure (copy), GetFFlagReplaceBrowserServiceWrapperModule (upval), p2 (copy), Formatted (copy), HttpService (upval), JavascriptHybridModule (upval), EnableGCSWebViewLaunchFlowLogging (upval), Default1 (upval), GetFFlagLuaAppEnableCredentialsProtocolFunction (upval), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), ExecuteJavaScriptInWebViewModule (upval), GetFIntLuaAppCredentialsProtocolTimeoutFunction (upval), Logging (upval), AccountService (upval)
		return RoactModule.createElement(BrowserServiceWrapperModule, {
			backNavigationHandledByParent = true,
			modal = false,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			isVisible = IsVisible,
			displayOrder = DisplayOrder,
			ignoreBackNavigationDisabled = GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabledModule(),
			webViewVisible = v1 or (IsVisible and ChallengeDisplayed or ForceWebViewVisibleOnLoadFailure),
			windowClosedCallback = function()
				-- upvalues: GetFFlagReplaceBrowserServiceWrapperModule (upval), p2 (upval)
				if not GetFFlagReplaceBrowserServiceWrapperModule() then
					p2:navigateBack()
				end
			end,
			title = p3.title,
			url = Formatted,
			javaScriptCallback = function(Input)
				-- upvalues: p2 (upval), HttpService (upval), JavascriptHybridModule (upval), EnableGCSWebViewLaunchFlowLogging (upval), Default1 (upval), GetFFlagLuaAppEnableCredentialsProtocolFunction (upval), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), ExecuteJavaScriptInWebViewModule (upval), GetFIntLuaAppCredentialsProtocolTimeoutFunction (upval), Logging (upval), AccountService (upval)
				if not p2.isMounted then return end
				local Data = HttpService:JSONDecode(Input)
				
				if Data.moduleID ~= JavascriptHybridModule.Module.Navigation or Data.functionName ~= JavascriptHybridModule.Function.navigateToFeature or not Data.params or not Data.params.params then return end
				if not p2.webViewLoaded then
					if EnableGCSWebViewLaunchFlowLogging then
						Default1:logEventOnce("challenge_launch_end")
					end
					p2.webViewLoaded = true
					
					if p2.props.analytics ~= nil and p2.props.analytics.Diag ~= nil then
						p2.props.analytics.Diag:reportCounter("ChallengeHybridWebView_NotTimeout", 1)
					end
				end
				local Params = Data.params.params
				
				if Params.feature == JavascriptHybridModule.Feature.ChallengeParsed and Params.data.parsed == false then
					p2.challengeInitializationFailed = true
					p2:navigateBack()
					
					return
				end
				if Params.feature == JavascriptHybridModule.Feature.ChallengeInitialized and Params.data.initialized == false then
					p2.challengeInitializationFailed = true
					p2:navigateBack()
					
					return
				end
				if GetFFlagLuaAppEnableCredentialsProtocolFunction() and Params.feature == JavascriptHybridModule.Feature.CredentialsProtocolAvailable then
					Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Params (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, (tostring(Result.isAvailable or false)))
					end):catch(function()
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Params (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, "false")
					end)
					
					return
				end
				if GetFFlagLuaAppEnableCredentialsProtocolFunction() and Params.feature == JavascriptHybridModule.Feature.GetCredentials then
					Default:getCredentials(Default.CredentialsTypes.FIDO2, Params.data.authenticationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeoutFunction()):andThen(function(Result)
						-- upvalues: Logging (upval), HttpService (upval), ExecuteJavaScriptInWebViewModule (upval), Params (copy)
						if Result ~= nil then
							Logging.warn("Executing javascript on webview to return GetCredentialsResponse")
							ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, (HttpService:JSONEncode(Result)))
						end
					end):catch(function()
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Params (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, "")
					end)
					
					return
				end
				if Params.feature == JavascriptHybridModule.Feature.GetIntegrityToken then
					if game:GetEngineFeature("AccountService") and AccountService and AccountService:DeviceIntegrityAvailable() then
						local DeviceIntegrityTokenYield = AccountService:GetDeviceIntegrityTokenYield(Params.data.deviceIntegrityParams)
						
						if DeviceIntegrityTokenYield ~= nil then
							ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, (HttpService:JSONEncode(DeviceIntegrityTokenYield)))
							
							return
						end
					end
					ExecuteJavaScriptInWebViewModule.Execute(Params.data.callId, "")
					
					return
				elseif Params.feature == JavascriptHybridModule.Feature.ChallengeCompleted then
					p2.completionData = Params.data
					p2:navigateBack()
					
					return
				else
					if Params.feature == JavascriptHybridModule.Feature.ChallengeInvalidated then
						p2.invalidationData = Params.data
						p2:navigateBack()
						
						return
					end
					if Data.params.params.feature == JavascriptHybridModule.Feature.ChallengeDisplayed then
						p2:setState({ challengeDisplayed = true })
						
						if p2.props.onChallengeDisplayed ~= nil then
							p2.props.onChallengeDisplayed()
						end
					end
				end
			end
		})
	end)
end

return (RoactServices.connect({ analytics = RoactAnalyticsModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy)
	return {
		setBackNavigationDisabled = function(p2)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p2) else Callback(SetBackNavigationDisabledModule(p2))
		end
	}
end)((RoactNavigationModule.withNavigation(ExtendResult))))))