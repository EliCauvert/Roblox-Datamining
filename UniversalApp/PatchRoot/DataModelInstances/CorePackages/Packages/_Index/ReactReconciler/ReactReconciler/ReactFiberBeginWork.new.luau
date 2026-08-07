local function _(p0) --[[ line: 14 | named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p0))
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

local _ = function(p1) --[[ line: 189 | named "shouldSuspend" ]]
	-- upvalues: t (ref)
	if not t.shouldSuspendRef then
		t.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
	end
	return t.shouldSuspendRef(p1)
end

local _ = function() --[[ line: 198 | named "initReactFiberHooks" ]]
	-- upvalues: t (ref)
	local unknownModule = require(script.Parent["ReactFiberHooks.new"])
	t.renderWithHooksRef = unknownModule.renderWithHooks
	t.bailoutHooksRef = unknownModule.bailoutHooks
end

local function renderWithHooks(...) --[[ line: 205 ]]
	-- upvalues: t (ref)
	if not t.renderWithHooksRef then
		local unknownModule = require(script.Parent["ReactFiberHooks.new"])
		t.renderWithHooksRef = unknownModule.renderWithHooks
		t.bailoutHooksRef = unknownModule.bailoutHooks
	end
	return t.renderWithHooksRef(...)
end

local function bailoutHooks(...) --[[ line: 213 ]]
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
local var22 = nil
local setWorkInProgressVersion = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion
local markSkippedUpdateLanes = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local consolePatchingDev = require(parent.Shared).ConsolePatchingDev
local disableLogs = consolePatchingDev.disableLogs
local reenableLogs = consolePatchingDev.reenableLogs
local reactCurrentOwner = reactSharedInternals.ReactCurrentOwner
local t_1 = {}
local bailoutOnAlreadyFinishedWork = nil
local updateFunctionComponent = nil
local var26 = false
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
local _ = function(p2, p3, p4, p5) --[[ line: 314 | named "reconcileChildren" ]]
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	if p2 == nil then
		p3.child = mountChildFibers(p3, nil, p4, p5)
		
		return
	end
	p3.child = reconcileChildFibers(p3, p2.child, p4, p5)
end

local _ = function(p6, p7, p8, p9) --[[ line: 343 | named "forceUnmountCurrentAndReconcile" ]]
	-- upvalues: reconcileChildFibers (ref)
	p7.child = reconcileChildFibers(p7, p6.child, nil, p9)
	p7.child = reconcileChildFibers(p7, nil, p8, p9)
end

local function updateForwardRef(p10, p11, p12, p13, p14) --[[ line: 367 ]]
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), prepareToReadContext (ref), t_1 (ref), reactCurrentOwner (ref), setIsRendering (ref), renderWithHooks (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var26 (write), bailoutHooks (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p11.type ~= p11.elementType then
		propTypes = p12.propTypes
		local validateProps = p12.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p13, "prop", getComponentName(p12))
		end
	end
	local var50
	propTypes = p12.render
	local ref = p11.ref
	local _ = nil
	prepareToReadContext(p11, p14, t_1.markWorkInProgressReceivedUpdate)
	
	if dEV then
		reactCurrentOwner.current = p11
		setIsRendering(true)
		var50 = renderWithHooks(p10, p11, propTypes, p13, ref, p14)
		
		if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p11.mode, strictMode) ~= 0 then
			disableLogs()
			local ok, status = xpcall(renderWithHooks, describeError, p10, p11, propTypes, p13, ref, p14)
			
			if ok then
				var50 = status
			end
			reenableLogs()
			
			if not ok then
				error(status)
			end
		end
		setIsRendering(false)
	else
		var50 = renderWithHooks(p10, p11, propTypes, p13, ref, p14)
	end
	if p10 ~= nil and not var26 then
		bailoutHooks(p10, p11, p14)
		
		return bailoutOnAlreadyFinishedWork(p10, p11, p14)
	end
	p11.flags = bit32.bor(p11.flags, performedWork)
	
	if p10 == nil then
		p11.child = mountChildFibers(p11, nil, var50, p14)
	else
		p11.child = reconcileChildFibers(p11, p10.child, var50, p14)
	end
	return p11.child
end

local function updateMemoComponent(p15, p16, p17, p18, p19, p20) --[[ line: 454 ]]
	-- upvalues: isSimpleFunctionComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), simpleMemoComponent (ref), updateSimpleMemoComponent (write), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), createFiberFromTypeAndProps (ref), reactFiberLaneModule (ref), shallowEqual (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), createWorkInProgress (ref)
	local var52
	if p15 == nil then
		local type = p17.type
		
		if isSimpleFunctionComponent(type) and p17.compare == nil and p17.defaultProps == nil then
			local var51 = if dEV then resolveFunctionForHotReloading(type) else type
			p16.tag = simpleMemoComponent
			p16.type = var51
			
			if dEV then
				validateFunctionComponentInDev(p16, type)
			end
			return updateSimpleMemoComponent(p15, p16, var51, p18, p19, p20)
		elseif dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			var52 = nil
			local validateProps = nil
			
			if type(type) == "table" then
				var52 = type.propTypes
				validateProps = type.validateProps
			end
			if var52 or validateProps then
				checkPropTypes(var52, validateProps, p18, "prop", getComponentName(type))
			end
		end
		var52 = createFiberFromTypeAndProps(p17.type, nil, p18, p16, p16.mode, p20)
		var52.ref = p16.ref
		var52.return_ = p16
		p16.child = var52
		
		return var52
	elseif dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
		local type = p17.type
		var52 = nil
		local validateProps = nil
		
		if type(type) == "table" then
			var52 = type.propTypes
			validateProps = type.validateProps
		end
		if var52 or validateProps then
			checkPropTypes(var52, validateProps, p18, "prop", getComponentName(type))
		end
	end
	local child = p15.child
	
	if not reactFiberLaneModule.includesSomeLane(p19, p20) then
		var52 = child.memoizedProps
		local compare = p17.compare
		
		if compare == nil then
			compare = shallowEqual
		end
		if compare(var52, p18) and p15.ref == p16.ref then
			return bailoutOnAlreadyFinishedWork(p15, p16, p20)
		end
	end
	p16.flags = bit32.bor(p16.flags, performedWork)
	var52 = createWorkInProgress(child, p18)
	var52.ref = p16.ref
	var52.return_ = p16
	p16.child = var52
	
	return var52
end

updateSimpleMemoComponent = function(p21, p22, p23, p24, p25, p26) --[[ line: 575 | named "updateSimpleMemoComponent" ]]
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), REACT_LAZY_TYPE (ref), describeError (ref), checkPropTypes (ref), getComponentName (ref), shallowEqual (ref), var26 (write), reactFiberLaneModule (ref), bailoutOnAlreadyFinishedWork (write), forceUpdateForLegacySuspense (ref), noFlags (ref), updateFunctionComponent (write)
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p22.type ~= p22.elementType then
		local elementType = p22.elementType
		
		if elementType["$$typeof"] == REACT_LAZY_TYPE then
			local var53 = elementType
			local ok, status = xpcall(var53._init, describeError, var53._payload)
			elementType = if ok then status else nil
			local propTypes = nil
			local validateProps = nil
			
			if elementType ~= nil and type(elementType) == "table" then
				propTypes = elementType.propTypes
				validateProps = elementType.validateProps
			end
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, p24, "prop", getComponentName(elementType))
			end
		end
	end
	if p21 ~= nil then
		if shallowEqual(p21.memoizedProps, p24) and p21.ref == p22.ref and (if dEV then p22.type == p21.type else true) then
			var26 = false
			
			if not reactFiberLaneModule.includesSomeLane(p26, p25) then
				p22.lanes = p21.lanes
				
				return bailoutOnAlreadyFinishedWork(p21, p22, p26)
			elseif bit32.band(p21.flags, forceUpdateForLegacySuspense) ~= noFlags then
				var26 = true
			end
		end
	end
	return updateFunctionComponent(p21, p22, p23, p24, p26)
