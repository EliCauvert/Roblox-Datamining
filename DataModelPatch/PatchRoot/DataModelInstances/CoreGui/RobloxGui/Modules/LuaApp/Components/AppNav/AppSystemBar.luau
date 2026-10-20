local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRReadyWrapper = VrCompatibilityModule.VRReadyWrapper
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local GetFFlagEnableNavigationPerformanceIntervalsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local SystemBarLabelTextSizeBindingModule = require(Modules.LuaApp.Util.SystemBarLabelTextSizeBinding)
local BuildCreatorWebNavUrlModule = require(Modules.LuaApp.buildCreatorWebNavUrl)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local BumperHint = require(CorePackages.Workspace.Packages.BumperNavigation).BumperHint
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local GetFFlagLuaAppEnableTopBannerFunction = SharedFlagsModule.GetFFlagLuaAppEnableTopBanner
local AXAppSystemBarEnableTelemtryForFPS = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPS", false)
local AXAppSystemBarEnableTelemtryForFPSForAll = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPSForAll", false)
local WebViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local FFlagShrinkAppNavBar = SharedFlagsModule.FFlagShrinkAppNavBar
local FFlagLuaAppFixStudioNotchSupportModule = SharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and GetFFlagLuaAppFixStudioNotchSupportModule()
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagAddGamepadBumperNavigation = SharedFlagsModule.FFlagAddGamepadBumperNavigation
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local AppSystemBar: (any) -> any = RoactModule.PureComponent:extend("AppSystemBar")

local function _(p1): boolean
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), AppPagePropertiesModule (copy)
	local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	local AppPagePropertiesModuleEntry = AppPagePropertiesModule[SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name]
	
	return AppPagePropertiesModuleEntry and AppPagePropertiesModuleEntry.webView == true
end

AppSystemBar.validateProps = TModule.strictInterface({
	isVisible = TModule.boolean,
	displayOrder = TModule.optional(TModule.number),
	layoutInfo = TModule.optional(TModule.table),
	selectedIndex = TModule.optional(TModule.number),
	items = TModule.array(TModule.any),
	onActivated = TModule.callback,
	vrPanelWidthMultiplier = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	vrPanelCurvature = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	xOffset = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	yOffset = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	zOffset = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	heightModifier = if FFlagLuaAppForceVrAppPanelWidthRollout then nil else TModule.optional(TModule.number),
	globalGuiInset = TModule.optional(TModule.table),
	isSpatial = TModule.boolean,
	navBarPlacement = TModule.valueOf(AppNavBarModule.Placement),
	navBarSize = TModule.number,
	showTooltip = if WebViewRedesignEnabledEngineFeature then TModule.optional(TModule.boolean) else nil,
	statusBarHeight = TModule.number,
	customEventMap = if FFlagAddGamepadBumperNavigation then TModule.optional(TModule.table) else nil,
	customEventHandlers = if FFlagAddGamepadBumperNavigation then TModule.optional(TModule.table) else nil,
	isBumperNavigationEnabled = if FFlagAddGamepadBumperNavigation then TModule.optional(TModule.boolean) else nil,
	leadingComponent = if FFlagAddGamepadBumperNavigation then TModule.optional(TModule.table) else nil,
	trailingComponent = if FFlagAddGamepadBumperNavigation then TModule.optional(TModule.table) else nil
})
AppSystemBar.defaultProps = { displayOrder = 0, selectedIndex = 1 }

if GetFFlagEnableNavigationPerformanceIntervalsFunction() then
	function AppSystemBar.init(p1)
		p1.alreadyTrackedPerformanceIntervals = {}
	end
	
	function AppSystemBar.getPerformanceTrackerIntervalName(p1, Page): string
		if p1.alreadyTrackedPerformanceIntervals[Page] == nil then
			p1.alreadyTrackedPerformanceIntervals[Page] = true
			
			return "go_to_" .. tostring(Page) .. "_" .. "cold"
		else
			return "go_to_" .. tostring(Page) .. "_" .. "warm"
		end
	end
