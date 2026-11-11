local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local SceneManagementModule = require(Parent.SceneManagement)
local SurfaceGuiWithAdornee = SceneManagementModule.SurfaceGuiWithAdornee
local UseCameraFacingGeometryFunction = SceneManagementModule.useCameraFacingGeometry
local ConstantsModule = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local ScreenKind = require(Parent.TenFootUiCommon).TenFootUiRNTypes.ScreenKind
local SceneViewWithFocusRootModule = require(script.Parent.SceneViewWithFocusRoot)
local TenFootUiOverflowScreenModule = require(TenFootUiShell.Components.TenFootUiOverflowScreen)
local NavigationModule = require(Parent.Navigation)
local GetCurrentRouteKeyFunction = NavigationModule.getCurrentRouteKey
local GetRouteKeyIsInNavigationStateFunction = NavigationModule.getRouteKeyIsInNavigationState
local GetActiveChildNavigationOptionsRecursivelyFunction = NavigationModule.getActiveChildNavigationOptionsRecursively
local UseEarlyIsFocusedFunction = NavigationModule.useEarlyIsFocused
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local CompositionStyleSheet = require(Parent.AppComposition).CompositionStyleSheet

local function getAdorneeSizeFromScreenSize(Vector): Vector3
	-- upvalues: ConstantsModule (copy)
	return (Vector3.new(Vector.X, Vector.Y, ConstantsModule.ADORNEE_DEPTH))
end

local function _(p1)
	-- upvalues: ScreenKind (copy), ConstantsModule (copy)
	local ScreenKind1 = p1.options.screenKind or ScreenKind.Default
	
	return if ScreenKind1 == ScreenKind.FullScreen then ConstantsModule.FULLSCREEN_CANVAS_SIZE else ConstantsModule.DEFAULT_CANVAS_SIZE
end

local function combineTransparencies(p1): number
	-- upvalues: Array (copy)
	return 1 - Array.reduce(p1, function(p2, p3)
		return p2 * (1 - (p3 or 0))
	end, 1)
end

local function useCombinedTransparency(...)
	-- upvalues: ReactModule (copy), combineTransparencies (copy)
	local list = { ... }
	
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), list (copy), combineTransparencies (upval)
		return ReactModule.joinBindings(list):map(combineTransparencies)
	end, list)
end

local _ = function(p1, p2)
	-- upvalues: GetCurrentRouteKeyFunction (copy), GetRouteKeyIsInNavigationStateFunction (copy)
	local CurrentRouteKey = GetCurrentRouteKeyFunction(p1)
	
	return if p2.options.hasSubNavigation and CurrentRouteKey ~= nil then GetRouteKeyIsInNavigationStateFunction(CurrentRouteKey, p2.state) else CurrentRouteKey == p2.key
end

local _ = function(p1, p2)
	-- upvalues: GetActiveChildNavigationOptionsRecursivelyFunction (copy), ScreenKind (copy)
	return (if p2.options.hasSubNavigation then GetActiveChildNavigationOptionsRecursivelyFunction(p1).screenKind else nil) or (p2.options.screenKind or ScreenKind.Default)
end

return function(p1)
	-- upvalues: UseCameraFacingGeometryFunction (copy), ConstantsModule (copy), UseEarlyIsFocusedFunction (copy), GetCurrentRouteKeyFunction (copy), GetRouteKeyIsInNavigationStateFunction (copy), GetActiveChildNavigationOptionsRecursivelyFunction (copy), ScreenKind (copy), useCombinedTransparency (copy), ReactModule (copy), Object (copy), TenFootUiOverflowScreenModule (copy), SceneViewWithFocusRootModule (copy), CompositionStyleSheet (copy), SurfaceGuiWithAdornee (copy), getAdorneeSizeFromScreenSize (copy)
	local Descriptor = p1.descriptor
	local ScreenProps = p1.screenProps
	local Navigation = p1.navigation
	local UseCameraFacingGeometryResult = UseCameraFacingGeometryFunction(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA)
	local IsActiveCard = UseEarlyIsFocusedFunction() and p1.isActiveCard
	local CurrentRouteKey = GetCurrentRouteKeyFunction(Navigation)
	local RouteKeyIsInNavigationState = if Descriptor.options.hasSubNavigation and CurrentRouteKey ~= nil then GetRouteKeyIsInNavigationStateFunction(CurrentRouteKey, Descriptor.state) else CurrentRouteKey == Descriptor.key
	local ScreenKind1 = (if Descriptor.options.hasSubNavigation then GetActiveChildNavigationOptionsRecursivelyFunction(Navigation).screenKind else nil) or (Descriptor.options.screenKind or ScreenKind.Default)
	local NoIsVisible = p1.isVisible and (ScreenProps.isVisible == nil or ScreenProps.isVisible)
	local UseCombinedTransparencyResult = useCombinedTransparency(p1.groupTransparency, ScreenProps.groupTransparency)
	local config = {
		name = Descriptor.key,
		adorneeSize = UseCameraFacingGeometryResult.viewportFillDimensions:map(getAdorneeSizeFromScreenSize),
		adorneeCFrame = p1.adorneeCFrame,
		adorneeParent = ScreenProps.worldContainer,
		canvasSize = if ScreenKind2 == ScreenKind.FullScreen then ConstantsModule.FULLSCREEN_CANVAS_SIZE else ConstantsModule.DEFAULT_CANVAS_SIZE,
		isVisible = NoIsVisible,
		surfaceGuiParent = ScreenProps.surfaceGuiContainer
	}
	local ScreenKind2 = Descriptor.options.screenKind or ScreenKind.Default
	
	return ReactModule.createElement(SurfaceGuiWithAdornee, config, (ReactModule.createElement(ReactModule.Fragment, nil, {
		CompositionStyleSheet = ReactModule.createElement(CompositionStyleSheet),
		Content = ReactModule.createElement(TenFootUiOverflowScreenModule, {
			screenKind = ScreenKind1,
			groupTransparency = UseCombinedTransparencyResult
		}, {
			SceneView = ReactModule.createElement(SceneViewWithFocusRootModule, {
				component = Descriptor.getComponent(),
				navigation = Descriptor.navigation,
				screenProps = ReactModule.useMemo(function()
					-- upvalues: Object (upval), ScreenProps (copy), NoIsVisible (copy), UseCombinedTransparencyResult (copy)
					return Object.assign({}, ScreenProps, {
						isVisible = NoIsVisible,
						groupTransparency = UseCombinedTransparencyResult
					})
				end, { ScreenProps, NoIsVisible, UseCombinedTransparencyResult }),
				isFocusable = IsActiveCard and RouteKeyIsInNavigationState,
				shouldRestoreFocus = Descriptor.options.enableFocusRestoration
			})
		})
	})))
end