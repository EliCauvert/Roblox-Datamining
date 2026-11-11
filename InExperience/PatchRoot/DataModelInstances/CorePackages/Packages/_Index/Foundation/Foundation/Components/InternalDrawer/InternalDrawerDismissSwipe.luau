local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Enums.InternalDrawerSide)
local _ = require(script.Parent.Types)
local OnCloseCallbackReasonModule = require(Foundation.Enums.OnCloseCallbackReason)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local ViewModule = require(Foundation.Components.View)
local DismissSwipeHandlersModule = require(script.Parent.dismissSwipeHandlers)
local DrawerMotionModule = require(script.Parent.drawerMotion)
local SwipeMathModule = require(script.Parent.swipeMath)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseSwipeSessionModule = require(script.Parent.useSwipeSession)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), SwipeMathModule (copy), DrawerMotionModule (copy), OnCloseCallbackReasonModule (copy), UseSwipeSessionModule (copy), DismissSwipeHandlersModule (copy), ViewModule (copy), DashModule (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local ResolveThresholdsResult, ResolveThresholdsResult2 = SwipeMathModule.resolveThresholds(p1.config)
	UseSwipeSessionModule({
		side = p1.side,
		travel = p1.travel,
		isOpen = p1.isOpen,
		distanceFraction = ResolveThresholdsResult,
		velocityThreshold = ResolveThresholdsResult2,
		onClaim = ReactModule.useCallback(function()
			-- upvalues: DrawerMotionModule (upval), p1 (copy)
			DrawerMotionModule.hold(p1.motion)
		end, { p1.motion }),
		setDrag = p1.motion.setDrag,
		onRelease = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), OnCloseCallbackReasonModule (upval), UseStateResult2 (copy), DrawerMotionModule (upval), UseTokensModuleResult (copy), ReducedMotion (copy)
			if p2 then
				p1.onRequestClose(OnCloseCallbackReasonModule.Swipe)
				UseStateResult2(true)
				
				return
			else
				DrawerMotionModule.animate(p1.motion, true, UseTokensModuleResult, ReducedMotion)
			end
		end, {
			p1.motion,
			p1.onRequestClose,
			UseTokensModuleResult,
			ReducedMotion
		}),
		onCancel = ReactModule.useCallback(function()
			-- upvalues: DrawerMotionModule (upval), p1 (copy), UseTokensModuleResult (copy), ReducedMotion (copy)
			DrawerMotionModule.animate(p1.motion, p1.isOpen, UseTokensModuleResult, ReducedMotion)
		end, {
			p1.motion,
			p1.isOpen,
			UseTokensModuleResult,
			ReducedMotion
		})
	}, function(Latest)
		-- upvalues: p1 (copy), UseRefResult (copy)
		return {
			gesture = nil,
			unlock = nil,
			latest = Latest,
			panelRef = p1.panelRef,
			backdropRef = p1.backdropRef,
			scrollingFrameRef = p1.scrollingFrameRef,
			captureRef = UseRefResult
		}
	end, DismissSwipeHandlersModule, p1.isOpen)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy), DrawerMotionModule (upval), UseTokensModuleResult (copy), ReducedMotion (copy), UseStateResult2 (copy)
		if not UseStateResult then return end
		if p1.isOpen then
			DrawerMotionModule.animate(p1.motion, true, UseTokensModuleResult, ReducedMotion)
		end
		UseStateResult2(false)
	end, {
		UseStateResult,
		p1.isOpen,
		p1.motion,
		UseTokensModuleResult,
		ReducedMotion
	})
	
	return ReactModule.createElement(ViewModule, {
		Visible = false,
		ZIndex = 5,
		tag = "size-full",
		onActivated = DashModule.noop,
		selection = ConstantsModule.MODAL.DISABLE_SELECTION,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		ref = UseRefResult,
		testId = `{p1.testId}--swipe-capture`
	})
end