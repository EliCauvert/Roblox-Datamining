local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local MessageBusService = game:GetService("MessageBusService")
local TelemetryService = game:GetService("TelemetryService")
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SystemThemeMessageId = MessageBusService:GetMessageId("SystemTheme", "systemThemeSetTheme")
local SystemThemeMessageId1 = MessageBusService:GetMessageId("SystemTheme", "systemThemeSetThemeOverride")
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local Default = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default
local ThemeContext = require(CorePackages.Workspace.Packages.Style).ThemeContext
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local DeviceLevelThemeAnalyticsModule = require(Modules.LuaApp.Components.EventReceivers.Analytics.DeviceLevelThemeAnalytics)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local GetFFlagDefaultThemeEnabledModule = require(Modules.LuaApp.Flags.GetFFlagDefaultThemeEnabled)
local GetFFlagEnableThemeUpdatedLoggingFixModule = require(Modules.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix)
local GetFFlagSystemThemeExposureLoggingFixModule = require(Modules.LuaApp.Flags.GetFFlagSystemThemeExposureLoggingFix)
local GetFFlagUseNonYieldGetSystemThemeModule = require(Modules.LuaApp.Flags.GetFFlagUseNonYieldGetSystemTheme)
local GetSystemThemeModule = require(Modules.LuaApp.Components.EventReceivers.GetSystemTheme)
local FFlagDefaultKidsToDarkTheme = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDefaultKidsToDarkTheme
local FFlagFixDefaultThemeOverride = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixDefaultThemeOverride
local DeviceLevelThemeUpdater = RoactModule.Component:extend("DeviceLevelThemeUpdater")

