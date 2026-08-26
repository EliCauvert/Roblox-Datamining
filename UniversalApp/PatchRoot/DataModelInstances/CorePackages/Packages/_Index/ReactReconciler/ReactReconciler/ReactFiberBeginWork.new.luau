local function _(p1)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p1))
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local parent = script.Parent.Parent
local console = require(parent.Shared).console
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = luauPolyfillModule.util.inspect
local dEV = require(parent.ReactGlobals).__DEV__
local dISABLEALLWARNINGSEXCEPTPROPVALIDATION = require(parent.ReactGlobals).__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local cOMPATWARNINGS = require(parent.ReactGlobals).__COMPAT_WARNINGS__
local _ = require(parent.Shared)
local _ = require(parent.React)
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local unknownModule = require(script.Parent["ReactFiberSuspenseContext.new"])
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local checkPropTypes = require(parent.Shared).checkPropTypes
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local functionComponent = reactWorkTagsModule.FunctionComponent
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local hostComponent = reactWorkTagsModule.HostComponent
local hostText = reactWorkTagsModule.HostText
local hostPortal = reactWorkTagsModule.HostPortal
local forwardRef = reactWorkTagsModule.ForwardRef
local fragment = reactWorkTagsModule.Fragment
local mode = reactWorkTagsModule.Mode
local contextProvider = reactWorkTagsModule.ContextProvider
local contextConsumer = reactWorkTagsModule.ContextConsumer
local profiler = reactWorkTagsModule.Profiler
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local memoComponent = reactWorkTagsModule.MemoComponent
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local lazyComponent = reactWorkTagsModule.LazyComponent
local incompleteClassComponent = reactWorkTagsModule.IncompleteClassComponent
local offscreenComponent = reactWorkTagsModule.OffscreenComponent
local legacyHiddenComponent = reactWorkTagsModule.LegacyHiddenComponent
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local noFlags = reactFiberFlagsModule.NoFlags
local staticMask = reactFiberFlagsModule.StaticMask
local performedWork = reactFiberFlagsModule.PerformedWork
local placement = reactFiberFlagsModule.Placement
local hydrating = reactFiberFlagsModule.Hydrating
local contentReset = reactFiberFlagsModule.ContentReset
local didCapture = reactFiberFlagsModule.DidCapture
local ref = reactFiberFlagsModule.Ref
local deletion = reactFiberFlagsModule.Deletion
local forceUpdateForLegacySuspense = reactFiberFlagsModule.ForceUpdateForLegacySuspense
local reactSharedInternals = require(parent.Shared).ReactSharedInternals
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = reactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = reactFeatureFlags.disableLegacyContext
local disableModulePatternComponents = reactFeatureFlags.disableModulePatternComponents
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local enableSchedulerTracing = reactFeatureFlags.enableSchedulerTracing
local enableSuspenseServerRenderer = reactFeatureFlags.enableSuspenseServerRenderer
local warnAboutDefaultPropsOnFunctionComponents = reactFeatureFlags.warnAboutDefaultPropsOnFunctionComponents
local invariant = require(parent.Shared).invariant
local describeError = require(parent.Shared).describeError
local shallowEqual = require(parent.Shared).shallowEqual
local getComponentName = require(parent.Shared).getComponentName
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_LAZY_TYPE = reactSymbols.REACT_LAZY_TYPE
local _ = reactSymbols.getIteratorFn
local unknownModule_1 = require(script.Parent["ReactStrictModeWarnings.new"])
local reactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local getCurrentFiberOwnerNameInDevOrNull = reactCurrentFiberModule.getCurrentFiberOwnerNameInDevOrNull
local setIsRendering = reactCurrentFiberModule.setIsRendering
local unknownModule_2 = require(script.Parent["ReactFiberHotReloading.new"])
local resolveFunctionForHotReloading = unknownModule_2.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = unknownModule_2.resolveForwardRefForHotReloading
local resolveClassForHotReloading = unknownModule_2.resolveClassForHotReloading
local unknownModule_3 = require(script.Parent["ReactChildFiber.new"])
local mountChildFibers = unknownModule_3.mountChildFibers
local reconcileChildFibers = unknownModule_3.reconcileChildFibers
local cloneChildFibers = unknownModule_3.cloneChildFibers
local unknownModule_4 = require(script.Parent["ReactUpdateQueue.new"])
local processUpdateQueue = unknownModule_4.processUpdateQueue
local cloneUpdateQueue = unknownModule_4.cloneUpdateQueue
local initializeUpdateQueue = unknownModule_4.initializeUpdateQueue
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local concurrentMode = reactTypeOfModeModule.ConcurrentMode
local noMode = reactTypeOfModeModule.NoMode
local profileMode = reactTypeOfModeModule.ProfileMode
local strictMode = reactTypeOfModeModule.StrictMode
local blockingMode = reactTypeOfModeModule.BlockingMode
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local shouldSetTextContent = reactFiberHostConfigModule.shouldSetTextContent
local isSuspenseInstancePending = reactFiberHostConfigModule.isSuspenseInstancePending
local isSuspenseInstanceFallback = reactFiberHostConfigModule.isSuspenseInstanceFallback
local registerSuspenseInstanceRetry = reactFiberHostConfigModule.registerSuspenseInstanceRetry
local supportsHydration = reactFiberHostConfigModule.supportsHydration
local unknownModule_5 = require(script.Parent["ReactFiberHostContext.new"])
local pushHostContext = unknownModule_5.pushHostContext
local pushHostContainer = unknownModule_5.pushHostContainer
local suspenseStackCursor = unknownModule.suspenseStackCursor
local hasSuspenseContext = unknownModule.hasSuspenseContext
local forceSuspenseFallback = unknownModule.ForceSuspenseFallback
local addSubtreeSuspenseContext = unknownModule.addSubtreeSuspenseContext
local invisibleParentSuspenseContext = unknownModule.InvisibleParentSuspenseContext
local pushSuspenseContext = unknownModule.pushSuspenseContext
local setDefaultShallowSuspenseContext = unknownModule.setDefaultShallowSuspenseContext
local unknownModule_6 = require(script.Parent["ReactFiberNewContext.new"])
local propagateContextChange = unknownModule_6.propagateContextChange
local readContext = unknownModule_6.readContext
local calculateChangedBits = unknownModule_6.calculateChangedBits
local prepareToReadContext = unknownModule_6.prepareToReadContext
local pushProvider = unknownModule_6.pushProvider
local t = {
	renderWithHooksRef = nil,
	bailoutHooksRef = nil,
	shouldSuspendRef = nil
}

local _ = function(p1)
	-- upvalues: t (ref)
	if not t.shouldSuspendRef then
		t.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
	end
	return t.shouldSuspendRef(p1)
end

local _ = function()
	-- upvalues: t (ref)
	local unknownModule = require(script.Parent["ReactFiberHooks.new"])
	t.renderWithHooksRef = unknownModule.renderWithHooks
	t.bailoutHooksRef = unknownModule.bailoutHooks
end

local function renderWithHooks(...)
	-- upvalues: t (ref)
	if not t.renderWithHooksRef then
		local unknownModule = require(script.Parent["ReactFiberHooks.new"])
		t.renderWithHooksRef = unknownModule.renderWithHooks
		t.bailoutHooksRef = unknownModule.bailoutHooks
	end
	return t.renderWithHooksRef(...)
end

local function bailoutHooks(...)
	-- upvalues: t (ref)
	if not t.bailoutHooksRef then
		local unknownModule = require(script.Parent["ReactFiberHooks.new"])
		t.renderWithHooksRef = unknownModule.renderWithHooks
		t.bailoutHooksRef = unknownModule.bailoutHooks
	end
	return t.bailoutHooksRef(...)
end