end
function AppSystemBar.getAppNavBarProps(p1)
	-- upvalues: AppNavBarModule (copy), ConstantsModule (copy), FFlagShrinkAppNavBar (copy), FFlagLuaAppFixStudioNotchSupportModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy), MemoizeFunction (copy), CryoModule (copy), GetFFlagEnableNavigationPerformanceIntervalsFunction (copy), AXAppSystemBarEnableTelemtryForFPS (copy), AppPageModule (copy), IntervalPerformanceTracker (copy), AXAppSystemBarEnableTelemtryForFPSForAll (copy), SystemBarLabelTextSizeBindingModule (copy), BuildCreatorWebNavUrlModule (copy), FFlagAddGamepadBumperNavigation (copy)
	local IsSpatial = p1.props.isSpatial
	local NavBarPlacement = p1.props.navBarPlacement
	local Position: UDim2? = nil
	local Size: UDim2? = nil
	local NavBarSize = p1.props.navBarSize
	
	if IsSpatial then
		Position = UDim2.fromOffset(0, 0)
		Size = UDim2.new(0, NavBarSize, 1, 0)
	elseif NavBarPlacement == AppNavBarModule.Placement.Bottom then
		Position = UDim2.new(0, 0, 1, -ConstantsModule.BOTTOM_BAR_SIZE)
		Size = UDim2.new(1, 0, 0, ConstantsModule.BOTTOM_BAR_SIZE + (if FFlagShrinkAppNavBar then ConstantsModule.BOTTOM_BAR_PADDING_BOTTOM else 0))
	elseif NavBarPlacement == AppNavBarModule.Placement.Left then
		if FFlagLuaAppFixStudioNotchSupportModule then
			Position = UDim2.new(0, 0, 0, (if GetFFlagLuaAppEnableTopBannerFunction() then -p1.props.globalGuiInset.top else 0) + p1.props.statusBarHeight)
			Size = UDim2.new(0, NavBarSize, 1, if GetFFlagLuaAppEnableTopBannerFunction() then p1.props.globalGuiInset.top else 0)
		else
			Position = UDim2.new(0, -NavBarSize, 0, (if GetFFlagLuaAppEnableTopBannerFunction() then -p1.props.globalGuiInset.top else 0) + p1.props.statusBarHeight)
			Size = UDim2.new(0, NavBarSize, 1, (if GetFFlagLuaAppEnableTopBannerFunction() then p1.props.globalGuiInset.top else 0) - p1.props.statusBarHeight)
		end
	else
		error(`unexpected navBarPlacement value: {NavBarPlacement}`)
	end
	p1.getAppNavBarItems = p1.getAppNavBarItems or MemoizeFunction(function(p2)
		-- upvalues: CryoModule (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), AXAppSystemBarEnableTelemtryForFPS (upval), AppPageModule (upval), IntervalPerformanceTracker (upval), p1 (copy), AXAppSystemBarEnableTelemtryForFPSForAll (upval)
		return CryoModule.List.map(p2, function(p3)
			-- upvalues: CryoModule (upval), GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), AXAppSystemBarEnableTelemtryForFPS (upval), AppPageModule (upval), IntervalPerformanceTracker (upval), p1 (upval), AXAppSystemBarEnableTelemtryForFPSForAll (upval)
			return CryoModule.Dictionary.join(p3, {
				badgeValue = if p3.badgeCount == nil or p3.badgeCount == 0 then nil else p3.badgeCount,
				onActivated = function()
					-- upvalues: GetFFlagEnableNavigationPerformanceIntervalsFunction (upval), p3 (copy), AXAppSystemBarEnableTelemtryForFPS (upval), AppPageModule (upval), IntervalPerformanceTracker (upval), p1 (upval), AXAppSystemBarEnableTelemtryForFPSForAll (upval)
					if GetFFlagEnableNavigationPerformanceIntervalsFunction() and p3.page ~= nil then
						local IsPageMatch = AXAppSystemBarEnableTelemtryForFPS and p3.page == AppPageModule.AvatarExperienceRoot or nil
						IntervalPerformanceTracker:startTracking(p1:getPerformanceTrackerIntervalName(p3.page), 2, nil, AXAppSystemBarEnableTelemtryForFPSForAll or IsPageMatch, AXAppSystemBarEnableTelemtryForFPSForAll or IsPageMatch)
					end
					return p1.props.onActivated(p3.page, p3.actionType)
				end
			})
		end)
	end)
	
	return {
		items = p1.getAppNavBarItems(p1.props.items),
		placement = NavBarPlacement,
		position = Position,
		size = Size,
		systemBarLabelTextSizeBinding = if FFlagShrinkAppNavBar then nil else SystemBarLabelTextSizeBindingModule,
		buildCreatorWebNavUrl = BuildCreatorWebNavUrlModule,
		selectedIndex = p1.props.selectedIndex,
		isVisible = p1.props.isVisible,
		clipsDescendants = not IsSpatial and nil,
		showTooltip = p1.props.showTooltip,
		leadingComponent = if FFlagAddGamepadBumperNavigation then p1.props.leadingComponent else nil,
		trailingComponent = if FFlagAddGamepadBumperNavigation then p1.props.trailingComponent else nil
	}
