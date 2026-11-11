local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OpenCentralOverlayForConfirmSignOutModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut)
local DeprecatedDarkThemeModule = require(Modules.LuaApp.Themes.DeprecatedDarkTheme)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ConsoleDisconnectFunction = require(CorePackages.Workspace.Packages.AuthCommon).Thunks.ConsoleDisconnect
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default

return function()
	-- upvalues: UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AppGuiService (copy), ReactModule (copy), Default (copy), TelemetryConfigs (copy), OpenCentralOverlayForConfirmSignOutModule (copy), ConsoleDisconnectFunction (copy), LogoutModule (copy), DeprecatedDarkThemeModule (copy), Button (copy), ButtonType (copy)
	local DisconnectTextFont = UseDesignTokensFunction().LuaApps.More.DisconnectTextFont
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ logout = "Application.Logout.Action.Logout" })
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppGuiService)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		DisconnectButton = ReactModule.createElement(Button, {
			buttonType = ButtonType.Secondary,
			size = UDim2.new(1, 0, 1, 0),
			text = UseLocalizationResult.logout,
			fontStyle = DisconnectTextFont,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Default (upval), TelemetryConfigs (upval), UseDispatchResult (copy), OpenCentralOverlayForConfirmSignOutModule (upval), ConsoleDisconnectFunction (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), LogoutModule (upval), DeprecatedDarkThemeModule (upval)
				pcall(function()
					-- upvalues: Default (upval), TelemetryConfigs (upval)
					Default:logRobloxTelemetryCounter(TelemetryConfigs.LogoutButtonClickedConfig, 1)
				end)
				UseDispatchResult(OpenCentralOverlayForConfirmSignOutModule(function()
					-- upvalues: UseDispatchResult (upval), ConsoleDisconnectFunction (upval), UseRoactServiceModuleResult (upval), UseRoactServiceModuleResult1 (upval), LogoutModule (upval)
					UseDispatchResult(ConsoleDisconnectFunction(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, LogoutModule))
				end, DeprecatedDarkThemeModule))
			end, {
				UseDispatchResult,
				UseRoactServiceModuleResult,
				UseRoactServiceModuleResult1
			})
		})
	})
end