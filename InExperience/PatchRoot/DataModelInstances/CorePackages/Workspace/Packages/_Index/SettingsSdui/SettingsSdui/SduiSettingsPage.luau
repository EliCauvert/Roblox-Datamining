local settingsSdui = script:FindFirstAncestor("SettingsSdui")
local parent = settingsSdui.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local compositionTags = require(parent.AppComposition).CompositionTags
local reactModule = require(parent.React)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageWrapperEntryPoint = sduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local settingsSduiConstantsModule = require(settingsSdui.SettingsSduiConstants)
local fetchSettingsPageModule = require(settingsSdui.fetchSettingsPage)
local settings = appPage.Settings
local configKey = settingsSduiConstantsModule.ConfigKey
local surfaceLoadTimeEventName = settingsSduiConstantsModule.SurfaceLoadTimeEventName
local t = { layout = compositionTags.Layout.Detail }

return reactModule.memo(function(value)
	-- upvalues: usePageScopeRef (ref), configKey (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), surfaceLoadTimeEventName (ref), fetchSettingsPageModule (ref), sduiPageWrapperEntryPoint (ref), settings (ref), t (ref)
	usePageScopeRef(configKey)
	local var1 = reactModule.useMemo(function()
		-- upvalues: sduiSurfaceLoadTimeTracker (copy), configKey (copy), surfaceLoadTimeEventName (copy)
		local var2 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
			eventName = surfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		var2.start("mount")
		
		return var2
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fetchSettingsPageModule (copy), var1 (ref)
		fetchSettingsPageModule(var1)
	end, { var1 })
	
	return reactModule.createElement(sduiPageWrapperEntryPoint, {
		appPage = settings,
		configKey = configKey,
		pageTimer = var1,
		refresh = reactModule.useCallback(function()
			-- upvalues: sduiSurfaceLoadTimeTracker (copy), configKey (copy), surfaceLoadTimeEventName (copy), fetchSettingsPageModule (copy)
			local var2 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
				eventName = surfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			var2.start("refresh")
			fetchSettingsPageModule(var2, true)
		end, {}),
		composition = t,
		pageTopPadding = value.pageTopPadding
	})
end)