function DeviceLevelThemeUpdater.init(p1)
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy), TelemetryService (copy), Logger (copy), HttpService (copy), FFlagDefaultKidsToDarkTheme (copy), SystemThemeFeatureModule (copy), AppStorageUtilitiesModule (copy), NotificationService (copy), LuaAppBacktraceReporterModule (copy), GetFFlagEnableThemeUpdatedLoggingFixModule (copy), MessageBusService (copy), SystemThemeMessageId (copy), SystemThemeMessageId1 (copy), RealtimeMessageId (copy), IXPServiceWrapper (copy), GetFFlagSystemThemeExposureLoggingFixModule (copy), AppBtidLayers (copy), GetSystemThemeModule (copy), GetFFlagDefaultThemeEnabledModule (copy), FFlagFixDefaultThemeOverride (copy)
	p1.deviceLevelThemeAnalytics = p1.props.deviceLevelThemeAnalytics or DeviceLevelThemeAnalyticsModule.new(TelemetryService)
	
	function p1.getHasResetToDefaultTheme(p2)
		-- upvalues: p1 (copy), Logger (upval)
		local LocalUserId = p1.props.localUserId
		local Result = p1.props.appStorageJsonCacheUtils:decodeInternal(p2).result
		local Entry = Result and Result[LocalUserId] or false
		Logger:info("Cached has reset to default theme: " .. tostring(Entry) .. " for storage key: " .. tostring(p2) .. " for userId: " .. tostring(LocalUserId))
		
		return Entry
	end
	
	function p1.setHasResetToDefaultTheme(p2, p3)
		-- upvalues: p1 (copy), Logger (upval), HttpService (upval)
		local LocalUserId = p1.props.localUserId
		local Result = p1.props.appStorageJsonCacheUtils:decodeInternal(p2).result or {}
		Result[LocalUserId] = p3
		Logger:info("Caching has reset to default theme: " .. tostring(p3) .. " for storage key: " .. tostring(p2) .. " for userId: " .. tostring(LocalUserId))
		p1.props.appStorageService:SetItem(p2, HttpService:JSONEncode(Result))
		p1.props.appStorageService:flush()
	end
	
	function p1.getShouldResetToDefaultTheme(): boolean
		-- upvalues: FFlagDefaultKidsToDarkTheme (upval), p1 (copy)
		return if FFlagDefaultKidsToDarkTheme and p1.props.appPolicyDefaultTheme then not p1.getHasResetToDefaultTheme("KidsAccountHasResetToDefaultTheme") else false
	end
	
	function p1.getCachedDeviceLevelThemeName()
		-- upvalues: p1 (copy), SystemThemeFeatureModule (upval), Logger (upval)
		local LocalUserId = p1.props.localUserId
		local Result = p1.props.appStorageJsonCacheUtils:decodeInternal(SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey).result
		local Entry = Result and Result[LocalUserId] or nil
		Logger:info("Cached device level theme name: " .. tostring(Entry) .. " for userId: " .. tostring(LocalUserId))
		
		return if Entry == "" then nil else Entry or nil
	end
	
	function p1.getCachedThemeName()
		-- upvalues: AppStorageUtilitiesModule (upval), Logger (upval), p1 (copy)
		local AuthenticatedTheme = AppStorageUtilitiesModule.getAuthenticatedTheme()
		Logger:info("Cached theme name: " .. tostring(AuthenticatedTheme) .. " for userId: " .. tostring(p1.props.localUserId))
		
		return if AuthenticatedTheme == "" then nil else AuthenticatedTheme or nil
	end
	
	function p1.changeAppTheme(Name)
		-- upvalues: p1 (copy), Logger (upval), NotificationService (upval), LuaAppBacktraceReporterModule (upval)
		p1.currentAppThemeName = Name
		local ThemeOverride = p1.themeOverride or Name
		Logger:info("Changing app theme to " .. ThemeOverride)
		p1.deviceLevelThemeAnalytics:onSetNativeTheme()
		NotificationService.SelectedTheme = ThemeOverride
		p1.props.themeContext.setTheme(ThemeOverride)
		LuaAppBacktraceReporterModule:updateSharedAttributes({ AppTheme = ThemeOverride })
	end
	
	function p1.setTheme(CurrentThemeEnum)
		-- upvalues: p1 (copy), Logger (upval), GetFFlagEnableThemeUpdatedLoggingFixModule (upval), SystemThemeFeatureModule (upval), HttpService (upval)
		if CurrentThemeEnum == p1.props.systemThemeEnum.Error then
			Logger:error("Received an error theme enum, not setting theme")
			
			return
		end
		if p1.currentThemeEnum == CurrentThemeEnum then
			Logger:info("Theme is already set to " .. CurrentThemeEnum.Name)
			
			return
		end
		Logger:info("Setting theme to " .. CurrentThemeEnum.Name)
		
		if not GetFFlagEnableThemeUpdatedLoggingFixModule() then
			p1.deviceLevelThemeAnalytics:onThemeChanged(CurrentThemeEnum)
		end
		p1.currentThemeEnum = CurrentThemeEnum
		
		if p1.props.systemThemeEnum.isLightTheme(CurrentThemeEnum) then
			p1.changeAppTheme(p1.props.systemThemeEnum.Light.Name)
		elseif p1.props.systemThemeEnum.isDarkTheme(CurrentThemeEnum) then
			p1.changeAppTheme(p1.props.systemThemeEnum.Dark.Name)
		end
		local LocalUserId = p1.props.localUserId
		local Result = p1.props.appStorageJsonCacheUtils:decodeInternal(SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey).result or {}
		Result[LocalUserId] = CurrentThemeEnum.Name
		Logger:info("Caching device level theme name: " .. CurrentThemeEnum.Name .. " for userId: " .. tostring(LocalUserId))
		p1.props.appStorageService:SetItem(SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey, HttpService:JSONEncode(Result))
		p1.props.appStorageService:flush()
	end
	
	if p1.props.systemThemeService then
		local MessageBusService1 = p1.props.messageBusService or MessageBusService
		p1.connections = {
			p1.props.systemThemeService.OnLuaThemeUpdated:Connect(function(Theme)
				-- upvalues: Logger (upval), p1 (copy)
				Logger:info("Received OnLuaThemeUpdated event with themeEnum: " .. Theme.Name)
				p1.deviceLevelThemeAnalytics:onReceivedSystemThemeUpdated()
				
				if p1.props.systemThemeEnum.isSystemTheme(p1.currentThemeEnum) then
					p1.props.systemThemeService:setTheme(Theme)
				end
			end),
			MessageBusService1:Subscribe(SystemThemeMessageId, function(p2)
				-- upvalues: Logger (upval), p1 (copy)
				local SystemTheme = p2.SystemTheme
				Logger:info("Received MESSAGE_SET_THEME_EVENT_ID event with themeEnumValue: " .. SystemTheme)
				p1.setTheme((p1.props.systemThemeEnum.getSystemThemeEnum(SystemTheme)))
			end, false, true),
			MessageBusService1:Subscribe(SystemThemeMessageId1, function(p2)
				-- upvalues: Logger (upval), p1 (copy)
				Logger:info("Received MESSAGE_SET_THEME_OVERRIDE_EVENT_ID event with themeEnumValue: " .. tostring(p2.ThemeOverride))
				p1.themeOverride = p2.ThemeOverride
				
				if p1.currentAppThemeName then
					p1.changeAppTheme(p1.currentAppThemeName)
				end
			end, false, true),
			MessageBusService1:Subscribe(RealtimeMessageId, function()
				-- upvalues: p1 (copy)
				p1.deviceLevelThemeAnalytics:onThemeSnapshot(p1.currentThemeEnum)
			end, false, true)
		}
	end
	function p1.getDefaultDeviceLevelTheme(CachedThemeName)
		-- upvalues: p1 (copy), Logger (upval), IXPServiceWrapper (upval), GetFFlagSystemThemeExposureLoggingFixModule (upval), AppBtidLayers (upval), GetSystemThemeModule (upval)
		local IxpDefaultThemeSelection = p1.props.ixpDefaultThemeSelection
		
		if p1.props.ixpDefaultThemeEnabled and (IxpDefaultThemeSelection and IxpDefaultThemeSelection ~= "") then
			Logger:info("No cached theme found, using default theme from IXP: " .. tostring(IxpDefaultThemeSelection))
			local IXPServiceWrapper1 = p1.props.IXPServiceWrapper or IXPServiceWrapper
			
			if GetFFlagSystemThemeExposureLoggingFixModule() then
				IXPServiceWrapper1:LogBrowserTrackerLayerExposure(AppBtidLayers.DefaultThemeLayer)
			else
				IXPServiceWrapper1:LogFlagLinkedUserLayerExposure(AppBtidLayers.DefaultThemeLayer)
			end
			if IxpDefaultThemeSelection == "system" then
				p1.deviceLevelThemeAnalytics:onRequestSystemTheme()
				local SystemThemeModule = p1.props.systemThemeService and GetSystemThemeModule(p1.props.systemThemeService) or p1.props.systemThemeEnum.Error
				p1.deviceLevelThemeAnalytics:onGetSystemTheme(SystemThemeModule)
				
				return SystemThemeModule
			else
				return p1.props.systemThemeEnum.getSystemThemeEnum(IxpDefaultThemeSelection)
			end
		elseif CachedThemeName then
			Logger:info("Found cached theme " .. CachedThemeName)
			
			return p1.props.systemThemeEnum.getSystemThemeEnum(CachedThemeName)
		else
			Logger:info("No cached theme found, defaulting to light theme")
			
			return p1.props.systemThemeEnum.Light
		end
	end
	
	function p1.initTheme()
		-- upvalues: p1 (copy), FFlagDefaultKidsToDarkTheme (upval), GetFFlagDefaultThemeEnabledModule (upval), Logger (upval), GetSystemThemeModule (upval), FFlagFixDefaultThemeOverride (upval)
		local CachedDeviceLevelThemeName = p1.getCachedDeviceLevelThemeName()
		local ShouldResetToDefaultTheme = if FFlagDefaultKidsToDarkTheme then p1.getShouldResetToDefaultTheme() else nil
		local SystemThemeEnum = nil
		
		if CachedDeviceLevelThemeName and not ShouldResetToDefaultTheme then
			Logger:info("Found cached device level theme " .. CachedDeviceLevelThemeName)
			SystemThemeEnum = p1.props.systemThemeEnum.getSystemThemeEnum(CachedDeviceLevelThemeName)
			
			if p1.props.systemThemeEnum.isSystemTheme(SystemThemeEnum) then
				p1.deviceLevelThemeAnalytics:onRequestSystemTheme()
				SystemThemeEnum = p1.props.systemThemeService and GetSystemThemeModule(p1.props.systemThemeService) or p1.props.systemThemeEnum.Error
				p1.deviceLevelThemeAnalytics:onGetSystemTheme(SystemThemeEnum)
			end
		else
			local CachedThemeName = p1.getCachedThemeName()
			
			if FFlagDefaultKidsToDarkTheme and p1.props.appPolicyDefaultTheme then
				SystemThemeEnum = p1.props.appPolicyDefaultTheme
				p1.setHasResetToDefaultTheme("KidsAccountHasResetToDefaultTheme", true)
			elseif GetFFlagDefaultThemeEnabledModule() then
				SystemThemeEnum = p1.getDefaultDeviceLevelTheme(CachedThemeName)
			elseif CachedThemeName then
				Logger:info("Found cached theme " .. CachedThemeName)
				SystemThemeEnum = p1.props.systemThemeEnum.getSystemThemeEnum(CachedThemeName)
			else
				Logger:info("No cached theme found, defaulting to light theme")
				SystemThemeEnum = p1.props.systemThemeEnum.Light
			end
		end
		if p1.props.systemThemeService and SystemThemeEnum then
			p1.deviceLevelThemeAnalytics:onThemeSnapshot(SystemThemeEnum)
			p1.deviceLevelThemeAnalytics:onSetNativeTheme()
			p1.props.systemThemeService:setTheme(SystemThemeEnum)
			
			if FFlagFixDefaultThemeOverride then
				p1.setTheme(SystemThemeEnum)
			end
		end
	end
