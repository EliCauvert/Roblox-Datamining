local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local DeprecatedDarkThemeModule = require(Modules.LuaApp.Themes.DeprecatedDarkTheme)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local OpenCentralOverlayForConfirmSignOutModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local CheckEmailVerificationBeforeLogoutModule = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerificationBeforeLogout)
local CheckPhoneVerificationModule = require(Modules.LuaApp.Thunks.Authentication.PhoneVerification.CheckPhoneVerification)
local GetFFlagEmailUpsellAtLogoutModule = require(Modules.LuaApp.Flags.GetFFlagEmailUpsellAtLogout)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local MoreLogOut = RoactModule.PureComponent:extend("MoreLogOut")
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local GetFFlagEnablePhoneVerificationLogoutUpsellModule = require(Modules.LuaApp.Flags.GetFFlagEnablePhoneVerificationLogoutUpsell)
local FFlagEnableForcingEmailUpsellForPasswordlessUsersModule = require(Modules.LuaApp.Flags.FFlagEnableForcingEmailUpsellForPasswordlessUsers)
local GetPasswordStatusModule = require(Modules.LuaApp.Http.Requests.GetPasswordStatus)
local FFlagForcingEmailUpsellForPasswordlessUsersBypassIXPModule = require(Modules.LuaApp.Flags.FFlagForcingEmailUpsellForPasswordlessUsersBypassIXP)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local IXPService = game:GetService("IXPService")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local DisconnectButtonModule = require(script.Parent.DisconnectButton)
local GetFFlagUIBloxUseFoundationButtonFunction = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local IsFlyoutSidePanelEnabledFunction = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP.isFlyoutSidePanelEnabled
local FFlagEnableVNGDUARSignupComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance)
local FFlagAuthSecExclusions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions
MoreLogOut.defaultProps = {
	layoutOrder = 1,
	isPhoneLogoutUpsellEnabled = false,
	isForceEmailUpsellForPasswordlessUsersEnabled = false,
	shouldShowPhoneUpsell = false,
	shouldDisableEmailUpsell = false
}
MoreLogOut.validateProps = TModule.strictInterface({
	buttonHeight = if IsFlyoutSidePanelEnabledFunction() then TModule.optional(TModule.integer) else TModule.integer,
	buttonMaxWidth = if IsFlyoutSidePanelEnabledFunction() then TModule.optional(TModule.integer) else TModule.integer,
	foundationButtonType = if IsFlyoutSidePanelEnabledFunction() then TModule.optional(TModule.string) else nil,
	foundationButtonSize = if IsFlyoutSidePanelEnabledFunction() then TModule.optional(TModule.string) else nil,
	item = TModule.table,
	layoutOrder = TModule.optional(TModule.integer),
	position = TModule.optional(TModule.UDim2),
	navigateDown = TModule.callback,
	logout = TModule.callback,
	showEmailBeforeLogout = TModule.callback,
	showPhoneBeforeLogout = TModule.callback,
	logoutWithoutShowConfirmation = TModule.callback,
	guiService = TModule.union(TModule.Instance, TModule.table),
	networkImpl = TModule.callback,
	willActivate = TModule.optional(TModule.callback),
	showDisconnectButton = TModule.boolean,
	isPhoneLogoutUpsellEnabled = TModule.boolean,
	isForceEmailUpsellForPasswordlessUsersEnabled = TModule.boolean,
	shouldShowPhoneUpsell = TModule.boolean,
	shouldDisableEmailUpsell = TModule.boolean,
	appPolicy = TModule.table
})

