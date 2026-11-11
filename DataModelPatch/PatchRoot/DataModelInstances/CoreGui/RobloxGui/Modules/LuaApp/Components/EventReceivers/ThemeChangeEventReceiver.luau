local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local MemStorageService = game:GetService("MemStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local FetchThemeModule = require(Modules.LuaApp.Thunks.FetchTheme)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local ThemeContext = require(CorePackages.Workspace.Packages.Style).ThemeContext
local SystemThemeEnabled = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature).GetSystemThemeEnabled()
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local ThemeUpdater = RoactModule.Component:extend("ThemeUpdater")

function ThemeUpdater.init(p1)
	-- upvalues: SystemThemeEnabled (copy), NotificationService (copy), LuaAppBacktraceReporterModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), AppStorageUtilitiesModule (copy), FetchThemeModule (copy), Players (copy)
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	local Networking = p1.props.networking
	
	function p1.changeTheme(AppTheme)
		-- upvalues: SystemThemeEnabled (upval), p1 (copy), NotificationService (upval), LuaAppBacktraceReporterModule (upval)
		if SystemThemeEnabled then return end
		if p1.props.themeOverride then
			AppTheme = p1.props.themeOverride
		end
		NotificationService.SelectedTheme = AppTheme
		p1.props.themeContext.setTheme(AppTheme)
		LuaAppBacktraceReporterModule:updateSharedAttributes({ AppTheme = AppTheme })
	end
	
	function p1.updateTheme()
		-- upvalues: MemStorageService (upval), MemStorageKeysModule (upval), p1 (copy), AppStorageUtilitiesModule (upval), FetchThemeModule (upval), Networking (copy), Players (upval)
		local function cacheAndChangeTheme(AppTheme)
			-- upvalues: MemStorageService (upval), MemStorageKeysModule (upval), p1 (upval), AppStorageUtilitiesModule (upval)
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, AppTheme)
			p1.changeTheme(AppTheme)
			AppStorageUtilitiesModule.setAuthenticatedTheme(AppTheme)
			AppStorageUtilitiesModule.flush()
		end
		
		return if p1.props.themeOverride then cacheAndChangeTheme(p1.props.themeOverride) else FetchThemeModule(Networking, Players.LocalPlayer.UserId):andThen(function(Result)
			-- upvalues: MemStorageService (upval), MemStorageKeysModule (upval), p1 (upval), AppStorageUtilitiesModule (upval)
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, Result)
			p1.changeTheme(Result)
			AppStorageUtilitiesModule.setAuthenticatedTheme(Result)
			AppStorageUtilitiesModule.flush()
		end)
	end
	
	p1.tokens = {
		RobloxEventReceiver:observeEvent("UserThemeTypeChangeNotification", function(p2, p3)
			-- upvalues: p1 (copy)
			if (p2.Type or p3) == "ThemeUpdate" then
				p1.updateTheme()
			end
		end),
		MemStorageService:Bind(MemStorageKeysModule.ThemeUpdate, function(AppTheme)
			-- upvalues: p1 (copy)
			p1.changeTheme(AppTheme)
		end)
	}
end

function ThemeUpdater:render() end

function ThemeUpdater.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

return RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService
})(function(p2)
	-- upvalues: UseAppPolicyModule (copy), ReactModule (copy), ThemeContext (copy), RoactModule (copy), ThemeUpdater (copy), CryoModule (copy)
	return RoactModule.createElement(ThemeUpdater, CryoModule.Dictionary.join(p2, {
		themeOverride = UseAppPolicyModule(function(p3)
			return p3.getForceTheme()
		end),
		themeContext = ReactModule.useContext(ThemeContext)
	}))
end)