local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local InternalDrawerModule = require(Foundation.Components.InternalDrawer)
local InternalDrawerBackdropModule = require(Foundation.Enums.InternalDrawerBackdrop)
local InternalDrawerLayoutModule = require(Foundation.Enums.InternalDrawerLayout)
local InternalDrawerShadowModule = require(Foundation.Enums.InternalDrawerShadow)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)
local _ = require(Foundation.Components.InternalDrawer.Types)
local _ = require(Foundation.Enums.OnCloseCallbackReason)
local SwipeBehaviorModule = require(Foundation.Enums.SwipeBehavior)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local UseHardwareInsetsModule = require(Foundation.Components.Sheet.useHardwareInsets)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local t = {}
local t1 = {}
local config = { testId = "--foundation-navigation-drawer", width = 320 }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseElevationModule (copy), ElevationLayerModule (copy), UseOverlayModule (copy), UseHardwareInsetsModule (copy), UseScaledValueModule (copy), SwipeBehaviorModule (copy), ReactModule (copy), InternalDrawerModule (copy), InternalDrawerSideModule (copy), InternalDrawerBackdropModule (copy), InternalDrawerLayoutModule (copy), InternalDrawerShadowModule (copy), t (copy), t1 (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local IsSwipeMatch: boolean = WithDefaultsModuleResult.swipe == SwipeBehaviorModule.Open or WithDefaultsModuleResult.swipe == SwipeBehaviorModule.OpenAndDismiss
	local IsSwipeMatch1: boolean = WithDefaultsModuleResult.swipe == SwipeBehaviorModule.Dismiss or WithDefaultsModuleResult.swipe == SwipeBehaviorModule.OpenAndDismiss
	
	return ReactModule.createElement(InternalDrawerModule, {
		backgroundColor = "bg-surface-100",
		elevation = UseElevationModule(ElevationLayerModule.Drawer, { stackAboveOwner = false }),
		isOpen = WithDefaultsModuleResult.isOpen,
		onRequestClose = WithDefaultsModuleResult.onClose,
		onOpenComplete = WithDefaultsModuleResult.onOpenComplete,
		onCloseComplete = WithDefaultsModuleResult.onCloseComplete,
		side = InternalDrawerSideModule.Start,
		width = UseScaledValueModule(WithDefaultsModuleResult.width),
		outerBleed = UseHardwareInsetsModule((UseOverlayModule())).left,
		backdrop = InternalDrawerBackdropModule.Dismissible,
		layout = InternalDrawerLayoutModule.FullBleed,
		shadow = InternalDrawerShadowModule.Overlay300,
		header = WithDefaultsModuleResult.header,
		footer = WithDefaultsModuleResult.footer,
		swipeToDismiss = if IsSwipeMatch1 then t else nil,
		swipeToOpen = if IsSwipeMatch then t1 else nil,
		onRequestOpen = WithDefaultsModuleResult.onOpen,
		testId = WithDefaultsModuleResult.testId,
		ref = Ref
	}, WithDefaultsModuleResult.children)
end))