end

local function updateOffscreenComponent(p27, p28, p29) --[[ line: 677 ]]
	-- upvalues: concurrentMode (ref), noMode (ref), reactFiberLaneModule (ref), pushRenderLanes (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local pendingProps = p28.pendingProps
	local children = pendingProps.children
	local var54 = if p27 ~= nil then p27.memoizedState else nil
	
	if pendingProps.mode ~= "hidden" and pendingProps.mode ~= "unstable-defer-without-hiding" then
		local var55
		local _ = nil
		
		if var54 == nil then
			var55 = p29
		else
			var55 = reactFiberLaneModule.mergeLanes(var54.baseLanes, p29)
			p28.memoizedState = nil
		end
		pushRenderLanes(p28, var55)
	elseif bit32.band(p28.mode, concurrentMode) == noMode then
		p28.memoizedState = { baseLanes = reactFiberLaneModule.NoLanes }
		pushRenderLanes(p28, p29)
	elseif reactFiberLaneModule.includesSomeLane(p29, reactFiberLaneModule.OffscreenLane) then
		p28.memoizedState = { baseLanes = reactFiberLaneModule.NoLanes }
		pushRenderLanes(p28, if var54 ~= nil then var54.baseLanes else p29)
	else
		local var56 = if var54 ~= nil then p29 else reactFiberLaneModule.mergeLanes(var54.baseLanes, p29)
		
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.OffscreenLane)
		end
		p28.childLanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.OffscreenLane)
		p28.lanes = p28.childLanes
		p28.memoizedState = { baseLanes = var56 }
		pushRenderLanes(p28, var56)
		
		return nil
	end
	if p27 == nil then
		p28.child = mountChildFibers(p28, nil, children, p29)
	else
		p28.child = reconcileChildFibers(p28, p27.child, children, p29)
	end
	return p28.child
end

function updateFragment(p30, p31, p32) --[[ line: 779 ]]
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	local pendingProps = p31.pendingProps
	
	if p30 == nil then
		p31.child = mountChildFibers(p31, nil, pendingProps, p32)
	else
		p31.child = reconcileChildFibers(p31, p30.child, pendingProps, p32)
	end
	return p31.child
end

function updateMode(p33, p34, p35) --[[ line: 785 ]]
	-- upvalues: mountChildFibers (ref), reconcileChildFibers (ref)
	local children = p34.pendingProps.children
	
	if p33 == nil then
		p34.child = mountChildFibers(p34, nil, children, p35)
	else
		p34.child = reconcileChildFibers(p34, p33.child, children, p35)
	end
	return p34.child
end

function updateProfiler(p36, p37, p38) --[[ line: 791 ]]
	-- upvalues: enableProfilerTimer (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	if enableProfilerTimer then
		local stateNode = p37.stateNode
		stateNode.effectDuration = 0
		stateNode.passiveEffectDuration = 0
	end
	local children = p37.pendingProps.children
	
	if p36 == nil then
		p37.child = mountChildFibers(p37, nil, children, p38)
	else
		p37.child = reconcileChildFibers(p37, p36.child, children, p38)
	end
	return p37.child
end

local _ = function(p39, p40) --[[ line: 805 | named "markRef" ]]
	-- upvalues: ref (ref)
	local ref_1 = p40.ref
	
	if p39 == nil and ref_1 ~= nil or p39 ~= nil and p39.ref ~= ref_1 then
		p40.flags = bit32.bor(p40.flags, ref)
	end
end

updateFunctionComponent = function(p41, p42, p43, p44, p45) --[[ line: 816 | named "updateFunctionComponent" ]]
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), prepareToReadContext (ref), t_1 (ref), reactCurrentOwner (ref), setIsRendering (ref), renderWithHooks (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var26 (write), bailoutHooks (ref), bailoutOnAlreadyFinishedWork (write), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and (type(p43) ~= "function" and p42.type ~= p42.elementType) then
		propTypes = nil
		local validateProps = nil
		
		if type(p43) == "table" then
			propTypes = p43.propTypes
			validateProps = p43.validateProps
		end
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p44, "prop", getComponentName(p43))
		end
	end
	local var57
	propTypes = if not disableLegacyContext then getMaskedContext(p42, getUnmaskedContext(p42, p43, true)) else nil
	local _ = nil
	prepareToReadContext(p42, p45, t_1.markWorkInProgressReceivedUpdate)
	
	if dEV then
		reactCurrentOwner.current = p42
		setIsRendering(true)
		var57 = renderWithHooks(p41, p42, p43, p44, propTypes, p45)
		
		if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p42.mode, strictMode) ~= 0 then
			disableLogs()
			local ok, status = xpcall(renderWithHooks, describeError, p41, p42, p43, p44, propTypes, p45)
			reenableLogs()
			
			if ok then
				var57 = status
			else
				error(status)
			end
		end
		setIsRendering(false)
	else
		var57 = renderWithHooks(p41, p42, p43, p44, propTypes, p45)
	end
	if p41 ~= nil and not var26 then
		bailoutHooks(p41, p42, p45)
		
		return bailoutOnAlreadyFinishedWork(p41, p42, p45)
	end
	p42.flags = bit32.bor(p42.flags, performedWork)
	
	if p41 == nil then
		p42.child = mountChildFibers(p42, nil, var57, p45)
	else
		p42.child = reconcileChildFibers(p42, p41.child, var57, p45)
	end
	return p42.child
end

local function updateClassComponent(p46, p47, p48, p49, p50) --[[ line: 995 ]]
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), isContextProvider (ref), pushContextProvider (ref), prepareToReadContext (ref), t_1 (ref), placement (ref), constructClassInstance (ref), mountClassInstance (ref), resumeMountClassInstance (ref), updateClassInstance (ref), console (ref)
	local propTypes
	if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p47.type ~= p47.elementType then
		propTypes = p48.propTypes
		local validateProps = p48.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p49, "prop", getComponentName(p48))
		end
	end
	propTypes = nil
	
	if isContextProvider(p48) then
		propTypes = true
		pushContextProvider(p47)
	else
		propTypes = false
	end
	local var58
	prepareToReadContext(p47, p50, t_1.markWorkInProgressReceivedUpdate)
	local _ = nil
	
	if p47.stateNode == nil then
		if p46 ~= nil then
			p46.alternate = nil
			p47.alternate = nil
			p47.flags = bit32.bor(p47.flags, placement)
		end
		constructClassInstance(p47, p48, p49)
		mountClassInstance(p47, p48, p49, p50)
		var58 = true
	else
		var58 = if p46 == nil then resumeMountClassInstance(p47, p48, p49, p50) else updateClassInstance(p46, p47, p48, p49, p50)
	end
	local var59 = finishClassComponent(p46, p47, p48, var58, propTypes, p50)
	
	if dEV then
		if var58 and p47.stateNode.props ~= p49 then
			if not t_1.didWarnAboutReassigningProps then
				console.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", getComponentName(p47.type) or "a component")
			end
			t_1.didWarnAboutReassigningProps = true
		end
	end
	return var59
end