function MoreLogOut.init(p1)
	-- upvalues: GetFFlagEmailUpsellAtLogoutModule (copy), DeprecatedDarkThemeModule (copy), Default (copy), TelemetryConfigs (copy), FFlagEnableForcingEmailUpsellForPasswordlessUsersModule (copy), FFlagForcingEmailUpsellForPasswordlessUsersBypassIXPModule (copy), IXPService (copy), AppUserLayers (copy), GetFFlagEnablePhoneVerificationLogoutUpsellModule (copy)
	local GuiService = p1.props.guiService
	local Item = p1.props.item
	local NetworkImpl = p1.props.networkImpl
	
	function p1.navigateDown()
		-- upvalues: p1 (copy), Item (copy)
		p1.props.navigateDown({ name = Item.context.page })
	end
	
	function p1.showEmailVerificationOrLogout()
		-- upvalues: GetFFlagEmailUpsellAtLogoutModule (upval), p1 (copy), NetworkImpl (copy), GuiService (copy), DeprecatedDarkThemeModule (upval)
		if GetFFlagEmailUpsellAtLogoutModule() and not p1.props.shouldDisableEmailUpsell then
			p1.props.showEmailBeforeLogout(NetworkImpl, GuiService, DeprecatedDarkThemeModule, p1.props.appPolicy)
			
			return
		else
			p1.props.logout(NetworkImpl, GuiService, DeprecatedDarkThemeModule)
		end
	end
	
	function p1.showPhoneVerificationOrLogout()
		-- upvalues: p1 (copy), NetworkImpl (copy), GuiService (copy), DeprecatedDarkThemeModule (upval)
		p1.props.showPhoneBeforeLogout(NetworkImpl, GuiService, DeprecatedDarkThemeModule)
	end
	
	p1.state = { hasNoPassword = false }
	
	function p1.onActivated()
		-- upvalues: Default (upval), TelemetryConfigs (upval), p1 (copy), FFlagEnableForcingEmailUpsellForPasswordlessUsersModule (upval), FFlagForcingEmailUpsellForPasswordlessUsersBypassIXPModule (upval), IXPService (upval), AppUserLayers (upval), GetFFlagEnablePhoneVerificationLogoutUpsellModule (upval)
		Default:logRobloxTelemetryCounter(TelemetryConfigs.LogoutButtonClickedConfig, 1)
		
		if p1.props.willActivate then
			p1.props.willActivate()
		end
		if FFlagEnableForcingEmailUpsellForPasswordlessUsersModule and (FFlagForcingEmailUpsellForPasswordlessUsersBypassIXPModule or p1.props.isForceEmailUpsellForPasswordlessUsersEnabled) and p1.state.hasNoPassword then
			IXPService:LogUserLayerExposure(AppUserLayers.LogoutLayer)
			p1.showEmailVerificationOrLogout()
			
			return
		end
		if not p1.props.shouldShowPhoneUpsell then
			p1.showEmailVerificationOrLogout()
			
			return
		end
		IXPService:LogUserLayerExposure(AppUserLayers.LogoutLayer)
		local IsPhoneLogoutUpsellEnabled = p1.props.isPhoneLogoutUpsellEnabled
		
		if GetFFlagEnablePhoneVerificationLogoutUpsellModule() or IsPhoneLogoutUpsellEnabled then
			p1.showPhoneVerificationOrLogout()
			
			return
		else
			p1.showEmailVerificationOrLogout()
		end
	end
end

function MoreLogOut.didMount(p1)
	-- upvalues: FFlagEnableForcingEmailUpsellForPasswordlessUsersModule (copy), GetPasswordStatusModule (copy)
	if FFlagEnableForcingEmailUpsellForPasswordlessUsersModule then
		GetPasswordStatusModule(p1.props.networkImpl):andThen(function(Result)
			-- upvalues: p1 (copy)
			p1:setState({ hasNoPassword = Result.responseBody.valid == false })
		end, function() end)
	end
end

function MoreLogOut.render(p1)
	-- upvalues: WithLocalizationModule (copy), IsFlyoutSidePanelEnabledFunction (copy), RoactModule (copy), FoundationModule (copy), DisconnectButtonModule (copy), Button (copy), ButtonType (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy)
	local ButtonHeight = p1.props.buttonHeight
	local ButtonMaxWidth = p1.props.buttonMaxWidth
	local LayoutOrder = p1.props.layoutOrder
	local Position = p1.props.position
	
	return WithLocalizationModule({ logOutText = p1.props.item.textKey })(function(p2)
		-- upvalues: IsFlyoutSidePanelEnabledFunction (upval), p1 (copy), RoactModule (upval), FoundationModule (upval), LayoutOrder (copy), Position (copy), ButtonHeight (copy), ButtonMaxWidth (copy), DisconnectButtonModule (upval), Button (upval), ButtonType (upval), GetFFlagUIBloxUseFoundationButtonFunction (upval)
		return if IsFlyoutSidePanelEnabledFunction() and p1.props.foundationButtonType then RoactModule.createElement(FoundationModule.Button, {
			isDisabled = false,
			text = p2.logOutText,
			variant = p1.props.foundationButtonType,
			LayoutOrder = LayoutOrder,
			onActivated = p1.onActivated,
			size = p1.props.foundationButtonSize,
			width = UDim.new(1, 0)
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = Position,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, ButtonHeight)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			LogOutButtonFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(ButtonMaxWidth, ButtonHeight) }),
				LogOutButton = if p1.props.showDisconnectButton then RoactModule.createElement(DisconnectButtonModule) else RoactModule.createElement(Button, {
					isDisabled = false,
					isLoading = false,
					buttonType = ButtonType.Secondary,
					onActivated = p1.onActivated,
					size = UDim2.new(1, 0, if GetFFlagUIBloxUseFoundationButtonFunction() then 0 else 1, if GetFFlagUIBloxUseFoundationButtonFunction() then ButtonHeight else 0),
					text = p2.logOutText
				})
			})
		})
	end)
