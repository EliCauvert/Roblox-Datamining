local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local LoadingBarModule = require(Modules.LuaApp.Components.LoadingBar)
local FitImageTextButtonModule = require(Modules.LuaApp.Components.FitImageTextButton)
local FetchAccountSettingsModule = require(Modules.LuaApp.Thunks.Authentication.FetchAccountSettings)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local WeChatLoginWrapper = RoactModule.PureComponent:extend("WeChatLoginWrapper")

function WeChatLoginWrapper.init(p1)
	-- upvalues: BrowserService (copy), HttpService (copy)
	p1.state = { showingBrowser = true, hasAuthenticated = false }
	
	function p1.openWWWLogin()
		-- upvalues: BrowserService (upval), p1 (copy)
		BrowserService:OpenWeChatAuthWindow()
		p1:setState({ showingBrowser = true })
	end
	
	function p1.onBrowserWindowClosed()
		-- upvalues: p1 (copy)
		p1:setState({ showingBrowser = false })
	end
	
	function p1.onAuthTokenUpdated()
		-- upvalues: p1 (copy)
		p1.props.launchApp(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.analytics, p1.props.appPolicy)
	end
	
	function p1.onJavascriptCallback(Input)
		-- upvalues: HttpService (upval), BrowserService (upval), p1 (copy)
		local Data = HttpService:JSONDecode(Input)
		
		if Data.moduleID ~= "Navigation" then return end
		if Data.functionName ~= "navigateToFeature" then return end
		local Feature = Data.params.params.feature
		
		if Feature == "login" or Feature == "signUp" then
			BrowserService:CopyAuthCookieFromBrowserToEngine()
			BrowserService:CloseBrowserWindow()
			spawn(function()
				-- upvalues: p1 (upval)
				p1:setState({ hasAuthenticated = true })
			end)
		end
	end
end

function WeChatLoginWrapper:didMount()
	-- upvalues: BrowserService (copy)
	BrowserService:OpenWeChatAuthWindow()
end

function WeChatLoginWrapper.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnectionModule (copy), BrowserService (copy), LoadingBarModule (copy), FitImageTextButtonModule (copy), ConstantsModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local AppTheme = p1.props.appTheme
	local Localization = p1.props.localization
	local config = {
		BrowserWindowClosedConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = BrowserService.BrowserWindowClosed,
			callback = p1.onBrowserWindowClosed
		}),
		AuthCookieCopiedToEngineConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = BrowserService.AuthCookieCopiedToEngine,
			callback = p1.onAuthTokenUpdated
		}),
		JavaScriptCallbackConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = BrowserService.JavaScriptCallback,
			callback = p1.onJavascriptCallback
		})
	}
	
	local function v27(p2)
		-- upvalues: p1 (copy), config (copy), RoactModule (upval), LoadingBarModule (upval), FitImageTextButtonModule (upval), AppTheme (copy), ConstantsModule (upval)
		if p1.state.showingBrowser or p1.state.hasAuthenticated then
			config.LoadingBar = RoactModule.createElement(LoadingBarModule)
		else
			config.LoginButton = RoactModule.createElement(FitImageTextButtonModule, {
				backgroundImage = "LuaApp/buttons/buttonFill",
				maxWidth = 200,
				minWidth = 50,
				horizontalPadding = 30,
				verticalPadding = 9,
				iconRightPadding = 5,
				backgroundColor = AppTheme.Authentication.WeChatButton.Background.Color,
				sliceCenter = Rect.new(8, 8, 9, 9),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.new(0.5, 0, 0.5, 0),
				text = p2.loginText,
				textColor = AppTheme.Authentication.WeChatButton.Text.Color,
				textFont = AppTheme.Authentication.WeChatButton.Text.Font,
				textSize = AppTheme.Authentication.WeChatButton.Text.Size,
				onActivated = p1.openWWWLogin
			})
		end
		return RoactModule.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.GRAY4
		}, config)
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({ loginText = "Authentication.Login.Action.WeChatLogin" })(v27) else v27({
		loginText = Localization:Format("Authentication.Login.Action.WeChatLogin")
	})
end

return (RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FetchAccountSettingsModule (copy), LaunchAppModule (copy), LaunchContextModule (copy)
	return {
		fetchAccountSettings = function(p1, p2, p3)
			-- upvalues: Callback (copy), FetchAccountSettingsModule (upval)
			Callback(FetchAccountSettingsModule(p1, p2, p3))
		end,
		launchApp = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), LaunchAppModule (upval), LaunchContextModule (upval)
			Callback(LaunchAppModule(p1, p2, p3, p4, LaunchContextModule.Login))
		end
	}
end)((WithThemeDEPRECATEDModule(WeChatLoginWrapper))))))))