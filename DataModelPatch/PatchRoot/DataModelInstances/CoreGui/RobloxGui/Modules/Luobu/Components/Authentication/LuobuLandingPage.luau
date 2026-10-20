local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local ColorsModule = require(Modules.LuaApp.Themes.Colors)
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local AuthenticationProtocol = require(CorePackages.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol
local LogoWithContentsLayoutModule = require(Modules.LuaApp.Components.Authentication.LogoWithContentsLayout)
local WeChatButtonModule = require(Modules.LuaApp.Components.WeChatButton)
local QQButtonModule = require(Modules.LuaApp.Components.QQButton)
local RequestMSDKLoginModule = require(Modules.Luobu.Thunks.RequestMSDKLogin)
local RequestTokenAuthenticationModule = require(Modules.Luobu.Thunks.RequestTokenAuthentication)
local LaunchLuobuAppModule = require(Modules.Luobu.Thunks.LaunchLuobuApp)
local FetchUpdatedUserAgreementsModule = require(Modules.LuaApp.Http.Requests.FetchUpdatedUserAgreements)
local SetMSDKLoginInProgressModule = require(Modules.Luobu.Actions.SetMSDKLoginInProgress)
local SetMSDKLoginErrMessageKeyModule = require(Modules.Luobu.Actions.SetMSDKLoginErrMessageKey)
local SetTokenAuthErrMessageKeyModule = require(Modules.Luobu.Actions.SetTokenAuthErrMessageKey)
local SetMSDKLoginOpenIdModule = require(Modules.Luobu.Actions.SetMSDKLoginOpenId)
local SetSignUpInfoModule = require(Modules.Luobu.Actions.SetSignUpInfo)
local LuobuLandingPage = RoactModule.PureComponent:extend("LuobuLandingPage")
LuobuLandingPage.validateProps = TModule.strictInterface({
	loginInProgress = TModule.boolean,
	MSDKLoginErrMessageKey = TModule.optional(TModule.string),
	tokenAuthErrMessageKey = TModule.optional(TModule.string),
	requestMSDKLogin = TModule.callback,
	requestTokenAuthentication = TModule.callback,
	launchLuobuApp = TModule.callback,
	setMSDKLoginInProgress = TModule.callback,
	setMSDKLoginOpenId = TModule.callback,
	setSignUpInfo = TModule.callback,
	resetMSDKLoginErrMessageKey = TModule.callback,
	resetTokenAuthErrMessageKey = TModule.callback,
	resetSignUpInfo = TModule.callback,
	navigateToSignUpPage = TModule.callback,
	navigateBack = TModule.callback,
	showUserAgreementsPrompt = TModule.callback,
	showAlert = TModule.callback,
	networking = TModule.callback,
	analytics = TModule.table,
	authAnalytics = TModule.table,
	appPolicy = TModule.table,
	guiService = TModule.table
})

function LuobuLandingPage.init(p1)
	-- upvalues: NotificationTypeModule (copy), EventStreamConstantsModule (copy), AuthenticationProtocol (copy)
	function p1.resetErrorMessages()
		-- upvalues: p1 (copy)
		p1.props.resetMSDKLoginErrMessageKey()
		p1.props.resetTokenAuthErrMessageKey()
	end
	
	function p1.shutdownApp()
		-- upvalues: p1 (copy), NotificationTypeModule (upval)
		p1.props.guiService:BroadcastNotification("", NotificationTypeModule.NATIVE_EXIT)
	end
	
	function p1.onLogin(QQ)
		-- upvalues: p1 (copy)
		local Analytics = p1.props.analytics
		local Networking = p1.props.networking
		local AppPolicy = p1.props.appPolicy
		local SetMSDKLoginInProgressFunction: (any) -> () = p1.props.setMSDKLoginInProgress
		local SetMSDKLoginOpenIdFunction: (any) -> () = p1.props.setMSDKLoginOpenId
		local SetSignUpInfoFunction: (any, any, any, any) -> () = p1.props.setSignUpInfo
		local LaunchLuobuAppFunction: (any, any, any) -> () = p1.props.launchLuobuApp
		local RequestMSDKLoginFunction = p1.props.requestMSDKLogin
		local RequestTokenAuthenticationFunction = p1.props.requestTokenAuthentication
		local NavigateToSignUpPageFunction: () -> () = p1.props.navigateToSignUpPage
		local NavigateBackFunction: () -> () = p1.props.navigateBack
		p1:resetErrorMessages()
		SetMSDKLoginInProgressFunction(true)
		local v1, v2 = RequestMSDKLoginFunction(Analytics, QQ, Networking, AppPolicy):await()
		
		if not v1 then
			SetMSDKLoginInProgressFunction(false)
			
			return
		end
		SetMSDKLoginOpenIdFunction(v2.openId)
		local v3, v4 = RequestTokenAuthenticationFunction(Networking, Analytics, QQ, v2):await()
		
		if not v3 then
			SetMSDKLoginInProgressFunction(false)
			
			if AppPolicy.useMSDKWebAuthentication() then
				NavigateBackFunction()
			end
			return
		elseif v4.voucher then
			SetSignUpInfoFunction(v4.displayName, v4.voucher, QQ, v2.channelId)
			NavigateToSignUpPageFunction()
			
			return
		else
			LaunchLuobuAppFunction(Networking, Analytics, AppPolicy)
		end
	end
	
	function p1.onWeChatButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), AuthenticationProtocol (upval)
		if not p1.props.loginInProgress then
			p1.props.authAnalytics.reportQQButtonClicked(EventStreamConstantsModule.Context.LuobuLandingPage)
			p1.onLogin(AuthenticationProtocol.AuthMethods.WECHAT)
			
			return
		end
	end
	
	function p1.onQQButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), AuthenticationProtocol (upval)
		if not p1.props.loginInProgress then
			p1.props.authAnalytics.reportQQButtonClicked(EventStreamConstantsModule.Context.LuobuLandingPage)
			p1.onLogin(AuthenticationProtocol.AuthMethods.QQ)
			
			return
		end
	end