end

function AppSystemBar.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), VRConstants (copy), RoactModule (copy), VRReadyWrapper (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagAddGamepadBumperNavigation (copy), AppNavBarModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy)
	local LayoutInfo = p1.props.layoutInfo
	local NavBarSize = p1.props.navBarSize
	local Background = LayoutInfo and LayoutInfo.Background or {}
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				NavigationBar = {
					Color = p2.Color.Common.NavigationBar.Color3,
					Transparency = p2.Color.Common.NavigationBar.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: FFlagLuaAppForceVrAppPanelWidthRollout (upval), p1 (copy), GetFFlagVRPanelWidthIXPEnabledFunction (upval), VRConstants (upval), RoactModule (upval), VRReadyWrapper (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), FFlagAddGamepadBumperNavigation (upval), AppNavBarModule (upval), Background (copy), NavBarSize (copy), GetFFlagLuaAppEnableTopBannerFunction (upval)
		local XOffset = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.xOffset then 0 else p1.props.xOffset
		local YOffset = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.yOffset then 0 else p1.props.yOffset
		local ZOffset = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.zOffset then 0 else p1.props.zOffset
		local AppSystemBarPosition = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() or not p1.props.vrPanelWidthMultiplier then VRConstants.AppSystemBarPosition else Vector3.new(VRConstants.AppSystemBarPosition.X * p1.props.vrPanelWidthMultiplier + XOffset, VRConstants.AppSystemBarPosition.Y + YOffset, VRConstants.AppSystemBarPosition.Z + ZOffset)
		
		return RoactModule.createElement(VRReadyWrapper, {
			component = "Frame",
			props = {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			},
			vrProps = {
				panelName = "AppSystemBar",
				partSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.heightModifier then VRConstants.AppSystemBarSize else Vector2.new(VRConstants.AppSystemBarSize.X, VRConstants.AppSystemBarSize.Y * p1.props.heightModifier),
				offset = if FFlagLuaAppForceVrAppPanelWidthRollout or GetFFlagVRPanelWidthIXPEnabledFunction() and p1.props.vrPanelCurvature == 0 then CFrame.new(AppSystemBarPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(AppSystemBarPosition, VRConstants.DefaultCameraPosition, vector.create(0, 1, 0)),
				virtualScreenSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.heightModifier then VRConstants.AppSystemBarResolution else Vector2.new(VRConstants.AppSystemBarResolution.X, VRConstants.AppSystemBarResolution.Y * p1.props.heightModifier),
				roundedCornersFrameColor = p2.Theme.NavigationBar.Color,
				hidden = not p1.props.isVisible
			}
		}, RoactModule.createElement(FocusNavigableSurfaceWrapper, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.NavBar,
			customEventMap = if FFlagAddGamepadBumperNavigation then p1.props.customEventMap else nil,
			customEventHandlers = if FFlagAddGamepadBumperNavigation then p1.props.customEventHandlers else nil
		}, {
			Background = if p1.props.navBarPlacement == AppNavBarModule.Placement.Bottom then RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Active = true,
				ZIndex = 0,
				AnchorPoint = Background.AnchorPoint,
				Position = Background.Position,
				Size = Background.Size,
				BackgroundTransparency = p2.Theme.NavigationBar.Transparency,
				BackgroundColor3 = p2.Theme.NavigationBar.Color
			}) else nil,
			StatusBarBackground = if p1.props.navBarPlacement == AppNavBarModule.Placement.Left then RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(-NavBarSize, if GetFFlagLuaAppEnableTopBannerFunction() then -p1.props.globalGuiInset.top else 0),
				Size = UDim2.fromOffset(NavBarSize, p1.props.statusBarHeight),
				BackgroundTransparency = p2.Theme.NavigationBar.Transparency,
				BackgroundColor3 = p2.Theme.NavigationBar.Color
			}) else nil,
			RealSystemBar = RoactModule.createElement(AppNavBarModule.AppNavBar, p1:getAppNavBarProps())
		}))
	end)
