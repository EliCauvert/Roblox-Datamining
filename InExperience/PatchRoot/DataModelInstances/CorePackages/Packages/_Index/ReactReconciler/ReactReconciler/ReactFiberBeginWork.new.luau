local function _(Text)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(Text))
	error("FIXME (roblox): " .. Text .. " is unimplemented", 2)
end

local Parent = script.Parent.Parent
local Console = require(Parent.Shared).console
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InspectFunction = LuauPolyfillModule.util.inspect
local DEV = require(Parent.ReactGlobals).__DEV__
local DISABLEALLWARNINGSEXCEPTPROPVALIDATION = require(Parent.ReactGlobals).__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local COMPATWARNINGS = require(Parent.ReactGlobals).__COMPAT_WARNINGS__
do
	local _ = require(Parent.Shared)
	local _ = require(Parent.React)
	local _ = require(script.Parent.ReactInternalTypes)
end
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ReactFiberSuspenseContextNewModule = require(script.Parent["ReactFiberSuspenseContext.new"])
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local CheckPropTypesFunction = require(Parent.Shared).checkPropTypes
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local HostComponent = ReactWorkTagsModule.HostComponent
local HostText = ReactWorkTagsModule.HostText
local HostPortal = ReactWorkTagsModule.HostPortal
local ForwardRef = ReactWorkTagsModule.ForwardRef
local Fragment = ReactWorkTagsModule.Fragment
local Mode = ReactWorkTagsModule.Mode
local ContextProvider = ReactWorkTagsModule.ContextProvider
local ContextConsumer = ReactWorkTagsModule.ContextConsumer
local Profiler = ReactWorkTagsModule.Profiler
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local MemoComponent = ReactWorkTagsModule.MemoComponent
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local LazyComponent = ReactWorkTagsModule.LazyComponent
local IncompleteClassComponent = ReactWorkTagsModule.IncompleteClassComponent
local OffscreenComponent = ReactWorkTagsModule.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTagsModule.LegacyHiddenComponent
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local NoFlags = ReactFiberFlagsModule.NoFlags
local StaticMask = ReactFiberFlagsModule.StaticMask
local PerformedWork = ReactFiberFlagsModule.PerformedWork
local Placement = ReactFiberFlagsModule.Placement
local Hydrating = ReactFiberFlagsModule.Hydrating
local ContentReset = ReactFiberFlagsModule.ContentReset
local DidCapture = ReactFiberFlagsModule.DidCapture
local Ref = ReactFiberFlagsModule.Ref
local Deletion = ReactFiberFlagsModule.Deletion
local ForceUpdateForLegacySuspense = ReactFiberFlagsModule.ForceUpdateForLegacySuspense
local ReactSharedInternals = require(Parent.Shared).ReactSharedInternals
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local DebugRenderPhaseSideEffectsForStrictMode = ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local DisableLegacyContext = ReactFeatureFlags.disableLegacyContext
local DisableModulePatternComponents = ReactFeatureFlags.disableModulePatternComponents
local EnableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local EnableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local EnableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local WarnAboutDefaultPropsOnFunctionComponents = ReactFeatureFlags.warnAboutDefaultPropsOnFunctionComponents
local InvariantFunction = require(Parent.Shared).invariant
local DescribeError = require(Parent.Shared).describeError
local ShallowEqualFunction = require(Parent.Shared).shallowEqual
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTLAZYTYPE = ReactSymbols.REACT_LAZY_TYPE
local _ = ReactSymbols.getIteratorFn
local ReactStrictModeWarningsNewModule = require(script.Parent["ReactStrictModeWarnings.new"])
local ReactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local GetCurrentFiberOwnerNameInDevOrNullFunction = ReactCurrentFiberModule.getCurrentFiberOwnerNameInDevOrNull
local SetIsRenderingFunction = ReactCurrentFiberModule.setIsRendering
local ReactFiberHotReloadingNewModule = require(script.Parent["ReactFiberHotReloading.new"])
local ResolveFunctionForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveFunctionForHotReloading
local ResolveForwardRefForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveForwardRefForHotReloading
local ResolveClassForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveClassForHotReloading
local ReactChildFiberNewModule = require(script.Parent["ReactChildFiber.new"])
local MountChildFibersFunction = ReactChildFiberNewModule.mountChildFibers
local ReconcileChildFibersFunction = ReactChildFiberNewModule.reconcileChildFibers
local CloneChildFibersFunction = ReactChildFiberNewModule.cloneChildFibers
local ReactUpdateQueueNewModule = require(script.Parent["ReactUpdateQueue.new"])
local ProcessUpdateQueueFunction = ReactUpdateQueueNewModule.processUpdateQueue
local CloneUpdateQueueFunction = ReactUpdateQueueNewModule.cloneUpdateQueue
local InitializeUpdateQueueFunction = ReactUpdateQueueNewModule.initializeUpdateQueue
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local ConcurrentMode = ReactTypeOfModeModule.ConcurrentMode
local NoMode = ReactTypeOfModeModule.NoMode
local ProfileMode = ReactTypeOfModeModule.ProfileMode
local StrictMode = ReactTypeOfModeModule.StrictMode
local BlockingMode = ReactTypeOfModeModule.BlockingMode
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local ShouldSetTextContentFunction = ReactFiberHostConfigModule.shouldSetTextContent
local IsSuspenseInstancePendingFunction = ReactFiberHostConfigModule.isSuspenseInstancePending
local IsSuspenseInstanceFallbackFunction = ReactFiberHostConfigModule.isSuspenseInstanceFallback
local RegisterSuspenseInstanceRetryFunction = ReactFiberHostConfigModule.registerSuspenseInstanceRetry
local SupportsHydration = ReactFiberHostConfigModule.supportsHydration
local ReactFiberHostContextNewModule = require(script.Parent["ReactFiberHostContext.new"])
local PushHostContextFunction = ReactFiberHostContextNewModule.pushHostContext
local PushHostContainerFunction = ReactFiberHostContextNewModule.pushHostContainer
local SuspenseStackCursor = ReactFiberSuspenseContextNewModule.suspenseStackCursor
local HasSuspenseContextFunction = ReactFiberSuspenseContextNewModule.hasSuspenseContext
local ForceSuspenseFallback = ReactFiberSuspenseContextNewModule.ForceSuspenseFallback
local AddSubtreeSuspenseContextFunction = ReactFiberSuspenseContextNewModule.addSubtreeSuspenseContext
local InvisibleParentSuspenseContext = ReactFiberSuspenseContextNewModule.InvisibleParentSuspenseContext
local PushSuspenseContextFunction = ReactFiberSuspenseContextNewModule.pushSuspenseContext
local SetDefaultShallowSuspenseContextFunction = ReactFiberSuspenseContextNewModule.setDefaultShallowSuspenseContext
local ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
local PropagateContextChangeFunction = ReactFiberNewContextNewModule.propagateContextChange
local ReadContextFunction = ReactFiberNewContextNewModule.readContext
local CalculateChangedBitsFunction = ReactFiberNewContextNewModule.calculateChangedBits
local PrepareToReadContextFunction = ReactFiberNewContextNewModule.prepareToReadContext
local PushProviderFunction = ReactFiberNewContextNewModule.pushProvider
local config = {
	renderWithHooksRef = nil,
	bailoutHooksRef = nil,
	shouldSuspendRef = nil
}

local _ = function(p1)
	-- upvalues: config (copy)
	if not config.shouldSuspendRef then
		config.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
	end
	return config.shouldSuspendRef(p1)
end

local _ = function()
	-- upvalues: config (copy)
	local ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
	config.renderWithHooksRef = ReactFiberHooksNewModule.renderWithHooks
	config.bailoutHooksRef = ReactFiberHooksNewModule.bailoutHooks
end

local function renderWithHooks(...)
	-- upvalues: config (copy)
	if not config.renderWithHooksRef then
		local ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.renderWithHooksRef = ReactFiberHooksNewModule.renderWithHooks
		config.bailoutHooksRef = ReactFiberHooksNewModule.bailoutHooks
	end
	return config.renderWithHooksRef(...)
end

local function bailoutHooks(...)
	-- upvalues: config (copy)
	if not config.bailoutHooksRef then
		local ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.renderWithHooksRef = ReactFiberHooksNewModule.renderWithHooks
		config.bailoutHooksRef = ReactFiberHooksNewModule.bailoutHooks
	end
	return config.bailoutHooksRef(...)
end