end

function DeviceLevelThemeUpdater.render(p1)
	-- upvalues: Logger (copy), GetFFlagDefaultThemeEnabledModule (copy), FFlagDefaultKidsToDarkTheme (copy), GetFFlagUseNonYieldGetSystemThemeModule (copy)
	local LocalUserId = p1.props.localUserId
	
	if LocalUserId == nil or LocalUserId == "" or LocalUserId == "-1" or LocalUserId == "0" then
		Logger:info("userId is not available. Default to light theme")
		p1.changeAppTheme(p1.props.systemThemeEnum.Light.Name)
	else
		Logger:info("initTheme for userId " .. tostring(p1.props.localUserId))
		
		if GetFFlagDefaultThemeEnabledModule() or FFlagDefaultKidsToDarkTheme then
			if GetFFlagUseNonYieldGetSystemThemeModule() then
				p1.initTheme()
			else
				task.spawn(p1.initTheme)
			end
		else
			p1.initTheme()
		end
	end
	return nil
end

function DeviceLevelThemeUpdater.willUnmount(p1)
	for _, connection in pairs(p1.connections) do
		connection:disconnect()
	end
end

return function(p2)
	-- upvalues: ReactModule (copy), ThemeContext (copy), AppStorageService (copy), Default (copy), SystemThemeFeatureModule (copy), MessageBusService (copy), UseLocalUserIdFunction (copy), FFlagDefaultKidsToDarkTheme (copy), UseAppPolicyModule (copy), GetFFlagDefaultThemeEnabledModule (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), RoactModule (copy), DeviceLevelThemeUpdater (copy), CryoModule (copy)
	local SystemThemeEnum = p2.SystemThemeEnum or SystemThemeFeatureModule.GetSystemThemeEnum()
	local UseAppPolicyModuleResult = if FFlagDefaultKidsToDarkTheme then UseAppPolicyModule(function(p3)
		-- upvalues: SystemThemeEnum (copy)
		local SystemThemeEnum1 = SystemThemeEnum.getSystemThemeEnum(p3.getDefaultTheme())
		
		return if SystemThemeEnum1 == SystemThemeEnum.Error then nil else SystemThemeEnum1
	end) else nil
	local UseBrowserTrackerExperimentResult = if GetFFlagDefaultThemeEnabledModule() then RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.DefaultThemeLayer }, function(p3)
		-- upvalues: AppBtidLayers (upval)
		local v1 = p3[AppBtidLayers.DefaultThemeLayer] or {}
		
		return {
			IxpDefaultThemeSelection = v1.DefaultThemeSelection,
			IxpDefaultThemeEnabled = v1.DefaultThemeEnabled
		}
	end) else {}
	
	return RoactModule.createElement(DeviceLevelThemeUpdater, CryoModule.Dictionary.join(p2, {
		themeContext = ReactModule.useContext(ThemeContext),
		appStorageService = p2.AppStorageService or AppStorageService,
		appStorageJsonCacheUtils = p2.AppStorageJsonCacheUtils or Default,
		systemThemeEnum = SystemThemeEnum,
		systemThemeService = p2.SystemThemeService or SystemThemeFeatureModule.GetSystemThemeService(),
		messageBusService = p2.messageBusService or MessageBusService,
		localUserId = UseLocalUserIdFunction(),
		ixpDefaultThemeSelection = UseBrowserTrackerExperimentResult.IxpDefaultThemeSelection,
		ixpDefaultThemeEnabled = UseBrowserTrackerExperimentResult.IxpDefaultThemeEnabled,
		appPolicyDefaultTheme = if FFlagDefaultKidsToDarkTheme then UseAppPolicyModuleResult else nil
	}))
end