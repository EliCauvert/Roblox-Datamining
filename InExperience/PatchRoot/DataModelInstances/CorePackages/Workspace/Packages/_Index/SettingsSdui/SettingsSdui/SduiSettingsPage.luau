local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local Parent = SettingsSdui.Parent
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local FFlagSduiSettingsFocusRef = require(Parent.SharedFlags).FFlagSduiSettingsFocusRef
local SduiPageWrapperEntryPoint = SduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local SettingsSduiConstantsModule = require(SettingsSdui.SettingsSduiConstants)
local FetchSettingsPageModule = require(SettingsSdui.fetchSettingsPage)
local Settings = require(Parent.RobloxAppEnums).AppPage.Settings
local ConfigKey = SettingsSduiConstantsModule.ConfigKey
local SurfaceLoadTimeEventName = SettingsSduiConstantsModule.SurfaceLoadTimeEventName
local Composition = {
	layout = require(Parent.AppComposition).CompositionTags.Layout.Detail
}

return ReactModule.memo(function(p1)
	-- upvalues: UsePageScopeRefFunction (copy), ConfigKey (copy), ReactModule (copy), SduiSurfaceLoadTimeTracker (copy), SurfaceLoadTimeEventName (copy), FetchSettingsPageModule (copy), SduiPageWrapperEntryPoint (copy), Settings (copy), Composition (copy), FFlagSduiSettingsFocusRef (copy)
	UsePageScopeRefFunction(ConfigKey)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SduiSurfaceLoadTimeTracker (upval), ConfigKey (upval), SurfaceLoadTimeEventName (upval)
		local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ConfigKey, {
			eventName = SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		LoadTimerWithSurfaceLoadTime.start("mount")
		
		return LoadTimerWithSurfaceLoadTime
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FetchSettingsPageModule (upval), UseMemoResult (copy)
		FetchSettingsPageModule(UseMemoResult)
	end, { UseMemoResult })
	
	return ReactModule.createElement(SduiPageWrapperEntryPoint, {
		appPage = Settings,
		configKey = ConfigKey,
		pageTimer = UseMemoResult,
		refresh = ReactModule.useCallback(function()
			-- upvalues: SduiSurfaceLoadTimeTracker (upval), ConfigKey (upval), SurfaceLoadTimeEventName (upval), FetchSettingsPageModule (upval)
			local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ConfigKey, {
				eventName = SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			LoadTimerWithSurfaceLoadTime.start("refresh")
			FetchSettingsPageModule(LoadTimerWithSurfaceLoadTime, true)
		end, {}),
		composition = Composition,
		pageTopPadding = p1.pageTopPadding,
		defaultFocusRef = if FFlagSduiSettingsFocusRef then p1.defaultFocusRef else nil,
		backgroundStyle = p1.backgroundStyle
	})
end)