function finishClassComponent(p51, p52, p53, p54, p55, p56) --[[ line: 1092 ]]
	-- upvalues: ref (ref), didCapture (ref), noFlags (ref), invalidateContextProvider (ref), bailoutOnAlreadyFinishedWork (write), reactCurrentOwner (ref), enableProfilerTimer (ref), stopProfilerTimerIfRunning (ref), dEV (ref), setIsRendering (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), performedWork (ref), reconcileChildFibers (ref), mountChildFibers (ref)
	local ref_1 = p52.ref
	
	if p51 == nil and ref_1 ~= nil or p51 ~= nil and p51.ref ~= ref_1 then
		p52.flags = bit32.bor(p52.flags, ref)
	end
	ref_1 = bit32.band(p52.flags, didCapture) ~= noFlags
	
	if p54 or ref_1 then
		local var60
		local stateNode = p52.stateNode
		reactCurrentOwner.current = p52
		local _ = nil
		
		if ref_1 and (p53.getDerivedStateFromError == nil or type(p53.getDerivedStateFromError) ~= "function") then
			var60 = nil
			
			if enableProfilerTimer then
				stopProfilerTimerIfRunning(p52)
			end
		elseif dEV then
			setIsRendering(true)
			var60 = stateNode:render()
			
			if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p52.mode, strictMode) ~= 0 then
				disableLogs()
				local ok, status = xpcall(stateNode.render, describeError, stateNode)
				reenableLogs()
				
				if not ok then
					error(status)
				end
			end
			setIsRendering(false)
		else
			var60 = stateNode:render()
		end
		p52.flags = bit32.bor(p52.flags, performedWork)
		
		if p51 == nil or not ref_1 then
			local var62 = var60
			
			if p51 == nil then
				p52.child = mountChildFibers(p52, nil, var62, p56)
			else
				p52.child = reconcileChildFibers(p52, p51.child, var62, p56)
			end
		else
			local var61 = var60
			p52.child = reconcileChildFibers(p52, p51.child, nil, p56)
			p52.child = reconcileChildFibers(p52, nil, var61, p56)
		end
		p52.memoizedState = stateNode.state
		
		if p55 then
			invalidateContextProvider(p52, p53, true)
		end
		return p52.child
	elseif p55 then
		invalidateContextProvider(p52, p53, false)
	end
	return bailoutOnAlreadyFinishedWork(p51, p52, p56)
end

local _ = function(p57) --[[ line: 1190 | named "pushHostRootContext" ]]
	-- upvalues: pushTopLevelContextObject (ref), pushHostContainer (ref)
	local stateNode = p57.stateNode
	
	if stateNode.pendingContext then
		pushTopLevelContextObject(p57, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
	elseif stateNode.context then
		pushTopLevelContextObject(p57, stateNode.context, false)
	end
	pushHostContainer(p57, stateNode.containerInfo)
end

local function updateHostRoot(p58, p59, p60) --[[ line: 1206 ]]
	-- upvalues: pushTopLevelContextObject (ref), pushHostContainer (ref), invariant (ref), cloneUpdateQueue (ref), processUpdateQueue (ref), resetHydrationState (ref), bailoutOnAlreadyFinishedWork (write), enterHydrationState (ref), supportsHydration (ref), setWorkInProgressVersion (ref), mountChildFibers (ref), placement (ref), hydrating (ref), reconcileChildFibers (ref)
	local stateNode = p59.stateNode
	
	if stateNode.pendingContext then
		pushTopLevelContextObject(p59, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
	elseif stateNode.context then
		pushTopLevelContextObject(p59, stateNode.context, false)
	end
	pushHostContainer(p59, stateNode.containerInfo)
	invariant(p58 ~= nil and p59.updateQueue ~= nil, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.")
	local pendingProps = p59.pendingProps
	local memoizedState = p59.memoizedState
	local var63 = if memoizedState ~= nil then memoizedState.element else nil
	cloneUpdateQueue(p58, p59)
	processUpdateQueue(p59, pendingProps, nil, p60)
	local element = p59.memoizedState.element
	
	if element == var63 then
		resetHydrationState()
		
		return bailoutOnAlreadyFinishedWork(p58, p59, p60)
	end
	local stateNode_1 = p59.stateNode
	
	if stateNode_1.hydrate and enterHydrationState(p59) then
		if supportsHydration then
			local mutableSourceEagerHydrationData = stateNode_1.mutableSourceEagerHydrationData
			
			if mutableSourceEagerHydrationData ~= nil then
				for i = 1, #mutableSourceEagerHydrationData, 2 do
					setWorkInProgressVersion(mutableSourceEagerHydrationData[i], mutableSourceEagerHydrationData[i + 1])
				end
			end
		end
		local var64 = mountChildFibers(p59, nil, element, p60)
		p59.child = var64
		local var65 = var64
		while var65 do
			var65.flags = bit32.bor(bit32.band(var65.flags, bit32.bnot(placement)), hydrating)
			var65 = var65.sibling
		end
	elseif p58 == nil then
		p59.child = mountChildFibers(p59, nil, element, p60)
	else
		p59.child = reconcileChildFibers(p59, p58.child, element, p60)
	end
	resetHydrationState()
	return p59.child
end

local function updateHostComponent(p61, p62, p63) --[[ line: 1283 ]]
	-- upvalues: pushHostContext (ref), tryToClaimNextHydratableInstance (ref), shouldSetTextContent (ref), contentReset (ref), performedWork (ref), ref (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	pushHostContext(p62)
	
	if p61 == nil then
		tryToClaimNextHydratableInstance(p62)
	end
	local type = p62.type
	local pendingProps = p62.pendingProps
	local var66 = if p61 ~= nil then p61.memoizedProps else nil
	local children = pendingProps.children
	
	if shouldSetTextContent(type, pendingProps) then
		children = nil
	elseif var66 ~= nil and shouldSetTextContent(type, var66) then
		p62.flags = bit32.bor(p62.flags, contentReset)
	end
	p62.flags = bit32.bor(p62.flags, performedWork)
	local ref_1 = p62.ref
	
	if p61 == nil and ref_1 ~= nil or p61 ~= nil and p61.ref ~= ref_1 then
		p62.flags = bit32.bor(p62.flags, ref)
	end
	if p61 == nil then
		p62.child = mountChildFibers(p62, nil, children, p63)
	else
		p62.child = reconcileChildFibers(p62, p61.child, children, p63)
	end
	return p62.child
end

local _ = function(p64, p65) --[[ line: 1324 | named "updateHostText" ]]
	-- upvalues: tryToClaimNextHydratableInstance (ref)
	if p64 == nil then
		tryToClaimNextHydratableInstance(p65)
	end
	return nil
end

local function mountLazyComponent(p66, p67, p68, p69, p70) --[[ line: 1333 ]]
	-- upvalues: placement (ref), resolveLazyComponentTag (ref), resolveDefaultProps (ref), functionComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), updateFunctionComponent (write), classComponent (ref), resolveClassForHotReloading (ref), updateClassComponent (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref), updateForwardRef (ref), memoComponent (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), updateMemoComponent (ref), REACT_LAZY_TYPE (ref), inspect (ref), invariant (ref)
	if p66 ~= nil then
		p66.alternate = nil
		p67.alternate = nil
		p67.flags = bit32.bor(p67.flags, placement)
	end
	local propTypes
	local pendingProps = p67.pendingProps
	local var67 = p68._init(p68._payload)
	p67.type = var67
	p67.tag = resolveLazyComponentTag(var67)
	local tag = p67.tag
	local var68 = resolveDefaultProps(var67, pendingProps)
	local _ = nil
	
	if tag == functionComponent then
		if dEV then
			validateFunctionComponentInDev(p67, var67)
			var67 = resolveFunctionForHotReloading(var67)
			p67.type = var67
		end
		return updateFunctionComponent(nil, p67, var67, var68, p70)
	elseif tag == classComponent then
		if dEV then
			var67 = resolveClassForHotReloading(var67)
			p67.type = var67
		end
		return updateClassComponent(nil, p67, var67, var68, p70)
	elseif tag == forwardRef then
		if dEV then
			var67 = resolveForwardRefForHotReloading(var67)
			p67.type = var67
		end
		return updateForwardRef(nil, p67, var67, var68, p70)
	elseif tag == memoComponent then
		if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p67.type ~= p67.elementType then
			propTypes = var67.propTypes
			local validateProps = var67.validateProps
			
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, var68, "prop", getComponentName(var67))
			end
		end
		return updateMemoComponent(nil, p67, var67, resolveDefaultProps(var67.type, var68), p69, p70)
	else
		propTypes = ""
		
		if dEV then
			if var67 ~= nil and type(var67) == "table" and var67["$$typeof"] == REACT_LAZY_TYPE then
				propTypes = " Did you wrap a component in React.lazy() more than once?"
			elseif type(var67) == "table" and var67["$$typeof"] == nil then
				propTypes = "\n" .. inspect(var67)
			end
		end
		invariant(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(var67), propTypes)
		
		return nil
	end
end

function mountIncompleteClassComponent(p71, p72, p73, p74, p75) --[[ line: 1464 ]]
	-- upvalues: placement (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), prepareToReadContext (ref), t_1 (ref), constructClassInstance (ref), mountClassInstance (ref)
	if p71 ~= nil then
		p71.alternate = nil
		p72.alternate = nil
		p72.flags = bit32.bor(p72.flags, placement)
	end
	local var69
	p72.tag = classComponent
	local _ = nil
	
	if isContextProvider(p73) then
		var69 = true
		pushContextProvider(p72)
	else
		var69 = false
	end
	prepareToReadContext(p72, p75, t_1.markWorkInProgressReceivedUpdate)
	constructClassInstance(p72, p73, p74)
	mountClassInstance(p72, p73, p74, p75)
	
	return finishClassComponent(nil, p72, p73, true, var69, p75)
end

local function mountIndeterminateComponent(a, b, p76, p77) --[[ line: 1516 ]]
	-- upvalues: placement (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), prepareToReadContext (ref), t_1 (ref), dEV (ref), getComponentName (ref), t_2 (ref), console (ref), strictMode (ref), unknownModule_1 (ref), setIsRendering (ref), reactCurrentOwner (ref), renderWithHooks (ref), performedWork (ref), disableModulePatternComponents (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), initializeUpdateQueue (ref), applyDerivedStateFromProps (ref), adoptClassInstance (ref), mountClassInstance (ref), functionComponent (ref), debugRenderPhaseSideEffectsForStrictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), mountChildFibers (ref)
	if a ~= nil then
		a.alternate = nil
		b.alternate = nil
		b.flags = bit32.bor(b.flags, placement)
	end
	local var71
	local pendingProps = b.pendingProps
	local var70 = if not disableLegacyContext then getMaskedContext(b, getUnmaskedContext(b, p76, false)) else nil
	prepareToReadContext(b, p77, t_1.markWorkInProgressReceivedUpdate)
	local _ = nil
	
	if dEV then
		if type(p76) == "table" and type(p76.render) == "function" then
			local var72 = getComponentName(p76) or "Unknown"
			
			if not t_2.didWarnAboutBadClass[var72] then
				console.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", var72, var72)
				t_2.didWarnAboutBadClass[var72] = true
			end
		end
		if bit32.band(b.mode, strictMode) ~= 0 then
			unknownModule_1.recordLegacyContextWarning(b)
		end
		setIsRendering(true)
		reactCurrentOwner.current = b
		var71 = renderWithHooks(nil, b, p76, pendingProps, var70, p77)
		setIsRendering(false)
	else
		var71 = renderWithHooks(nil, b, p76, pendingProps, var70, p77)
	end
	b.flags = bit32.bor(b.flags, performedWork)
	local var73 = type(var71)
	
	if dEV and var71 ~= nil and (var73 == "table" and type(var71.render) == "function") and var71["$$typeof"] == nil then
		local var74 = getComponentName(p76) or "Unknown"
		
		if not t_2.didWarnAboutModulePatternComponent[var74] then
			console.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", var74, var74)
			t_2.didWarnAboutModulePatternComponent[var74] = true
		end
	end
	if disableModulePatternComponents or var71 == nil or (var73 ~= "table" or type(var71.render) ~= "function") or var71["$$typeof"] ~= nil then
		b.tag = functionComponent
		
		if dEV then
			if disableLegacyContext and p76.contextTypes then
				console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", getComponentName(p76) or "Unknown")
			end
			if debugRenderPhaseSideEffectsForStrictMode and bit32.band(b.mode, strictMode) ~= 0 then
				disableLogs()
				local ok, status = xpcall(renderWithHooks, describeError, nil, b, p76, pendingProps, var70, p77)
				reenableLogs()
				
				if ok then
					var71 = status
				else
					error(status)
				end
			end
		end
		b.child = mountChildFibers(b, nil, var71, p77)
		
		if dEV then
			validateFunctionComponentInDev(b, p76)
		end
		return b.child
	elseif dEV then
		local var75 = getComponentName(p76) or "Unknown"
		
		if not t_2.didWarnAboutModulePatternComponent[var75] then
			console.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. var75, var75)
			t_2.didWarnAboutModulePatternComponent[var75] = true
		end
	end
	local var76
	b.tag = classComponent
	b.memoizedState = nil
	b.updateQueue = nil
	local _ = false
	
	if isContextProvider(p76) then
		var76 = true
		pushContextProvider(b)
	else
		var76 = false
	end
	b.memoizedState = var71.state
	initializeUpdateQueue(b)
	local var77 = if type(p76) ~= "function" then p76.getDerivedStateFromProps else nil
	
	if var77 ~= nil and type(var77) == "function" then
		applyDerivedStateFromProps(b, p76, var77, pendingProps)
	end
	adoptClassInstance(b, var71)
	mountClassInstance(b, p76, pendingProps, p77)
	
	return finishClassComponent(nil, b, p76, true, var76, p77)
