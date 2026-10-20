local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceInitializationModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceInitialization)
local AvatarSceneManagerModule = require(Modules.AvatarExperience.Common.Managers.AvatarSceneManager)
local ItemSelectionManagerModule = require(Modules.AvatarExperience.Common.Components.ItemSelectionManager)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local AvatarExperienceIXPDiagnosticsModule = require(Modules.AvatarExperience.Common.Debug.AvatarExperienceIXPDiagnostics)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local UsePrefetchMarketplaceModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.usePrefetchMarketplace)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseStoreFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXDebugPanel = AvatarExperienceFlagsModule.FFlagAXDebugPanel
local FFlagAXBackgroundsCycloramaVR = AvatarExperienceFlagsModule.FFlagAXBackgroundsCycloramaVR

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	return { authStatus = p1.AuthenticationStatus.status }
end, nil)(function(p1)
	-- upvalues: UseIsSpatialFunction (copy), UseStoreFunction (copy), LoginStatusModule (copy), AXPrefetchMarketplaceIXP (copy), UsePrefetchMarketplaceModule (copy), FFlagAXDebugPanel (copy), ReactModule (copy), CorePackages (copy), ItemSelectionManagerModule (copy), AvatarSceneManagerModule (copy), FFlagAXBackgroundsCycloramaVR (copy), AvatarExperienceInitializationModule (copy), AvatarExperienceIXPDiagnosticsModule (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local ShouldStart = p1.shouldStart
	local UseStoreResult = UseStoreFunction()
	local IsAuthStatusMatch = p1.authStatus == LoginStatusModule.LOGGED_IN or ShouldStart
	
	if AXPrefetchMarketplaceIXP.isEnabled() then
		UsePrefetchMarketplaceModule()
	end
	if FFlagAXDebugPanel then
		ReactModule.useEffect(function()
			-- upvalues: CorePackages (upval)
			return (require(CorePackages.Workspace.Packages.AvatarExperienceDebugSections).register())
		end, {})
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		ItemSelectionManager = ReactModule.createElement(ItemSelectionManagerModule),
		AvatarSceneManager = if IsAuthStatusMatch then ReactModule.createElement(AvatarSceneManagerModule, {
			store = UseStoreResult,
			shouldStart = ShouldStart,
			shouldManageBackground = not UseIsSpatialResult or FFlagAXBackgroundsCycloramaVR,
			isSpatial = UseIsSpatialResult,
			renderSky = ShouldStart
		}) else nil,
		AvatarExperienceInitialization = if IsAuthStatusMatch then ReactModule.createElement(AvatarExperienceInitializationModule) else nil,
		AvatarExperienceIXPDiagnostics = ReactModule.createElement(AvatarExperienceIXPDiagnosticsModule)
	})
end))