local stopProfilerTimerIfRunning = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning
local unknownModule_7 = require(script.Parent["ReactFiberContext.new"])
local getMaskedContext = unknownModule_7.getMaskedContext
local getUnmaskedContext = unknownModule_7.getUnmaskedContext
local hasContextChanged = unknownModule_7.hasContextChanged
local pushContextProvider = unknownModule_7.pushContextProvider
local isContextProvider = unknownModule_7.isContextProvider
local pushTopLevelContextObject = unknownModule_7.pushTopLevelContextObject
local invalidateContextProvider = unknownModule_7.invalidateContextProvider
local unknownModule_8 = require(script.Parent["ReactFiberHydrationContext.new"])
local resetHydrationState = unknownModule_8.resetHydrationState
local enterHydrationState = unknownModule_8.enterHydrationState
local reenterHydrationStateFromDehydratedSuspenseInstance = unknownModule_8.reenterHydrationStateFromDehydratedSuspenseInstance
local tryToClaimNextHydratableInstance = unknownModule_8.tryToClaimNextHydratableInstance
local warnIfHydrating = unknownModule_8.warnIfHydrating
local unknownModule_9 = require(script.Parent["ReactFiberClassComponent.new"])
local adoptClassInstance = unknownModule_9.adoptClassInstance
local applyDerivedStateFromProps = unknownModule_9.applyDerivedStateFromProps
local constructClassInstance = unknownModule_9.constructClassInstance
local mountClassInstance = unknownModule_9.mountClassInstance
local resumeMountClassInstance = unknownModule_9.resumeMountClassInstance
local updateClassInstance = unknownModule_9.updateClassInstance
local resolveDefaultProps = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local unknownModule_10 = require(script.Parent["ReactFiber.new"])
local resolveLazyComponentTag = unknownModule_10.resolveLazyComponentTag
local createFiberFromFragment = unknownModule_10.createFiberFromFragment
local createFiberFromOffscreen = unknownModule_10.createFiberFromOffscreen
local createFiberFromTypeAndProps = unknownModule_10.createFiberFromTypeAndProps
local isSimpleFunctionComponent = unknownModule_10.isSimpleFunctionComponent
local createWorkInProgress = unknownModule_10.createWorkInProgress
local unknownModule_11 = require(script.Parent["ReactFiberWorkLoop.new"])
local pushRenderLanes = unknownModule_11.pushRenderLanes
local markSpawnedWork = unknownModule_11.markSpawnedWork
local retryDehydratedSuspenseBoundary = unknownModule_11.retryDehydratedSuspenseBoundary
local scheduleUpdateOnFiber = unknownModule_11.scheduleUpdateOnFiber
local renderDidSuspendDelayIfPossible = unknownModule_11.renderDidSuspendDelayIfPossible
local getWorkInProgressRoot = unknownModule_11.getWorkInProgressRoot
local getExecutionContext = unknownModule_11.getExecutionContext
local retryAfterError = unknownModule_11.RetryAfterError
local noContext = unknownModule_11.NoContext
local var1 = nil
local setWorkInProgressVersion = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion
local markSkippedUpdateLanes = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local consolePatchingDev = require(parent.Shared).ConsolePatchingDev
local disableLogs = consolePatchingDev.disableLogs
local reenableLogs = consolePatchingDev.reenableLogs
local reactCurrentOwner = reactSharedInternals.ReactCurrentOwner
local t_1 = {}
local bailoutOnAlreadyFinishedWork = nil
local updateFunctionComponent = nil
local var2 = false
local t_2 = {
	didWarnAboutBadClass = {},
	didWarnAboutModulePatternComponent = {},
	didWarnAboutContextTypeOnFunctionComponent = {},
	didWarnAboutGetDerivedStateOnFunctionComponent = {},
	didWarnAboutFunctionRefs = {},
	didWarnAboutDefaultPropsOnFunctionComponent = {}
}
local updateSimpleMemoComponent = nil

if dEV then
	t_2.didWarnAboutBadClass = {}
	t_2.didWarnAboutModulePatternComponent = {}
	t_2.didWarnAboutContextTypeOnFunctionComponent = {}
	t_2.didWarnAboutGetDerivedStateOnFunctionComponent = {}
	t_2.didWarnAboutFunctionRefs = {}
	t_1.didWarnAboutReassigningProps = false
	t_2.didWarnAboutDefaultPropsOnFunctionComponent = {}
end
local _ = function(p1, p2, p3, p4)
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, p3, p4)
		
		return
	end
	p2.child = reconcileChildFibers(p2, p1.child, p3, p4)
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: reconcileChildFibers (ref)
	p2.child = reconcileChildFibers(p2, p1.child, nil, p4)
	p2.child = reconcileChildFibers(p2, nil, p3, p4)
end

local function updateForwardRef(p1, p2, p3, p4, p5)
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), prepareToReadContext (ref), t_1 (ref), reactCurrentOwner (ref), setIsRendering (ref), renderWithHooks (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var2 (write), bailoutHooks (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p2.type ~= p2.elementType then
		propTypes = p3.propTypes
		local validateProps = p3.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
		end
	end
	local var3
	propTypes = p3.render
	local ref = p2.ref
	local _ = nil
	prepareToReadContext(p2, p5, t_1.markWorkInProgressReceivedUpdate)
	
	if dEV then
		reactCurrentOwner.current = p2
		setIsRendering(true)
		var3 = renderWithHooks(p1, p2, propTypes, p4, ref, p5)
		
		if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, strictMode) ~= 0 then
			disableLogs()
			local ok, status = xpcall(renderWithHooks, describeError, p1, p2, propTypes, p4, ref, p5)
			
			if ok then
				var3 = status
			end
			reenableLogs()
			
			if not ok then
				error(status)
			end
		end
		setIsRendering(false)
	else
		var3 = renderWithHooks(p1, p2, propTypes, p4, ref, p5)
	end
	if p1 ~= nil and not var2 then
		bailoutHooks(p1, p2, p5)
		
		return bailoutOnAlreadyFinishedWork(p1, p2, p5)
	end
	p2.flags = bit32.bor(p2.flags, performedWork)
	
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, var3, p5)
	else
		p2.child = reconcileChildFibers(p2, p1.child, var3, p5)
	end
	return p2.child
end

local function updateMemoComponent(p1, p2, p3, p4, p5, p6)
	-- upvalues: isSimpleFunctionComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), simpleMemoComponent (ref), updateSimpleMemoComponent (write), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), createFiberFromTypeAndProps (ref), reactFiberLaneModule (ref), shallowEqual (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), createWorkInProgress (ref)
	local var3
	if p1 == nil then
		local type = p3.type
		
		if isSimpleFunctionComponent(type) and p3.compare == nil and p3.defaultProps == nil then
			local var4 = if dEV then resolveFunctionForHotReloading(type) else type
			p2.tag = simpleMemoComponent
			p2.type = var4
			
			if dEV then
				validateFunctionComponentInDev(p2, type)
			end
			return updateSimpleMemoComponent(p1, p2, var4, p4, p5, p6)
		elseif dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			var3 = nil
			local validateProps = nil
			
			if type(type) == "table" then
				var3 = type.propTypes
				validateProps = type.validateProps
			end
			if var3 or validateProps then
				checkPropTypes(var3, validateProps, p4, "prop", getComponentName(type))
			end
		end
		var3 = createFiberFromTypeAndProps(p3.type, nil, p4, p2, p2.mode, p6)
		var3.ref = p2.ref
		var3.return_ = p2
		p2.child = var3
		
		return var3
	elseif dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
		local type = p3.type
		var3 = nil
		local validateProps = nil
		
		if type(type) == "table" then
			var3 = type.propTypes
			validateProps = type.validateProps
		end
		if var3 or validateProps then
			checkPropTypes(var3, validateProps, p4, "prop", getComponentName(type))
		end
	end
	local child = p1.child
	
	if not reactFiberLaneModule.includesSomeLane(p5, p6) then
		var3 = child.memoizedProps
		local compare = p3.compare
		
		if compare == nil then
			compare = shallowEqual
		end
		if compare(var3, p4) and p1.ref == p2.ref then
			return bailoutOnAlreadyFinishedWork(p1, p2, p6)
		end
	end
	p2.flags = bit32.bor(p2.flags, performedWork)
	var3 = createWorkInProgress(child, p4)
	var3.ref = p2.ref
	var3.return_ = p2
	p2.child = var3
	
	return var3
end

updateSimpleMemoComponent = function(p1, p2, p3, p4, p5, p6)
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), REACT_LAZY_TYPE (ref), describeError (ref), checkPropTypes (ref), getComponentName (ref), shallowEqual (ref), var2 (write), reactFiberLaneModule (ref), bailoutOnAlreadyFinishedWork (write), forceUpdateForLegacySuspense (ref), noFlags (ref), updateFunctionComponent (write)
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p2.type ~= p2.elementType then
		local elementType = p2.elementType
		
		if elementType["$$typeof"] == REACT_LAZY_TYPE then
			local var3 = elementType
			local ok, status = xpcall(var3._init, describeError, var3._payload)
			elementType = if ok then status else nil
			local propTypes = nil
			local validateProps = nil
			
			if elementType ~= nil and type(elementType) == "table" then
				propTypes = elementType.propTypes
				validateProps = elementType.validateProps
			end
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(elementType))
			end
		end
	end
	if p1 ~= nil then
		if shallowEqual(p1.memoizedProps, p4) and p1.ref == p2.ref and (if dEV then p2.type == p1.type else true) then
			var2 = false
			
			if not reactFiberLaneModule.includesSomeLane(p6, p5) then
				p2.lanes = p1.lanes
				
				return bailoutOnAlreadyFinishedWork(p1, p2, p6)
			elseif bit32.band(p1.flags, forceUpdateForLegacySuspense) ~= noFlags then
				var2 = true
			end
		end
	end
	return updateFunctionComponent(p1, p2, p3, p4, p6)