end

function validateFunctionComponentInDev(p78, p79) --[[ line: 1733 ]]
	-- upvalues: dEV (ref), getCurrentFiberOwnerNameInDevOrNull (ref), t_2 (ref), console (ref), warnAboutDefaultPropsOnFunctionComponents (ref), getComponentName (ref)
	if dEV then
		if p78.ref ~= nil then
			local var78 = ""
			local var79 = getCurrentFiberOwnerNameInDevOrNull()
			
			if var79 then
				var78 ..= "\n\nCheck the render method of `" .. var79 .. "`."
			end
			local var80 = var79 or (p78._debugID or "")
			local debugSource = p78._debugSource
			
			if debugSource then
				var80 = debugSource.fileName .. ":" .. debugSource.lineNumber
			end
			if not t_2.didWarnAboutFunctionRefs[var80] then
				t_2.didWarnAboutFunctionRefs[var80] = true
				console.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", var78)
			end
		end
		if warnAboutDefaultPropsOnFunctionComponents and type(p79) ~= "function" and p79.defaultProps ~= nil then
			local var81 = getComponentName(p79) or "Unknown"
			
			if not t_2.didWarnAboutDefaultPropsOnFunctionComponent[var81] then
				console.error("%s: Support for defaultProps will be removed from function components in a future major release.", var81)
				t_2.didWarnAboutDefaultPropsOnFunctionComponent[var81] = true
			end
		end
		if type(p79) ~= "function" and p79.getDerivedStateFromProps ~= nil and type(p79.getDerivedStateFromProps) == "function" then
			local var82 = getComponentName(p79) or "Unknown"
			
			if not t_2.didWarnAboutGetDerivedStateOnFunctionComponent[var82] then
				console.error("%s: Function components do not support getDerivedStateFromProps.", var82)
				t_2.didWarnAboutGetDerivedStateOnFunctionComponent[var82] = true
			end
		end
		if type(p79) ~= "function" and p79.contextType ~= nil and type(p79.contextType) == "table" then
			local var83 = getComponentName(p79) or "Unknown"
			
			if not t_2.didWarnAboutContextTypeOnFunctionComponent[var83] then
				console.error("%s: Function components do not support contextType.", var83)
				t_2.didWarnAboutContextTypeOnFunctionComponent[var83] = true
			end
		end
	end
