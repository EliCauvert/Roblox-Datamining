local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local InternalDrawerOpenPhaseModule = require(Foundation.Enums.InternalDrawerOpenPhase)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InternalDrawerEdgeSwipeModule = require(script.Parent.InternalDrawerEdgeSwipe)
local InternalDrawerOverlayModule = require(script.Parent.InternalDrawerOverlay)
local _ = require(script.Parent.Types)
local DrawerMotionModule = require(script.Parent.drawerMotion)
local UseInternalDrawerVariantsModule = require(script.Parent.useInternalDrawerVariants)
local UseSurfaceWidthModule = require(script.Parent.useSurfaceWidth)
local config = {
	outerBleed = 0,
	scrolls = true,
	testId = "--foundation-internal-drawer",
	scrollBarVisibility = require(Foundation.Enums.ScrollBarVisibility).None
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseInternalDrawerVariantsModule (copy), UseSurfaceWidthModule (copy), ReactModule (copy), InternalDrawerOpenPhaseModule (copy), DrawerMotionModule (copy), DashModule (copy), InternalDrawerEdgeSwipeModule (copy), InternalDrawerOverlayModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local _, UseSurfaceWidthModuleResult2 = UseSurfaceWidthModule(WithDefaultsModuleResult.width, UseInternalDrawerVariantsModule(WithDefaultsModuleResult.layout, WithDefaultsModuleResult.side).surface.margin, WithDefaultsModuleResult.outerBleed)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isOpen)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(InternalDrawerOpenPhaseModule.Idle)
	local UseRefResult = ReactModule.useRef(UseStateResult1)
	UseRefResult.current = UseStateResult1
	local UseRefResult1 = ReactModule.useRef(WithDefaultsModuleResult.isOpen)
	local UseDragResult, UseDragResult2 = DrawerMotionModule.useDrag()
	
	if WithDefaultsModuleResult.isOpen and not UseStateResult then
		UseStateResult2(true)
	end
	if WithDefaultsModuleResult.isOpen then
		UseRefResult1.current = true
		
		if UseStateResult1 ~= InternalDrawerOpenPhaseModule.Idle then
			UseStateResult2_1(InternalDrawerOpenPhaseModule.Idle)
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), InternalDrawerOpenPhaseModule (upval), WithDefaultsModuleResult (copy), UseStateResult2_1 (copy)
		if UseStateResult1 == InternalDrawerOpenPhaseModule.Requested and not WithDefaultsModuleResult.isOpen then
			UseStateResult2_1(InternalDrawerOpenPhaseModule.Settling)
		end
	end, { UseStateResult1, WithDefaultsModuleResult.isOpen })
	local OnCloseCompleteFunction = WithDefaultsModuleResult.onCloseComplete
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), InternalDrawerOpenPhaseModule (upval), OnCloseCompleteFunction (copy)
		local Current = UseRefResult1.current
		UseRefResult1.current = false
		UseStateResult2(false)
		UseStateResult2_1(InternalDrawerOpenPhaseModule.Idle)
		
		if Current and OnCloseCompleteFunction then
			OnCloseCompleteFunction()
		end
	end, { OnCloseCompleteFunction })
	local OnRequestOpenFunction = WithDefaultsModuleResult.onRequestOpen
	local UseResult1 = ReactModule.useCallback(function(Idle)
		-- upvalues: InternalDrawerOpenPhaseModule (upval), UseRefResult (copy), UseStateResult2_1 (copy), OnRequestOpenFunction (copy)
		if Idle == InternalDrawerOpenPhaseModule.Idle and UseRefResult.current ~= InternalDrawerOpenPhaseModule.Pressed then return end
		UseStateResult2_1(Idle)
		
		if Idle == InternalDrawerOpenPhaseModule.Requested and OnRequestOpenFunction ~= nil then
			OnRequestOpenFunction()
		end
	end, { OnRequestOpenFunction })
	local UseStateResult3 = UseStateResult or UseStateResult1 ~= InternalDrawerOpenPhaseModule.Idle
	
	if UseStateResult3 or WithDefaultsModuleResult.swipeToOpen ~= nil then
		local JoinResult = DashModule.join(WithDefaultsModuleResult, {
			ref = Ref,
			onExited = UseResult,
			drag = UseDragResult,
			setDrag = UseDragResult2,
			openPhase = UseStateResult1
		})
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Edge = if WithDefaultsModuleResult.swipeToOpen == nil then nil else ReactModule.createElement(InternalDrawerEdgeSwipeModule, {
				config = WithDefaultsModuleResult.swipeToOpen,
				side = WithDefaultsModuleResult.side,
				outerBleed = WithDefaultsModuleResult.outerBleed,
				travel = UseSurfaceWidthModuleResult2,
				isOpen = WithDefaultsModuleResult.isOpen,
				zIndex = WithDefaultsModuleResult.elevation.zIndex,
				setPhase = UseResult1,
				setDrag = UseDragResult2,
				testId = WithDefaultsModuleResult.testId
			}),
			Overlay = if UseStateResult3 then ReactModule.createElement(InternalDrawerOverlayModule, JoinResult) else nil
		})
	else
		return nil
	end
end))