end

local function updateOffscreenComponent(p1, p2, p3)
	-- upvalues: concurrentMode (ref), noMode (ref), reactFiberLaneModule (ref), pushRenderLanes (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local pendingProps = p2.pendingProps
	local children = pendingProps.children
	local var3 = if p1 ~= nil then p1.memoizedState else nil
	
	if pendingProps.mode ~= "hidden" and pendingProps.mode ~= "unstable-defer-without-hiding" then
		local var4
		local _ = nil
		
		if var3 == nil then
			var4 = p3
		else
			var4 = reactFiberLaneModule.mergeLanes(var3.baseLanes, p3)
			p2.memoizedState = nil
		end
		pushRenderLanes(p2, var4)
	elseif bit32.band(p2.mode, concurrentMode) == noMode then
		p2.memoizedState = { baseLanes = reactFiberLaneModule.NoLanes }
		pushRenderLanes(p2, p3)
	elseif reactFiberLaneModule.includesSomeLane(p3, reactFiberLaneModule.OffscreenLane) then
		p2.memoizedState = { baseLanes = reactFiberLaneModule.NoLanes }
		pushRenderLanes(p2, if var3 ~= nil then var3.baseLanes else p3)
	else
		local var5 = if var3 ~= nil then p3 else reactFiberLaneModule.mergeLanes(var3.baseLanes, p3)
		
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.OffscreenLane)
		end
		p2.childLanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.OffscreenLane)
		p2.lanes = p2.childLanes
		p2.memoizedState = { baseLanes = var5 }
		pushRenderLanes(p2, var5)
		
		return nil
	end
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, children, p3)
	else
		p2.child = reconcileChildFibers(p2, p1.child, children, p3)
	end
	return p2.child
end

function updateFragment(p1, p2, p3)
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	local pendingProps = p2.pendingProps
	
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, pendingProps, p3)
	else
		p2.child = reconcileChildFibers(p2, p1.child, pendingProps, p3)
	end
	return p2.child
end

function updateMode(p1, p2, p3)
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	local children = p2.pendingProps.children
	
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, children, p3)
	else
		p2.child = reconcileChildFibers(p2, p1.child, children, p3)
	end
	return p2.child
end

function updateProfiler(p1, p2, p3)
	-- upvalues: enableProfilerTimer (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	if enableProfilerTimer then
		local stateNode = p2.stateNode
		stateNode.effectDuration = 0
		stateNode.passiveEffectDuration = 0
	end
	local children = p2.pendingProps.children
	
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, children, p3)
	else
		p2.child = reconcileChildFibers(p2, p1.child, children, p3)
	end
	return p2.child
end

local _ = function(p1, p2)
	-- upvalues: ref (ref)
	local ref_1 = p2.ref
	
	if p1 == nil and ref_1 ~= nil or p1 ~= nil and p1.ref ~= ref_1 then
		p2.flags = bit32.bor(p2.flags, ref)
	end
end

updateFunctionComponent = function(p1, p2, p3, p4, p5)
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), prepareToReadContext (ref), t_1 (ref), reactCurrentOwner (ref), setIsRendering (ref), renderWithHooks (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var2 (write), bailoutHooks (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and (type(p3) ~= "function" and p2.type ~= p2.elementType) then
		propTypes = nil
		local validateProps = nil
		
		if type(p3) == "table" then
			propTypes = p3.propTypes
			validateProps = p3.validateProps
		end
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
		end
	end
	local var3
	propTypes = if not disableLegacyContext then getMaskedContext(p2, getUnmaskedContext(p2, p3, true)) else nil
	local _ = nil
	prepareToReadContext(p2, p5, t_1.markWorkInProgressReceivedUpdate)
	
	if dEV then
		reactCurrentOwner.current = p2
		setIsRendering(true)
		var3 = renderWithHooks(p1, p2, p3, p4, propTypes, p5)
		
		if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, strictMode) ~= 0 then
			disableLogs()
			local ok, status = xpcall(renderWithHooks, describeError, p1, p2, p3, p4, propTypes, p5)
			reenableLogs()
			
			if ok then
				var3 = status
			else
				error(status)
			end
		end
		setIsRendering(false)
	else
		var3 = renderWithHooks(p1, p2, p3, p4, propTypes, p5)
	end
	if p1 ~= nil and not var2 then
		bailoutHooks(p1, p2, p5)
		
		return bailoutOnAlreadyFinishedWork(p1, p2, p5)
	end
	p2.flags = bit32.bor(p2.flags, performedWork)
	
	if p1 == nil then
		p2.child = mountChildFibers(p2, nil, var3, p5)
	else
		p2.child = reconcileChildFibers(p2, p1.child, var3, p5)
	end
	return p2.child
end

local function updateClassComponent(p1, p2, p3, p4, p5)
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), isContextProvider (ref), pushContextProvider (ref), prepareToReadContext (ref), t_1 (ref), placement (ref), constructClassInstance (ref), mountClassInstance (ref), resumeMountClassInstance (ref), updateClassInstance (ref), console (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p2.type ~= p2.elementType then
		propTypes = p3.propTypes
		local validateProps = p3.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p4, "prop", getComponentName(p3))
		end
	end
	propTypes = nil
	
	if isContextProvider(p3) then
		propTypes = true
		pushContextProvider(p2)
	else
		propTypes = false
	end
	local var3
	prepareToReadContext(p2, p5, t_1.markWorkInProgressReceivedUpdate)
	local _ = nil
	
	if p2.stateNode == nil then
		if p1 ~= nil then
			p1.alternate = nil
			p2.alternate = nil
			p2.flags = bit32.bor(p2.flags, placement)
		end
		constructClassInstance(p2, p3, p4)
		mountClassInstance(p2, p3, p4, p5)
		var3 = true
	else
		var3 = if p1 == nil then resumeMountClassInstance(p2, p3, p4, p5) else updateClassInstance(p1, p2, p3, p4, p5)
	end
	local var4 = finishClassComponent(p1, p2, p3, var3, propTypes, p5)
	
	if dEV then
		if var3 and p2.stateNode.props ~= p4 then
			if not t_1.didWarnAboutReassigningProps then
				console.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", getComponentName(p2.type) or "a component")
			end
			t_1.didWarnAboutReassigningProps = true
		end
	end
	return var4
end

function finishClassComponent(p1, p2, p3, p4, p5, p6)
	-- upvalues: ref (ref), didCapture (ref), noFlags (ref), invalidateContextProvider (ref), bailoutOnAlreadyFinishedWork (write), reactCurrentOwner (ref), enableProfilerTimer (ref), stopProfilerTimerIfRunning (ref), dEV (ref), setIsRendering (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), performedWork (ref), reconcileChildFibers (ref), mountChildFibers (ref)
	local ref_1 = p2.ref
	
	if p1 == nil and ref_1 ~= nil or p1 ~= nil and p1.ref ~= ref_1 then
		p2.flags = bit32.bor(p2.flags, ref)
	end
	ref_1 = bit32.band(p2.flags, didCapture) ~= noFlags
	
	if p4 or ref_1 then
		local var3
		local stateNode = p2.stateNode
		reactCurrentOwner.current = p2
		local _ = nil
		
		if ref_1 and (p3.getDerivedStateFromError == nil or type(p3.getDerivedStateFromError) ~= "function") then
			var3 = nil
			
			if enableProfilerTimer then
				stopProfilerTimerIfRunning(p2)
			end
		elseif dEV then
			setIsRendering(true)
			var3 = stateNode:render()
			
			if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, strictMode) ~= 0 then
				disableLogs()
				local ok, status = xpcall(stateNode.render, describeError, stateNode)
				reenableLogs()
				
				if not ok then
					error(status)
				end
			end
			setIsRendering(false)
		else
			var3 = stateNode:render()
		end
		p2.flags = bit32.bor(p2.flags, performedWork)
		
		if p1 == nil or not ref_1 then
			local var4 = var3
			
			if p1 == nil then
				p2.child = mountChildFibers(p2, nil, var4, p6)
			else
				p2.child = reconcileChildFibers(p2, p1.child, var4, p6)
			end
		else
			local var5 = var3
			p2.child = reconcileChildFibers(p2, p1.child, nil, p6)
			p2.child = reconcileChildFibers(p2, nil, var5, p6)
		end
		p2.memoizedState = stateNode.state
		
		if p5 then
			invalidateContextProvider(p2, p3, true)
		end
		return p2.child
	elseif p5 then
		invalidateContextProvider(p2, p3, false)
	end
	return bailoutOnAlreadyFinishedWork(p1, p2, p6)