end

function LuobuLandingPage.willUnmount(p1)
	p1.props.setMSDKLoginInProgress(false)
end

function LuobuLandingPage.didMount(p1)
	-- upvalues: FetchUpdatedUserAgreementsModule (copy)
	p1.props.resetSignUpInfo()
	local v1, v2 = FetchUpdatedUserAgreementsModule(p1.props.networking, p1.props.analytics):await()
	
	if v1 and type(v2) == "table" and next(v2) ~= nil then
		p1.props.showUserAgreementsPrompt(v2)
		
		return
	else
		p1.props.showAlert("CommonUI.Messages.Label.Alert", "Luobu.Authentication.Message.UnknownErrorTryAgain", "Application.ConnectionError.Action.Ok", p1.shutdownApp)
	end
end

function LuobuLandingPage.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), LogoWithContentsLayoutModule (copy), AlignmentModule (copy), ColorsModule (copy), WeChatButtonModule (copy), QQButtonModule (copy)
	local TokenAuthErrMessageKey = if p1.props.MSDKLoginErrMessageKey == "" then p1.props.tokenAuthErrMessageKey ~= "" and p1.props.tokenAuthErrMessageKey else p1.props.MSDKLoginErrMessageKey or p1.props.tokenAuthErrMessageKey ~= "" and p1.props.tokenAuthErrMessageKey
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), TokenAuthErrMessageKey (copy), p1 (copy), RoactModule (upval), LogoWithContentsLayoutModule (upval), AlignmentModule (upval), ColorsModule (upval), WeChatButtonModule (upval), QQButtonModule (upval)
		return WithLocalizationModule({
			logInTextWeChat = "Authentication.Login.Action.WeChatLogin",
			logInTextQQ = "Authentication.Login.Action.QQLogin",
			antiAddictionText = "Luobu.Authentication.Login.Label.AntiAddictionText",
			networkLicense = "Luobu.Authentication.Login.Label.NetworkLicense",
			tokenAuthFailure = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain",
			localizedError = if TokenAuthErrMessageKey == "" then nil else TokenAuthErrMessageKey or nil
		})(function(p3)
			-- upvalues: p1 (upval), RoactModule (upval), LogoWithContentsLayoutModule (upval), AlignmentModule (upval), p2 (copy), ColorsModule (upval), WeChatButtonModule (upval), QQButtonModule (upval)
			local LoginInProgress = p1.props.loginInProgress
			
			return RoactModule.createElement(LogoWithContentsLayoutModule, {
				LuobuLogoEnabled = true,
				ContentAlign = AlignmentModule.Top
			}, {
				LandingPageContents = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -40, 0, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 10),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Bottom
					}),
					UIPadding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 36) }),
					UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, 0),
						MaxSize = Vector2.new(360, 1e999)
					}),
					AntiAddictionText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextTransparency = 0.5,
						TextWrapped = true,
						TextColor3 = p2.Theme.SystemPrimaryDefault.Color,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p3.antiAddictionText,
						TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeMinSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					ErrorText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						TextColor3 = ColorsModule.Red,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p3.localizedError or "",
						Font = p2.Font.Footer.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}, {
						UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, 10) })
					}),
					WeChatButton = RoactModule.createElement(WeChatButtonModule, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 48),
						Text = p3.logInTextWeChat,
						TextSize = p2.Font.BaseSize * p2.Font.Header1.RelativeSize,
						Color = p2.Theme.ContextualPrimaryDefault.Color,
						Transparency = p2.Theme.ContextualPrimaryDefault.Transparency,
						isDisabled = LoginInProgress,
						isLoading = LoginInProgress,
						onActivated = p1.onWeChatButtonActivated
					}),
					QQButton = RoactModule.createElement(QQButtonModule, {
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 48),
						Text = p3.logInTextQQ,
						TextSize = p2.Font.BaseSize * p2.Font.Header1.RelativeSize,
						Color = p2.Theme.TextLink.Color,
						Transparency = p2.Theme.TextLink.Transparency,
						isDisabled = LoginInProgress,
						isLoading = LoginInProgress,
						onActivated = p1.onQQButtonActivated
					}),
					NetworkLicense = RoactModule.createElement("TextLabel", {
						LayoutOrder = 5,
						BackgroundTransparency = 1,
						TextTransparency = 0.5,
						TextWrapped = true,
						TextColor3 = p2.Theme.SystemPrimaryDefault.Color,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p3.networkLicense,
						TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeMinSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			})
		end)
	end)