local StopProfilerTimerIfRunningFunction = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning
local ReactFiberContextNewModule = require(script.Parent["ReactFiberContext.new"])
local GetMaskedContextFunction = ReactFiberContextNewModule.getMaskedContext
local GetUnmaskedContextFunction = ReactFiberContextNewModule.getUnmaskedContext
local HasContextChangedFunction = ReactFiberContextNewModule.hasContextChanged
local PushContextProviderFunction = ReactFiberContextNewModule.pushContextProvider
local IsContextProviderFunction = ReactFiberContextNewModule.isContextProvider
local PushTopLevelContextObjectFunction = ReactFiberContextNewModule.pushTopLevelContextObject
local InvalidateContextProviderFunction = ReactFiberContextNewModule.invalidateContextProvider
local ReactFiberHydrationContextNewModule = require(script.Parent["ReactFiberHydrationContext.new"])
local ResetHydrationStateFunction = ReactFiberHydrationContextNewModule.resetHydrationState
local EnterHydrationStateFunction = ReactFiberHydrationContextNewModule.enterHydrationState
local ReenterHydrationStateFromDehydratedSuspenseInstanceFunction = ReactFiberHydrationContextNewModule.reenterHydrationStateFromDehydratedSuspenseInstance
local TryToClaimNextHydratableInstanceFunction = ReactFiberHydrationContextNewModule.tryToClaimNextHydratableInstance
local WarnIfHydratingFunction = ReactFiberHydrationContextNewModule.warnIfHydrating
local ReactFiberClassComponentNewModule = require(script.Parent["ReactFiberClassComponent.new"])
local AdoptClassInstanceFunction = ReactFiberClassComponentNewModule.adoptClassInstance
local ApplyDerivedStateFromPropsFunction = ReactFiberClassComponentNewModule.applyDerivedStateFromProps
local ConstructClassInstanceFunction = ReactFiberClassComponentNewModule.constructClassInstance
local MountClassInstanceFunction = ReactFiberClassComponentNewModule.mountClassInstance
local ResumeMountClassInstanceFunction = ReactFiberClassComponentNewModule.resumeMountClassInstance
local UpdateClassInstanceFunction = ReactFiberClassComponentNewModule.updateClassInstance
local ResolveDefaultPropsFunction = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local ReactFiberNewModule = require(script.Parent["ReactFiber.new"])
local ResolveLazyComponentTagFunction = ReactFiberNewModule.resolveLazyComponentTag
local CreateFiberFromFragmentFunction = ReactFiberNewModule.createFiberFromFragment
local CreateFiberFromOffscreenFunction = ReactFiberNewModule.createFiberFromOffscreen
local CreateFiberFromTypeAndPropsFunction = ReactFiberNewModule.createFiberFromTypeAndProps
local IsSimpleFunctionComponentFunction = ReactFiberNewModule.isSimpleFunctionComponent
local CreateWorkInProgressFunction = ReactFiberNewModule.createWorkInProgress
local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
local PushRenderLanesFunction = ReactFiberWorkLoopNewModule.pushRenderLanes
local MarkSpawnedWorkFunction = ReactFiberWorkLoopNewModule.markSpawnedWork
local RetryDehydratedSuspenseBoundaryFunction = ReactFiberWorkLoopNewModule.retryDehydratedSuspenseBoundary
local ScheduleUpdateOnFiberFunction = ReactFiberWorkLoopNewModule.scheduleUpdateOnFiber
local RenderDidSuspendDelayIfPossibleFunction = ReactFiberWorkLoopNewModule.renderDidSuspendDelayIfPossible
local GetWorkInProgressRootFunction = ReactFiberWorkLoopNewModule.getWorkInProgressRoot
local GetExecutionContextFunction = ReactFiberWorkLoopNewModule.getExecutionContext
local RetryAfterError = ReactFiberWorkLoopNewModule.RetryAfterError
local NoContext = ReactFiberWorkLoopNewModule.NoContext
local UnstableWrap = nil
local SetWorkInProgressVersionFunction = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion
local MarkSkippedUpdateLanesFunction = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local ConsolePatchingDev = require(Parent.Shared).ConsolePatchingDev
local DisableLogsFunction = ConsolePatchingDev.disableLogs
local ReenableLogsFunction = ConsolePatchingDev.reenableLogs
local ReactCurrentOwner = ReactSharedInternals.ReactCurrentOwner
local ReactFiberBeginWorkModule = {}
local Callback2 = nil
local Callback4 = nil
local IsNotBitsMatch = false
local config1 = {
	didWarnAboutBadClass = {},
	didWarnAboutModulePatternComponent = {},
	didWarnAboutContextTypeOnFunctionComponent = {},
	didWarnAboutGetDerivedStateOnFunctionComponent = {},
	didWarnAboutFunctionRefs = {},
	didWarnAboutDefaultPropsOnFunctionComponent = {}
}
local Callback3 = nil

if DEV then
	config1.didWarnAboutBadClass = {}
	config1.didWarnAboutModulePatternComponent = {}
	config1.didWarnAboutContextTypeOnFunctionComponent = {}
	config1.didWarnAboutGetDerivedStateOnFunctionComponent = {}
	config1.didWarnAboutFunctionRefs = {}
	ReactFiberBeginWorkModule.didWarnAboutReassigningProps = false
	config1.didWarnAboutDefaultPropsOnFunctionComponent = {}
end
local function reconcileChildren(p1, Current, Children, p2)
	-- upvalues: MountChildFibersFunction (copy), ReactFeatureFlags (copy), ReconcileChildFibersFunction (copy)
	if p1 == nil then
		Current.child = MountChildFibersFunction(Current, nil, Children, p2)
		
		return
	end
	if ReactFeatureFlags.enableWorkLoopTrims then
		local ReconcileChildFibersResult = ReconcileChildFibersFunction(Current, p1.child, Children, p2)
		
		if ReconcileChildFibersResult ~= nil or Current.child ~= nil then
			Current.child = ReconcileChildFibersResult
			
			return
		end
	else
		Current.child = ReconcileChildFibersFunction(Current, p1.child, Children, p2)
	end
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: ReconcileChildFibersFunction (copy)
	p2.child = ReconcileChildFibersFunction(p2, p1.child, nil, p4)
	p2.child = ReconcileChildFibersFunction(p2, nil, p3, p4)
end

local function updateForwardRef(p1, Current, InitResult, p2, BaseLanes)
	-- upvalues: DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), ReactCurrentOwner (copy), SetIsRenderingFunction (copy), renderWithHooks (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), IsNotBitsMatch (ref), bailoutHooks (copy), Callback2 (ref), PerformedWork (copy), reconcileChildren (copy)
	if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and Current.type ~= Current.elementType then
		local PropTypes = InitResult.propTypes
		local ValidateProps = InitResult.validateProps
		
		if PropTypes or ValidateProps then
			CheckPropTypesFunction(PropTypes, ValidateProps, p2, "prop", GetComponentNameFunction(InitResult))
		end
	end
	local Render = InitResult.render
	local Ref = Current.ref
	PrepareToReadContextFunction(Current, BaseLanes, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
	local RenderWithHooksResult = nil
	
	if DEV then
		ReactCurrentOwner.current = Current
		SetIsRenderingFunction(true)
		RenderWithHooksResult = renderWithHooks(p1, Current, Render, p2, Ref, BaseLanes)
		
		if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(Current.mode, StrictMode) ~= 0 then
			DisableLogsFunction()
			local Success, Result = xpcall(renderWithHooks, DescribeError, p1, Current, Render, p2, Ref, BaseLanes)
			
			if Success then
				RenderWithHooksResult = Result
			end
			ReenableLogsFunction()
			
			if not Success then
				error(Result)
			end
		end
		SetIsRenderingFunction(false)
	else
		RenderWithHooksResult = renderWithHooks(p1, Current, Render, p2, Ref, BaseLanes)
	end
	if p1 == nil or IsNotBitsMatch then
		Current.flags = bit32.bor(Current.flags, PerformedWork)
		reconcileChildren(p1, Current, RenderWithHooksResult, BaseLanes)
		
		return Current.child
	else
		bailoutHooks(p1, Current, BaseLanes)
		
		return Callback2(p1, Current, BaseLanes)
	end
end

local function updateMemoComponent(p1, Return_, InitResult, p2, Lanes, BaseLanes)
	-- upvalues: IsSimpleFunctionComponentFunction (copy), DEV (copy), ResolveFunctionForHotReloadingFunction (copy), SimpleMemoComponent (copy), Callback3 (ref), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), CreateFiberFromTypeAndPropsFunction (copy), ReactFiberLaneModule (copy), ShallowEqualFunction (copy), Callback2 (ref), PerformedWork (copy), CreateWorkInProgressFunction (copy)
	if p1 == nil then
		local Type1 = InitResult.type
		
		if IsSimpleFunctionComponentFunction(Type1) and InitResult.compare == nil and InitResult.defaultProps == nil then
			local ResolveFunctionForHotReloadingResult = if DEV then ResolveFunctionForHotReloadingFunction(Type1) else Type1
			Return_.tag = SimpleMemoComponent
			Return_.type = ResolveFunctionForHotReloadingResult
			
			if DEV then
				validateFunctionComponentInDev(Return_, Type1)
			end
			return Callback3(p1, Return_, ResolveFunctionForHotReloadingResult, p2, Lanes, BaseLanes)
		else
			if DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION then
				local PropTypes = nil
				local ValidateProps = nil
				
				if type(Type1) == "table" then
					PropTypes = Type1.propTypes
					ValidateProps = Type1.validateProps
				end
				if PropTypes or ValidateProps then
					CheckPropTypesFunction(PropTypes, ValidateProps, p2, "prop", GetComponentNameFunction(Type1))
				end
			end
			local FiberFromTypeAndProps = CreateFiberFromTypeAndPropsFunction(InitResult.type, nil, p2, Return_, Return_.mode, BaseLanes)
			FiberFromTypeAndProps.ref = Return_.ref
			FiberFromTypeAndProps.return_ = Return_
			Return_.child = FiberFromTypeAndProps
			
			return FiberFromTypeAndProps
		end
	else
		if DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			local Type2 = InitResult.type
			local PropTypes = nil
			local ValidateProps = nil
			
			if type(Type2) == "table" then
				PropTypes = Type2.propTypes
				ValidateProps = Type2.validateProps
			end
			if PropTypes or ValidateProps then
				CheckPropTypesFunction(PropTypes, ValidateProps, p2, "prop", GetComponentNameFunction(Type2))
			end
		end
		local Child = p1.child
		
		if not ReactFiberLaneModule.includesSomeLane(Lanes, BaseLanes) then
			local MemoizedProps = Child.memoizedProps
			local CompareFunction = InitResult.compare
			
			if CompareFunction == nil then
				CompareFunction = ShallowEqualFunction
			end
			if CompareFunction(MemoizedProps, p2) and p1.ref == Return_.ref then
				return Callback2(p1, Return_, BaseLanes)
			end
		end
		Return_.flags = bit32.bor(Return_.flags, PerformedWork)
		local WorkInProgress = CreateWorkInProgressFunction(Child, p2)
		WorkInProgress.ref = Return_.ref
		WorkInProgress.return_ = Return_
		Return_.child = WorkInProgress
		
		return WorkInProgress
	end
end

Callback3 = function(p1, Current, Type1, PendingProps, Lanes, BaseLanes)
	-- upvalues: DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), REACTLAZYTYPE (copy), DescribeError (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), ShallowEqualFunction (copy), IsNotBitsMatch (ref), ReactFiberLaneModule (copy), Callback2 (ref), ForceUpdateForLegacySuspense (copy), NoFlags (copy), Callback4 (ref)
	if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and Current.type ~= Current.elementType then
		local ElementType = Current.elementType
		
		if ElementType["$$typeof"] == REACTLAZYTYPE then
			local Success, Result = xpcall(ElementType._init, DescribeError, ElementType._payload)
			local Result1 = if Success then Result else nil
			local PropTypes = nil
			local ValidateProps = nil
			
			if Result1 ~= nil and type(Result1) == "table" then
				PropTypes = Result1.propTypes
				ValidateProps = Result1.validateProps
			end
			if PropTypes or ValidateProps then
				CheckPropTypesFunction(PropTypes, ValidateProps, PendingProps, "prop", GetComponentNameFunction(Result1))
			end
		end
	end
	if p1 ~= nil then
		local NoDEV: boolean = not DEV or Current.type == p1.type
		
		if ShallowEqualFunction(p1.memoizedProps, PendingProps) and p1.ref == Current.ref and NoDEV then
			IsNotBitsMatch = false
			
			if not ReactFiberLaneModule.includesSomeLane(BaseLanes, Lanes) then
				Current.lanes = p1.lanes
				
				return Callback2(p1, Current, BaseLanes)
			end
			if bit32.band(p1.flags, ForceUpdateForLegacySuspense) ~= NoFlags then
				IsNotBitsMatch = true
			end
		end
	end
	return Callback4(p1, Current, Type1, PendingProps, BaseLanes)