end

local _ = function(p1)
	-- upvalues: pushTopLevelContextObject (ref), pushHostContainer (ref)
	local stateNode = p1.stateNode
	
	if stateNode.pendingContext then
		pushTopLevelContextObject(p1, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
	elseif stateNode.context then
		pushTopLevelContextObject(p1, stateNode.context, false)
	end
	pushHostContainer(p1, stateNode.containerInfo)
end

local function updateHostRoot(p1, p2, p3)
	-- upvalues: pushTopLevelContextObject (ref), pushHostContainer (ref), invariant (ref), cloneUpdateQueue (ref), processUpdateQueue (ref), resetHydrationState (ref), bailoutOnAlreadyFinishedWork (write), enterHydrationState (ref), supportsHydration (ref), setWorkInProgressVersion (ref), mountChildFibers (ref), placement (ref), hydrating (ref), reconcileChildFibers (ref)
	local stateNode = p2.stateNode
	
	if stateNode.pendingContext then
		pushTopLevelContextObject(p2, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
	elseif stateNode.context then
		pushTopLevelContextObject(p2, stateNode.context, false)
	end
	pushHostContainer(p2, stateNode.containerInfo)
	invariant(p1 ~= nil and p2.updateQueue ~= nil, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
	local pendingProps = p2.pendingProps
	local memoizedState = p2.memoizedState
	local var3 = if memoizedState ~= nil then memoizedState.element else nil
	cloneUpdateQueue(p1, p2)
	processUpdateQueue(p2, pendingProps, nil, p3)
	local element = p2.memoizedState.element
	
	if element == var3 then
		resetHydrationState()
		
		return bailoutOnAlreadyFinishedWork(p1, p2, p3)
	end
	local stateNode_1 = p2.stateNode
	
	if stateNode_1.hydrate and enterHydrationState(p2) then
		if supportsHydration then
			local mutableSourceEagerHydrationData = stateNode_1.mutableSourceEagerHydrationData
			
			if mutableSourceEagerHydrationData ~= nil then
				for i = 1, #mutableSourceEagerHydrationData, 2 do
					setWorkInProgressVersion(mutableSourceEagerHydrationData[i], mutableSourceEagerHydrationData[i + 1])
				end
			end
		end
		local var4 = mountChildFibers(p2, nil, element, p3)
		p2.child = var4
		local var5 = var4
		while var5 do
			var5.flags = bit32.bor(bit32.band(var5.flags, bit32.bnot(placement)), hydrating)
			var5 = var5.sibling
		end
	elseif p1 == nil then
		p2.child = mountChildFibers(p2, nil, element, p3)
	else
		p2.child = reconcileChildFibers(p2, p1.child, element, p3)
	end
	resetHydrationState()
	return p2.child
end

local function updateHostComponent(p4, p5, p6)
	-- upvalues: pushHostContext (ref), tryToClaimNextHydratableInstance (ref), shouldSetTextContent (ref), contentReset (ref), performedWork (ref), ref (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	pushHostContext(p5)
	
	if p4 == nil then
		tryToClaimNextHydratableInstance(p5)
	end
	local type = p5.type
	local pendingProps = p5.pendingProps
	local var6 = if p4 ~= nil then p4.memoizedProps else nil
	local children = pendingProps.children
	
	if shouldSetTextContent(type, pendingProps) then
		children = nil
	elseif var6 ~= nil and shouldSetTextContent(type, var6) then
		p5.flags = bit32.bor(p5.flags, contentReset)
	end
	p5.flags = bit32.bor(p5.flags, performedWork)
	local ref_1 = p5.ref
	
	if p4 == nil and ref_1 ~= nil or p4 ~= nil and p4.ref ~= ref_1 then
		p5.flags = bit32.bor(p5.flags, ref)
	end
	if p4 == nil then
		p5.child = mountChildFibers(p5, nil, children, p6)
	else
		p5.child = reconcileChildFibers(p5, p4.child, children, p6)
	end
	return p5.child
end

local _ = function(p4, p5)
	-- upvalues: tryToClaimNextHydratableInstance (ref)
	if p4 == nil then
		tryToClaimNextHydratableInstance(p5)
	end
	return nil
end

local function mountLazyComponent(p4, p5, p6, p7, p8)
	-- upvalues: placement (ref), resolveLazyComponentTag (ref), resolveDefaultProps (ref), functionComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), updateFunctionComponent (write), classComponent (ref), resolveClassForHotReloading (ref), updateClassComponent (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref), updateForwardRef (ref), memoComponent (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), updateMemoComponent (ref), REACT_LAZY_TYPE (ref), inspect (ref), invariant (ref)
	if p4 ~= nil then
		p4.alternate = nil
		p5.alternate = nil
		p5.flags = bit32.bor(p5.flags, placement)
	end
	local propTypes
	local pendingProps = p5.pendingProps
	local var6 = p6._init(p6._payload)
	p5.type = var6
	p5.tag = resolveLazyComponentTag(var6)
	local tag = p5.tag
	local var7 = resolveDefaultProps(var6, pendingProps)
	local _ = nil
	
	if tag == functionComponent then
		if dEV then
			validateFunctionComponentInDev(p5, var6)
			var6 = resolveFunctionForHotReloading(var6)
			p5.type = var6
		end
		return updateFunctionComponent(nil, p5, var6, var7, p8)
	elseif tag == classComponent then
		if dEV then
			var6 = resolveClassForHotReloading(var6)
			p5.type = var6
		end
		return updateClassComponent(nil, p5, var6, var7, p8)
	elseif tag == forwardRef then
		if dEV then
			var6 = resolveForwardRefForHotReloading(var6)
			p5.type = var6
		end
		return updateForwardRef(nil, p5, var6, var7, p8)
	elseif tag == memoComponent then
		if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p5.type ~= p5.elementType then
			propTypes = var6.propTypes
			local validateProps = var6.validateProps
			
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, var7, "prop", getComponentName(var6))
			end
		end
		return updateMemoComponent(nil, p5, var6, resolveDefaultProps(var6.type, var7), p7, p8)
	else
		propTypes = ""
		
		if dEV then
			if var6 ~= nil and type(var6) == "table" and var6["$$typeof"] == REACT_LAZY_TYPE then
				propTypes = " Did you wrap a component in React.lazy() more than once?"
			elseif type(var6) == "table" and var6["$$typeof"] == nil then
				propTypes = "\n" .. inspect(var6)
			end
		end
		invariant(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(var6), propTypes)
		
		return nil
	end
end

function mountIncompleteClassComponent(p4, p5, p6, p7, p8)
	-- upvalues: placement (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), prepareToReadContext (ref), t_1 (ref), constructClassInstance (ref), mountClassInstance (ref)
	if p4 ~= nil then
		p4.alternate = nil
		p5.alternate = nil
		p5.flags = bit32.bor(p5.flags, placement)
	end
	local var6
	p5.tag = classComponent
	local _ = nil
	
	if isContextProvider(p6) then
		var6 = true
		pushContextProvider(p5)
	else
		var6 = false
	end
	prepareToReadContext(p5, p8, t_1.markWorkInProgressReceivedUpdate)
	constructClassInstance(p5, p6, p7)
	mountClassInstance(p5, p6, p7, p8)
	
	return finishClassComponent(nil, p5, p6, true, var6, p8)
end

local function mountIndeterminateComponent(a, b, p4, p5)
	-- upvalues: placement (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), prepareToReadContext (ref), t_1 (ref), dEV (ref), getComponentName (ref), t_2 (ref), console (ref), strictMode (ref), unknownModule_1 (ref), setIsRendering (ref), reactCurrentOwner (ref), renderWithHooks (ref), performedWork (ref), disableModulePatternComponents (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), initializeUpdateQueue (ref), applyDerivedStateFromProps (ref), adoptClassInstance (ref), mountClassInstance (ref), functionComponent (ref), debugRenderPhaseSideEffectsForStrictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), mountChildFibers (ref)
	if a ~= nil then
		a.alternate = nil
		b.alternate = nil
		b.flags = bit32.bor(b.flags, placement)
	end
	local var6
	local pendingProps = b.pendingProps
	local var7 = if not disableLegacyContext then getMaskedContext(b, getUnmaskedContext(b, p4, false)) else nil
	prepareToReadContext(b, p5, t_1.markWorkInProgressReceivedUpdate)
	local _ = nil
	
	if dEV then
		if type(p4) == "table" and type(p4.render) == "function" then
			local var8 = getComponentName(p4) or "Unknown"
			
			if not t_2.didWarnAboutBadClass[var8] then
				console.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", var8, var8)
				t_2.didWarnAboutBadClass[var8] = true
			end
		end
		if bit32.band(b.mode, strictMode) ~= 0 then
			unknownModule_1.recordLegacyContextWarning(b)
		end
		setIsRendering(true)
		reactCurrentOwner.current = b
		var6 = renderWithHooks(nil, b, p4, pendingProps, var7, p5)
		setIsRendering(false)
	else
		var6 = renderWithHooks(nil, b, p4, pendingProps, var7, p5)
	end
	b.flags = bit32.bor(b.flags, performedWork)
	local var9 = type(var6)
	
	if dEV and var6 ~= nil and (var9 == "table" and type(var6.render) == "function") and var6["$$typeof"] == nil then
		local var10 = getComponentName(p4) or "Unknown"
		
		if not t_2.didWarnAboutModulePatternComponent[var10] then
			console.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", var10, var10)
			t_2.didWarnAboutModulePatternComponent[var10] = true
		end
	end
	if disableModulePatternComponents or var6 == nil or (var9 ~= "table" or type(var6.render) ~= "function") or var6["$$typeof"] ~= nil then
		b.tag = functionComponent
		
		if dEV then
			if disableLegacyContext and p4.contextTypes then
				console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", getComponentName(p4) or "Unknown")
			end
			if debugRenderPhaseSideEffectsForStrictMode and bit32.band(b.mode, strictMode) ~= 0 then
				disableLogs()
				local ok, status = xpcall(renderWithHooks, describeError, nil, b, p4, pendingProps, var7, p5)
				reenableLogs()
				
				if ok then
					var6 = status
				else
					error(status)
				end
			end
		end
		b.child = mountChildFibers(b, nil, var6, p5)
		
		if dEV then
			validateFunctionComponentInDev(b, p4)
		end
		return b.child
	elseif dEV then
		local var11 = getComponentName(p4) or "Unknown"
		
		if not t_2.didWarnAboutModulePatternComponent[var11] then
			console.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. var75, var11)
			t_2.didWarnAboutModulePatternComponent[var11] = true
		end
	end
	local var12
	b.tag = classComponent
	b.memoizedState = nil
	b.updateQueue = nil
	local _ = false
	
	if isContextProvider(p4) then
		var12 = true
		pushContextProvider(b)
	else
		var12 = false
	end
	b.memoizedState = var6.state
	initializeUpdateQueue(b)
	local var13 = if type(p4) ~= "function" then p4.getDerivedStateFromProps else nil
	
	if var13 ~= nil and type(var13) == "function" then
		applyDerivedStateFromProps(b, p4, var13, pendingProps)
	end
	adoptClassInstance(b, var6)
	mountClassInstance(b, p4, pendingProps, p5)
	
	return finishClassComponent(nil, b, p4, true, var12, p5)