end

return (RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	authAnalytics = RoactAnalyticsAuthEventsModule,
	guiService = AppGuiService
})((RoactRoduxModule.connect(function(p1, _)
	return {
		loginInProgress = p1.Luobu.MSDKAuth.loginInProgress,
		MSDKLoginErrMessageKey = p1.Luobu.MSDKAuth.MSDKLoginErrMessageKey,
		tokenAuthErrMessageKey = p1.Luobu.MSDKAuth.tokenAuthErrMessageKey
	}
end, function(Callback)
	-- upvalues: RequestMSDKLoginModule (copy), RequestTokenAuthenticationModule (copy), LaunchLuobuAppModule (copy), SetMSDKLoginInProgressModule (copy), SetMSDKLoginErrMessageKeyModule (copy), SetTokenAuthErrMessageKeyModule (copy), SetMSDKLoginOpenIdModule (copy), SetSignUpInfoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), AppPageModule (copy), NavigateDownModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), NavigateBackModule (copy)
	return {
		requestMSDKLogin = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), RequestMSDKLoginModule (upval)
			return Callback(RequestMSDKLoginModule(p1, p2, p3, p4))
		end,
		requestTokenAuthentication = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), RequestTokenAuthenticationModule (upval)
			return Callback(RequestTokenAuthenticationModule(p1, p2, p3, p4))
		end,
		launchLuobuApp = function(p1, p2, p3)
			-- upvalues: Callback (copy), LaunchLuobuAppModule (upval)
			return Callback(LaunchLuobuAppModule(p1, p2, p3))
		end,
		setMSDKLoginInProgress = function(p1)
			-- upvalues: Callback (copy), SetMSDKLoginInProgressModule (upval)
			return Callback(SetMSDKLoginInProgressModule(p1))
		end,
		resetMSDKLoginErrMessageKey = function()
			-- upvalues: Callback (copy), SetMSDKLoginErrMessageKeyModule (upval)
			return Callback(SetMSDKLoginErrMessageKeyModule(""))
		end,
		resetTokenAuthErrMessageKey = function()
			-- upvalues: Callback (copy), SetTokenAuthErrMessageKeyModule (upval)
			return Callback(SetTokenAuthErrMessageKeyModule(""))
		end,
		setMSDKLoginOpenId = function(p1)
			-- upvalues: Callback (copy), SetMSDKLoginOpenIdModule (upval)
			return Callback(SetMSDKLoginOpenIdModule(p1))
		end,
		setSignUpInfo = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), SetSignUpInfoModule (upval)
			return Callback(SetSignUpInfoModule(p1, p2, p3, p4))
		end,
		resetSignUpInfo = function()
			-- upvalues: Callback (copy), SetSignUpInfoModule (upval)
			return Callback(SetSignUpInfoModule("", "", "", ""))
		end,
		navigateToSignUpPage = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), AppPageModule (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPageModule.LuobuSignUpPage })) else Callback(NavigateDownModule({ name = AppPageModule.LuobuSignUpPage }))
		end,
		showUserAgreementsPrompt = function(Agreements)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.UserAgreementsPrompt, { agreements = Agreements }))
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				Callback(NavigateBackModule())
			end
		end,
		showAlert = function(TitleKey, BodyTextKey, ConfirmButtonTextKey, ConfirmButtonCallback)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.SimpleTextAlertPrompt, {
				titleKey = TitleKey,
				bodyTextKey = BodyTextKey,
				confirmButtonTextKey = ConfirmButtonTextKey,
				confirmButtonCallback = ConfirmButtonCallback
			}))
		end
	}
end)(LuobuLandingPage))))))