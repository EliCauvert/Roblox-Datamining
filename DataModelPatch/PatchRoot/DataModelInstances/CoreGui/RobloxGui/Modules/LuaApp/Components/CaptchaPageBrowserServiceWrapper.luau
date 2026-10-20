local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local BrowserServiceWrapperModule = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UrlModule = require(Modules.LuaApp.Http.Url)
local JavascriptHybridModule = require(Modules.LuaApp.Enum.JavascriptHybrid)
local Number: number? = tonumber(settings():GetFVariable("CaptchaTimeout"))
local GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptchaModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptcha)
local GetFFlagReplaceBrowserServiceWrapperModule = require(Modules.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper)
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local CaptchaPageBrowserServiceWrapper = RoactModule.PureComponent:extend("CaptchaPageBrowserServiceWrapper")
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
CaptchaPageBrowserServiceWrapper.defaultProps = {
	webViewVisible = true,
	backNavigationDisabledWhileLoading = false
}

function CaptchaPageBrowserServiceWrapper.init(p1)
	-- upvalues: Number (copy), UserInputService (copy)
	p1.state = { webViewVisible = p1.props.webViewVisible }
	p1.captchaSuccess = false
	p1.captchaData = nil
	p1.timerCancelled = false
	
	if p1.props.backNavigationDisabledWhileLoading then
		p1.props.setBackNavigationDisabled(true)
	end
	if Number > 0 then
		spawn(function()
			-- upvalues: Number (upval), p1 (copy)
			local Count = 0
			while Count < Number do
				wait(1)
				Count += 1
				
				if p1.timerCancelled then return end
			end
			if p1.props.backNavigationDisabledWhileLoading then
				p1.props.setBackNavigationDisabled(false)
			end
			if p1.props.analytics ~= nil and p1.props.analytics.Diag ~= nil then
				p1.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_Timeout", 1)
			end
			p1.props.navigation.goBack()
		end)
	end
	function p1.getPlatformString(): string
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
		if Platform == Enum.Platform.UWP then
			v1 = "uwp"
			
			return v1
		end
		if Platform == Enum.Platform.XBoxOne then
			v1 = "xbox"
		end
		return v1
	end
	
	function p1.getCaptchaDxBlob(CaptchaType, Props)
		if Props ~= nil and Props.dxBlob ~= nil then
			return Props.dxBlob
		end
		if Props.analytics ~= nil then
			Props.analytics.EventStream:setRBXEventStream("captcha", "captchaDxBlobNotSet", { captchaType = CaptchaType })
		end
		return ""
	end
	
	function p1.getCaptchaId(Props)
		return if Props == nil or Props.captchaId == nil then "" else Props.captchaId
	end
end

function CaptchaPageBrowserServiceWrapper.willUnmount(p2)
	-- upvalues: ToastTypeModule (copy)
	p2.timerCancelled = true
	local CaptchaCallbackFunction: (any, any) -> () = p2.props.captchaCallback
	
	if not p2.captchaSuccess then
		p2.props.setCurrentToastMessage(ToastTypeModule.NetworkingError, "Authentication.Login.Response.SomethingWentWrong")
	end
	if CaptchaCallbackFunction then
		CaptchaCallbackFunction(p2.captchaSuccess, p2.captchaData)
	end
end

function CaptchaPageBrowserServiceWrapper.render(p2)
	-- upvalues: UrlModule (copy), RoactModule (copy), BrowserServiceWrapperModule (copy), GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptchaModule (copy), GetFFlagReplaceBrowserServiceWrapperModule (copy), HttpService (copy), JavascriptHybridModule (copy)
	local IsVisible = p2.props.isVisible
	local DisplayOrder = p2.props.DisplayOrder
	local CaptchaType = p2.props.captchaType
	local CvalueType = p2.props.cvalueType
	local Cvalue = p2.props.cvalue
	local BackNavigationDisabledWhileLoading = p2.props.backNavigationDisabledWhileLoading
	local Formatted = nil
	
	if CaptchaType == "login" then
		local CaptchaDxBlob = p2.getCaptchaDxBlob(CaptchaType, p2.props)
		local _ = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s", UrlModule.WWW_URL, CvalueType, Cvalue, CaptchaDxBlob)
		Formatted = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s&hybrid-return-captcha-id=%s", UrlModule.WWW_URL, CvalueType, Cvalue, CaptchaDxBlob, (p2.getCaptchaId(p2.props)))
	else
		local CaptchaDxBlob = p2.getCaptchaDxBlob(CaptchaType, p2.props)
		local _ = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s", UrlModule.WWW_URL, CaptchaDxBlob)
		Formatted = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s&hybrid-return-captcha-id=%s", UrlModule.WWW_URL, CaptchaDxBlob, (p2.getCaptchaId(p2.props)))
	end
	return RoactModule.createElement(BrowserServiceWrapperModule, {
		modal = true,
		backNavigationHandledByParent = GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptchaModule(),
		isVisible = IsVisible and p2.state.webViewVisible,
		webViewVisible = p2.state.webViewVisible,
		displayOrder = DisplayOrder,
		url = Formatted,
		windowClosedCallback = function()
			-- upvalues: BackNavigationDisabledWhileLoading (copy), p2 (copy), GetFFlagReplaceBrowserServiceWrapperModule (upval)
			if BackNavigationDisabledWhileLoading then
				p2.props.setBackNavigationDisabled(false)
			end
			p2.timerCancelled = true
			
			if not GetFFlagReplaceBrowserServiceWrapperModule() then
				p2.props.navigation.goBack()
			end
		end,
		javaScriptCallback = function(Input)
			-- upvalues: BackNavigationDisabledWhileLoading (copy), p2 (copy), HttpService (upval), JavascriptHybridModule (upval)
			if BackNavigationDisabledWhileLoading then
				p2.props.setBackNavigationDisabled(false)
			end
			local Data = HttpService:JSONDecode(Input)
			
			if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then
				p2.timerCancelled = true
				
				if p2.props.analytics ~= nil and p2.props.analytics.Diag ~= nil then
					p2.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_NotTimeout", 1)
				end
				if Data.params.params.feature == JavascriptHybridModule.Feature.CaptchaSuccess then
					p2.captchaSuccess = true
					p2.captchaData = Data.params.params.captchaData
					p2.props.navigation.goBack()
					
					return
				elseif Data.params.params.feature == JavascriptHybridModule.Feature.CaptchaShown then
					p2:setState({ webViewVisible = true })
				end
			end
		end
	})
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetCurrentToastMessageModule (copy), FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy)
	return {
		setCurrentToastMessage = function(ToastType, ToastMessage)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			return Callback(SetCurrentToastMessageModule({ toastType = ToastType, toastMessage = ToastMessage }))
		end,
		setBackNavigationDisabled = function(p2)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p2) else Callback(SetBackNavigationDisabledModule(p2))
		end
	}
end)((RoactServices.connect({ analytics = RoactAnalyticsModule })((RoactNavigationModule.withNavigation(CaptchaPageBrowserServiceWrapper)))))