end

local t_3 = {
	dehydrated = nil,
	retryLane = reactFiberLaneModule.NoLane
}

local _ = function(p80) --[[ line: 1830 | named "mountSuspenseOffscreenState" ]]
	return { baseLanes = p80 }
end

local _ = function(p81, p82) --[[ line: 1836 | named "updateSuspenseOffscreenState" ]]
	-- upvalues: reactFiberLaneModule (ref)
	return {
		baseLanes = reactFiberLaneModule.mergeLanes(p81.baseLanes, p82)
	}
end

local _ = function(p83, p84, _, _) --[[ line: 1846 | named "shouldRemainOnFallback" ]]
	-- upvalues: hasSuspenseContext (ref), forceSuspenseFallback (ref)
	return (p84 == nil or p84.memoizedState ~= nil) and hasSuspenseContext(p83, forceSuspenseFallback)
end

local _ = function(p85, p86) --[[ line: 1870 | named "getRemainingWorkInPrimaryTree" ]]
	-- upvalues: reactFiberLaneModule (ref)
	return reactFiberLaneModule.removeLanes(p85.childLanes, p86)
end

local updateSuspensePrimaryChildren = nil
local mountDehydratedSuspenseComponent = nil
local mountSuspensePrimaryChildren = nil
local updateSuspenseFallbackChildren = nil
local updateDehydratedSuspenseComponent = nil

local function updateSuspenseComponent(p87, p88, p89) --[[ line: 1882 ]]
	-- upvalues: dEV (ref), t (ref), didCapture (ref), suspenseStackCursor (ref), noFlags (ref), hasSuspenseContext (ref), forceSuspenseFallback (ref), addSubtreeSuspenseContext (ref), invisibleParentSuspenseContext (ref), setDefaultShallowSuspenseContext (ref), pushSuspenseContext (ref), tryToClaimNextHydratableInstance (ref), enableSuspenseServerRenderer (ref), mountDehydratedSuspenseComponent (write), t_3 (ref), reactFiberLaneModule (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), mountSuspensePrimaryChildren (write), updateDehydratedSuspenseComponent (write), updateSuspenseFallbackChildren (write), updateSuspensePrimaryChildren (write)
	local pendingProps = p88.pendingProps
	
	if dEV then
		if not t.shouldSuspendRef then
			t.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend
		end
		if t.shouldSuspendRef(p88) then
			p88.flags = bit32.bor(p88.flags, didCapture)
		end
	end
	local current = suspenseStackCursor.current
	local var84 = false
	local var85 = bit32.band(p88.flags, didCapture) ~= noFlags
	
	if not var85 then
		if (p87 == nil or p87.memoizedState ~= nil) and hasSuspenseContext(current, forceSuspenseFallback) then
			var84 = true
			p88.flags = bit32.band(p88.flags, bit32.bnot(didCapture))
		elseif (p87 == nil or p87.memoizedState ~= nil) and (pendingProps.fallback ~= nil and pendingProps.unstable_avoidThisFallback ~= true) then
			current = addSubtreeSuspenseContext(current, invisibleParentSuspenseContext)
		end
		pushSuspenseContext(p88, setDefaultShallowSuspenseContext(current))
		
		if p87 == nil then
			if pendingProps.fallback ~= nil then
				tryToClaimNextHydratableInstance(p88)
				
				if enableSuspenseServerRenderer then
					local memoizedState = p88.memoizedState
					
					if memoizedState ~= nil then
						local dehydrated = memoizedState.dehydrated
						
						if dehydrated ~= nil then
							return mountDehydratedSuspenseComponent(p88, dehydrated, p89)
						end
					end
				end
			end
			local children = pendingProps.children
			local fallback = pendingProps.fallback
			
			if var84 then
				local var86 = mountSuspenseFallbackChildren(p88, children, fallback, p89)
				p88.child.memoizedState = { baseLanes = p89 }
				p88.memoizedState = t_3
				
				return var86
			elseif pendingProps.unstable_expectedLoadTime == nil or type(pendingProps.unstable_expectedLoadTime) ~= "number" then
				return mountSuspensePrimaryChildren(p88, children, p89)
			end
			local var87 = mountSuspenseFallbackChildren(p88, children, fallback, p89)
			p88.child.memoizedState = { baseLanes = p89 }
			p88.memoizedState = t_3
			p88.lanes = reactFiberLaneModule.SomeRetryLane
			
			if enableSchedulerTracing then
				markSpawnedWork(reactFiberLaneModule.SomeRetryLane)
			end
			return var87
		else
			local memoizedState = p87.memoizedState
			
			if memoizedState == nil then
				if not var84 then
					local var92 = updateSuspensePrimaryChildren(p87, p88, pendingProps.children, p89)
					p88.memoizedState = nil
					
					return var92
				end
				local var91 = updateSuspenseFallbackChildren(p87, p88, pendingProps.children, pendingProps.fallback, p89)
				local child = p88.child
				local memoizedState_1 = p87.child.memoizedState
				
				if memoizedState_1 == nil then
					child.memoizedState = { baseLanes = p89 }
				else
					child.memoizedState = {
						baseLanes = reactFiberLaneModule.mergeLanes(memoizedState_1.baseLanes, p89)
					}
				end
				child.childLanes = reactFiberLaneModule.removeLanes(p87.childLanes, p89)
				p88.memoizedState = t_3
				
				return var91
			elseif enableSuspenseServerRenderer then
				local dehydrated = memoizedState.dehydrated
				
				if dehydrated == nil then
					if var84 then
						local var89 = updateSuspenseFallbackChildren(p87, p88, pendingProps.children, pendingProps.fallback, p89)
						local child = p88.child
						local memoizedState_1 = p87.child.memoizedState
						
						if memoizedState_1 == nil then
							child.memoizedState = { baseLanes = p89 }
						else
							child.memoizedState = {
								baseLanes = reactFiberLaneModule.mergeLanes(memoizedState_1.baseLanes, p89)
							}
						end
						child.childLanes = reactFiberLaneModule.removeLanes(p87.childLanes, p89)
						p88.memoizedState = t_3
						
						return var89
					else
						local var90 = updateSuspensePrimaryChildren(p87, p88, pendingProps.children, p89)
						p88.memoizedState = nil
						
						return var90
					end
				elseif not var85 then
					return updateDehydratedSuspenseComponent(p87, p88, dehydrated, memoizedState, p89)
				elseif p88.memoizedState == nil then
					local var88 = mountSuspenseFallbackAfterRetryWithoutHydrating(p87, p88, pendingProps.children, pendingProps.fallback, p89)
					p88.child.memoizedState = { baseLanes = p89 }
					p88.memoizedState = t_3
					
					return var88
				end
				p88.child = p87.child
				p88.flags = bit32.bor(p88.flags, didCapture)
				
				return nil
			end
		end
	end
end

mountSuspensePrimaryChildren = function(p90, p91, p92) --[[ line: 2167 | named "mountSuspensePrimaryChildren" ]]
	-- upvalues: createFiberFromOffscreen (ref)
	local var93 = createFiberFromOffscreen({ mode = "visible", children = p91 }, p90.mode, p92, nil)
	var93.return_ = p90
	p90.child = var93
	
	return var93
end

