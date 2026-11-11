local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactProfiler = require(CorePackages.Workspace.Packages.RoactUtils).Profiling.ReactProfiler
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local CompositionStyleSheet = require(CorePackages.Workspace.Packages.AppComposition).CompositionStyleSheet
local CollectionViewsModule = require(CorePackages.Workspace.Packages.CollectionViews)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppEnableStickyShortcutBar = SharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local GetFFlagLuaAppFixStudioNotchSupportModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local FFlagLuaAppFixStudioNotchSupportModule = SharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and GetFFlagLuaAppFixStudioNotchSupportModule()
local FFlagFixNavigationInsetsOnHiddenTabBar = SharedFlagsModule.FFlagFixNavigationInsetsOnHiddenTabBar
local FFlagGuacStickyShortcutBarEnabled = SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local AppShortcutBarStatusListener = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then require(CorePackages.Workspace.Packages.AppShortcutBar).AppShortcutBarStatusListener else nil

return function(p1)
	-- upvalues: ReactModule (copy), CollectionViewsModule (copy), FFlagLuaAppEnableStickyShortcutBar (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicyFunction (copy), ReactProfiler (copy), CompositionStyleSheet (copy), ResponsiveModule (copy), AppShortcutBarStatusListener (copy), FFlagLuaAppFixStudioNotchSupportModule (copy), UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), AppNavBarModule (copy), FFlagFixNavigationInsetsOnHiddenTabBar (copy)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: CollectionViewsModule (upval)
		local MainCollectionLayoutStore = CollectionViewsModule.getMainCollectionLayoutStore(false)
		
		if MainCollectionLayoutStore.setDefaultContentRegionWidth then
			MainCollectionLayoutStore.setDefaultContentRegionWidth(Frame.AbsoluteSize.X)
		end
	end, {})
	local UseBindingResult = nil
	local OnHeightChanged = nil
	local UseMemoResult = nil
	
	if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then
		UseBindingResult, OnHeightChanged = ReactModule.useBinding(0)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseBindingResult (ref)
			return UseBindingResult:map(function(p2): UDim2
				return UDim2.new(1, 0, 1, -p2)
			end)
		end, { UseBindingResult })
	end
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicyFunction(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) else nil
	local Element = ReactModule.createElement(ReactProfiler, { id = "AppNavContainer" }, {
		CompositionStyleSheet = ReactModule.createElement(CompositionStyleSheet),
		ResponsiveContainerFrame = ReactModule.createElement(ResponsiveModule.ResponsiveContainerFrame),
		NavigatorView = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled and UseAppPolicyResult then UseMemoResult else UDim2.new(1, 0, 1, 0),
			ZIndex = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, p1.children),
		ShortcutBarStatusListener = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled and UseAppPolicyResult then ReactModule.createElement(AppShortcutBarStatusListener, { onHeightChanged = OnHeightChanged }) else nil
	})
	
	if FFlagLuaAppFixStudioNotchSupportModule then
		local UseNavBarPlacementResult = UseNavBarPlacementFunction()
		local UseNavBarSizeResult = UseNavBarSizeFunction()
		local IsUseNavBarPlacementResultMatch = UseNavBarPlacementResult == AppNavBarModule.Placement.Left
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = if IsUseNavBarPlacementResultMatch and (not FFlagFixNavigationInsetsOnHiddenTabBar or p1.isTabBarVisible) then UDim2.new(0, UseNavBarSizeResult, 0, 0) else UDim2.new(0, 0, 0, 0),
			Size = if IsUseNavBarPlacementResultMatch and (not FFlagFixNavigationInsetsOnHiddenTabBar or p1.isTabBarVisible) then UDim2.new(1, -UseNavBarSizeResult, 1, 0) else UDim2.new(1, 0, 1, 0)
		}, { Inner = Element })
	else
		return Element
	end
end