end

local function updateOffscreenComponent(p1, Current, BaseLanes)
	-- upvalues: ConcurrentMode (copy), NoMode (copy), ReactFiberLaneModule (copy), PushRenderLanesFunction (copy), EnableSchedulerTracing (copy), MarkSpawnedWorkFunction (copy), reconcileChildren (copy)
	local PendingProps = Current.pendingProps
	local Children = PendingProps.children
	local MemoizedState = if p1 ~= nil then p1.memoizedState else nil
	
	if PendingProps.mode == "hidden" or PendingProps.mode == "unstable-defer-without-hiding" then
		if bit32.band(Current.mode, ConcurrentMode) == NoMode then
			Current.memoizedState = { baseLanes = ReactFiberLaneModule.NoLanes }
			PushRenderLanesFunction(Current, BaseLanes)
		elseif ReactFiberLaneModule.includesSomeLane(BaseLanes, ReactFiberLaneModule.OffscreenLane) then
			Current.memoizedState = { baseLanes = ReactFiberLaneModule.NoLanes }
			PushRenderLanesFunction(Current, if MemoizedState == nil then BaseLanes else MemoizedState.baseLanes)
		else
			local BaseLanes1 = if MemoizedState == nil then BaseLanes else ReactFiberLaneModule.mergeLanes(MemoizedState.baseLanes, BaseLanes)
			
			if EnableSchedulerTracing then
				MarkSpawnedWorkFunction(ReactFiberLaneModule.OffscreenLane)
			end
			Current.childLanes = ReactFiberLaneModule.laneToLanes(ReactFiberLaneModule.OffscreenLane)
			Current.lanes = Current.childLanes
			Current.memoizedState = { baseLanes = BaseLanes1 }
			PushRenderLanesFunction(Current, BaseLanes1)
			
			return nil
		end
	else
		local MergeLanesResult = nil
		if MemoizedState == nil then
			MergeLanesResult = BaseLanes
		else
			MergeLanesResult = ReactFiberLaneModule.mergeLanes(MemoizedState.baseLanes, BaseLanes)
			Current.memoizedState = nil
		end
		PushRenderLanesFunction(Current, MergeLanesResult)
	end
	reconcileChildren(p1, Current, Children, BaseLanes)
	
	return Current.child
end

function updateFragment(p1, p2, p3)
	-- upvalues: reconcileChildren (copy)
	reconcileChildren(p1, p2, p2.pendingProps, p3)
	
	return p2.child
end

function updateMode(p1, p2, p3)
	-- upvalues: reconcileChildren (copy)
	reconcileChildren(p1, p2, p2.pendingProps.children, p3)
	
	return p2.child
end

function updateProfiler(p1, p2, p3)
	-- upvalues: EnableProfilerTimer (copy), reconcileChildren (copy)
	if EnableProfilerTimer then
		local StateNode = p2.stateNode
		StateNode.effectDuration = 0
		StateNode.passiveEffectDuration = 0
	end
	reconcileChildren(p1, p2, p2.pendingProps.children, p3)
	
	return p2.child
end