function mountSuspenseFallbackChildren(p93, p94, p95, p96) --[[ line: 2180 ]]
	-- upvalues: blockingMode (ref), noMode (ref), reactFiberLaneModule (ref), enableProfilerTimer (ref), profileMode (ref), createFiberFromFragment (ref), createFiberFromOffscreen (ref)
	local var95, var96
	local mode = p93.mode
	local child = p93.child
	local t = { mode = "hidden", children = p94 }
	local _ = nil
	local _ = nil
	
	if bit32.band(mode, blockingMode) == noMode and child ~= nil then
		var95 = child
		var95.childLanes = reactFiberLaneModule.NoLanes
		var95.pendingProps = t
		
		if enableProfilerTimer and bit32.band(p93.mode, profileMode) ~= 0 then
			var95.actualDuration = 0
			var95.actualStartTime = -1
			var95.selfBaseDuration = 0
			var95.treeBaseDuration = 0
		end
		var96 = createFiberFromFragment(p95, mode, p96, nil)
	else
		var95 = createFiberFromOffscreen(t, mode, reactFiberLaneModule.NoLanes, nil)
		var96 = createFiberFromFragment(p95, mode, p96, nil)
	end
	var95.return_ = p93
	var96.return_ = p93
	var95.sibling = var96
	p93.child = var95
	
	return var96
end

local _ = function(p97, p98) --[[ line: 2230 | named "createWorkInProgressOffscreenFiber" ]]
	-- upvalues: createWorkInProgress (ref)
	return createWorkInProgress(p97, p98)
end

updateSuspensePrimaryChildren = function(p99, p100, p101, p102) --[[ line: 2239 | named "updateSuspensePrimaryChildren" ]]
	-- upvalues: createWorkInProgress (ref), blockingMode (ref), noMode (ref), deletion (ref)
	local child = p99.child
	local sibling = child.sibling
	local var97 = createWorkInProgress(child, { mode = "visible", children = p101 })
	
	if bit32.band(p100.mode, blockingMode) == noMode then
		var97.lanes = p102
	end
	var97.return_ = p100
	var97.sibling = nil
	
	if sibling ~= nil then
		local deletions = p100.deletions
		
		if deletions == nil then
			p100.deletions = { sibling }
			p100.flags = bit32.bor(p100.flags, deletion)
		else
			table.insert(deletions, sibling)
		end
	end
	p100.child = var97
	
	return var97
end

updateSuspenseFallbackChildren = function(p103, p104, p105, p106, p107) --[[ line: 2274 | named "updateSuspenseFallbackChildren" ]]
	-- upvalues: blockingMode (ref), noMode (ref), reactFiberLaneModule (ref), enableProfilerTimer (ref), profileMode (ref), createWorkInProgress (ref), staticMask (ref), createFiberFromFragment (ref), placement (ref)
	local var99
	local mode = p104.mode
	local child = p103.child
	local sibling = child.sibling
	local t = { mode = "hidden", children = p105 }
	local _ = nil
	
	if bit32.band(mode, blockingMode) == noMode and p104.child ~= child then
		var99 = p104.child
		var99.childLanes = reactFiberLaneModule.NoLanes
		var99.pendingProps = t
		
		if enableProfilerTimer and bit32.band(p104.mode, profileMode) ~= 0 then
			var99.actualDuration = 0
			var99.actualStartTime = -1
			var99.selfBaseDuration = child.selfBaseDuration
			var99.treeBaseDuration = child.treeBaseDuration
		end
		p104.deletions = nil
	else
		var99 = createWorkInProgress(child, t)
		var99.subtreeFlags = bit32.band(child.subtreeFlags, staticMask)
	end
	local var100
	local _ = nil
	
	if sibling == nil then
		var100 = createFiberFromFragment(p106, mode, p107, nil)
		var100.flags = bit32.bor(var100.flags, placement)
	else
		var100 = createWorkInProgress(sibling, p106)
	end
	var100.return_ = p104
	var99.return_ = p104
	var99.sibling = var100
	p104.child = var99
	
	return var100
end

local _ = function(p108, p109, p110) --[[ line: 2357 | named "retrySuspenseComponentWithoutHydrating" ]]
	-- upvalues: reconcileChildFibers (ref), mountSuspensePrimaryChildren (write), placement (ref)
	reconcileChildFibers(p109, p108.child, nil, p110)
	local var101 = mountSuspensePrimaryChildren(p109, p109.pendingProps.children, p110)
	var101.flags = bit32.bor(var101.flags, placement)
	p109.memoizedState = nil
	
	return var101
end

function mountSuspenseFallbackAfterRetryWithoutHydrating(p111, p112, p113, p114, p115) --[[ line: 2378 ]]
	-- upvalues: createFiberFromOffscreen (ref), reactFiberLaneModule (ref), createFiberFromFragment (ref), placement (ref), blockingMode (ref), noMode (ref), reconcileChildFibers (ref)
	local mode = p112.mode
	local var102 = createFiberFromOffscreen(p113, mode, reactFiberLaneModule.NoLanes, nil)
	local var103 = createFiberFromFragment(p114, mode, p115, nil)
	var103.flags = bit32.bor(var103.flags, placement)
	var102.return_ = p112
	var103.return_ = p112
	var102.sibling = var103
	p112.child = var102
	
	if bit32.band(p112.mode, blockingMode) ~= noMode then
		reconcileChildFibers(p112, p111.child, nil, p115)
	end
	return var103
end

mountDehydratedSuspenseComponent = function(p116, p117, _) --[[ line: 2408 | named "mountDehydratedSuspenseComponent" ]]
	-- upvalues: blockingMode (ref), noMode (ref), dEV (ref), console (ref), reactFiberLaneModule (ref), isSuspenseInstanceFallback (ref), enableSchedulerTracing (ref), markSpawnedWork (ref)
	if bit32.band(p116.mode, blockingMode) == noMode then
		if dEV then
			console.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
		end
		p116.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.SyncLane)
	elseif isSuspenseInstanceFallback(p117) then
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.DefaultHydrationLane)
		end
		p116.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.DefaultHydrationLane)
	else
		p116.lanes = reactFiberLaneModule.laneToLanes(reactFiberLaneModule.OffscreenLane)
		
		if enableSchedulerTracing then
			markSpawnedWork(reactFiberLaneModule.OffscreenLane)
		end
	end
	return nil
end