end

function validateFunctionComponentInDev(p4, p5)
	-- upvalues: dEV (ref), getCurrentFiberOwnerNameInDevOrNull (ref), t_2 (ref), console (ref), warnAboutDefaultPropsOnFunctionComponents (ref), getComponentName (ref)
	if dEV then
		if p4.ref ~= nil then
			local var6 = ""
			local var7 = getCurrentFiberOwnerNameInDevOrNull()
			
			if var7 then
				var6 ..= "\n\nCheck the render method of `" .. var79 .. "`."
			end
			local var8 = var7 or (p4._debugID or "")
			local debugSource = p4._debugSource
			
			if debugSource then
				var8 = debugSource.fileName .. ":" .. debugSource.lineNumber
			end
			if not t_2.didWarnAboutFunctionRefs[var8] then
				t_2.didWarnAboutFunctionRefs[var8] = true
				console.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", var6)
			end
		end
		if warnAboutDefaultPropsOnFunctionComponents and type(p5) ~= "function" and p5.defaultProps ~= nil then
			local var9 = getComponentName(p5) or "Unknown"
			
			if not t_2.didWarnAboutDefaultPropsOnFunctionComponent[var9] then
				console.error("%s: Support for defaultProps will be removed from function components in a future major release.", var9)
				t_2.didWarnAboutDefaultPropsOnFunctionComponent[var9] = true
			end
		end
		if type(p5) ~= "function" and p5.getDerivedStateFromProps ~= nil and type(p5.getDerivedStateFromProps) == "function" then
			local var10 = getComponentName(p5) or "Unknown"
			
			if not t_2.didWarnAboutGetDerivedStateOnFunctionComponent[var10] then
				console.error("%s: Function components do not support getDerivedStateFromProps.", var10)
				t_2.didWarnAboutGetDerivedStateOnFunctionComponent[var10] = true
			end
		end
		if type(p5) ~= "function" and p5.contextType ~= nil and type(p5.contextType) == "table" then
			local var11 = getComponentName(p5) or "Unknown"
			
			if not t_2.didWarnAboutContextTypeOnFunctionComponent[var11] then
				console.error("%s: Function components do not support contextType.", var11)
				t_2.didWarnAboutContextTypeOnFunctionComponent[var11] = true
			end
		end
	end
end

local t_3 = {
	dehydrated = nil,
	retryLane = reactFiberLaneModule.NoLane
}

local _ = function(p4)
	return { baseLanes = p4 }
end

local _ = function(p4, p5)
	-- upvalues: reactFiberLaneModule (ref)
	return {
		baseLanes = reactFiberLaneModule.mergeLanes(p4.baseLanes, p5)
	}
end

local _ = function(p4, p5, _, _)
	-- upvalues: hasSuspenseContext (ref), forceSuspenseFallback (ref)
	return (p5 == nil or p5.memoizedState ~= nil) and hasSuspenseContext(p4, forceSuspenseFallback)
end

local _ = function(p4, p5)
	-- upvalues: reactFiberLaneModule (ref)
	return reactFiberLaneModule.removeLanes(p4.childLanes, p5)
end

local updateSuspensePrimaryChildren = nil
local mountDehydratedSuspenseComponent = nil
local mountSuspensePrimaryChildren = nil
local updateSuspenseFallbackChildren = nil
local updateDehydratedSuspenseComponent = nil