end

if WebViewRedesignEnabledEngineFeature then
	if FFlagSignalsNavP3bTopBar then
		local AppSystemBar1 = AppSystemBar
		
		AppSystemBar = function(p1)
			-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), AppPagePropertiesModule (copy), ReactModule (copy), AppSystemBar1 (copy), CryoModule (copy)
			local AppPagePropertiesModuleEntry = AppPagePropertiesModule[UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage).name]
			
			return ReactModule.createElement(AppSystemBar1, CryoModule.Dictionary.union(p1, {
				showTooltip = not (AppPagePropertiesModuleEntry and AppPagePropertiesModuleEntry.webView == true)
			}))
		end
	else
		AppSystemBar = RoactRoduxModule.connect(function(p1, _)
			-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), AppPagePropertiesModule (copy)
			local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
			local AppPagePropertiesModuleEntry = AppPagePropertiesModule[SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name]
			
			return {
				showTooltip = not (AppPagePropertiesModuleEntry and AppPagePropertiesModuleEntry.webView == true)
			}
		end)(AppSystemBar)
	end
end
if not FFlagLuaAppForceVrAppPanelWidthRollout and GetFFlagVRPanelWidthIXPEnabledFunction() then
	AppSystemBar = IxpUtilsModule.connectTestVariables({
		vrPanelWidthMultiplier = VRPanelWidthIXP.VrAppPanelWidthMultiplier,
		vrPanelCurvature = VRPanelWidthIXP.VrAppPanelCurvature,
		xOffset = VRPanelWidthIXP.VrSystemBarXOffSet,
		yOffset = VRPanelWidthIXP.VrSystemBarYOffSet,
		zOffset = VRPanelWidthIXP.VrSystemBarZOffSet,
		heightModifier = VRPanelWidthIXP.SystemBarHeightMultiplier
	})(AppSystemBar)
end
if GetFFlagLuaAppEnableTopBannerFunction() then
	AppSystemBar = RoactRoduxModule.connect(function(p1, _)
		return { globalGuiInset = p1.GlobalGuiInset }
	end, function(_)
		return {}
	end)(AppSystemBar)
end
return function(p1)
	-- upvalues: UseIsSpatialFunction (copy), UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), UseSelectorFunction (copy), FFlagAddGamepadBumperNavigation (copy), ResponsiveModule (copy), ReactModule (copy), BumperHint (copy), CryoModule (copy), RoactModule (copy), AppSystemBar (ref)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local UseNavBarSizeResult = UseNavBarSizeFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local Element = nil
	local Element1 = nil
	
	if FFlagAddGamepadBumperNavigation and ResponsiveModule.useBreakpointYOrLarger(ResponsiveModule.Keys.Medium) and p1.isBumperNavigationEnabled then
		Element = ReactModule.createElement(BumperHint, { isLeftBumper = true, squareSize = UseNavBarSizeResult })
		Element1 = ReactModule.createElement(BumperHint, { isRightBumper = true, squareSize = UseNavBarSizeResult })
	end
	return RoactModule.createElement(AppSystemBar, (CryoModule.Dictionary.join(p1, {
		isSpatial = UseIsSpatialResult,
		navBarPlacement = UseNavBarPlacementResult,
		navBarSize = UseNavBarSizeResult,
		statusBarHeight = UseSelectorResult,
		leadingComponent = if FFlagAddGamepadBumperNavigation then Element else nil,
		trailingComponent = if FFlagAddGamepadBumperNavigation then Element1 else nil
	})))
end