end

return RoactServices.connect({
	guiService = AppGuiService,
	networkImpl = RoactNetworkingModule
})((RoactAppExperimentModule.connectUserLayer({ AppUserLayers.LogoutLayer }, function(p1, _)
	-- upvalues: AppUserLayers (copy)
	local v1 = p1[AppUserLayers.LogoutLayer] or {}
	
	return {
		isPhoneLogoutUpsellEnabled = v1.IsPhoneLogoutUpsellEnabled,
		isForceEmailUpsellForPasswordlessUsersEnabled = v1.IsForceEmailUpsellForPasswordlessUsersEnabled
	}
end)((RoactAppPolicy.connect(function(AppPolicy, _)
	-- upvalues: FFlagEnableVNGDUARSignupComplianceModule (copy), FFlagAuthSecExclusions (copy)
	return {
		showDisconnectButton = AppPolicy.getShowDisconnectButton(),
		shouldShowPhoneUpsell = AppPolicy.getShouldShowPhoneUpsell(),
		shouldDisableEmailUpsell = if FFlagEnableVNGDUARSignupComplianceModule or FFlagAuthSecExclusions then AppPolicy.getDisableLogOutEmailUpsell() else false,
		appPolicy = AppPolicy
	}
end)((RoactRoduxModule.connect(function(_, _) end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), CheckEmailVerificationBeforeLogoutModule (copy), OpenCentralOverlayForConfirmSignOutModule (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy), CheckPhoneVerificationModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end,
		showEmailBeforeLogout = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), CheckEmailVerificationBeforeLogoutModule (upval), OpenCentralOverlayForConfirmSignOutModule (upval), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(CheckEmailVerificationBeforeLogoutModule(p1, p2, p4)):andThen(function()
				-- upvalues: Callback (upval), OpenCentralOverlayForConfirmSignOutModule (upval), LogoutModule (upval), p1 (copy), p2 (copy), LuaLogoutReasonNamesModule (upval), p3 (copy)
				Callback(OpenCentralOverlayForConfirmSignOutModule(function()
					-- upvalues: Callback (upval), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval)
					Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.MoreLogOut))
				end, p3))
			end, function() end)
		end,
		showPhoneBeforeLogout = function(p1, p2, p3)
			-- upvalues: Callback (copy), CheckPhoneVerificationModule (upval), OpenCentralOverlayForConfirmSignOutModule (upval), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(CheckPhoneVerificationModule(p1, p2)):andThen(function()
				-- upvalues: Callback (upval), OpenCentralOverlayForConfirmSignOutModule (upval), LogoutModule (upval), p1 (copy), p2 (copy), LuaLogoutReasonNamesModule (upval), p3 (copy)
				Callback(OpenCentralOverlayForConfirmSignOutModule(function()
					-- upvalues: Callback (upval), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval)
					Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.MoreLogOut))
				end, p3))
			end, function() end)
		end,
		logout = function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenCentralOverlayForConfirmSignOutModule (upval), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(OpenCentralOverlayForConfirmSignOutModule(function()
				-- upvalues: Callback (upval), LogoutModule (upval), p1 (copy), p2 (copy), LuaLogoutReasonNamesModule (upval)
				Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.MoreLogOut))
			end, p3))
		end,
		logoutWithoutShowConfirmation = function(p1, p2)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.MoreLogOut))
		end
	}
end)(MoreLogOut)))))))