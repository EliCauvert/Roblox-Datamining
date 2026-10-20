local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ResponsiveModule = require(Parent.Responsive)
local ReactModule = require(Parent.React)
local GetOrCreateSurfaceGuiContainerModule = require(TenFootUiShell.getOrCreateSurfaceGuiContainer)
local GetOrCreateWorkSpaceContainerModule = require(TenFootUiShell.getOrCreateWorkSpaceContainer)
local TenFootUiGlobalEffectsModule = require(TenFootUiShell.Components.TenFootUiGlobalEffects)
local GlobalNavContainer = require(Parent.TenFootUiGlobalNav).GlobalNavContainer
local TenFootUiContext = require(Parent.TenFootUiCommon).TenFootUiContext
local AppShortcutBarModule = require(Parent.AppShortcutBar)
local AppShortcutBarContainer = AppShortcutBarModule.AppShortcutBarContainer
local AppShortcutBarContext = AppShortcutBarModule.AppShortcutBarContext
local TenFootUiLayoutModule = require(script.Parent.TenFootUiLayout)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local UseOverlayFunction = require(Parent.Foundation).Hooks.useOverlay
local SduiDiscoveryDependencyUpdater = require(Parent.ServerDrivenUi).SduiDiscoveryDependencyUpdater
local SduiAvatarExperienceRegister = require(Parent.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister
local SduiSharedRegister = require(Parent.SduiSharedContent).SduiSharedRegister
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableAvatarExperienceSdui = SharedFlagsModule.FFlagEnableAvatarExperienceSdui
local CollectionViewsModule = require(Parent.CollectionViews)
local EnableProgressLoadingAssetsTenFoot = game:DefineFastFlag("EnableProgressLoadingAssetsTenFoot", false)
local ProgressLoadingAssetsScreenGui = if EnableProgressLoadingAssetsTenFoot then require(Parent.ProgressLoading).ProgressLoadingAssetsScreenGui else nil
local EnableSduiRegistriesforTenFootUiContainer = game:DefineFastFlag("EnableSduiRegistriesforTenFootUiContainer", false)
local FFlagLuaAppUseOverlayInAppContainer = SharedFlagsModule.FFlagLuaAppUseOverlayInAppContainer

local function RootViewContainer(p1)
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), CollectionViewsModule (copy), GetOrCreateSurfaceGuiContainerModule (copy), GetOrCreateWorkSpaceContainerModule (copy), UseNavigationFunction (copy)
	local UseContextResult = ReactModule.useContext(ResponsiveModule.ContainerRef)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), CollectionViewsModule (upval)
		local Current = if UseContextResult then UseContextResult.current else nil
		
		if not Current then return end
		local MainCollectionLayoutStore = CollectionViewsModule.getMainCollectionLayoutStore(false)
		
		if MainCollectionLayoutStore.setDefaultContentRegionWidth then
			MainCollectionLayoutStore.setDefaultContentRegionWidth(Current.AbsoluteSize.X)
		end
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: MainCollectionLayoutStore (copy), Current (copy)
			if MainCollectionLayoutStore.setDefaultContentRegionWidth then
				MainCollectionLayoutStore.setDefaultContentRegionWidth(Current.AbsoluteSize.X)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseContextResult })
	
	return (ReactModule.createElement(ReactModule.Fragment, nil, {
		ResponsiveContainerFrame = ReactModule.createElement(ResponsiveModule.ResponsiveContainerFrame),
		NavigatorView = ReactModule.createElement(p1.dependencies.RootNavigator, {
			navigation = UseNavigationFunction(),
			screenProps = {
				surfaceGuiContainer = GetOrCreateSurfaceGuiContainerModule(),
				worldContainer = GetOrCreateWorkSpaceContainerModule()
			}
		})
	}))
end

return function(p1)
	-- upvalues: FFlagLuaAppUseOverlayInAppContainer (copy), UseOverlayFunction (copy), GetOrCreateSurfaceGuiContainerModule (copy), GetOrCreateWorkSpaceContainerModule (copy), ReactModule (copy), TenFootUiLayoutModule (copy), RootViewContainer (copy), GlobalNavContainer (copy), AppShortcutBarContainer (copy), EnableProgressLoadingAssetsTenFoot (copy), ProgressLoadingAssetsScreenGui (ref), TenFootUiGlobalEffectsModule (copy), SduiSharedRegister (copy), EnableSduiRegistriesforTenFootUiContainer (copy), SduiDiscoveryDependencyUpdater (copy), FFlagEnableAvatarExperienceSdui (copy), SduiAvatarExperienceRegister (copy), TenFootUiContext (copy), AppShortcutBarContext (copy), ProviderContainer (copy)
	if FFlagLuaAppUseOverlayInAppContainer then
		UseOverlayFunction()
	end
	local Element = ReactModule.createElement(ReactModule.Fragment, nil, {
		Toast = p1.toast,
		CentralOverlay = p1.centralOverlay,
		TenFootUiLayout = ReactModule.createElement(TenFootUiLayoutModule, {
			adorneeParent = GetOrCreateWorkSpaceContainerModule(),
			surfaceGuiParent = GetOrCreateSurfaceGuiContainerModule(),
			rootViewSlot = ReactModule.createElement(RootViewContainer, p1),
			globalNavSlot = ReactModule.createElement(GlobalNavContainer),
			controllerBarSlot = ReactModule.createElement(AppShortcutBarContainer)
		}),
		ProgressLoadingAssetsScreenGui = if EnableProgressLoadingAssetsTenFoot then ReactModule.createElement(ProgressLoadingAssetsScreenGui) else nil,
		GlobalEffects = ReactModule.createElement(TenFootUiGlobalEffectsModule),
		SduiSharedRegister = ReactModule.createElement(SduiSharedRegister),
		SduiDiscoveryDependencyUpdater = if EnableSduiRegistriesforTenFootUiContainer then ReactModule.createElement(SduiDiscoveryDependencyUpdater) else nil,
		SduiAvatarExperienceRegister = if EnableSduiRegistriesforTenFootUiContainer and FFlagEnableAvatarExperienceSdui then ReactModule.createElement(SduiAvatarExperienceRegister) else nil
	})
	local List = {}
	table.insert(List, {
		class = TenFootUiContext.Provider,
		props = { value = p1.dependencies }
	})
	table.insert(List, { class = AppShortcutBarContext.Provider })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, Element)
end