local function updateSuspenseComponent(p4, p5, p6)
	-- upvalues: dEV (ref), t (ref), didCapture (ref), suspenseStackCursor (ref), noFlags (ref), hasSuspenseContext (ref), forceSuspenseFallback (ref), addSubtreeSuspenseContext (ref), invisibleParentSuspenseContext (ref), setDefaultShallowSuspenseContext (ref), pushSuspenseContext (ref), tryToClaimNextHydratableInstance (ref), enableSuspenseServerRenderer (ref), mountDehydratedSuspenseComponent (write), t_3 (ref), reactFiberLaneModule (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), mountSuspensePrimaryChildren (write), updateDehydratedSuspenseComponent (write), updateSuspenseFallbackChildren (write), updateSuspensePrimaryChildren (write)
	local pendingProps = p5.pendingProps
	
	if dEV then
		if not t.shouldSuspendRef then
			t.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
		end
		if t.shouldSuspendRef(p5) then
			p5.flags = bit32.bor(p5.flags, didCapture)
		end
	end
	local current = suspenseStackCursor.current
	local var6 = false
	local var7 = bit32.band(p5.flags, didCapture) ~= noFlags
	
	if not var7 then
		if (p4 == nil or p4.memoizedState ~= nil) and hasSuspenseContext(current, forceSuspenseFallback) then
			var6 = true
			p5.flags = bit32.band(p5.flags, bit32.bnot(didCapture))
		elseif (p4 == nil or p4.memoizedState ~= nil) and (pendingProps.fallback ~= nil and pendingProps.unstable_avoidThisFallback ~= true) then
			current = addSubtreeSuspenseContext(current, invisibleParentSuspenseContext)
		end
		pushSuspenseContext(p5, setDefaultShallowSuspenseContext(current))
		
		if p4 == nil then
			if pendingProps.fallback ~= nil then
				tryToClaimNextHydratableInstance(p5)
				
				if enableSuspenseServerRenderer then
					local memoizedState = p5.memoizedState
					
					if memoizedState ~= nil then
						local dehydrated = memoizedState.dehydrated
						
						if dehydrated ~= nil then
							return mountDehydratedSuspenseComponent(p5, dehydrated, p6)
						end
					end
				end
			end
			local children = pendingProps.children
			local fallback = pendingProps.fallback
			
			if var6 then
				local var8 = mountSuspenseFallbackChildren(p5, children, fallback, p6)
				p5.child.memoizedState = { baseLanes = p6 }
				p5.memoizedState = t_3
				
				return var8
			elseif pendingProps.unstable_expectedLoadTime == nil or type(pendingProps.unstable_expectedLoadTime) ~= "number" then
				return mountSuspensePrimaryChildren(p5, children, p6)
			end
			local var9 = mountSuspenseFallbackChildren(p5, children, fallback, p6)
			p5.child.memoizedState = { baseLanes = p6 }
			p5.memoizedState = t_3
			p5.lanes = reactFiberLaneModule.SomeRetryLane
			
			if enableSchedulerTracing then
				markSpawnedWork(reactFiberLaneModule.SomeRetryLane)
			end
			return var9
		else
			local memoizedState = p4.memoizedState
			
			if memoizedState == nil then
				if not var6 then
					local var10 = updateSuspensePrimaryChildren(p4, p5, pendingProps.children, p6)
					p5.memoizedState = nil
					
					return var10
				end
				local var11 = updateSuspenseFallbackChildren(p4, p5, pendingProps.children, pendingProps.fallback, p6)
				local child = p5.child
				local memoizedState_1 = p4.child.memoizedState
				
				if memoizedState_1 == nil then
					child.memoizedState = { baseLanes = p6 }
				else
					child.memoizedState = {
						baseLanes = reactFiberLaneModule.mergeLanes(memoizedState_1.baseLanes, p6)
					}
				end
				child.childLanes = reactFiberLaneModule.removeLanes(p4.childLanes, p6)
				p5.memoizedState = t_3
				
				return var11
			elseif enableSuspenseServerRenderer then
				local dehydrated = memoizedState.dehydrated
				
				if dehydrated == nil then
					if var6 then
						local var12 = updateSuspenseFallbackChildren(p4, p5, pendingProps.children, pendingProps.fallback, p6)
						local child = p5.child
						local memoizedState_1 = p4.child.memoizedState
						
						if memoizedState_1 == nil then
							child.memoizedState = { baseLanes = p6 }
						else
							child.memoizedState = {
								baseLanes = reactFiberLaneModule.mergeLanes(memoizedState_1.baseLanes, p6)
							}
						end
						child.childLanes = reactFiberLaneModule.removeLanes(p4.childLanes, p6)
						p5.memoizedState = t_3
						
						return var12
					else
						local var13 = updateSuspensePrimaryChildren(p4, p5, pendingProps.children, p6)
						p5.memoizedState = nil
						
						return var13
					end
				elseif not var7 then
					return updateDehydratedSuspenseComponent(p4, p5, dehydrated, memoizedState, p6)
				elseif p5.memoizedState == nil then
					local var14 = mountSuspenseFallbackAfterRetryWithoutHydrating(p4, p5, pendingProps.children, pendingProps.fallback, p6)
					p5.child.memoizedState = { baseLanes = p6 }
					p5.memoizedState = t_3
					
					return var14
				end
				p5.child = p4.child
				p5.flags = bit32.bor(p5.flags, didCapture)
				
				return nil
			end
		end
	end
end

mountSuspensePrimaryChildren = function(p4, p5, p6)
	-- upvalues: createFiberFromOffscreen (ref)
	local var6 = createFiberFromOffscreen({ mode = "visible", children = p5 }, p4.mode, p6, nil)
	var6.return_ = p4
	p4.child = var6
	
	return var6
end

function mountSuspenseFallbackChildren(p4, p5, p6, p7)
	-- upvalues: blockingMode (ref), noMode (ref), reactFiberLaneModule (ref), enableProfilerTimer (ref), profileMode (ref), createFiberFromFragment (ref), createFiberFromOffscreen (ref)
	local var6, var7
	local mode = p4.mode
	local child = p4.child
	local t = { mode = "hidden", children = p5 }
	local _ = nil
	local _ = nil
	
	if bit32.band(mode, blockingMode) == noMode and child ~= nil then
		var6 = child
		var6.childLanes = reactFiberLaneModule.NoLanes
		var6.pendingProps = t
		
		if enableProfilerTimer and bit32.band(p4.mode, profileMode) ~= 0 then
			var6.actualDuration = 0
			var6.actualStartTime = -1
			var6.selfBaseDuration = 0
			var6.treeBaseDuration = 0
		end
		var7 = createFiberFromFragment(p6, mode, p7, nil)
	else
		var6 = createFiberFromOffscreen(t, mode, reactFiberLaneModule.NoLanes, nil)
		var7 = createFiberFromFragment(p6, mode, p7, nil)
	end
	var6.return_ = p4
	var7.return_ = p4
	var6.sibling = var7
	p4.child = var6
	
	return var7
end

local _ = function(p4, p5)
	-- upvalues: createWorkInProgress (ref)
	return createWorkInProgress(p4, p5)
end

updateSuspensePrimaryChildren = function(p4, p5, p6, p7)
	-- upvalues: createWorkInProgress (ref), blockingMode (ref), noMode (ref), deletion (ref)
	local child = p4.child
	local sibling = child.sibling
	local var6 = createWorkInProgress(child, { mode = "visible", children = p6 })
	
	if bit32.band(p5.mode, blockingMode) == noMode then
		var6.lanes = p7
	end
	var6.return_ = p5
	var6.sibling = nil
	
	if sibling ~= nil then
		local deletions = p5.deletions
		
		if deletions == nil then
			p5.deletions = { sibling }
			p5.flags = bit32.bor(p5.flags, deletion)
		else
			table.insert(deletions, sibling)
		end
	end
	p5.child = var6
	
	return var6
end

updateSuspenseFallbackChildren = function(p4, p5, p6, p7, p8)
	-- upvalues: blockingMode (ref), noMode (ref), reactFiberLaneModule (ref), enableProfilerTimer (ref), profileMode (ref), createWorkInProgress (ref), staticMask (ref), createFiberFromFragment (ref), placement (ref)
	local var6
	local mode = p5.mode
	local child = p4.child
	local sibling = child.sibling
	local t = { mode = "hidden", children = p6 }
	local _ = nil
	
	if bit32.band(mode, blockingMode) == noMode and p5.child ~= child then
		var6 = p5.child
		var6.childLanes = reactFiberLaneModule.NoLanes
		var6.pendingProps = t
		
		if enableProfilerTimer and bit32.band(p5.mode, profileMode) ~= 0 then
			var6.actualDuration = 0
			var6.actualStartTime = -1
			var6.selfBaseDuration = child.selfBaseDuration
			var6.treeBaseDuration = child.treeBaseDuration
		end
		p5.deletions = nil
	else
		var6 = createWorkInProgress(child, t)
		var6.subtreeFlags = bit32.band(child.subtreeFlags, staticMask)
	end
	local var7
	local _ = nil
	
	if sibling == nil then
		var7 = createFiberFromFragment(p7, mode, p8, nil)
		var7.flags = bit32.bor(var7.flags, placement)
	else
		var7 = createWorkInProgress(sibling, p7)
	end
	var7.return_ = p5
	var6.return_ = p5
	var6.sibling = var7
	p5.child = var6
	
	return var7
end

local _ = function(p4, p5, p6)
	-- upvalues: reconcileChildFibers (ref), mountSuspensePrimaryChildren (write), placement (ref)
	reconcileChildFibers(p5, p4.child, nil, p6)
	local var6 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p6)
	var6.flags = bit32.bor(var6.flags, placement)
	p5.memoizedState = nil
	
	return var6
end

function mountSuspenseFallbackAfterRetryWithoutHydrating(p4, p5, p6, p7, p8)
	-- upvalues: createFiberFromOffscreen (ref), reactFiberLaneModule (ref), createFiberFromFragment (ref), placement (ref), blockingMode (ref), noMode (ref), reconcileChildFibers (ref)
	local mode = p5.mode
	local var6 = createFiberFromOffscreen(p6, mode, reactFiberLaneModule.NoLanes, nil)
	local var7 = createFiberFromFragment(p7, mode, p8, nil)
	var7.flags = bit32.bor(var7.flags, placement)
	var6.return_ = p5
	var7.return_ = p5
	var6.sibling = var7
	p5.child = var6
	
	if bit32.band(p5.mode, blockingMode) ~= noMode then
		reconcileChildFibers(p5, p4.child, nil, p8)
	end
	return var7
end

