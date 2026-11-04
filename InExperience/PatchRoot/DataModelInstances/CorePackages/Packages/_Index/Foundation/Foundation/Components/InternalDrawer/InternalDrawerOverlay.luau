local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local BackdropModule = require(Foundation.Components.Backdrop)
local ConstantsModule = require(Foundation.Constants)
local OnCloseCallbackReasonModule = require(Foundation.Enums.OnCloseCallbackReason)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local ScrollViewModule = require(Foundation.Components.ScrollView)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local ViewModule = require(Foundation.Components.View)
local UseInternalDrawerVariantsModule = require(script.Parent.useInternalDrawerVariants)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseScreenSizeModule = require(Foundation.Components.Sheet.useScreenSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local InternalDrawerBackdropModule = require(Foundation.Enums.InternalDrawerBackdrop)
local InternalDrawerShadowModule = require(Foundation.Enums.InternalDrawerShadow)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)
local _ = require(script.Parent.Types)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseOverlayModule (copy), UseTokensModule (copy), UseInternalDrawerVariantsModule (copy), InternalDrawerShadowModule (copy), UsePreferencesModule (copy), UseScreenSizeModule (copy), InternalDrawerSideModule (copy), ReactModule (copy), UseAnimatedBindingFunction (copy), OtterModule (copy), InternalDrawerBackdropModule (copy), OnCloseCallbackReasonModule (copy), ReactRobloxModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), DashModule (copy), ConstantsModule (copy), ElevationOwnerScope (copy), ScrollViewModule (copy), BackdropModule (copy)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseInternalDrawerVariantsModuleResult = UseInternalDrawerVariantsModule(p1.layout, p1.side)
	local IsShadowMatch = p1.shadow == InternalDrawerShadowModule.Overlay300
	local Elevation = p1.elevation
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local Surface = UseInternalDrawerVariantsModuleResult.surface
	local Smallest = math.min(p1.width, (math.max(UseScreenSizeModule().X - UseTokensModuleResult.Size.Size_1200 - Surface.margin, 0)))
	local OuterBleed = p1.outerBleed or 0
	local Config = if OuterBleed > 0 then if p1.side == InternalDrawerSideModule.End then { right = UDim.new(0, OuterBleed) } else { left = UDim.new(0, OuterBleed) } else nil
	local UseRefResult = ReactModule.useRef(p1.isOpen)
	UseRefResult.current = p1.isOpen
	local UseRefResult1 = ReactModule.useRef(true)
	local UseRefResult2 = ReactModule.useRef(true)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(1)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef(p1.onExited)
	UseRefResult6.current = p1.onExited
	local UseRefResult7 = ReactModule.useRef(p1.onOpenComplete)
	UseRefResult7.current = p1.onOpenComplete
	
	local function notifySettled()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult7 (copy)
		if not UseRefResult.current and UseRefResult1.current and UseRefResult2.current then
			UseRefResult6.current()
			
			return
		end
		if UseRefResult5.current and UseRefResult1.current and UseRefResult2.current and UseRefResult3.current == 1 and UseRefResult4.current == 0 then
			UseRefResult5.current = false
			local CurrentFunction: () -> () = UseRefResult7.current
			
			if CurrentFunction then
				CurrentFunction()
			end
		end
	end
	
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0, function(Current)
		-- upvalues: UseRefResult3 (copy), UseRefResult1 (copy), notifySettled (copy)
		UseRefResult3.current = Current
		UseRefResult1.current = true
		notifySettled()
	end)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(1, function(Current)
		-- upvalues: UseRefResult4 (copy), UseRefResult2 (copy), notifySettled (copy)
		UseRefResult4.current = Current
		UseRefResult2.current = true
		notifySettled()
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult5 (copy), p1 (copy), UseRefResult7 (copy), ReducedMotion (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseAnimatedBindingResult2_1 (copy), UseTokensModuleResult (copy)
		UseRefResult1.current = false
		UseRefResult2.current = false
		UseRefResult5.current = p1.isOpen and UseRefResult7.current ~= nil
		
		if ReducedMotion then
			UseAnimatedBindingResult2((OtterModule.instant(if p1.isOpen then 1 else 0)))
			UseAnimatedBindingResult2_1((OtterModule.instant(if p1.isOpen then 0 else 1)))
			
			return
		end
		if p1.isOpen then
			UseAnimatedBindingResult2(OtterModule.ease(1, {
				easingStyle = UseTokensModuleResult.Ease.StandardOut,
				duration = UseTokensModuleResult.Time.Time_300
			}))
			UseAnimatedBindingResult2_1(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
			
			return
		else
			UseAnimatedBindingResult2(OtterModule.ease(0, {
				easingStyle = UseTokensModuleResult.Ease.StandardIn,
				duration = UseTokensModuleResult.Time.Time_100
			}))
			UseAnimatedBindingResult2_1(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
		end
	end, { p1.isOpen, ReducedMotion })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), InternalDrawerBackdropModule (upval), UseRefResult (copy), OnCloseCallbackReasonModule (upval)
		if p1.backdrop == InternalDrawerBackdropModule.Dismissible and UseRefResult.current then
			p1.onRequestClose(OnCloseCallbackReasonModule.BackdropClick)
		end
	end, { p1.backdrop, p1.onRequestClose })
	local _UDim2 = UDim2.new(0, Smallest + OuterBleed, 1, -Surface.margin * 2)
	local MapResult = UseAnimatedBindingResult:map(function(p2: number): UDim2
		-- upvalues: OuterBleed (copy), p1 (copy), InternalDrawerSideModule (upval), Smallest (copy), Surface (copy)
		local ScaledOuterBleed = (1 - p2) * OuterBleed
		
		return UDim2.new(Surface.anchorScaleX, if p1.side == InternalDrawerSideModule.End then -p2 * (Smallest + Surface.margin) + ScaledOuterBleed else Surface.openOffsetSign * Surface.margin * p2 + Surface.hiddenOffsetSign * ((1 - p2) * Smallest + OuterBleed + ScaledOuterBleed), 0, Surface.margin)
	end)
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = Elevation.zIndex,
		testId = `{p1.testId}--container`
	}, {
		Surface = ReactModule.createElement(ViewModule, {
			ClipsDescendants = true,
			Size = _UDim2,
			Position = MapResult,
			ZIndex = if IsShadowMatch then 3 else 2,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = DashModule.noop,
			selection = ConstantsModule.MODAL.DISABLE_SELECTION,
			selectionGroup = ConstantsModule.MODAL.TRAP_FOCUS,
			tag = `{Surface.tag} {p1.backgroundColor}`,
			ref = Ref,
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
			Position = MapResult,
			tag = UseInternalDrawerVariantsModuleResult.shadow.tag,
			testId = `{p1.testId}--shadow`
		}) else nil,
		Backdrop = ReactModule.createElement(BackdropModule, {
			ZIndex = 1,
			transparency = UseAnimatedBindingResult1,
			onActivated = UseResult,
			testId = `{p1.testId}--backdrop`
		})
	}), UseOverlayModuleResult)
end))