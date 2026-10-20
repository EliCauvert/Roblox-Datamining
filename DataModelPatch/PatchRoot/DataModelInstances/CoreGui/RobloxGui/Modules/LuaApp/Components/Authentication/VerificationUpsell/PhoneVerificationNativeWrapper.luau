local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local UrlModule = require(Modules.LuaApp.Http.Url)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local JavascriptHybridModule = require(Modules.LuaApp.Enum.JavascriptHybrid)
local GetFFlagPhoneVerificationWebviewShouldBeFullscreenFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagPhoneVerificationWebviewShouldBeFullscreen
local PhoneVerificationNativeWrapper = RoactModule.PureComponent:extend("PhoneVerificationNativeWrapper")
PhoneVerificationNativeWrapper.defaultProps = {
	closeCallback = nil,
	BrowserWrapperComponent = require(Modules.LuaApp.Components.BrowserServiceWrapper)
}

local function _(p1)
	-- upvalues: JavascriptHybridModule (copy)
	return if p1.moduleID == JavascriptHybridModule.Module.Navigation and p1.functionName == JavascriptHybridModule.Function.navigateToFeature and p1.params and p1.params.params then p1.params.params.feature else nil
end

local _ = function(p1): boolean
	-- upvalues: JavascriptHybridModule (copy)
	return (if p1.moduleID == JavascriptHybridModule.Module.Navigation and p1.functionName == JavascriptHybridModule.Function.navigateToFeature and p1.params and p1.params.params then p1.params.params.feature else nil) == JavascriptHybridModule.Feature.CloseContactMethodUpsellWebview
end

local _ = function(p1): boolean
	-- upvalues: JavascriptHybridModule (copy)
	return (if p1.moduleID == JavascriptHybridModule.Module.Navigation and p1.functionName == JavascriptHybridModule.Function.navigateToFeature and p1.params and p1.params.params then p1.params.params.feature else nil) == JavascriptHybridModule.Feature.CompletedContactMethodUpsellWebview
end

function PhoneVerificationNativeWrapper.init(p1)
	p1.isPhoneVerificationSuccessful = false
end

function PhoneVerificationNativeWrapper.render(p1)
	-- upvalues: RoactModule (copy), GetFFlagPhoneVerificationWebviewShouldBeFullscreenFunction (copy), UrlModule (copy), HttpService (copy), JavascriptHybridModule (copy)
	return RoactModule.createElement(p1.props.BrowserWrapperComponent, {
		isVisible = true,
		webViewVisible = true,
		isGenericWebview = true,
		modal = not GetFFlagPhoneVerificationWebviewShouldBeFullscreenFunction(),
		displayOrder = p1.props.displayOrder,
		url = UrlModule.BASE_URL .. "phone-verification",
		javaScriptCallback = function(Input)
			-- upvalues: HttpService (upval), JavascriptHybridModule (upval), p1 (copy)
			local Data = HttpService:JSONDecode(Input)
			
			if (if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybridModule.Feature.CompletedContactMethodUpsellWebview then
				p1.isPhoneVerificationSuccessful = true
				
				if p1.props.onSuccessCallback then
					p1.props.onSuccessCallback()
					
					return
				end
			elseif (if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybridModule.Feature.CloseContactMethodUpsellWebview then
				p1.props.navigation.goBack()
			end
		end
	})
end

function PhoneVerificationNativeWrapper.willUnmount(p1)
	if p1.props.closeCallback then
		p1.props.closeCallback(p1.isPhoneVerificationSuccessful)
	end
end

return (RoactNavigationModule.withNavigation(PhoneVerificationNativeWrapper))