mountDehydratedSuspenseComponent = function(p4, p5, _)
	-- upvalues: blockingMode (ref), noMode (ref), dEV (ref), console (ref), reactFiberLaneModule (ref), isSuspenseInstanceFallback (ref), enableSchedulerTracing (ref), markSpawnedWork (ref)
	if bit32.band(p4.mode, blockingMode) == noMode then
		if dEV then
			console.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
		end
		p4.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.SyncLane)
	elseif isSuspenseInstanceFallback(p5) then
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.DefaultHydrationLane)
		end
		p4.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.DefaultHydrationLane)
	else
		p4.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.OffscreenLane)
		
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.OffscreenLane)
		end
	end
	return nil
end

updateDehydratedSuspenseComponent = function(p4, p5, p6, p7, p8)
	-- upvalues: warnIfHydrating (ref), getExecutionContext (ref), retryAfterError (ref), noContext (ref), reconcileChildFibers (ref), mountSuspensePrimaryChildren (write), placement (ref), blockingMode (ref), noMode (ref), isSuspenseInstanceFallback (ref), reactFiberLaneModule (ref), var2 (write), getWorkInProgressRoot (ref), scheduleUpdateOnFiber (ref), renderDidSuspendDelayIfPossible (ref), isSuspenseInstancePending (ref), didCapture (ref), retryDehydratedSuspenseBoundary (ref), enableSchedulerTracing (ref), var1 (write), parent (ref), registerSuspenseInstanceRetry (ref), reenterHydrationStateFromDehydratedSuspenseInstance (ref), hydrating (ref)
	warnIfHydrating()
	
	if bit32.band(getExecutionContext(), retryAfterError) ~= noContext then
		reconcileChildFibers(p5, p4.child, nil, p8)
		local var6 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p8)
		var6.flags = bit32.bor(var6.flags, placement)
		p5.memoizedState = nil
		
		return var6
	elseif bit32.band(p5.mode, blockingMode) == noMode then
		reconcileChildFibers(p5, p4.child, nil, p8)
		local var7 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p8)
		var7.flags = bit32.bor(var7.flags, placement)
		p5.memoizedState = nil
		
		return var7
	elseif isSuspenseInstanceFallback(p6) then
		reconcileChildFibers(p5, p4.child, nil, p8)
		local var8 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p8)
		var8.flags = bit32.bor(var8.flags, placement)
		p5.memoizedState = nil
		
		return var8
	elseif var2 or reactFiberLaneModule.includesSomeLane(p8, p4.childLanes) then
		local var9 = getWorkInProgressRoot()
		
		if var9 ~= nil then
			local bumpedLaneForHydration = reactFiberLaneModule.getBumpedLaneForHydration(var9, p8)
			
			if bumpedLaneForHydration ~= reactFiberLaneModule.NoLane and bumpedLaneForHydration ~= p7.retryLane then
				p7.retryLane = bumpedLaneForHydration
				scheduleUpdateOnFiber(p4, bumpedLaneForHydration, reactFiberLaneModule.NoTimestamp)
			end
		end
		renderDidSuspendDelayIfPossible()
		reconcileChildFibers(p5, p4.child, nil, p8)
		local var10 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p8)
		var10.flags = bit32.bor(var10.flags, placement)
		p5.memoizedState = nil
		
		return var10
	elseif not isSuspenseInstancePending(p6) then
		reenterHydrationStateFromDehydratedSuspenseInstance(p5, p6)
		local var11 = mountSuspensePrimaryChildren(p5, p5.pendingProps.children, p8)
		var11.flags = bit32.bor(var11.flags, hydrating)
		
		return var11
	end
	p5.flags = bit32.bor(p5.flags, didCapture)
	p5.child = p4.child
	
	local var12 = function()
		-- upvalues: retryDehydratedSuspenseBoundary (copy), p4 (ref)
		return retryDehydratedSuspenseBoundary(p4)
	end
	
	if enableSchedulerTracing then
		if var1 == nil then
			var1 = require(parent.Scheduler).tracing.unstable_wrap
		end
		var12 = var1(var12)
	end
	registerSuspenseInstanceRetry(p6, var12)
	
	return nil
end

function updatePortalComponent(p4, p5, p6)
	-- upvalues: pushHostContainer (ref), reconcileChildFibers (ref), mountChildFibers (ref)
	pushHostContainer(p5, p5.stateNode.containerInfo)
	local pendingProps = p5.pendingProps
	
	if p4 == nil then
		p5.child = reconcileChildFibers(p5, nil, pendingProps, p6)
	elseif p4 == nil then
		p5.child = mountChildFibers(p5, nil, pendingProps, p6)
	else
		p5.child = reconcileChildFibers(p5, p4.child, pendingProps, p6)
	end
	return p5.child
end

local var6 = false

local function updateContextProvider(p4, p5, p6)
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), array (ref), object (ref), var6 (write), console (ref), checkPropTypes (ref), pushProvider (ref), calculateChangedBits (ref), hasContextChanged (ref), bailoutOnAlreadyFinishedWork (write), propagateContextChange (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	local context = p5.type._context
	local pendingProps = p5.pendingProps
	local memoizedProps = p5.memoizedProps
	local value = pendingProps.value
	
	if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
		if array.indexOf(object.keys(pendingProps), "value") < 1 and not var6 then
			var6 = true
			console.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
		end
		propTypes = p5.type.propTypes
		local validateProps = p5.type.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, pendingProps, "prop", "Context.Provider")
		end
	end
	pushProvider(p5, value)
	
	if memoizedProps ~= nil then
		local var7 = calculateChangedBits(context, value, memoizedProps.value)
		
		if var7 == 0 then
			if memoizedProps.children == pendingProps.children and not hasContextChanged() then
				return bailoutOnAlreadyFinishedWork(p4, p5, p6)
			end
		else
			propagateContextChange(p5, context, var7, p6)
		end
	end
	propTypes = pendingProps.children
	
	if p4 == nil then
		p5.child = mountChildFibers(p5, nil, propTypes, p6)
	else
		p5.child = reconcileChildFibers(p5, p4.child, propTypes, p6)
	end
	return p5.child
end

local t_4 = {
	usingContextAsConsumer = false,
	usingLegacyConsumer = false
}

