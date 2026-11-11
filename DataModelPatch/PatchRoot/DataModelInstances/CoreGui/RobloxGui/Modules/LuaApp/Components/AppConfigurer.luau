local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseDisableAutoFocusFunction = FocusNavigationUtilsModule.useDisableAutoFocus
local UseGlobalFocusHandlerFunction = FocusNavigationUtilsModule.useGlobalFocusHandler
local UseGlobalDefaultSelectionCursorFunction = FocusNavigationUtilsModule.useGlobalDefaultSelectionCursor
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local ReactProfiler = require(CorePackages.Workspace.Packages.RoactUtils).Profiling.ReactProfiler
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
game:DefineFastFlag("LuaAppInlineRequireAppConfigurer", false)

if not game:GetFastFlag("LuaAppInlineRequireAppConfigurer") then
	local _ = require(Modules.LuaApp.TenFootUI.TenFootUiDependencies)
	local _ = require(Modules.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup)
	local _ = require(Modules.LuaApp.Components.CentralOverlay)
	local _ = require(Modules.LuaApp.Constants)
	local _ = require(Modules.LuaApp.Components.ToastV2)
	local _ = require(Modules.LuaApp.Components.AppContainer)
end
return function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), UseDisableAutoFocusFunction (copy), UseGlobalFocusHandlerFunction (copy), UseGlobalDefaultSelectionCursorFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), Modules (copy), CorePackages (copy), ReactModule (copy), ReactProfiler (copy)
	UseGlobalFocusHandlerFunction(not FFlagAXMigrateAXToGlobalAutofocus and UseDisableAutoFocusFunction())
	UseGlobalDefaultSelectionCursorFunction()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UiModeInfo = p1.uiModeInfo or UseUiModeInfoResult
	
	if UiModeInfo.uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then
		local TenFootUiDependenciesModule = require(Modules.LuaApp.TenFootUI.TenFootUiDependencies)
		local CentralOverlayModule = require(Modules.LuaApp.Components.CentralOverlay)
		local ConstantsModule = require(Modules.LuaApp.Constants)
		local ToastV2Module = require(Modules.LuaApp.Components.ToastV2)
		local TenFootUiContainer = require(CorePackages.Workspace.Packages.TenFootUiShell).TenFootUiContainer
		settings().Rendering.EnableFRM = true
		settings().Rendering.AutoFRMLevel = settings().Rendering:GetMaxQualityLevel()
		
		return ReactModule.createElement(ReactProfiler, { id = "AppConfigurer" }, ReactModule.createElement(TenFootUiContainer, {
			store = p1.store,
			dependencies = TenFootUiDependenciesModule,
			toast = ReactModule.createElement(ToastV2Module, { displayOrder = ConstantsModule.DisplayOrder.Toast }),
			centralOverlay = ReactModule.createElement(CentralOverlayModule, {
				includeStatusBar = false,
				displayOrder = ConstantsModule.DisplayOrder.CentralOverlay
			})
		}))
	else
		if FFlagEnableLeftNavOnConsole and UiModeInfo.uiMode == UiMode.TenFoot then
			settings().Rendering.EnableFRM = true
			settings().Rendering.AutoFRMLevel = settings().Rendering:GetMaxQualityLevel()
		end
		return ReactModule.createElement(ReactProfiler, { id = "AppConfigurer" }, {
			AppContainer = ReactModule.createElement(require(Modules.LuaApp.Components.AppContainer), { store = p1.store })
		})
	end
end