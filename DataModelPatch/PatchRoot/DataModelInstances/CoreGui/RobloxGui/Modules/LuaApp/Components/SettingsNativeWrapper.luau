local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local JavascriptHybridModule = require(Modules.LuaApp.Enum.JavascriptHybrid)
local ExecuteJavaScriptInWebViewModule = require(Modules.LuaApp.Util.ExecuteJavaScriptInWebView)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local GetFFlagLuaAppEnableCredentialsProtocolFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local GetFIntLuaAppCredentialsProtocolTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local RequireDeviceBoundOnlyForFIDO2 = game:DefineFastFlag("RequireDeviceBoundOnlyForFIDO2", false)
local SettingsNativeWrapper = RoactModule.PureComponent:extend("SettingsNativeWrapper")
SettingsNativeWrapper.defaultProps = {
	url = nil,
	titleKey = nil,
	isVisible = false,
	windowClosedCallback = nil,
	displayOrder = nil,
	BrowserWrapperComponent = require(Modules.LuaApp.Components.BrowserServiceWrapper)
}

local function _(p1)
	-- upvalues: JavascriptHybridModule (copy)
	return if p1.moduleID == JavascriptHybridModule.Module.Navigation and p1.functionName == JavascriptHybridModule.Function.navigateToFeature and p1.params and p1.params.params then p1.params.params.feature else nil
end

function SettingsNativeWrapper.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), HttpService (copy), GetFFlagLuaAppEnableCredentialsProtocolFunction (copy), JavascriptHybridModule (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), RequireDeviceBoundOnlyForFIDO2 (copy), ExecuteJavaScriptInWebViewModule (copy), GetFIntLuaAppCredentialsProtocolTimeoutFunction (copy), Logging (copy)
	return WithLocalizationModule({ title = p1.props.titleKey })(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), HttpService (upval), GetFFlagLuaAppEnableCredentialsProtocolFunction (upval), JavascriptHybridModule (upval), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), RequireDeviceBoundOnlyForFIDO2 (upval), ExecuteJavaScriptInWebViewModule (upval), GetFIntLuaAppCredentialsProtocolTimeoutFunction (upval), Logging (upval)
		return RoactModule.createElement(p1.props.BrowserWrapperComponent, {
			modal = false,
			webViewVisible = true,
			isGenericWebview = true,
			isVisible = p1.props.isVisible,
			title = p2.title,
			displayOrder = p1.props.displayOrder,
			url = p1.props.url,
			windowClosedCallback = p1.props.windowClosedCallback,
			javaScriptCallback = function(Input)
				-- upvalues: HttpService (upval), GetFFlagLuaAppEnableCredentialsProtocolFunction (upval), JavascriptHybridModule (upval), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), RequireDeviceBoundOnlyForFIDO2 (upval), ExecuteJavaScriptInWebViewModule (upval), GetFIntLuaAppCredentialsProtocolTimeoutFunction (upval), Logging (upval)
				local Data = HttpService:JSONDecode(Input)
				
				if GetFFlagLuaAppEnableCredentialsProtocolFunction() and (if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybridModule.Feature.CredentialsProtocolAvailable then
					Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
						-- upvalues: RequireDeviceBoundOnlyForFIDO2 (upval), ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						local IsAvailable = Result.isAvailable or false
						
						if RequireDeviceBoundOnlyForFIDO2 then
							IsAvailable = IsAvailable and Result.supportsDeviceBoundOnly or false
						end
						ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, (tostring(IsAvailable)))
					end):catch(function()
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, "false")
					end)
					
					return
				end
				if GetFFlagLuaAppEnableCredentialsProtocolFunction() and (if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybridModule.Feature.RegisterCredentials then
					Default:registerCredentials(Default.CredentialsTypes.FIDO2, Data.params.params.data.creationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeoutFunction()):andThen(function(Result)
						-- upvalues: Logging (upval), HttpService (upval), ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						if Result ~= nil then
							Logging.warn("Executing javascript on webview to return RegisterCredentialsResponse")
							ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, (HttpService:JSONEncode(Result)))
						end
					end):catch(function()
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, "")
					end)
					
					return
				end
				if GetFFlagLuaAppEnableCredentialsProtocolFunction() and (if Data.moduleID == JavascriptHybridModule.Module.Navigation and Data.functionName == JavascriptHybridModule.Function.navigateToFeature and Data.params and Data.params.params then Data.params.params.feature else nil) == JavascriptHybridModule.Feature.GetCredentials then
					Default:getCredentials(Default.CredentialsTypes.FIDO2, Data.params.params.data.authenticationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeoutFunction()):andThen(function(Result)
						-- upvalues: Logging (upval), HttpService (upval), ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						if Result ~= nil then
							Logging.warn("Executing javascript on webview to return GetCredentialsResponse")
							ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, (HttpService:JSONEncode(Result)))
						end
					end):catch(function()
						-- upvalues: ExecuteJavaScriptInWebViewModule (upval), Data (copy)
						ExecuteJavaScriptInWebViewModule.Execute(Data.params.params.data.callId, "")
					end)
					
					return
				end
			end
		})
	end)
end

return (RoactNavigationModule.withNavigation(SettingsNativeWrapper))