updateDehydratedSuspenseComponent = function(p118, p119, p120, p121, p122) --[[ line: 2455 | named "updateDehydratedSuspenseComponent" ]]
	-- upvalues: warnIfHydrating (ref), getExecutionContext (ref), retryAfterError (ref), noContext (ref), reconcileChildFibers (ref), mountSuspensePrimaryChildren (write), placement (ref), blockingMode (ref), noMode (ref), isSuspenseInstanceFallback (ref), reactFiberLaneModule (ref), var26 (write), getWorkInProgressRoot (ref), scheduleUpdateOnFiber (ref), renderDidSuspendDelayIfPossible (ref), isSuspenseInstancePending (ref), didCapture (ref), retryDehydratedSuspenseBoundary (ref), enableSchedulerTracing (ref), var22 (write), parent (ref), registerSuspenseInstanceRetry (ref), reenterHydrationStateFromDehydratedSuspenseInstance (ref), hydrating (ref)
	warnIfHydrating()
	
	if bit32.band(getExecutionContext(), retryAfterError) ~= noContext then
		reconcileChildFibers(p119, p118.child, nil, p122)
		local var104 = mountSuspensePrimaryChildren(p119, p119.pendingProps.children, p122)
		var104.flags = bit32.bor(var104.flags, placement)
		p119.memoizedState = nil
		
		return var104
	elseif bit32.band(p119.mode, blockingMode) == noMode then
		reconcileChildFibers(p119, p118.child, nil, p122)
		local var105 = mountSuspensePrimaryChildren(p119, p119.pendingProps.children, p122)
		var105.flags = bit32.bor(var105.flags, placement)
		p119.memoizedState = nil
		
		return var105
	elseif isSuspenseInstanceFallback(p120) then
		reconcileChildFibers(p119, p118.child, nil, p122)
		local var106 = mountSuspensePrimaryChildren(p119, p119.pendingProps.children, p122)
		var106.flags = bit32.bor(var106.flags, placement)
		p119.memoizedState = nil
		
		return var106
	elseif var26 or reactFiberLaneModule.includesSomeLane(p122, p118.childLanes) then
		local var107 = getWorkInProgressRoot()
		
		if var107 ~= nil then
			local bumpedLaneForHydration = reactFiberLaneModule.getBumpedLaneForHydration(var107, p122)
			
			if bumpedLaneForHydration ~= reactFiberLaneModule.NoLane and bumpedLaneForHydration ~= p121.retryLane then
				p121.retryLane = bumpedLaneForHydration
				scheduleUpdateOnFiber(p118, bumpedLaneForHydration, reactFiberLaneModule.NoTimestamp)
			end
		end
		renderDidSuspendDelayIfPossible()
		reconcileChildFibers(p119, p118.child, nil, p122)
		local var109 = mountSuspensePrimaryChildren(p119, p119.pendingProps.children, p122)
		var109.flags = bit32.bor(var109.flags, placement)
		p119.memoizedState = nil
		
		return var109
	elseif not isSuspenseInstancePending(p120) then
		reenterHydrationStateFromDehydratedSuspenseInstance(p119, p120)
		local var111 = mountSuspensePrimaryChildren(p119, p119.pendingProps.children, p122)
		var111.flags = bit32.bor(var111.flags, hydrating)
		
		return var111
	end
	p119.flags = bit32.bor(p119.flags, didCapture)
	p119.child = p118.child
	
	local var110 = function() --[[ line: 2551 ]]
		-- upvalues: retryDehydratedSuspenseBoundary (copy), p118 (ref)
		return retryDehydratedSuspenseBoundary(p118)
	end
	
	if enableSchedulerTracing then
		if var22 == nil then
			var22 = require(parent.Scheduler).tracing.unstable_wrap
		end
		var110 = var22(var110)
	end
	registerSuspenseInstanceRetry(p120, var110)
	
	return nil
end

function updatePortalComponent(p123, p124, p125) --[[ line: 2964 ]]
	-- upvalues: pushHostContainer (ref), reconcileChildFibers (ref), mountChildFibers (ref)
	pushHostContainer(p124, p124.stateNode.containerInfo)
	local pendingProps = p124.pendingProps
	
	if p123 == nil then
		p124.child = reconcileChildFibers(p124, nil, pendingProps, p125)
	elseif p123 == nil then
		p124.child = mountChildFibers(p124, nil, pendingProps, p125)
	else
		p124.child = reconcileChildFibers(p124, p123.child, pendingProps, p125)
	end
	return p124.child
end

local var44 = false

local function updateContextProvider(p126, p127, p128) --[[ line: 2987 ]]
	-- upvalues: dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), array (ref), object (ref), var44 (write), console (ref), checkPropTypes (ref), pushProvider (ref), calculateChangedBits (ref), hasContextChanged (ref), bailoutOnAlreadyFinishedWork (write), propagateContextChange (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local propTypes
	local context = p127.type._context
	local pendingProps = p127.pendingProps
	local memoizedProps = p127.memoizedProps
	local value = pendingProps.value
	
	if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
		if array.indexOf(object.keys(pendingProps), "value") < 1 and not var44 then
			var44 = true
			console.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
		end
		propTypes = p127.type.propTypes
		local validateProps = p127.type.validateProps
		
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, pendingProps, "prop", "Context.Provider")
		end
	end
	pushProvider(p127, value)
	
	if memoizedProps ~= nil then
		local var112 = calculateChangedBits(context, value, memoizedProps.value)
		
		if var112 == 0 then
			if memoizedProps.children == pendingProps.children and not hasContextChanged() then
				return bailoutOnAlreadyFinishedWork(p126, p127, p128)
			end
		else
			propagateContextChange(p127, context, var112, p128)
		end
	end
	propTypes = pendingProps.children
	
	if p126 == nil then
		p127.child = mountChildFibers(p127, nil, propTypes, p128)
	else
		p127.child = reconcileChildFibers(p127, p126.child, propTypes, p128)
	end
	return p127.child
end

local t_4 = {
	usingContextAsConsumer = false,
	usingLegacyConsumer = false
}

function updateContextConsumer(p129, p130, p131) --[[ line: 3055 ]]
	-- upvalues: dEV (ref), t_4 (ref), console (ref), cOMPATWARNINGS (ref), prepareToReadContext (ref), t_1 (ref), readContext (ref), reactCurrentOwner (ref), setIsRendering (ref), performedWork (ref), mountChildFibers (ref), reconcileChildFibers (ref)
	local type = p130.type
	
	if dEV then
		if type._context ~= nil then
			type = type._context
		elseif type ~= type.Consumer and not t_4.usingContextAsConsumer then
			t_4.usingContextAsConsumer = true
			console.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
		end
	end
	local render
	local pendingProps = p130.pendingProps
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
	local var114
	prepareToReadContext(p130, p131, t_1.markWorkInProgressReceivedUpdate)
	local var113 = readContext(type, pendingProps.unstable_observedBits)
	local _ = nil
	
	if dEV then
		reactCurrentOwner.current = p130
		setIsRendering(true)
		var114 = render(var113)
		setIsRendering(false)
	else
		var114 = render(var113)
	end
	p130.flags = bit32.bor(p130.flags, performedWork)
	
	if p129 == nil then
		p130.child = mountChildFibers(p130, nil, var114, p131)
	else
		p130.child = reconcileChildFibers(p130, p129.child, var114, p131)
	end
	return p130.child
end

function t_1.markWorkInProgressReceivedUpdate() --[[ line: 3165 ]]
	-- upvalues: var26 (write)
	var26 = true
end

bailoutOnAlreadyFinishedWork = function(p132, p133, p134) --[[ line: 3169 | named "bailoutOnAlreadyFinishedWork" ]]
	-- upvalues: enableProfilerTimer (ref), stopProfilerTimerIfRunning (ref), markSkippedUpdateLanes (ref), reactFiberLaneModule (ref), cloneChildFibers (ref)
	if p132 then
		p133.dependencies = p132.dependencies
	end
	if enableProfilerTimer then
		stopProfilerTimerIfRunning(p133)
	end
	markSkippedUpdateLanes(p133.lanes)
	
	if reactFiberLaneModule.includesSomeLane(p134, p133.childLanes) then
		cloneChildFibers(p132, p133)
		
		return p133.child
	end
	return nil
end

function remountFiber(p135, p136, p137) --[[ line: 3200 ]]
	-- upvalues: dEV (ref), deletion (ref), placement (ref)
	if not dEV then
		error("Did not expect this call in production. This is a bug in React. Please file an issue.")
		
		return
	end
	local _return = p136.return_
	
	if _return == nil then
		error("Cannot swap the root fiber.")
	end
	assert(_return ~= nil, "returnFiber was nil in remountFiber")
	p135.alternate = nil
	p136.alternate = nil
	p137.index = p136.index
	p137.sibling = p136.sibling
	p137.return_ = p136.return_
	p137.ref = p136.ref
	
	if p136 == _return.child then
		_return.child = p137
	else
		local child = _return.child
		
		if child == nil then
			error("Expected parent to have a child.")
		end
		assert(child ~= nil, "prevSibling was nil in remountFiber")
		while child.sibling ~= p136 do
			child = child.sibling
			
			if child == nil then
				error("Expected to find the previous sibling.")
			end
		end
		child.sibling = p137
	end
	local deletions = _return.deletions
	
	if deletions == nil then
		_return.deletions = { p135 }
		_return.flags = bit32.bor(_return.flags, deletion)
	else
		table.insert(deletions, p135)
	end
	p137.flags = bit32.bor(p137.flags, placement)
	
	return p137
end