do
	local _ = function(p1, p2)
		-- upvalues: Ref (copy)
		local Ref1 = p2.ref
		
		if p1 == nil and Ref1 ~= nil or p1 ~= nil and p1.ref ~= Ref1 then
			p2.flags = bit32.bor(p2.flags, Ref)
		end
	end

	Callback4 = function(p1, Current, Callback, p2, BaseLanes)
		-- upvalues: DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), DisableLegacyContext (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), ReactCurrentOwner (copy), SetIsRenderingFunction (copy), renderWithHooks (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), IsNotBitsMatch (ref), bailoutHooks (copy), Callback2 (ref), PerformedWork (copy), reconcileChildren (copy)
		if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and (type(Callback) ~= "function" and Current.type ~= Current.elementType) then
			local PropTypes = nil
			local ValidateProps = nil
			
			if type(Callback) == "table" then
				PropTypes = Callback.propTypes
				ValidateProps = Callback.validateProps
			end
			if PropTypes or ValidateProps then
				CheckPropTypesFunction(PropTypes, ValidateProps, p2, "prop", GetComponentNameFunction(Callback))
			end
		end
		local MaskedContext = if DisableLegacyContext then nil else GetMaskedContextFunction(Current, (GetUnmaskedContextFunction(Current, Callback, true)))
		PrepareToReadContextFunction(Current, BaseLanes, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
		local RenderWithHooksResult = nil
		
		if DEV then
			ReactCurrentOwner.current = Current
			SetIsRenderingFunction(true)
			RenderWithHooksResult = renderWithHooks(p1, Current, Callback, p2, MaskedContext, BaseLanes)
			
			if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(Current.mode, StrictMode) ~= 0 then
				DisableLogsFunction()
				local Success, Result = xpcall(renderWithHooks, DescribeError, p1, Current, Callback, p2, MaskedContext, BaseLanes)
				ReenableLogsFunction()
				
				if Success then
					RenderWithHooksResult = Result
				else
					error(Result)
				end
			end
			SetIsRenderingFunction(false)
		else
			RenderWithHooksResult = renderWithHooks(p1, Current, Callback, p2, MaskedContext, BaseLanes)
		end
		if p1 == nil or IsNotBitsMatch then
			Current.flags = bit32.bor(Current.flags, PerformedWork)
			reconcileChildren(p1, Current, RenderWithHooksResult, BaseLanes)
			
			return Current.child
		else
			bailoutHooks(p1, Current, BaseLanes)
			
			return Callback2(p1, Current, BaseLanes)
		end
	end

	local function updateClassComponent(p1, Current, InitResult, Props, BaseLanes)
		-- upvalues: DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), IsContextProviderFunction (copy), PushContextProviderFunction (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), Placement (copy), ConstructClassInstanceFunction (copy), MountClassInstanceFunction (copy), ResumeMountClassInstanceFunction (copy), UpdateClassInstanceFunction (copy), Console (copy)
		if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and Current.type ~= Current.elementType then
			local PropTypes = InitResult.propTypes
			local ValidateProps = InitResult.validateProps
			
			if PropTypes or ValidateProps then
				CheckPropTypesFunction(PropTypes, ValidateProps, Props, "prop", GetComponentNameFunction(InitResult))
			end
		end
		local Flag = nil
		if IsContextProviderFunction(InitResult) then
			Flag = true
			PushContextProviderFunction(Current)
		else
			Flag = false
		end
		PrepareToReadContextFunction(Current, BaseLanes, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
		local ResumeMountClassInstanceResult = nil
		
		if Current.stateNode == nil then
			if p1 ~= nil then
				p1.alternate = nil
				Current.alternate = nil
				Current.flags = bit32.bor(Current.flags, Placement)
			end
			ConstructClassInstanceFunction(Current, InitResult, Props)
			MountClassInstanceFunction(Current, InitResult, Props, BaseLanes)
			ResumeMountClassInstanceResult = true
		else
			ResumeMountClassInstanceResult = if p1 == nil then ResumeMountClassInstanceFunction(Current, InitResult, Props, BaseLanes) else UpdateClassInstanceFunction(p1, Current, InitResult, Props, BaseLanes)
		end
		local FinishClassComponentResult = finishClassComponent(p1, Current, InitResult, ResumeMountClassInstanceResult, Flag, BaseLanes)
		
		if DEV then
			local StateNode = Current.stateNode
			
			if ResumeMountClassInstanceResult and StateNode.props ~= Props then
				if not ReactFiberBeginWorkModule.didWarnAboutReassigningProps then
					Console.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", GetComponentNameFunction(Current.type) or "a component")
				end
				ReactFiberBeginWorkModule.didWarnAboutReassigningProps = true
			end
		end
		return FinishClassComponentResult
	end

	function finishClassComponent(p1, Current, p2, p3, p4, p5)
		-- upvalues: Ref (copy), DidCapture (copy), NoFlags (copy), InvalidateContextProviderFunction (copy), Callback2 (ref), ReactCurrentOwner (copy), EnableProfilerTimer (copy), StopProfilerTimerIfRunningFunction (copy), DEV (copy), SetIsRenderingFunction (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), PerformedWork (copy), ReconcileChildFibersFunction (copy), reconcileChildren (copy)
		local Ref1 = Current.ref
		
		if p1 == nil and Ref1 ~= nil or p1 ~= nil and p1.ref ~= Ref1 then
			Current.flags = bit32.bor(Current.flags, Ref)
		end
		local IsNotBitsMatch = bit32.band(Current.flags, DidCapture) ~= NoFlags
		
		if p3 or IsNotBitsMatch then
			local StateNode = Current.stateNode
			ReactCurrentOwner.current = Current
			local RenderResult = nil
			
			if IsNotBitsMatch and (p2.getDerivedStateFromError == nil or type(p2.getDerivedStateFromError) ~= "function") then
				RenderResult = nil
				
				if EnableProfilerTimer then
					StopProfilerTimerIfRunningFunction(Current)
				end
			elseif DEV then
				SetIsRenderingFunction(true)
				RenderResult = StateNode:render()
				
				if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(Current.mode, StrictMode) ~= 0 then
					DisableLogsFunction()
					local Success, Result = xpcall(StateNode.render, DescribeError, StateNode)
					ReenableLogsFunction()
					
					if not Success then
						error(Result)
					end
				end
				SetIsRenderingFunction(false)
			else
				RenderResult = StateNode:render()
			end
			Current.flags = bit32.bor(Current.flags, PerformedWork)
			
			if p1 == nil or not IsNotBitsMatch then
				reconcileChildren(p1, Current, RenderResult, p5)
			else
				Current.child = ReconcileChildFibersFunction(Current, p1.child, nil, p5)
				Current.child = ReconcileChildFibersFunction(Current, nil, RenderResult, p5)
			end
			Current.memoizedState = StateNode.state
			
			if p4 then
				InvalidateContextProviderFunction(Current, p2, true)
			end
			return Current.child
		else
			if p4 then
				InvalidateContextProviderFunction(Current, p2, false)
			end
			return Callback2(p1, Current, p5)
		end
	end

	local _ = function(p1)
		-- upvalues: PushTopLevelContextObjectFunction (copy), PushHostContainerFunction (copy)
		local StateNode = p1.stateNode
		
		if StateNode.pendingContext then
			PushTopLevelContextObjectFunction(p1, StateNode.pendingContext, StateNode.pendingContext ~= StateNode.context)
		elseif StateNode.context then
			PushTopLevelContextObjectFunction(p1, StateNode.context, false)
		end
		PushHostContainerFunction(p1, StateNode.containerInfo)
	end

	local function updateHostRoot(p1, Current, BaseLanes)
		-- upvalues: PushTopLevelContextObjectFunction (copy), PushHostContainerFunction (copy), InvariantFunction (copy), CloneUpdateQueueFunction (copy), ProcessUpdateQueueFunction (copy), ResetHydrationStateFunction (copy), Callback2 (ref), EnterHydrationStateFunction (copy), SupportsHydration (copy), SetWorkInProgressVersionFunction (copy), MountChildFibersFunction (copy), Placement (copy), Hydrating (copy), reconcileChildren (copy)
		local StateNode = Current.stateNode
		
		if StateNode.pendingContext then
			PushTopLevelContextObjectFunction(Current, StateNode.pendingContext, StateNode.pendingContext ~= StateNode.context)
		elseif StateNode.context then
			PushTopLevelContextObjectFunction(Current, StateNode.context, false)
		end
		PushHostContainerFunction(Current, StateNode.containerInfo)
		local UpdateQueue = Current.updateQueue
		InvariantFunction(p1 ~= nil and UpdateQueue ~= nil, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
		local PendingProps = Current.pendingProps
		local MemoizedState = Current.memoizedState
		local Element = if MemoizedState == nil then nil else MemoizedState.element
		CloneUpdateQueueFunction(p1, Current)
		ProcessUpdateQueueFunction(Current, PendingProps, nil, BaseLanes)
		local Element1 = Current.memoizedState.element
		
		if Element1 == Element then
			ResetHydrationStateFunction()
			
			return Callback2(p1, Current, BaseLanes)
		end
		local StateNode1 = Current.stateNode
		
		if StateNode1.hydrate and EnterHydrationStateFunction(Current) then
			if SupportsHydration then
				local MutableSourceEagerHydrationData = StateNode1.mutableSourceEagerHydrationData
				
				if MutableSourceEagerHydrationData ~= nil then
					for i = 1, #MutableSourceEagerHydrationData, 2 do
						SetWorkInProgressVersionFunction(MutableSourceEagerHydrationData[i], MutableSourceEagerHydrationData[i + 1])
					end
				end
			end
			local MountChildFibersResult = MountChildFibersFunction(Current, nil, Element1, BaseLanes)
			Current.child = MountChildFibersResult
			local Sibling = MountChildFibersResult
			while Sibling do
				Sibling.flags = bit32.bor(bit32.band(Sibling.flags, (bit32.bnot(Placement))), Hydrating)
				Sibling = Sibling.sibling
			end
		else
			reconcileChildren(p1, Current, Element1, BaseLanes)
			ResetHydrationStateFunction()
		end
		return Current.child
	end

	local function updateHostComponent(p2, Current, BaseLanes)
		-- upvalues: PushHostContextFunction (copy), TryToClaimNextHydratableInstanceFunction (copy), ShouldSetTextContentFunction (copy), ContentReset (copy), PerformedWork (copy), Ref (copy), reconcileChildren (copy)
		PushHostContextFunction(Current)
		
		if p2 == nil then
			TryToClaimNextHydratableInstanceFunction(Current)
		end
		local Type1 = Current.type
		local PendingProps = Current.pendingProps
		local MemoizedProps = if p2 == nil then nil else p2.memoizedProps
		local Children = PendingProps.children
		
		if ShouldSetTextContentFunction(Type1, PendingProps) then
			Children = nil
		elseif MemoizedProps ~= nil and ShouldSetTextContentFunction(Type1, MemoizedProps) then
			Current.flags = bit32.bor(Current.flags, ContentReset)
		end
		Current.flags = bit32.bor(Current.flags, PerformedWork)
		local Ref1 = Current.ref
		
		if p2 == nil and Ref1 ~= nil or p2 ~= nil and p2.ref ~= Ref1 then
			Current.flags = bit32.bor(Current.flags, Ref)
		end
		reconcileChildren(p2, Current, Children, BaseLanes)
		
		return Current.child
	end

	local _ = function(p2, p3)
		-- upvalues: TryToClaimNextHydratableInstanceFunction (copy)
		if p2 == nil then
			TryToClaimNextHydratableInstanceFunction(p3)
		end
		return nil
	end

	local function mountLazyComponent(p2, Current, ElementType, Lanes, BaseLanes)
		-- upvalues: Placement (copy), ResolveLazyComponentTagFunction (copy), ResolveDefaultPropsFunction (copy), FunctionComponent (copy), DEV (copy), ResolveFunctionForHotReloadingFunction (copy), Callback4 (ref), ClassComponent (copy), ResolveClassForHotReloadingFunction (copy), updateClassComponent (copy), ForwardRef (copy), ResolveForwardRefForHotReloadingFunction (copy), updateForwardRef (copy), MemoComponent (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), updateMemoComponent (copy), REACTLAZYTYPE (copy), InspectFunction (copy), InvariantFunction (copy)
		if p2 ~= nil then
			p2.alternate = nil
			Current.alternate = nil
			Current.flags = bit32.bor(Current.flags, Placement)
		end
		local PendingProps = Current.pendingProps
		local InitResult = ElementType._init(ElementType._payload)
		Current.type = InitResult
		Current.tag = ResolveLazyComponentTagFunction(InitResult)
		local Tag = Current.tag
		local ResolveDefaultPropsResult = ResolveDefaultPropsFunction(InitResult, PendingProps)
		
		if Tag == FunctionComponent then
			if DEV then
				validateFunctionComponentInDev(Current, InitResult)
				InitResult = ResolveFunctionForHotReloadingFunction(InitResult)
				Current.type = InitResult
			end
			return (Callback4(nil, Current, InitResult, ResolveDefaultPropsResult, BaseLanes))
		elseif Tag == ClassComponent then
			if DEV then
				InitResult = ResolveClassForHotReloadingFunction(InitResult)
				Current.type = InitResult
			end
			return (updateClassComponent(nil, Current, InitResult, ResolveDefaultPropsResult, BaseLanes))
		elseif Tag == ForwardRef then
			if DEV then
				InitResult = ResolveForwardRefForHotReloadingFunction(InitResult)
				Current.type = InitResult
			end
			return (updateForwardRef(nil, Current, InitResult, ResolveDefaultPropsResult, BaseLanes))
		elseif Tag == MemoComponent then
			if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and Current.type ~= Current.elementType then
				local PropTypes = InitResult.propTypes
				local ValidateProps = InitResult.validateProps
				
				if PropTypes or ValidateProps then
					CheckPropTypesFunction(PropTypes, ValidateProps, ResolveDefaultPropsResult, "prop", GetComponentNameFunction(InitResult))
				end
			end
			return (updateMemoComponent(nil, Current, InitResult, ResolveDefaultPropsFunction(InitResult.type, ResolveDefaultPropsResult), Lanes, BaseLanes))
		else
			local v1 = ""
			
			if DEV then
				if InitResult == nil or type(InitResult) ~= "table" or InitResult["$$typeof"] ~= REACTLAZYTYPE then
					if type(InitResult) == "table" and InitResult["$$typeof"] == nil then
						v1 = "\n" .. InspectFunction(InitResult)
					end
				else
					v1 = " Did you wrap a component in React.lazy() more than once?"
				end
			end
			InvariantFunction(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(InitResult), v1)
			
			return nil
		end
	end

	function mountIncompleteClassComponent(p2, p3, p4, p5, p6)
		-- upvalues: Placement (copy), ClassComponent (copy), IsContextProviderFunction (copy), PushContextProviderFunction (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), ConstructClassInstanceFunction (copy), MountClassInstanceFunction (copy)
		if p2 ~= nil then
			p2.alternate = nil
			p3.alternate = nil
			p3.flags = bit32.bor(p3.flags, Placement)
		end
		p3.tag = ClassComponent
		local Flag = nil
		
		if IsContextProviderFunction(p4) then
			Flag = true
			PushContextProviderFunction(p3)
		else
			Flag = false
		end
		PrepareToReadContextFunction(p3, p6, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
		ConstructClassInstanceFunction(p3, p4, p5)
		MountClassInstanceFunction(p3, p4, p5, p6)
		
		return finishClassComponent(nil, p3, p4, true, Flag, p6)
	end

	local function mountIndeterminateComponent(p2, Current, Callback, BaseLanes)
		-- upvalues: Placement (copy), DisableLegacyContext (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), DEV (copy), GetComponentNameFunction (copy), config1 (copy), Console (copy), StrictMode (copy), ReactStrictModeWarningsNewModule (copy), SetIsRenderingFunction (copy), ReactCurrentOwner (copy), renderWithHooks (copy), PerformedWork (copy), DisableModulePatternComponents (copy), ClassComponent (copy), IsContextProviderFunction (copy), PushContextProviderFunction (copy), InitializeUpdateQueueFunction (copy), ApplyDerivedStateFromPropsFunction (copy), AdoptClassInstanceFunction (copy), MountClassInstanceFunction (copy), FunctionComponent (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), MountChildFibersFunction (copy)
		if p2 ~= nil then
			p2.alternate = nil
			Current.alternate = nil
			Current.flags = bit32.bor(Current.flags, Placement)
		end
		local PendingProps = Current.pendingProps
		local MaskedContext = if DisableLegacyContext then nil else GetMaskedContextFunction(Current, (GetUnmaskedContextFunction(Current, Callback, false)))
		PrepareToReadContextFunction(Current, BaseLanes, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
		local RenderWithHooksResult = nil
		
		if DEV then
			if type(Callback) == "table" and type(Callback.render) == "function" then
				local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
				
				if not config1.didWarnAboutBadClass[ComponentName] then
					Console.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", ComponentName, ComponentName)
					config1.didWarnAboutBadClass[ComponentName] = true
				end
			end
			if bit32.band(Current.mode, StrictMode) ~= 0 then
				ReactStrictModeWarningsNewModule.recordLegacyContextWarning(Current)
			end
			SetIsRenderingFunction(true)
			ReactCurrentOwner.current = Current
			RenderWithHooksResult = renderWithHooks(nil, Current, Callback, PendingProps, MaskedContext, BaseLanes)
			SetIsRenderingFunction(false)
		else
			RenderWithHooksResult = renderWithHooks(nil, Current, Callback, PendingProps, MaskedContext, BaseLanes)
		end
		Current.flags = bit32.bor(Current.flags, PerformedWork)
		local ValueType = type(RenderWithHooksResult)
		
		if DEV and RenderWithHooksResult ~= nil and ValueType == "table" and type(RenderWithHooksResult.render) == "function" and RenderWithHooksResult["$$typeof"] == nil then
			local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
			
			if not config1.didWarnAboutModulePatternComponent[ComponentName] then
				Console.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", ComponentName, ComponentName)
				config1.didWarnAboutModulePatternComponent[ComponentName] = true
			end
		end
		if DisableModulePatternComponents or RenderWithHooksResult == nil or ValueType ~= "table" or type(RenderWithHooksResult.render) ~= "function" or RenderWithHooksResult["$$typeof"] ~= nil then
			Current.tag = FunctionComponent
			
			if DEV then
				if DisableLegacyContext and Callback.contextTypes then
					Console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", GetComponentNameFunction(Callback) or "Unknown")
				end
				if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(Current.mode, StrictMode) ~= 0 then
					DisableLogsFunction()
					local Success, Result = xpcall(renderWithHooks, DescribeError, nil, Current, Callback, PendingProps, MaskedContext, BaseLanes)
					ReenableLogsFunction()
					
					if Success then
						RenderWithHooksResult = Result
					else
						error(Result)
					end
				end
			end
			Current.child = MountChildFibersFunction(Current, nil, RenderWithHooksResult, BaseLanes)
			
			if DEV then
				validateFunctionComponentInDev(Current, Callback)
			end
			return Current.child
		else
			if DEV then
				local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
				
				if not config1.didWarnAboutModulePatternComponent[ComponentName] then
					Console.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. ComponentName, ComponentName)
					config1.didWarnAboutModulePatternComponent[ComponentName] = true
				end
			end
			Current.tag = ClassComponent
			Current.memoizedState = nil
			Current.updateQueue = nil
			local Flag = nil
			
			if IsContextProviderFunction(Callback) then
				Flag = true
				PushContextProviderFunction(Current)
			else
				Flag = false
			end
			Current.memoizedState = RenderWithHooksResult.state
			InitializeUpdateQueueFunction(Current)
			local GetDerivedStateFromProps = if type(Callback) ~= "function" then Callback.getDerivedStateFromProps else nil
			
			if GetDerivedStateFromProps ~= nil and type(GetDerivedStateFromProps) == "function" then
				ApplyDerivedStateFromPropsFunction(Current, Callback, GetDerivedStateFromProps, PendingProps)
			end
			AdoptClassInstanceFunction(Current, RenderWithHooksResult)
			MountClassInstanceFunction(Current, Callback, PendingProps, BaseLanes)
			
			return finishClassComponent(nil, Current, Callback, true, Flag, BaseLanes)
		end
	end

	function validateFunctionComponentInDev(p2, Callback)
		-- upvalues: DEV (copy), GetCurrentFiberOwnerNameInDevOrNullFunction (copy), config1 (copy), Console (copy), WarnAboutDefaultPropsOnFunctionComponents (copy), GetComponentNameFunction (copy)
		if DEV then
			if p2.ref ~= nil then
				local Text = ""
				local CurrentFiberOwnerNameInDevOrNull = GetCurrentFiberOwnerNameInDevOrNullFunction()
				
				if CurrentFiberOwnerNameInDevOrNull then
					Text ..= "\n\nCheck the render method of `" .. CurrentFiberOwnerNameInDevOrNull .. "`."
				end
				local CurrentFiberOwnerNameInDevOrNull1 = CurrentFiberOwnerNameInDevOrNull or (p2._debugID or "")
				local DebugSource = p2._debugSource
				
				if DebugSource then
					CurrentFiberOwnerNameInDevOrNull1 = DebugSource.fileName .. ":" .. DebugSource.lineNumber
				end
				if not config1.didWarnAboutFunctionRefs[CurrentFiberOwnerNameInDevOrNull1] then
					config1.didWarnAboutFunctionRefs[CurrentFiberOwnerNameInDevOrNull1] = true
					Console.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", Text)
				end
			end
			if WarnAboutDefaultPropsOnFunctionComponents and type(Callback) ~= "function" and Callback.defaultProps ~= nil then
				local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
				
				if not config1.didWarnAboutDefaultPropsOnFunctionComponent[ComponentName] then
					Console.error("%s: Support for defaultProps will be removed from function components in a future major release.", ComponentName)
					config1.didWarnAboutDefaultPropsOnFunctionComponent[ComponentName] = true
				end
			end
			if type(Callback) ~= "function" and Callback.getDerivedStateFromProps ~= nil and type(Callback.getDerivedStateFromProps) == "function" then
				local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
				
				if not config1.didWarnAboutGetDerivedStateOnFunctionComponent[ComponentName] then
					Console.error("%s: Function components do not support getDerivedStateFromProps.", ComponentName)
					config1.didWarnAboutGetDerivedStateOnFunctionComponent[ComponentName] = true
				end
			end
			if type(Callback) ~= "function" and Callback.contextType ~= nil and type(Callback.contextType) == "table" then
				local ComponentName = GetComponentNameFunction(Callback) or "Unknown"
				
				if not config1.didWarnAboutContextTypeOnFunctionComponent[ComponentName] then
					Console.error("%s: Function components do not support contextType.", ComponentName)
					config1.didWarnAboutContextTypeOnFunctionComponent[ComponentName] = true
				end
			end
		end
	end

	local MemoizedState = {
		dehydrated = nil,
		retryLane = ReactFiberLaneModule.NoLane
	}

	local _ = function(BaseLanes)
		return { baseLanes = BaseLanes }
	end

	local _ = function(p2, p3)
		-- upvalues: ReactFiberLaneModule (copy)
		return {
			baseLanes = ReactFiberLaneModule.mergeLanes(p2.baseLanes, p3)
		}
	end

	local _ = function(p2, p3, _, _)
		-- upvalues: HasSuspenseContextFunction (copy), ForceSuspenseFallback (copy)
		return (p3 == nil or p3.memoizedState ~= nil) and HasSuspenseContextFunction(p2, ForceSuspenseFallback)
	end

	local _ = function(p2, p3)
		-- upvalues: ReactFiberLaneModule (copy)
		return ReactFiberLaneModule.removeLanes(p2.childLanes, p3)
	end

	local Callback7 = nil
	local Callback6 = nil
	local Callback1 = nil
	local Callback5 = nil
	local Callback = nil

	local function updateSuspenseComponent(p2, Return, BaseLanes)
		-- upvalues: DEV (copy), config (copy), DidCapture (copy), SuspenseStackCursor (copy), NoFlags (copy), HasSuspenseContextFunction (copy), ForceSuspenseFallback (copy), AddSubtreeSuspenseContextFunction (copy), InvisibleParentSuspenseContext (copy), SetDefaultShallowSuspenseContextFunction (copy), PushSuspenseContextFunction (copy), TryToClaimNextHydratableInstanceFunction (copy), EnableSuspenseServerRenderer (copy), Callback6 (ref), MemoizedState (copy), ReactFiberLaneModule (copy), EnableSchedulerTracing (copy), MarkSpawnedWorkFunction (copy), Callback1 (ref), Callback (ref), Callback5 (ref), Callback7 (ref)
		local PendingProps = Return.pendingProps
		
		if DEV then
			if not config.shouldSuspendRef then
				config.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
			end
			if config.shouldSuspendRef(Return) then
				Return.flags = bit32.bor(Return.flags, DidCapture)
			end
		end
		local Current = SuspenseStackCursor.current
		local Flag = false
		local IsNotBitsMatch = bit32.band(Return.flags, DidCapture) ~= NoFlags
		
		if IsNotBitsMatch or (p2 == nil or p2.memoizedState ~= nil) and HasSuspenseContextFunction(Current, ForceSuspenseFallback) then
			Flag = true
			Return.flags = bit32.band(Return.flags, (bit32.bnot(DidCapture)))
		elseif (p2 == nil or p2.memoizedState ~= nil) and (PendingProps.fallback ~= nil and PendingProps.unstable_avoidThisFallback ~= true) then
			Current = AddSubtreeSuspenseContextFunction(Current, InvisibleParentSuspenseContext)
		end
		PushSuspenseContextFunction(Return, (SetDefaultShallowSuspenseContextFunction(Current)))
		
		if p2 == nil then
			if PendingProps.fallback ~= nil then
				TryToClaimNextHydratableInstanceFunction(Return)
				
				if EnableSuspenseServerRenderer then
					local MemoizedState2 = Return.memoizedState
					
					if MemoizedState2 ~= nil then
						local Dehydrated = MemoizedState2.dehydrated
						
						if Dehydrated ~= nil then
							return Callback6(Return, Dehydrated, BaseLanes)
						end
					end
				end
			end
			local Children = PendingProps.children
			local Fallback = PendingProps.fallback
			
			if Flag then
				Return.child.memoizedState = { baseLanes = BaseLanes }
				Return.memoizedState = MemoizedState
				
				return (mountSuspenseFallbackChildren(Return, Children, Fallback, BaseLanes))
			end
			if PendingProps.unstable_expectedLoadTime == nil or type(PendingProps.unstable_expectedLoadTime) ~= "number" then
				return Callback1(Return, Children, BaseLanes)
			end
			local MountSuspenseFallbackChildrenResult = mountSuspenseFallbackChildren(Return, Children, Fallback, BaseLanes)
			Return.child.memoizedState = { baseLanes = BaseLanes }
			Return.memoizedState = MemoizedState
			Return.lanes = ReactFiberLaneModule.SomeRetryLane
			
			if EnableSchedulerTracing then
				MarkSpawnedWorkFunction(ReactFiberLaneModule.SomeRetryLane)
			end
			return MountSuspenseFallbackChildrenResult
		else
			local MemoizedState1 = p2.memoizedState
			
			if MemoizedState1 == nil then
				if not Flag then
					Return.memoizedState = nil
					
					return (Callback7(p2, Return, PendingProps.children, BaseLanes))
				end
				local CallbackResult = Callback5(p2, Return, PendingProps.children, PendingProps.fallback, BaseLanes)
				local Child = Return.child
				local MemoizedState4 = p2.child.memoizedState
				
				if MemoizedState4 == nil then
					Child.memoizedState = { baseLanes = BaseLanes }
				else
					Child.memoizedState = {
						baseLanes = ReactFiberLaneModule.mergeLanes(MemoizedState4.baseLanes, BaseLanes)
					}
				end
				Child.childLanes = ReactFiberLaneModule.removeLanes(p2.childLanes, BaseLanes)
				Return.memoizedState = MemoizedState
				
				return CallbackResult
			else
				if EnableSuspenseServerRenderer then
					local Dehydrated = MemoizedState1.dehydrated
					
					if Dehydrated ~= nil then
						if not IsNotBitsMatch then
							return Callback(p2, Return, Dehydrated, MemoizedState1, BaseLanes)
						elseif Return.memoizedState == nil then
							Return.child.memoizedState = { baseLanes = BaseLanes }
							Return.memoizedState = MemoizedState
							
							return (mountSuspenseFallbackAfterRetryWithoutHydrating(p2, Return, PendingProps.children, PendingProps.fallback, BaseLanes))
						else
							Return.child = p2.child
							Return.flags = bit32.bor(Return.flags, DidCapture)
							
							return nil
						end
					end
				end
				if not Flag then
					Return.memoizedState = nil
					
					return (Callback7(p2, Return, PendingProps.children, BaseLanes))
				end
				local CallbackResult = Callback5(p2, Return, PendingProps.children, PendingProps.fallback, BaseLanes)
				local Child = Return.child
				local MemoizedState3 = p2.child.memoizedState
				
				if MemoizedState3 == nil then
					Child.memoizedState = { baseLanes = BaseLanes }
				else
					Child.memoizedState = {
						baseLanes = ReactFiberLaneModule.mergeLanes(MemoizedState3.baseLanes, BaseLanes)
					}
				end
				Child.childLanes = ReactFiberLaneModule.removeLanes(p2.childLanes, BaseLanes)
				Return.memoizedState = MemoizedState
				
				return CallbackResult
			end
		end
	end

	Callback1 = function(Return, Children, BaseLanes)
		-- upvalues: CreateFiberFromOffscreenFunction (copy)
		local FiberFromOffscreen = CreateFiberFromOffscreenFunction({ mode = "visible", children = Children }, Return.mode, BaseLanes, nil)
		FiberFromOffscreen.return_ = Return
		Return.child = FiberFromOffscreen
		
		return FiberFromOffscreen
	end

	function mountSuspenseFallbackChildren(Return_, Children, p2, p3)
		-- upvalues: BlockingMode (copy), NoMode (copy), ReactFiberLaneModule (copy), EnableProfilerTimer (copy), ProfileMode (copy), CreateFiberFromFragmentFunction (copy), CreateFiberFromOffscreenFunction (copy)
		local Mode: number = Return_.mode
		local Child = Return_.child
		local PendingProps = { mode = "hidden", children = Children }
		local FiberFromOffscreen = nil
		local FiberFromFragment = nil
		
		if bit32.band(Mode, BlockingMode) == NoMode and Child ~= nil then
			FiberFromOffscreen = Child
			FiberFromOffscreen.childLanes = ReactFiberLaneModule.NoLanes
			FiberFromOffscreen.pendingProps = PendingProps
			
			if EnableProfilerTimer and bit32.band(Return_.mode, ProfileMode) ~= 0 then
				FiberFromOffscreen.actualDuration = 0
				FiberFromOffscreen.actualStartTime = -1
				FiberFromOffscreen.selfBaseDuration = 0
				FiberFromOffscreen.treeBaseDuration = 0
			end
			FiberFromFragment = CreateFiberFromFragmentFunction(p2, Mode, p3, nil)
		else
			FiberFromOffscreen = CreateFiberFromOffscreenFunction(PendingProps, Mode, ReactFiberLaneModule.NoLanes, nil)
			FiberFromFragment = CreateFiberFromFragmentFunction(p2, Mode, p3, nil)
		end
		FiberFromOffscreen.return_ = Return_
		FiberFromFragment.return_ = Return_
		FiberFromOffscreen.sibling = FiberFromFragment
		Return_.child = FiberFromOffscreen
		
		return FiberFromFragment
	end

	local _ = function(p2, p3)
		-- upvalues: CreateWorkInProgressFunction (copy)
		return CreateWorkInProgressFunction(p2, p3)
	end

	Callback7 = function(p2, Return, Children, BaseLanes)
		-- upvalues: CreateWorkInProgressFunction (copy), BlockingMode (copy), NoMode (copy), Deletion (copy)
		local Child = p2.child
		local Sibling = Child.sibling
		local WorkInProgress = CreateWorkInProgressFunction(Child, { mode = "visible", children = Children })
		
		if bit32.band(Return.mode, BlockingMode) == NoMode then
			WorkInProgress.lanes = BaseLanes
		end
		WorkInProgress.return_ = Return
		WorkInProgress.sibling = nil
		
		if Sibling ~= nil then
			local Deletions = Return.deletions
			
			if Deletions == nil then
				Return.deletions = { Sibling }
				Return.flags = bit32.bor(Return.flags, Deletion)
			else
				table.insert(Deletions, Sibling)
			end
		end
		Return.child = WorkInProgress
		
		return WorkInProgress
	end

	Callback5 = function(p2, Return_, Children, Fallback, BaseLanes)
		-- upvalues: BlockingMode (copy), NoMode (copy), ReactFiberLaneModule (copy), EnableProfilerTimer (copy), ProfileMode (copy), CreateWorkInProgressFunction (copy), StaticMask (copy), CreateFiberFromFragmentFunction (copy), Placement (copy)
		local Mode: number = Return_.mode
		local Child = p2.child
		local Sibling = Child.sibling
		local PendingProps = { mode = "hidden", children = Children }
		local WorkInProgress = nil
		
		if bit32.band(Mode, BlockingMode) == NoMode and Return_.child ~= Child then
			WorkInProgress = Return_.child
			WorkInProgress.childLanes = ReactFiberLaneModule.NoLanes
			WorkInProgress.pendingProps = PendingProps
			
			if EnableProfilerTimer and bit32.band(Return_.mode, ProfileMode) ~= 0 then
				WorkInProgress.actualDuration = 0
				WorkInProgress.actualStartTime = -1
				WorkInProgress.selfBaseDuration = Child.selfBaseDuration
				WorkInProgress.treeBaseDuration = Child.treeBaseDuration
			end
			Return_.deletions = nil
		else
			WorkInProgress = CreateWorkInProgressFunction(Child, PendingProps)
			WorkInProgress.subtreeFlags = bit32.band(Child.subtreeFlags, StaticMask)
		end
		local WorkInProgress1 = nil
		if Sibling == nil then
			WorkInProgress1 = CreateFiberFromFragmentFunction(Fallback, Mode, BaseLanes, nil)
			WorkInProgress1.flags = bit32.bor(WorkInProgress1.flags, Placement)
		else
			WorkInProgress1 = CreateWorkInProgressFunction(Sibling, Fallback)
		end
		WorkInProgress1.return_ = Return_
		WorkInProgress.return_ = Return_
		WorkInProgress.sibling = WorkInProgress1
		Return_.child = WorkInProgress
		
		return WorkInProgress1
	end

	local _ = function(p2, Return, p3)
		-- upvalues: ReconcileChildFibersFunction (copy), Callback1 (ref), Placement (copy)
		ReconcileChildFibersFunction(Return, p2.child, nil, p3)
		local CallbackResult = Callback1(Return, Return.pendingProps.children, p3)
		CallbackResult.flags = bit32.bor(CallbackResult.flags, Placement)
		Return.memoizedState = nil
		
		return CallbackResult
	end

	function mountSuspenseFallbackAfterRetryWithoutHydrating(p2, Return_, p3, p4, p5)
		-- upvalues: CreateFiberFromOffscreenFunction (copy), ReactFiberLaneModule (copy), CreateFiberFromFragmentFunction (copy), Placement (copy), BlockingMode (copy), NoMode (copy), ReconcileChildFibersFunction (copy)
		local Mode = Return_.mode
		local FiberFromOffscreen = CreateFiberFromOffscreenFunction(p3, Mode, ReactFiberLaneModule.NoLanes, nil)
		local FiberFromFragment = CreateFiberFromFragmentFunction(p4, Mode, p5, nil)
		FiberFromFragment.flags = bit32.bor(FiberFromFragment.flags, Placement)
		FiberFromOffscreen.return_ = Return_
		FiberFromFragment.return_ = Return_
		FiberFromOffscreen.sibling = FiberFromFragment
		Return_.child = FiberFromOffscreen
		
		if bit32.band(Return_.mode, BlockingMode) ~= NoMode then
			ReconcileChildFibersFunction(Return_, p2.child, nil, p5)
		end
		return FiberFromFragment
	end

	Callback6 = function(p2, Dehydrated, _)
		-- upvalues: BlockingMode (copy), NoMode (copy), DEV (copy), Console (copy), ReactFiberLaneModule (copy), IsSuspenseInstanceFallbackFunction (copy), EnableSchedulerTracing (copy), MarkSpawnedWorkFunction (copy)
		if bit32.band(p2.mode, BlockingMode) == NoMode then
			if DEV then
				Console.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
			end
			p2.lanes = ReactFiberLaneModule.laneToLanes(ReactFiberLaneModule.SyncLane)
		elseif IsSuspenseInstanceFallbackFunction(Dehydrated) then
			if EnableSchedulerTracing then
				MarkSpawnedWorkFunction(ReactFiberLaneModule.DefaultHydrationLane)
			end
			p2.lanes = ReactFiberLaneModule.laneToLanes(ReactFiberLaneModule.DefaultHydrationLane)
		else
			p2.lanes = ReactFiberLaneModule.laneToLanes(ReactFiberLaneModule.OffscreenLane)
			
			if EnableSchedulerTracing then
				MarkSpawnedWorkFunction(ReactFiberLaneModule.OffscreenLane)
			end
		end
		return nil
	end

	Callback = function(p2, Return, Dehydrated, MemoizedState, BaseLanes)
		-- upvalues: WarnIfHydratingFunction (copy), GetExecutionContextFunction (copy), RetryAfterError (copy), NoContext (copy), ReconcileChildFibersFunction (copy), Callback1 (ref), Placement (copy), BlockingMode (copy), NoMode (copy), IsSuspenseInstanceFallbackFunction (copy), ReactFiberLaneModule (copy), IsNotBitsMatch (ref), GetWorkInProgressRootFunction (copy), ScheduleUpdateOnFiberFunction (copy), RenderDidSuspendDelayIfPossibleFunction (copy), IsSuspenseInstancePendingFunction (copy), DidCapture (copy), RetryDehydratedSuspenseBoundaryFunction (copy), EnableSchedulerTracing (copy), UnstableWrap (ref), Parent (copy), RegisterSuspenseInstanceRetryFunction (copy), ReenterHydrationStateFromDehydratedSuspenseInstanceFunction (copy), Hydrating (copy)
		WarnIfHydratingFunction()
		
		if bit32.band(GetExecutionContextFunction(), RetryAfterError) ~= NoContext then
			ReconcileChildFibersFunction(Return, p2.child, nil, BaseLanes)
			local CallbackResult = Callback1(Return, Return.pendingProps.children, BaseLanes)
			CallbackResult.flags = bit32.bor(CallbackResult.flags, Placement)
			Return.memoizedState = nil
			
			return CallbackResult
		end
		if bit32.band(Return.mode, BlockingMode) == NoMode then
			ReconcileChildFibersFunction(Return, p2.child, nil, BaseLanes)
			local CallbackResult = Callback1(Return, Return.pendingProps.children, BaseLanes)
			CallbackResult.flags = bit32.bor(CallbackResult.flags, Placement)
			Return.memoizedState = nil
			
			return CallbackResult
		end
		if IsSuspenseInstanceFallbackFunction(Dehydrated) then
			ReconcileChildFibersFunction(Return, p2.child, nil, BaseLanes)
			local CallbackResult = Callback1(Return, Return.pendingProps.children, BaseLanes)
			CallbackResult.flags = bit32.bor(CallbackResult.flags, Placement)
			Return.memoizedState = nil
			
			return CallbackResult
		end
		local IncludesSomeLaneResult = ReactFiberLaneModule.includesSomeLane(BaseLanes, p2.childLanes)
		
		if IsNotBitsMatch or IncludesSomeLaneResult then
			local WorkInProgressRoot = GetWorkInProgressRootFunction()
			
			if WorkInProgressRoot ~= nil then
				local BumpedLaneForHydration = ReactFiberLaneModule.getBumpedLaneForHydration(WorkInProgressRoot, BaseLanes)
				
				if BumpedLaneForHydration ~= ReactFiberLaneModule.NoLane and BumpedLaneForHydration ~= MemoizedState.retryLane then
					MemoizedState.retryLane = BumpedLaneForHydration
					ScheduleUpdateOnFiberFunction(p2, BumpedLaneForHydration, ReactFiberLaneModule.NoTimestamp)
				end
			end
			RenderDidSuspendDelayIfPossibleFunction()
			ReconcileChildFibersFunction(Return, p2.child, nil, BaseLanes)
			local CallbackResult = Callback1(Return, Return.pendingProps.children, BaseLanes)
			CallbackResult.flags = bit32.bor(CallbackResult.flags, Placement)
			Return.memoizedState = nil
			
			return CallbackResult
		else
			if not IsSuspenseInstancePendingFunction(Dehydrated) then
				ReenterHydrationStateFromDehydratedSuspenseInstanceFunction(Return, Dehydrated)
				local CallbackResult = Callback1(Return, Return.pendingProps.children, BaseLanes)
				CallbackResult.flags = bit32.bor(CallbackResult.flags, Hydrating)
				
				return CallbackResult
			end
			Return.flags = bit32.bor(Return.flags, DidCapture)
			Return.child = p2.child
			
			local function v260()
				-- upvalues: RetryDehydratedSuspenseBoundaryFunction (upval), p2 (copy)
				return RetryDehydratedSuspenseBoundaryFunction(p2)
			end
			
			if EnableSchedulerTracing then
				if UnstableWrap == nil then
					UnstableWrap = require(Parent.Scheduler).tracing.unstable_wrap
				end
				v260 = UnstableWrap(v260)
			end
			RegisterSuspenseInstanceRetryFunction(Dehydrated, v260)
			
			return nil
		end
	end

	function updatePortalComponent(p2, p3, p4)
		-- upvalues: PushHostContainerFunction (copy), ReconcileChildFibersFunction (copy), reconcileChildren (copy)
		PushHostContainerFunction(p3, p3.stateNode.containerInfo)
		local PendingProps = p3.pendingProps
		
		if p2 == nil then
			p3.child = ReconcileChildFibersFunction(p3, nil, PendingProps, p4)
		else
			reconcileChildren(p2, p3, PendingProps, p4)
		end
		return p3.child
	end

	local Flag = false

	local function updateContextProvider(p2, Current, BaseLanes)
		-- upvalues: DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), Array (copy), Object (copy), Flag (ref), Console (copy), CheckPropTypesFunction (copy), PushProviderFunction (copy), CalculateChangedBitsFunction (copy), HasContextChangedFunction (copy), Callback2 (ref), PropagateContextChangeFunction (copy), reconcileChildren (copy)
		local Context = Current.type._context
		local PendingProps = Current.pendingProps
		local MemoizedProps = Current.memoizedProps
		local Value = PendingProps.value
		
		if DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			if Array.indexOf(Object.keys(PendingProps), "value") < 1 and not Flag then
				Flag = true
				Console.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
			end
			local PropTypes = Current.type.propTypes
			local ValidateProps = Current.type.validateProps
			
			if PropTypes or ValidateProps then
				CheckPropTypesFunction(PropTypes, ValidateProps, PendingProps, "prop", "Context.Provider")
			end
		end
		PushProviderFunction(Current, Value)
		
		if MemoizedProps ~= nil then
			local ChangedBits = CalculateChangedBitsFunction(Context, Value, MemoizedProps.value)
			
			if ChangedBits ~= 0 then
				PropagateContextChangeFunction(Current, Context, ChangedBits, BaseLanes)
			elseif MemoizedProps.children == PendingProps.children and not HasContextChangedFunction() then
				return Callback2(p2, Current, BaseLanes)
			end
		end
		reconcileChildren(p2, Current, PendingProps.children, BaseLanes)
		
		return Current.child
	end

	local config2 = {
		usingContextAsConsumer = false,
		usingLegacyConsumer = false
	}

	function updateContextConsumer(p2, Current, p3)
		-- upvalues: DEV (copy), config2 (copy), Console (copy), COMPATWARNINGS (copy), PrepareToReadContextFunction (copy), ReactFiberBeginWorkModule (copy), ReadContextFunction (copy), ReactCurrentOwner (copy), SetIsRenderingFunction (copy), PerformedWork (copy), reconcileChildren (copy)
		local Type1 = Current.type
		
		if DEV then
			if Type1._context == nil then
				if Type1 ~= Type1.Consumer and not config2.usingContextAsConsumer then
					config2.usingContextAsConsumer = true
					Console.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
				end
			else
				Type1 = Type1._context
			end
		end
		local PendingProps = Current.pendingProps
		local RenderFunction = nil
		
		if PendingProps.render then
			if DEV and COMPATWARNINGS and not config2.usingLegacyConsumer then
				config2.usingLegacyConsumer = true
				Console.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \nPlease provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
			end
			RenderFunction = PendingProps.render
		else
			RenderFunction = PendingProps.children
		end
		if DEV and type(RenderFunction) ~= "function" then
			Console.error("A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
		end
		PrepareToReadContextFunction(Current, p3, ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate)
		local Context = ReadContextFunction(Type1, PendingProps.unstable_observedBits)
		local RenderResult = nil
		
		if DEV then
			ReactCurrentOwner.current = Current
			SetIsRenderingFunction(true)
			RenderResult = RenderFunction(Context)
			SetIsRenderingFunction(false)
		else
			RenderResult = RenderFunction(Context)
		end
		Current.flags = bit32.bor(Current.flags, PerformedWork)
		reconcileChildren(p2, Current, RenderResult, p3)
		
		return Current.child
	end

	function ReactFiberBeginWorkModule.markWorkInProgressReceivedUpdate()
		-- upvalues: IsNotBitsMatch (ref)
		IsNotBitsMatch = true
	end

	Callback2 = function(p2, Current, BaseLanes)
		-- upvalues: EnableProfilerTimer (copy), StopProfilerTimerIfRunningFunction (copy), MarkSkippedUpdateLanesFunction (copy), ReactFiberLaneModule (copy), CloneChildFibersFunction (copy)
		if p2 then
			Current.dependencies = p2.dependencies
		end
		if EnableProfilerTimer then
			StopProfilerTimerIfRunningFunction(Current)
		end
		MarkSkippedUpdateLanesFunction(Current.lanes)
		
		if ReactFiberLaneModule.includesSomeLane(BaseLanes, Current.childLanes) then
			CloneChildFibersFunction(p2, Current)
			
			return Current.child
		else
			return nil
		end
	end

	function remountFiber(p2, Child, Child1)
		-- upvalues: DEV (copy), Deletion (copy), Placement (copy)
		if not DEV then
			error("Did not expect this call in production. This is a bug in React. Please file an issue.")
			
			return
		end
		local Return = Child.return_
		
		if Return == nil then
			error("Cannot swap the root fiber.")
		end
		assert(Return ~= nil, "returnFiber was nil in remountFiber")
		p2.alternate = nil
		Child.alternate = nil
		Child1.index = Child.index
		Child1.sibling = Child.sibling
		Child1.return_ = Child.return_
		Child1.ref = Child.ref
		
		if Child == Return.child then
			Return.child = Child1
		else
			local Child2 = Return.child
			
			if Child2 == nil then
				error("Expected parent to have a child.")
			end
			assert(Child2 ~= nil, "prevSibling was nil in remountFiber")
			while Child2.sibling ~= Child do
				Child2 = Child2.sibling
				
				if Child2 == nil then
					error("Expected to find the previous sibling.")
				end
			end
			Child2.sibling = Child1
		end
		local Deletions = Return.deletions
		
		if Deletions == nil then
			Return.deletions = { p2 }
			Return.flags = bit32.bor(Return.flags, Deletion)
		else
			table.insert(Deletions, p2)
		end
		Child1.flags = bit32.bor(Child1.flags, Placement)
		
		return Child1
	end

	function ReactFiberBeginWorkModule.beginWork(p3, Current, BaseLanes)
		-- upvalues: DEV (copy), CreateFiberFromTypeAndPropsFunction (copy), HasContextChangedFunction (copy), IsNotBitsMatch (ref), ReactFiberLaneModule (copy), HostRoot (copy), PushTopLevelContextObjectFunction (copy), PushHostContainerFunction (copy), ResetHydrationStateFunction (copy), HostComponent (copy), PushHostContextFunction (copy), ClassComponent (copy), IsContextProviderFunction (copy), PushContextProviderFunction (copy), HostPortal (copy), ContextProvider (copy), PushProviderFunction (copy), Profiler (copy), EnableProfilerTimer (copy), SuspenseComponent (copy), EnableSuspenseServerRenderer (copy), PushSuspenseContextFunction (copy), SetDefaultShallowSuspenseContextFunction (copy), SuspenseStackCursor (copy), DidCapture (copy), updateSuspenseComponent (copy), Callback2 (ref), SuspenseListComponent (copy), OffscreenComponent (copy), LegacyHiddenComponent (copy), updateOffscreenComponent (copy), ForceUpdateForLegacySuspense (copy), NoFlags (copy), ReactWorkTagsModule (copy), mountIndeterminateComponent (copy), LazyComponent (copy), mountLazyComponent (copy), FunctionComponent (copy), ResolveDefaultPropsFunction (copy), Callback4 (ref), updateClassComponent (copy), updateHostRoot (copy), updateHostComponent (copy), HostText (copy), TryToClaimNextHydratableInstanceFunction (copy), ForwardRef (copy), updateForwardRef (copy), Fragment (copy), Mode (copy), updateContextProvider (copy), ContextConsumer (copy), MemoComponent (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), GetComponentNameFunction (copy), updateMemoComponent (copy), SimpleMemoComponent (copy), Callback3 (ref), IncompleteClassComponent (copy), updateOffscreenComponent (copy), InvariantFunction (copy)
		local Lanes = Current.lanes
		
		if DEV and Current._debugNeedsRemount and p3 ~= nil then
			return remountFiber(p3, Current, CreateFiberFromTypeAndPropsFunction(Current.type, Current.key, Current.pendingProps, Current._debugOwner or nil, Current.mode, Current.lanes))
		end
		if p3 == nil then
			IsNotBitsMatch = false
		elseif p3.memoizedProps == Current.pendingProps and not HasContextChangedFunction() and not (if DEV then Current.type ~= p3.type else false) then
			if ReactFiberLaneModule.includesSomeLane(BaseLanes, Lanes) then
				IsNotBitsMatch = bit32.band(p3.flags, ForceUpdateForLegacySuspense) ~= NoFlags
			else
				IsNotBitsMatch = false
				
				if Current.tag == HostRoot then
					local StateNode = Current.stateNode
					
					if StateNode.pendingContext then
						PushTopLevelContextObjectFunction(Current, StateNode.pendingContext, StateNode.pendingContext ~= StateNode.context)
					elseif StateNode.context then
						PushTopLevelContextObjectFunction(Current, StateNode.context, false)
					end
					PushHostContainerFunction(Current, StateNode.containerInfo)
					ResetHydrationStateFunction()
				elseif Current.tag == HostComponent then
					PushHostContextFunction(Current)
				elseif Current.tag == ClassComponent then
					if IsContextProviderFunction(Current.type) then
						PushContextProviderFunction(Current)
					end
				elseif Current.tag == HostPortal then
					PushHostContainerFunction(Current, Current.stateNode.containerInfo)
				elseif Current.tag == ContextProvider then
					PushProviderFunction(Current, Current.memoizedProps.value)
				elseif Current.tag == Profiler then
					if EnableProfilerTimer then
						local StateNode = Current.stateNode
						StateNode.effectDuration = 0
						StateNode.passiveEffectDuration = 0
					end
				elseif Current.tag == SuspenseComponent then
					local MemoizedState = Current.memoizedState
					
					if MemoizedState == nil then
						PushSuspenseContextFunction(Current, SetDefaultShallowSuspenseContextFunction(SuspenseStackCursor.current))
					elseif EnableSuspenseServerRenderer and MemoizedState.dehydrated ~= nil then
						PushSuspenseContextFunction(Current, SetDefaultShallowSuspenseContextFunction(SuspenseStackCursor.current))
						Current.flags = bit32.bor(Current.flags, DidCapture)
						
						return nil
					elseif ReactFiberLaneModule.includesSomeLane(BaseLanes, Current.child.childLanes) then
						return updateSuspenseComponent(p3, Current, BaseLanes)
					else
						PushSuspenseContextFunction(Current, SetDefaultShallowSuspenseContextFunction(SuspenseStackCursor.current))
						local CallbackResult = Callback2(p3, Current, BaseLanes)
						
						return if CallbackResult == nil then nil else CallbackResult.sibling
					end
				elseif Current.tag == SuspenseListComponent then
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
					error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
				elseif Current.tag == OffscreenComponent or Current.tag == LegacyHiddenComponent then
					Current.lanes = ReactFiberLaneModule.NoLanes
					
					return (updateOffscreenComponent(p3, Current, BaseLanes))
				end
				return Callback2(p3, Current, BaseLanes)
			end
		else
			IsNotBitsMatch = true
		end
		Current.lanes = ReactFiberLaneModule.NoLanes
		
		if Current.tag == ReactWorkTagsModule.IndeterminateComponent then
			return mountIndeterminateComponent(p3, Current, Current.type, BaseLanes)
		end
		if Current.tag == LazyComponent then
			return (mountLazyComponent(p3, Current, Current.elementType, Lanes, BaseLanes))
		end
		if Current.tag == FunctionComponent then
			local Type1 = Current.type
			local PendingProps = Current.pendingProps
			
			return Callback4(p3, Current, Type1, if Current.elementType == Type1 then PendingProps else ResolveDefaultPropsFunction(Type1, PendingProps), BaseLanes)
		end
		if Current.tag == ClassComponent then
			local Type2 = Current.type
			local PendingProps = Current.pendingProps
			
			return (updateClassComponent(p3, Current, Type2, Current.elementType == Type2 and PendingProps or ResolveDefaultPropsFunction(Type2, PendingProps), BaseLanes))
		end
		if Current.tag == HostRoot then
			return updateHostRoot(p3, Current, BaseLanes)
		end
		if Current.tag == HostComponent then
			return (updateHostComponent(p3, Current, BaseLanes))
		end
		if Current.tag == HostText then
			if p3 == nil then
				TryToClaimNextHydratableInstanceFunction(Current)
			end
			return nil
		else
			if Current.tag == SuspenseComponent then
				return updateSuspenseComponent(p3, Current, BaseLanes)
			end
			if Current.tag == HostPortal then
				return updatePortalComponent(p3, Current, BaseLanes)
			end
			if Current.tag == ForwardRef then
				local Type3 = Current.type
				local PendingProps = Current.pendingProps
				
				return updateForwardRef(p3, Current, Type3, if Current.elementType == Type3 then PendingProps else ResolveDefaultPropsFunction(Type3, PendingProps), BaseLanes)
			end
			if Current.tag == Fragment then
				return updateFragment(p3, Current, BaseLanes)
			end
			if Current.tag == Mode then
				return updateMode(p3, Current, BaseLanes)
			end
			if Current.tag == Profiler then
				return updateProfiler(p3, Current, BaseLanes)
			end
			if Current.tag == ContextProvider then
				return updateContextProvider(p3, Current, BaseLanes)
			end
			if Current.tag == ContextConsumer then
				return updateContextConsumer(p3, Current, BaseLanes)
			end
			if Current.tag == MemoComponent then
				local Type4 = Current.type
				local ResolveDefaultPropsResult = ResolveDefaultPropsFunction(Type4, Current.pendingProps)
				
				if (DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION) and Current.type ~= Current.elementType then
					local PropTypes = nil
					local ValidateProps = nil
					
					if type(Type4) == "table" then
						PropTypes = Type4.propTypes
						ValidateProps = Type4.validateProps
					end
					if PropTypes or ValidateProps then
						CheckPropTypesFunction(PropTypes, ValidateProps, ResolveDefaultPropsResult, "prop", GetComponentNameFunction(Type4))
					end
				end
				return updateMemoComponent(p3, Current, Type4, ResolveDefaultPropsFunction(Type4.type, ResolveDefaultPropsResult), Lanes, BaseLanes)
			elseif Current.tag == SimpleMemoComponent then
				return Callback3(p3, Current, Current.type, Current.pendingProps, Lanes, BaseLanes)
			elseif Current.tag == IncompleteClassComponent then
				local Type5 = Current.type
				local PendingProps = Current.pendingProps
				
				return mountIncompleteClassComponent(p3, Current, Type5, Current.elementType == Type5 and PendingProps or ResolveDefaultPropsFunction(Type5, PendingProps), BaseLanes)
			elseif Current.tag == OffscreenComponent then
				return (updateOffscreenComponent(p3, Current, BaseLanes))
			elseif Current.tag == LegacyHiddenComponent then
				return (updateOffscreenComponent(p3, Current, BaseLanes))
			else
				InvariantFunction(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(Current.tag)))
				
				return nil
			end
		end
	end

end
return ReactFiberBeginWorkModule