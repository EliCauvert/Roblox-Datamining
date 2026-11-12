local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local BackdropModule = require(Foundation.Components.Backdrop)
local ConstantsModule = require(Foundation.Constants)
local OnCloseCallbackReasonModule = require(Foundation.Enums.OnCloseCallbackReason)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local InternalDrawerDismissSwipeModule = require(script.Parent.InternalDrawerDismissSwipe)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local ViewModule = require(Foundation.Components.View)
local DrawerMotionModule = require(script.Parent.drawerMotion)
local UseInternalDrawerVariantsModule = require(script.Parent.useInternalDrawerVariants)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseSurfaceWidthModule = require(script.Parent.useSurfaceWidth)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local InternalDrawerBackdropModule = require(Foundation.Enums.InternalDrawerBackdrop)
local InternalDrawerOpenPhaseModule = require(Foundation.Enums.InternalDrawerOpenPhase)
local InternalDrawerShadowModule = require(Foundation.Enums.InternalDrawerShadow)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)
local _ = require(script.Parent.Types)

local function _(Callback: (any) -> (), Current)
	if typeof(Callback) == "function" then
		Callback(Current)
		
		return
	end
	if Callback ~= nil then
		Callback.current = Current
	end
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Callback)
	-- upvalues: UseOverlayModule (copy), UseTokensModule (copy), UseInternalDrawerVariantsModule (copy), InternalDrawerShadowModule (copy), UsePreferencesModule (copy), UseSurfaceWidthModule (copy), InternalDrawerSideModule (copy), ReactModule (copy), InternalDrawerOpenPhaseModule (copy), UseAnimatedBindingFunction (copy), DrawerMotionModule (copy), InternalDrawerBackdropModule (copy), OnCloseCallbackReasonModule (copy), ReactRobloxModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), DashModule (copy), ConstantsModule (copy), ElevationOwnerScope (copy), ScrollViewModule (copy), BackdropModule (copy), InternalDrawerDismissSwipeModule (copy)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseInternalDrawerVariantsModuleResult = UseInternalDrawerVariantsModule(p1.layout, p1.side)
	local IsShadowMatch = p1.shadow == InternalDrawerShadowModule.Overlay300
	local Elevation = p1.elevation
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local Surface = UseInternalDrawerVariantsModuleResult.surface
	local OuterBleed = p1.outerBleed or 0
	local UseSurfaceWidthModuleResult, UseSurfaceWidthModuleResult2 = UseSurfaceWidthModule(p1.width, Surface.margin, OuterBleed)
	local Config = if OuterBleed > 0 then if p1.side == InternalDrawerSideModule.End then { right = UDim.new(0, OuterBleed) } else { left = UDim.new(0, OuterBleed) } else nil
	local UseRefResult = ReactModule.useRef(p1.isOpen)
	UseRefResult.current = p1.isOpen
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), Callback (copy)
		UseRefResult1.current = Current
		
		if typeof(Callback) == "function" then
			Callback(Current)
			
			return
		end
		if Callback ~= nil then
			Callback.current = Current
		end
	end, { Callback })
	local UseRefResult4 = ReactModule.useRef(true)
	local UseRefResult5 = ReactModule.useRef(true)
	local UseRefResult6 = ReactModule.useRef(0)
	local UseRefResult7 = ReactModule.useRef(1)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseRefResult9 = ReactModule.useRef(p1.onExited)
	UseRefResult9.current = p1.onExited
	local UseRefResult10 = ReactModule.useRef(p1.onOpenComplete)
	UseRefResult10.current = p1.onOpenComplete
	local UseRefResult11 = ReactModule.useRef(false)
	local NoIsOpen: boolean = p1.openPhase == InternalDrawerOpenPhaseModule.Pressed and not p1.isOpen
	local NoIsOpen1: boolean = if p1.openPhase == InternalDrawerOpenPhaseModule.Dragging then not p1.isOpen else p1.openPhase == InternalDrawerOpenPhaseModule.Requested and not p1.isOpen
	UseRefResult11.current = NoIsOpen1 or NoIsOpen
	
	local function notifySettled()
		-- upvalues: UseRefResult (copy), UseRefResult11 (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult9 (copy), UseRefResult8 (copy), UseRefResult6 (copy), UseRefResult7 (copy), UseRefResult10 (copy)
		if not UseRefResult.current and not UseRefResult11.current and UseRefResult4.current and UseRefResult5.current then
			UseRefResult9.current()
			
			return
		end
		if UseRefResult8.current and UseRefResult4.current and UseRefResult5.current and UseRefResult6.current == 1 and UseRefResult7.current == 0 then
			UseRefResult8.current = false
			local CurrentFunction: () -> () = UseRefResult10.current
			
			if CurrentFunction then
				CurrentFunction()
			end
		end
	end
	
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0, function(Current)
		-- upvalues: UseRefResult6 (copy), UseRefResult4 (copy), notifySettled (copy)
		UseRefResult6.current = Current
		UseRefResult4.current = true
		notifySettled()
	end)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(1, function(Current)
		-- upvalues: UseRefResult7 (copy), UseRefResult5 (copy), notifySettled (copy)
		UseRefResult7.current = Current
		UseRefResult5.current = true
		notifySettled()
	end)
	local Drag = p1.drag
	local SetDrag = p1.setDrag
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), UseAnimatedBindingResult2 (copy), UseAnimatedBindingResult2_1 (copy), Drag (copy), SetDrag (copy)
		return {
			panelProgress = UseAnimatedBindingResult,
			backdropTransparency = UseAnimatedBindingResult1,
			setPanelGoal = UseAnimatedBindingResult2,
			setBackdropGoal = UseAnimatedBindingResult2_1,
			drag = Drag,
			setDrag = SetDrag
		}
	end, {
		UseAnimatedBindingResult, UseAnimatedBindingResult1, UseAnimatedBindingResult2,
		UseAnimatedBindingResult2_1, Drag, SetDrag
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult (copy), Drag (copy)
		return ReactModule.joinBindings({ animated = UseAnimatedBindingResult, dragged = Drag }):map(function(p2)
			return if p2.dragged == nil then p2.animated else p2.dragged
		end)
	end, { UseAnimatedBindingResult, Drag })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult1 (copy), Drag (copy)
		return ReactModule.joinBindings({ animated = UseAnimatedBindingResult1, dragged = Drag }):map(function(p2)
			return if p2.dragged == nil then p2.animated else 1 - p2.dragged
		end)
	end, { UseAnimatedBindingResult1, Drag })
	ReactModule.useEffect(function()
		-- upvalues: NoIsOpen1 (copy), DrawerMotionModule (upval), UseMemoResult (copy), NoIsOpen (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult8 (copy), p1 (copy), UseRefResult10 (copy), UseTokensModuleResult (copy), ReducedMotion (copy)
		if NoIsOpen1 then
			DrawerMotionModule.hold(UseMemoResult)
			
			return
		end
		if not NoIsOpen then
			UseRefResult4.current = false
			UseRefResult5.current = false
			UseRefResult8.current = p1.isOpen and UseRefResult10.current ~= nil
			DrawerMotionModule.animate(UseMemoResult, p1.isOpen, UseTokensModuleResult, ReducedMotion)
			
			return
		end
	end, { p1.isOpen, NoIsOpen1, NoIsOpen, ReducedMotion })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), InternalDrawerBackdropModule (upval), UseRefResult (copy), OnCloseCallbackReasonModule (upval)
		if p1.backdrop == InternalDrawerBackdropModule.Dismissible and UseRefResult.current then
			p1.onRequestClose(OnCloseCallbackReasonModule.BackdropClick)
		end
	end, { p1.backdrop, p1.onRequestClose })
	local _UDim2 = UDim2.new(0, UseSurfaceWidthModuleResult + OuterBleed, 1, -Surface.margin * 2)
	local Side = p1.side
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), OuterBleed (copy), Side (copy), InternalDrawerSideModule (upval), UseSurfaceWidthModuleResult (copy), Surface (copy)
		return UseMemoResult1:map(function(p2: number): UDim2
			-- upvalues: OuterBleed (upval), Side (upval), InternalDrawerSideModule (upval), UseSurfaceWidthModuleResult (upval), Surface (upval)
			local ScaledOuterBleed = (1 - p2) * OuterBleed
			
			return UDim2.new(Surface.anchorScaleX, if Side == InternalDrawerSideModule.End then -p2 * (UseSurfaceWidthModuleResult + Surface.margin) + ScaledOuterBleed else Surface.openOffsetSign * Surface.margin * p2 + Surface.hiddenOffsetSign * ((1 - p2) * UseSurfaceWidthModuleResult + OuterBleed + ScaledOuterBleed), 0, Surface.margin)
		end)
	end, {
		UseMemoResult1,
		Side,
		UseSurfaceWidthModuleResult,
		OuterBleed,
		Surface
	})
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		tag = "size-full",
		Visible = p1.openPhase ~= InternalDrawerOpenPhaseModule.Pressed,
		ZIndex = Elevation.zIndex,
		testId = `{p1.testId}--container`
	}, {
		Surface = ReactModule.createElement(ViewModule, {
			ClipsDescendants = true,
			Size = _UDim2,
			Position = UseMemoResult3,
			ZIndex = if IsShadowMatch then 3 else 2,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = DashModule.noop,
			selection = ConstantsModule.MODAL.DISABLE_SELECTION,
			selectionGroup = ConstantsModule.MODAL.TRAP_FOCUS,
			tag = `{Surface.tag} {p1.backgroundColor}`,
			ref = if p1.swipeToDismiss == nil then Callback else UseResult,
			testId = p1.testId
		}, {
			Content = ReactModule.createElement(ViewModule, {
				tag = "col size-full",
				padding = Config,
				testId = `{p1.testId}--column`
			}, ReactModule.createElement(ElevationOwnerScope, { owner = Elevation }, {
				Header = if p1.header == nil then nil else ReactModule.createElement(ViewModule, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y",
					testId = `{p1.testId}--header`
				}, p1.header),
				Body = if p1.scrolls == false then ReactModule.createElement(ViewModule, {
					LayoutOrder = 2,
					tag = "fill size-full-0",
					testId = `{p1.testId}--body`
				}, p1.children) else ReactModule.createElement(ScrollViewModule, {
					LayoutOrder = 2,
					tag = "fill size-full-0",
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = p1.scrollBarVisibility
					},
					scrollingFrameRef = if p1.swipeToDismiss == nil then nil else UseRefResult3,
					testId = `{p1.testId}--body`
				}, {
					Children = ReactModule.createElement(ViewModule, {
						tag = "col size-full-0 auto-y",
						testId = `{p1.testId}--body-content`
					}, p1.children)
				}),
				Footer = if p1.footer == nil then nil else ReactModule.createElement(ViewModule, {
					LayoutOrder = 3,
					tag = "col size-full-0 auto-y",
					testId = `{p1.testId}--footer`
				}, p1.footer)
			})),
			InnerEdge = if UseInternalDrawerVariantsModuleResult.innerEdge.isVisible then ReactModule.createElement(ViewModule, {
				ZIndex = 2,
				Size = UDim2.new(0, UseInternalDrawerVariantsModuleResult.innerEdge.thickness, 1, 0),
				backgroundStyle = UseInternalDrawerVariantsModuleResult.innerEdge.backgroundStyle,
				tag = UseInternalDrawerVariantsModuleResult.innerEdge.tag,
				testId = `{p1.testId}--inner-edge`
			}) else nil
		}),
		Shadow = if IsShadowMatch then ReactModule.createElement(ViewModule, {
			ZIndex = 2,
			Size = _UDim2,
			Position = UseMemoResult3,
			tag = UseInternalDrawerVariantsModuleResult.shadow.tag,
			testId = `{p1.testId}--shadow`
		}) else nil,
		Backdrop = ReactModule.createElement(BackdropModule, {
			ZIndex = 1,
			transparency = UseMemoResult2,
			onActivated = UseResult1,
			ref = if p1.swipeToDismiss == nil then nil else UseRefResult2,
			testId = `{p1.testId}--backdrop`
		}),
		Swipe = if p1.swipeToDismiss == nil then nil else ReactModule.createElement(InternalDrawerDismissSwipeModule, {
			config = p1.swipeToDismiss,
			panelRef = UseRefResult1,
			backdropRef = UseRefResult2,
			scrollingFrameRef = UseRefResult3,
			travel = UseSurfaceWidthModuleResult2,
			side = p1.side,
			isOpen = p1.isOpen,
			motion = UseMemoResult,
			onRequestClose = p1.onRequestClose,
			testId = p1.testId
		})
	}), UseOverlayModuleResult)
end))