function t_1.beginWork(p138, p139, p140) --[[ line: 3269 ]]
	-- upvalues: dEV (ref), createFiberFromTypeAndProps (ref), hasContextChanged (ref), var26 (write), reactFiberLaneModule (ref), hostRoot (ref), pushTopLevelContextObject (ref), pushHostContainer (ref), resetHydrationState (ref), hostComponent (ref), pushHostContext (ref), classComponent (ref), isContextProvider (ref), pushContextProvider (ref), hostPortal (ref), contextProvider (ref), pushProvider (ref), profiler (ref), enableProfilerTimer (ref), suspenseComponent (ref), enableSuspenseServerRenderer (ref), pushSuspenseContext (ref), setDefaultShallowSuspenseContext (ref), suspenseStackCursor (ref), didCapture (ref), updateSuspenseComponent (ref), bailoutOnAlreadyFinishedWork (write), suspenseListComponent (ref), offscreenComponent (ref), legacyHiddenComponent (ref), updateOffscreenComponent (ref), forceUpdateForLegacySuspense (ref), noFlags (ref), reactWorkTagsModule (ref), mountIndeterminateComponent (ref), lazyComponent (ref), mountLazyComponent (ref), functionComponent (ref), resolveDefaultProps (ref), updateFunctionComponent (write), updateClassComponent (ref), updateHostRoot (ref), updateHostComponent (ref), hostText (ref), tryToClaimNextHydratableInstance (ref), forwardRef (ref), updateForwardRef (ref), fragment (ref), mode (ref), updateContextProvider (ref), contextConsumer (ref), memoComponent (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), getComponentName (ref), updateMemoComponent (ref), simpleMemoComponent (ref), updateSimpleMemoComponent (write), incompleteClassComponent (ref), updateOffscreenComponent (ref), invariant (ref)
	local lanes = p139.lanes
	
	if dEV and p139._debugNeedsRemount and p138 ~= nil then
		return remountFiber(p138, p139, createFiberFromTypeAndProps(p139.type, p139.key, p139.pendingProps, p139._debugOwner or nil, p139.mode, p139.lanes))
	elseif p138 == nil then
		var26 = false
	elseif p138.memoizedProps == p139.pendingProps and not hasContextChanged() then
		local var115
		if dEV then
			var115 = p139.type ~= p138.type
			var115 = nil
		else
			var115 = false
		end
		if var115 then
			var26 = true
		elseif reactFiberLaneModule.includesSomeLane(p140, lanes) then
			var26 = bit32.band(p138.flags, forceUpdateForLegacySuspense) == noFlags
		else
			var26 = false
			
			if p139.tag == hostRoot then
				var115 = p139.stateNode
				
				if var115.pendingContext then
					pushTopLevelContextObject(p139, var115.pendingContext, var115.pendingContext ~= var115.context)
				elseif var115.context then
					pushTopLevelContextObject(p139, var115.context, false)
				end
				pushHostContainer(p139, var115.containerInfo)
				resetHydrationState()
			elseif p139.tag == hostComponent then
				pushHostContext(p139)
			elseif p139.tag == classComponent then
				if isContextProvider(p139.type) then
					pushContextProvider(p139)
				end
			elseif p139.tag == hostPortal then
				pushHostContainer(p139, p139.stateNode.containerInfo)
			elseif p139.tag == contextProvider then
				pushProvider(p139, p139.memoizedProps.value)
			elseif p139.tag == profiler then
				if enableProfilerTimer then
					var115 = p139.stateNode
					var115.effectDuration = 0
					var115.passiveEffectDuration = 0
				end
			elseif p139.tag == suspenseComponent then
				var115 = p139.memoizedState
				
				if var115 == nil then
					pushSuspenseContext(p139, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
				elseif enableSuspenseServerRenderer and var115.dehydrated ~= nil then
					pushSuspenseContext(p139, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
					p139.flags = bit32.bor(p139.flags, didCapture)
					
					return nil
				elseif reactFiberLaneModule.includesSomeLane(p140, p139.child.childLanes) then
					return updateSuspenseComponent(p138, p139, p140)
				end
				pushSuspenseContext(p139, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
				local var116 = bailoutOnAlreadyFinishedWork(p138, p139, p140)
				
				return if var116 == nil then nil else var116.sibling
			elseif p139.tag == suspenseListComponent then
				print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
				print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
				print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
				error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
			elseif p139.tag == offscreenComponent or p139.tag == legacyHiddenComponent then
				p139.lanes = reactFiberLaneModule.NoLanes
				
				return updateOffscreenComponent(p138, p139, p140)
			end
			return bailoutOnAlreadyFinishedWork(p138, p139, p140)
		end
	end
	p139.lanes = reactFiberLaneModule.NoLanes
	
	if p139.tag == reactWorkTagsModule.IndeterminateComponent then
		return mountIndeterminateComponent(p138, p139, p139.type, p140)
	elseif p139.tag == lazyComponent then
		return mountLazyComponent(p138, p139, p139.elementType, lanes, p140)
	elseif p139.tag == functionComponent then
		local type = p139.type
		local pendingProps = p139.pendingProps
		
		return updateFunctionComponent(p138, p139, type, if p139.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p140)
	elseif p139.tag == classComponent then
		local type = p139.type
		local pendingProps = p139.pendingProps
		
		return updateClassComponent(p138, p139, type, if p139.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p140)
	elseif p139.tag == hostRoot then
		return updateHostRoot(p138, p139, p140)
	elseif p139.tag == hostComponent then
		return updateHostComponent(p138, p139, p140)
	elseif p139.tag == hostText then
		if p138 == nil then
			tryToClaimNextHydratableInstance(p139)
		end
		return nil
	elseif p139.tag == suspenseComponent then
		return updateSuspenseComponent(p138, p139, p140)
	elseif p139.tag == hostPortal then
		return updatePortalComponent(p138, p139, p140)
	elseif p139.tag == forwardRef then
		local type = p139.type
		local pendingProps = p139.pendingProps
		
		return updateForwardRef(p138, p139, type, if p139.elementType ~= type then resolveDefaultProps(type, pendingProps) else pendingProps, p140)
	elseif p139.tag == fragment then
		return updateFragment(p138, p139, p140)
	elseif p139.tag == mode then
		return updateMode(p138, p139, p140)
	elseif p139.tag == profiler then
		return updateProfiler(p138, p139, p140)
	elseif p139.tag == contextProvider then
		return updateContextProvider(p138, p139, p140)
	elseif p139.tag == contextConsumer then
		return updateContextConsumer(p138, p139, p140)
	elseif p139.tag == memoComponent then
		local type = p139.type
		local var117 = resolveDefaultProps(type, p139.pendingProps)
		
		if (dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION) and p139.type ~= p139.elementType then
			local propTypes = nil
			local validateProps = nil
			
			if type(type) == "table" then
				propTypes = type.propTypes
				validateProps = type.validateProps
			end
			if propTypes or validateProps then
				checkPropTypes(propTypes, validateProps, var117, "prop", getComponentName(type))
			end
		end
		return updateMemoComponent(p138, p139, type, resolveDefaultProps(type.type, var117), lanes, p140)
	elseif p139.tag == simpleMemoComponent then
		return updateSimpleMemoComponent(p138, p139, p139.type, p139.pendingProps, lanes, p140)
	elseif p139.tag == incompleteClassComponent then
		local type = p139.type
		local pendingProps = p139.pendingProps
		
		return mountIncompleteClassComponent(p138, p139, type, if p139.elementType == type then pendingProps else resolveDefaultProps(type, pendingProps), p140)
	elseif p139.tag == offscreenComponent then
		return updateOffscreenComponent(p138, p139, p140)
	elseif p139.tag == legacyHiddenComponent then
		return updateOffscreenComponent(p138, p139, p140)
	end
	invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", tostring(p139.tag))
	
	return nil
end

return t_1