function updateContextConsumer(p4, p5, p6)
	-- upvalues: dEV (ref), t_4 (ref), console (ref), cOMPATWARNINGS (ref), prepareToReadContext (ref), t_1 (ref), readContext (ref), reactCurrentOwner (ref), setIsRendering (ref), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local type = p5.type
	
	if dEV then
		if type._context ~= nil then
			type = type._context
		elseif type ~= type.Consumer and not t_4.usingContextAsConsumer then
			t_4.usingContextAsConsumer = true
			console.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
		end
	end
	local render
	local pendingProps = p5.pendingProps
	local _ = nil
	
	if pendingProps.render then
		if dEV and cOMPATWARNINGS and not t_4.usingLegacyConsumer then
			t_4.usingLegacyConsumer = true
			console.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \nPlease provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
		end
		render = pendingProps.render
	else
		render = pendingProps.children
	end
	if dEV and type(render) ~= "function" then
		console.error("A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
	end
	local var7
	prepareToReadContext(p5, p6, t_1.markWorkInProgressReceivedUpdate)
	local var8 = readContext(type, pendingProps.unstable_observedBits)
	local _ = nil
	
	if dEV then
		reactCurrentOwner.current = p5
		setIsRendering(true)
		var7 = render(var8)
		setIsRendering(false)
	else
		var7 = render(var8)
	end
	p5.flags = bit32.bor(p5.flags, performedWork)
	
	if p4 == nil then
		p5.child = mountChildFibers(p5, nil, var7, p6)
	else
		p5.child = reconcileChildFibers(p5, p4.child, var7, p6)
	end
	return p5.child
end

function t_1.markWorkInProgressReceivedUpdate()
	-- upvalues: var2 (write)
	var2 = true
end

bailoutOnAlreadyFinishedWork = function(p4, p5, p6)
	-- upvalues: enableProfilerTimer (ref), stopProfilerTimerIfRunning (ref), markSkippedUpdateLanes (ref), reactFiberLaneModule (ref), cloneChildFibers (ref)
	if p4 then
		p5.dependencies = p4.dependencies
	end
	if enableProfilerTimer then
		stopProfilerTimerIfRunning(p5)
	end
	markSkippedUpdateLanes(p5.lanes)
	
	if reactFiberLaneModule.includesSomeLane(p6, p5.childLanes) then
		cloneChildFibers(p4, p5)
		
		return p5.child
	end
	return nil
end

function remountFiber(p4, p5, p6)
	-- upvalues: dEV (ref), deletion (ref), placement (ref)
	if not dEV then
		error("Did not expect this call in production. This is a bug in React. Please file an issue.")
		
		return
	end
	local _return = p5.return_
	
	if _return == nil then
		error("Cannot swap the root fiber.")
	end
	assert(_return ~= nil, "returnFiber was nil in remountFiber")
	p4.alternate = nil
	p5.alternate = nil
	p6.index = p5.index
	p6.sibling = p5.sibling
	p6.return_ = p5.return_
	p6.ref = p5.ref
	
	if p5 == _return.child then
		_return.child = p6
	else
		local child = _return.child
		
		if child == nil then
			error("Expected parent to have a child.")
		end
		assert(child ~= nil, "prevSibling was nil in remountFiber")
		while child.sibling ~= p5 do
			child = child.sibling
			
			if child == nil then
				error("Expected to find the previous sibling.")
			end
		end
		child.sibling = p6
	end
	local deletions = _return.deletions
	
	if deletions == nil then
		_return.deletions = { p4 }
		_return.flags = bit32.bor(_return.flags, deletion)
	else
		table.insert(deletions, p4)
	end
	p6.flags = bit32.bor(p6.flags, placement)
	
	return p6
end

function t_1.beginWork(p7, p8, p9)
	-- upvalues: dEV (ref), createFiberFromTypeAndProps (ref), hasContextChanged (ref), var2 (write), reactFiberLaneModule (ref), hostRoot (ref), pushTopLevelContextObject (ref), pushHostContainer (ref), resetHydrationState (ref), hostComponent (ref), pushHostContext (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), hostPortal (ref), contextProvider (ref), pushProvider (ref), profiler (ref), enableProfilerTimer (ref), suspenseComponent (ref), enableSuspenseServerRenderer (ref), pushSuspenseContext (ref), setDefaultShallowSuspenseContext (ref), suspenseStackCursor (ref), didCapture (ref), updateSuspenseComponent (ref), bailoutOnAlreadyFinishedWork (write), suspenseListComponent (ref), offscreenComponent (ref), legacyHiddenComponent (ref), updateOffscreenComponent (ref), forceUpdateForLegacySuspense (ref), noFlags (ref), reactWorkTagsModule (ref), mountIndeterminateComponent (ref), lazyComponent (ref), mountLazyComponent (ref), functionComponent (ref), resolveDefaultProps (ref), updateFunctionComponent (write), updateClassComponent (ref), updateHostRoot (ref), updateHostComponent (ref), hostText (ref), tryToClaimNextHydratableInstance (ref), forwardRef (ref), updateForwardRef (ref), fragment (ref), mode (ref), updateContextProvider (ref), contextConsumer (ref), memoComponent (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), updateMemoComponent (ref), simpleMemoComponent (ref), updateSimpleMemoComponent (write), incompleteClassComponent (ref), updateOffscreenComponent (ref), invariant (ref)
	local lanes = p8.lanes
	
	if dEV and p8._debugNeedsRemount and p7 ~= nil then
		return remountFiber(p7, p8, createFiberFromTypeAndProps(p8.type, p8.key, p8.pendingProps, p8._debugOwner or nil, p8.mode, p8.lanes))
	elseif p7 == nil then
		var2 = false
	elseif p7.memoizedProps == p8.pendingProps and not hasContextChanged() then
		local var7
		if dEV then
			var7 = p8.type ~= p7.type
			var7 = nil
		else
			var7 = false
		end
		if var7 then
			var2 = true
		elseif reactFiberLaneModule.includesSomeLane(p9, lanes) then
			var2 = bit32.band(p7.flags, forceUpdateForLegacySuspense) == noFlags
		else
			var2 = false
			
			if p8.tag == hostRoot then
				var7 = p8.stateNode
				
				if var7.pendingContext then
					pushTopLevelContextObject(p8, var7.pendingContext, var7.pendingContext ~= var7.context)
				elseif var7.context then
					pushTopLevelContextObject(p8, var7.context, false)
				end
				pushHostContainer(p8, var7.containerInfo)
				resetHydrationState()
			elseif p8.tag == hostComponent then
				pushHostContext(p8)
			elseif p8.tag == classComponent then
				if isContextProvider(p8.type) then
					pushContextProvider(p8)
				end
			elseif p8.tag == hostPortal then
				pushHostContainer(p8, p8.stateNode.containerInfo)
			elseif p8.tag == contextProvider then
				pushProvider(p8, p8.memoizedProps.value)
			elseif p8.tag == profiler then
				if enableProfilerTimer then
					var7 = p8.stateNode
					var7.effectDuration = 0
					var7.passiveEffectDuration = 0
				end
			elseif p8.tag == suspenseComponent then
				var7 = p8.memoizedState
				
				if var7 == nil then
					pushSuspenseContext(p8, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
				elseif enableSuspenseServerRenderer and var7.dehydrated ~= nil then
					pushSuspenseContext(p8, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
					p8.flags = bit32.bor(p8.flags, didCapture)
					
					return nil
				elseif reactFiberLaneModule.includesSomeLane(p9, p8.child.childLanes) then
					return updateSuspenseComponent(p7, p8, p9)
				end
				pushSuspenseContext(p8, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
				local var8 = bailoutOnAlreadyFinishedWork(p7, p8, p9)
				
				return if var8 == nil then nil else var8.sibling
			elseif p8.tag == suspenseListComponent then
				print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
				print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
				print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
				error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
			elseif p8.tag == offscreenComponent or p8.tag == legacyHiddenComponent then
				p8.lanes = reactFiberLaneModule.NoLanes
				
				return updateOffscreenComponent(p7, p8, p9)
			end
			return bailoutOnAlreadyFinishedWork(p7, p8, p9)
		end
	end
	p8.lanes = reactFiberLaneModule.NoLanes
	
	if p8.tag == reactWorkTagsModule.IndeterminateComponent then
		return mountIndeterminateComponent(p7, p8, p8.type, p9)
	elseif p8.tag == lazyComponent then
		return mountLazyComponent(p7, p8, p8.elementType, lanes, p9)
	elseif p8.tag == functionComponent then
		local type = p8.type
		local pendingProps = p8.pendingProps
		
		return updateFunctionComponent(p7, p8, type, if p8.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p9)
	elseif p8.tag == classComponent then
		local type = p8.type
		local pendingProps = p8.pendingProps
		
		return updateClassComponent(p7, p8, type, if p8.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p9)
	elseif p8.tag == hostRoot then
		return updateHostRoot(p7, p8, p9)
	elseif p8.tag == hostComponent then
		return updateHostComponent(p7, p8, p9)
	elseif p8.tag == hostText then
		if p7 == nil then
			tryToClaimNextHydratableInstance(p8)
		end
		return nil
	elseif p8.tag == suspenseComponent then
		return updateSuspenseComponent(p7, p8, p9)
	elseif p8.tag == hostPortal then
		return updatePortalComponent(p7, p8, p9)
	elseif p8.tag == forwardRef then
		local type = p8.type
		local pendingProps = p8.pendingProps
		
		return updateForwardRef(p7, p8, type, if p8.elementType ~= type then resolveDefaultProps(type, pendingProps) else pendingProps, p9)
	elseif p8.tag == fragment then
		return updateFragment(p7, p8, p9)
	elseif p8.tag == mode then
		return updateMode(p7, p8, p9)
	elseif p8.tag == profiler then
		return updateProfiler(p7, p8, p9)
	elseif p8.tag == contextProvider then
		return updateContextProvider(p7, p8, p9)
	elseif p8.tag == contextConsumer then
		return updateContextConsumer(p7, p8, p9)
	elseif p8.tag == memoComponent then
		local type = p8.type
		local var9 = resolveDefaultProps(type, p8.pendingProps)
		
		if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p8.type ~= p8.elementType then
			local propTypes = nil
			local validateProps = nil
			
			if type(type) == "table" then
				propTypes = type.propTypes
				validateProps = type.validateProps
			end
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, var9, "prop", getComponentName(type))
			end
		end
		return updateMemoComponent(p7, p8, type, resolveDefaultProps(type.type, var9), lanes, p9)
	elseif p8.tag == simpleMemoComponent then
		return updateSimpleMemoComponent(p7, p8, p8.type, p8.pendingProps, lanes, p9)
	elseif p8.tag == incompleteClassComponent then
		local type = p8.type
		local pendingProps = p8.pendingProps
		
		return mountIncompleteClassComponent(p7, p8, type, if p8.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p9)
	elseif p8.tag == offscreenComponent then
		return updateOffscreenComponent(p7, p8, p9)
	elseif p8.tag == legacyHiddenComponent then
		return updateOffscreenComponent(p7, p8, p9)
	end
	invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", tostring(p8.tag))
	
	return nil
end

return t_1