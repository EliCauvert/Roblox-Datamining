-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:37 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local set = require(parent.LuauPolyfill).Set
local dEV = reactGlobalsModule.__DEV__
local yOLO = reactGlobalsModule.__YOLO__
local t = { NoContext = 0, RetryAfterError = 64 }
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local schedulerModule = require(parent.Scheduler)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableDebugTracing = reactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = reactFeatureFlags.enableSchedulingProfiler
local skipUnmountedBoundaries = reactFeatureFlags.skipUnmountedBoundaries
local enableDoubleInvokingEffects = reactFeatureFlags.enableDoubleInvokingEffects
local deletedTreeCleanUpLevel = reactFeatureFlags.deletedTreeCleanUpLevel
local enableNewTreeCleanupPath = reactFeatureFlags.enableNewTreeCleanupPath
local sharedModule = require(parent.Shared)
local describeError = require(parent.Shared).describeError
local reactSharedInternals = sharedModule.ReactSharedInternals
local invariant = sharedModule.invariant
local unknownModule_1 = require(script.Parent["SchedulerWithReactIntegration.new"])
local scheduleCallback = unknownModule_1.scheduleCallback
local cancelCallback = unknownModule_1.cancelCallback
local getCurrentPriorityLevel = unknownModule_1.getCurrentPriorityLevel
local runWithPriority = unknownModule_1.runWithPriority
local shouldYield = unknownModule_1.shouldYield
local requestPaint = unknownModule_1.requestPaint
local now = unknownModule_1.now
local noPriority = unknownModule_1.NoPriority
local immediatePriority = unknownModule_1.ImmediatePriority
local userBlockingPriority = unknownModule_1.UserBlockingPriority
local normalPriority = unknownModule_1.NormalPriority
local flushSyncCallbackQueue = unknownModule_1.flushSyncCallbackQueue
local scheduleSyncCallback = unknownModule_1.scheduleSyncCallback
local debugTracingModule = require(script.Parent.DebugTracing)
local schedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local tracing = require(parent.Scheduler).tracing
local interactionsRef = tracing.__interactionsRef
local subscriberRef = tracing.__subscriberRef
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local unknownModule_2 = require(script.Parent["ReactFiber.new"])
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local legacyRoot = require(script.Parent.ReactRootTags).LegacyRoot
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local syncLane = reactFiberLaneModule.SyncLane
local syncBatchedLane = reactFiberLaneModule.SyncBatchedLane
local noTimestamp = reactFiberLaneModule.NoTimestamp
local findUpdateLane = reactFiberLaneModule.findUpdateLane
local findTransitionLane = reactFiberLaneModule.findTransitionLane
local findRetryLane = reactFiberLaneModule.findRetryLane
local includesSomeLane = reactFiberLaneModule.includesSomeLane
local isSubsetOfLanes = reactFiberLaneModule.isSubsetOfLanes
local mergeLanes = reactFiberLaneModule.mergeLanes
local removeLanes = reactFiberLaneModule.removeLanes
local pickArbitraryLane = reactFiberLaneModule.pickArbitraryLane
local hasDiscreteLanes = reactFiberLaneModule.hasDiscreteLanes
local includesNonIdleWork = reactFiberLaneModule.includesNonIdleWork
local includesOnlyRetries = reactFiberLaneModule.includesOnlyRetries
local includesOnlyTransitions = reactFiberLaneModule.includesOnlyTransitions
local getNextLanes = reactFiberLaneModule.getNextLanes
local returnNextLanesPriority = reactFiberLaneModule.returnNextLanesPriority
local setCurrentUpdateLanePriority = reactFiberLaneModule.setCurrentUpdateLanePriority
local getCurrentUpdateLanePriority = reactFiberLaneModule.getCurrentUpdateLanePriority
local markStarvedLanesAsExpired = reactFiberLaneModule.markStarvedLanesAsExpired
local getLanesToRetrySynchronouslyOnError = reactFiberLaneModule.getLanesToRetrySynchronouslyOnError
local markRootUpdated = reactFiberLaneModule.markRootUpdated
local markRootPinged = reactFiberLaneModule.markRootPinged
local markRootExpired = reactFiberLaneModule.markRootExpired
local markDiscreteUpdatesExpired = reactFiberLaneModule.markDiscreteUpdatesExpired
local markRootFinished = reactFiberLaneModule.markRootFinished
local schedulerPriorityToLanePriority = reactFiberLaneModule.schedulerPriorityToLanePriority
local lanePriorityToSchedulerPriority = reactFiberLaneModule.lanePriorityToSchedulerPriority
local reactFiberTransitionModule = require(script.Parent.ReactFiberTransition)
local unknownModule_3 = require(script.Parent["ReactFiberUnwindWork.new"])
local unwindWork = unknownModule_3.unwindWork
local unwindInterruptedWork = unknownModule_3.unwindInterruptedWork
local unknownModule_4 = require(script.Parent["ReactFiberThrow.new"])
local throwException = unknownModule_4.throwException
local createRootErrorUpdate = unknownModule_4.createRootErrorUpdate
local createClassErrorUpdate = unknownModule_4.createClassErrorUpdate
local unknownModule_5 = require(script.Parent["ReactFiberCommitWork.new"])
local commitBeforeMutationLifeCycles = unknownModule_5.commitBeforeMutationLifeCycles
local commitPlacement = unknownModule_5.commitPlacement
local commitWork = unknownModule_5.commitWork
local commitDeletion = unknownModule_5.commitDeletion
local commitPassiveUnmount = unknownModule_5.commitPassiveUnmount
local commitPassiveUnmountInsideDeletedTree = unknownModule_5.commitPassiveUnmountInsideDeletedTree
local commitPassiveMount = unknownModule_5.commitPassiveMount
local commitDetachRef = unknownModule_5.commitDetachRef
local invokeLayoutEffectMountInDEV = unknownModule_5.invokeLayoutEffectMountInDEV
local invokePassiveEffectMountInDEV = unknownModule_5.invokePassiveEffectMountInDEV
local invokeLayoutEffectUnmountInDEV = unknownModule_5.invokeLayoutEffectUnmountInDEV
local invokePassiveEffectUnmountInDEV = unknownModule_5.invokePassiveEffectUnmountInDEV
local recursivelyCommitLayoutEffects = unknownModule_5.recursivelyCommitLayoutEffects
local promiseModule = require(parent.Promise)
local enqueueUpdate = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate
local resetContextDependencies = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies
local robloxReactProfilingModule = require(script.Parent.RobloxReactProfiling)
local var20 = nil
local t_1 = {
	resetHooksAfterThrowRef = nil,
	ContextOnlyDispatcherRef = nil,
	getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil,
	originalBeginWorkRef = nil,
	completeWorkRef = nil
}

local var22 = function(p0, p1, p2) --[[ line: 246 ]]
	-- upvalues: t_1 (ref)
	if not t_1.originalBeginWorkRef then
		t_1.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork
	end
	return t_1.originalBeginWorkRef(p0, p1, p2)
end

local _ = function(p3, p4, p5) --[[ line: 258 ]]
	-- upvalues: t_1 (ref)
	if not t_1.completeWorkRef then
		t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
	end
	return t_1.completeWorkRef(p3, p4, p5)
end

local var23 = nil

local function _() --[[ line: 272 | named "initReactFiberHooks" ]]
	-- upvalues: var23 (write), t_1 (ref)
	var23 = require(script.Parent["ReactFiberHooks.new"])
	t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
	t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
	t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end

local _ = function() --[[ line: 281 ]]
	-- upvalues: t_1 (ref), var23 (write)
	if not t_1.resetHooksAfterThrowRef then
		var23 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.resetHooksAfterThrowRef()
end

local _ = function() --[[ line: 289 ]]
	-- upvalues: t_1 (ref), var23 (write)
	if not t_1.ContextOnlyDispatcherRef then
		var23 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.ContextOnlyDispatcherRef
end

local _ = function() --[[ line: 297 ]]
	-- upvalues: t_1 (ref), var23 (write)
	if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
		var23 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef()
end

local createCapturedValue = require(script.Parent.ReactCapturedValue).createCapturedValue
local push = unknownModule.push
local pop = unknownModule.pop
local createCursor = unknownModule.createCursor
local unknownModule_6 = require(script.Parent["ReactProfilerTimer.new"])
local getComponentName = require(parent.Shared).getComponentName
local unknownModule_7 = require(script.Parent["ReactStrictModeWarnings.new"])
local reactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local current = reactCurrentFiberModule.current
local resetCurrentFiber = reactCurrentFiberModule.resetCurrentFiber
local setCurrentFiber = reactCurrentFiberModule.setCurrentFiber
local reactErrorUtils = require(parent.Shared).ReactErrorUtils
local invokeGuardedCallback = reactErrorUtils.invokeGuardedCallback
local hasCaughtError = reactErrorUtils.hasCaughtError
local clearCaughtError = reactErrorUtils.clearCaughtError
local onCommitRoot = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitRoot
local onCommitRoot_1 = require(script.Parent.ReactTestSelectors).onCommitRoot
local enqueueTask = require(parent.Shared).enqueueTask
local doesFiberContain = require(script.Parent.ReactFiberTreeReflection).doesFiberContain
local reactCurrentDispatcher = reactSharedInternals.ReactCurrentDispatcher
local reactCurrentOwner = reactSharedInternals.ReactCurrentOwner
local isSomeRendererActing = reactSharedInternals.IsSomeRendererActing
local var27 = nil
local _ = nil
local t_2 = {}
local _ = {
	Incomplete = 0,
	FatalErrored = 1,
	Errored = 2,
	Suspended = 3,
	SuspendedWithDelay = 4,
	Completed = 5
}
local var29 = 0
local var30 = nil
local var31 = nil
local noLanes = reactFiberLaneModule.NoLanes
t.subtreeRenderLanes = reactFiberLaneModule.NoLanes
local var32 = createCursor(reactFiberLaneModule.NoLanes)
local var33 = 0
local var34 = nil
local noLanes_1 = reactFiberLaneModule.NoLanes
local reactFiberWorkInProgressModule = require(script.Parent.ReactFiberWorkInProgress)
local workInProgressRootSkippedLanes = reactFiberWorkInProgressModule.workInProgressRootSkippedLanes
local noLanes_2 = reactFiberLaneModule.NoLanes
local noLanes_3 = reactFiberLaneModule.NoLanes
local var36 = nil
local var37 = 0
local var38 = 1e999
local var39 = nil

local _ = function() --[[ line: 433 | named "resetRenderTimer" ]]
	-- upvalues: var38 (write), now (ref)
	var38 = now() + 500
end

function t.getRenderTargetTime() --[[ line: 437 ]]
	-- upvalues: var38 (write)
	return var38
end

local var40 = false
local var41 = nil
local var42 = nil
local var43 = false
local var44 = nil
local var45 = noPriority
local noLanes_4 = reactFiberLaneModule.NoLanes
local var46 = nil
local var47 = 0
local var48 = nil
local var49 = 0
local var50 = nil
local var51 = noTimestamp
local noLanes_5 = reactFiberLaneModule.NoLanes
local noLanes_6 = reactFiberLaneModule.NoLanes
local var52 = nil
local var53 = false

function t.getWorkInProgressRoot() --[[ line: 477 ]]
	-- upvalues: var30 (write)
	return var30
end

function t.requestEventTime() --[[ line: 481 ]]
	-- upvalues: var29 (write), now (ref), var51 (write), noTimestamp (ref)
	if bit32.band(var29, 48) ~= 0 then
		return now()
	elseif var51 == noTimestamp then
		var51 = now()
		
		return var51
	end
	return var51
end

function t.requestUpdateLane(p6) --[[ line: 503 ]]
	-- upvalues: reactTypeOfModeModule (ref), syncLane (ref), getCurrentPriorityLevel (ref), immediatePriority (ref), syncBatchedLane (ref), reactFeatureFlags (ref), var29 (write), noLanes (write), reactFiberLaneModule (ref), pickArbitraryLane (ref), noLanes_5 (write), noLanes_1 (write), reactFiberTransitionModule (ref), noLanes_6 (write), var36 (write), findTransitionLane (ref), userBlockingPriority (ref), findUpdateLane (ref), schedulerPriorityToLanePriority (ref), getCurrentUpdateLanePriority (ref), dEV (ref), console (ref)
	local mode = p6.mode
	
	if bit32.band(mode, reactTypeOfModeModule.BlockingMode) == reactTypeOfModeModule.NoMode then
		return syncLane
	elseif bit32.band(mode, reactTypeOfModeModule.ConcurrentMode) == reactTypeOfModeModule.NoMode then
		return if getCurrentPriorityLevel() == immediatePriority then syncLane else syncBatchedLane
	elseif not reactFeatureFlags.deferRenderPhaseUpdateToNextBatch and bit32.band(var29, 16) ~= 0 and noLanes ~= reactFiberLaneModule.NoLanes then
		return pickArbitraryLane(noLanes)
	elseif noLanes_5 == reactFiberLaneModule.NoLanes then
		noLanes_5 = noLanes_1
	end
	if reactFiberTransitionModule.requestCurrentTransition() ~= reactFiberTransitionModule.NoTransition then
		if noLanes_6 ~= reactFiberLaneModule.NoLanes then
			noLanes_6 = if var36 ~= nil then reactFiberLaneModule.NoLanes else var36.pendingLanes
		end
		return findTransitionLane(noLanes_5, noLanes_6)
	else
		local var68 = getCurrentPriorityLevel()
		local _ = nil
		
		if bit32.band(var29, 4) ~= 0 and var68 == userBlockingPriority then
			return findUpdateLane(reactFiberLaneModule.InputDiscreteLanePriority, noLanes_5)
		end
		local var69 = schedulerPriorityToLanePriority(var68)
		
		if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local var70 = getCurrentUpdateLanePriority()
			
			if var69 ~= var70 and var70 ~= reactFiberLaneModule.NoLanePriority and dEV then
				console.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(var69), tostring(var70))
			end
		end
		return findUpdateLane(var69, noLanes_5)
	end
end

function requestRetryLane(p7) --[[ line: 607 ]]
	-- upvalues: reactTypeOfModeModule (ref), syncLane (ref), getCurrentPriorityLevel (ref), immediatePriority (ref), syncBatchedLane (ref), noLanes_5 (write), reactFiberLaneModule (ref), noLanes_1 (write), findRetryLane (ref)
	local mode = p7.mode
	
	if bit32.band(mode, reactTypeOfModeModule.BlockingMode) == reactTypeOfModeModule.NoMode then
		return syncLane
	elseif bit32.band(mode, reactTypeOfModeModule.ConcurrentMode) == reactTypeOfModeModule.NoMode then
		return if getCurrentPriorityLevel() == immediatePriority then syncLane else syncBatchedLane
	elseif noLanes_5 == reactFiberLaneModule.NoLanes then
		noLanes_5 = noLanes_1
	end
	return findRetryLane(noLanes_5)
end

function t.scheduleUpdateOnFiber(p8, p9, p10) --[[ line: 629 ]]
	-- upvalues: t_2 (ref), markRootUpdated (ref), var30 (write), reactFeatureFlags (ref), var29 (write), noLanes_2 (write), mergeLanes (ref), var33 (write), noLanes (write), getCurrentPriorityLevel (ref), syncLane (ref), var20 (write), var38 (write), now (ref), flushSyncCallbackQueue (ref), userBlockingPriority (ref), immediatePriority (ref), var46 (write), set (ref), var36 (write)
	t_2.checkForNestedUpdates()
	local var71 = t_2.markUpdateLaneFromFiberToRoot(p8, p9)
	
	if var71 == nil then
		return nil
	end
	markRootUpdated(var71, p9, p10)
	
	if var71 == var30 then
		t_2.warnAboutRenderPhaseUpdatesInDEV(p8)
		
		if reactFeatureFlags.deferRenderPhaseUpdateToNextBatch or bit32.band(var29, 16) == 0 then
			noLanes_2 = mergeLanes(noLanes_2, p9)
		end
		if var33 == 4 then
			t_2.markRootSuspended(var71, noLanes)
		end
	end
	local var72 = getCurrentPriorityLevel()
	
	if p9 ~= syncLane then
		if bit32.band(var29, 4) ~= 0 and (var72 == userBlockingPriority or var72 == immediatePriority) then
			if var46 == nil then
				var46 = set.new({ var71 })
			else
				var46:add(var71)
			end
		end
		var20(var71, p10)
		t_2.schedulePendingInteractions(var71, p9)
	elseif bit32.band(var29, 8) == 0 or bit32.band(var29, 48) ~= 0 then
		var20(var71, p10)
		t_2.schedulePendingInteractions(var71, p9)
		
		if var29 == 0 then
			var38 = now() + 500
			flushSyncCallbackQueue()
		end
	else
		t_2.schedulePendingInteractions(var71, p9)
		t_2.performSyncWorkOnRoot(var71)
	end
	var36 = var71
	
	return var71
end

function t_2.markUpdateLaneFromFiberToRoot(p11, p12) --[[ line: 739 ]]
	-- upvalues: mergeLanes (ref), dEV (ref), reactFiberFlagsModule (ref), t_2 (ref), reactWorkTagsModule (ref)
	p11.lanes = mergeLanes(p11.lanes, p12)
	local alternate = p11.alternate
	
	if alternate ~= nil then
		alternate.lanes = mergeLanes(alternate.lanes, p12)
	end
	if dEV and alternate == nil and bit32.band(p11.flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Hydrating)) ~= reactFiberFlagsModule.NoFlags then
		t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p11)
	end
	local var73 = p11
	local _return = p11.return_
	while _return ~= nil do
		_return.childLanes = mergeLanes(_return.childLanes, p12)
		local alternate_1 = _return.alternate
		
		if alternate_1 ~= nil then
			alternate_1.childLanes = mergeLanes(alternate_1.childLanes, p12)
		elseif dEV and bit32.band(_return.flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Hydrating)) ~= reactFiberFlagsModule.NoFlags then
			t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p11)
		end
		var73 = _return
		_return = _return.return_
	end
	return if var73.tag == reactWorkTagsModule.HostRoot then var73.stateNode else nil
end

var20 = function(p13, p14) --[[ line: 794 ]]
	-- upvalues: markStarvedLanesAsExpired (ref), var30 (write), noLanes (write), reactFiberLaneModule (ref), getNextLanes (ref), returnNextLanesPriority (ref), cancelCallback (ref), scheduleSyncCallback (ref), robloxReactProfilingModule (ref), t_2 (ref), scheduleCallback (ref), immediatePriority (ref), lanePriorityToSchedulerPriority (ref)
	local callbackNode = p13.callbackNode
	markStarvedLanesAsExpired(p13, p14)
	local var74 = returnNextLanesPriority()
	
	if getNextLanes(p13, if p13 == var30 then noLanes else reactFiberLaneModule.NoLanes) == reactFiberLaneModule.NoLanes then
		if callbackNode ~= nil then
			cancelCallback(callbackNode)
			p13.callbackNode = nil
			p13.callbackPriority = reactFiberLaneModule.NoLanePriority
		end
		return
	elseif callbackNode ~= nil then
		if p13.callbackPriority == var74 then return end
		cancelCallback(callbackNode)
	end
	local var75 = if var74 == reactFiberLaneModule.SyncLanePriority then scheduleSyncCallback(function() --[[ line: 839 ]]
		-- upvalues: robloxReactProfilingModule (copy), p13 (ref), t_2 (copy)
		local var78 = t_2.performSyncWorkOnRoot(p13)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p13))
		
		return var78
	end) elseif var74 == reactFiberLaneModule.SyncBatchedLanePriority then scheduleCallback(immediatePriority, function() --[[ line: 847 ]]
		-- upvalues: robloxReactProfilingModule (copy), p13 (ref), t_2 (copy)
		local var77 = t_2.performSyncWorkOnRoot(p13)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p13))
		
		return var77
	end) else scheduleCallback(lanePriorityToSchedulerPriority(var74), function() --[[ line: 857 ]]
		-- upvalues: robloxReactProfilingModule (copy), p13 (ref), t_2 (copy)
		local var76 = t_2.performConcurrentWorkOnRoot(p13)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p13))
		
		return var76
	end)
	p13.callbackPriority = var74
	p13.callbackNode = var75
end

function t_2.performConcurrentWorkOnRoot(p15) --[[ line: 873 ]]
	-- upvalues: var51 (write), noTimestamp (ref), noLanes_5 (write), reactFiberLaneModule (ref), noLanes_6 (write), invariant (ref), var29 (write), t (ref), getNextLanes (ref), var30 (write), noLanes (write), t_2 (ref), includesSomeLane (ref), noLanes_1 (write), noLanes_2 (write), reactFiberHostConfigModule (ref), getLanesToRetrySynchronouslyOnError (ref), var34 (write), var20 (write), now (ref), robloxReactProfilingModule (ref)
	var51 = noTimestamp
	noLanes_5 = reactFiberLaneModule.NoLanes
	noLanes_6 = reactFiberLaneModule.NoLanes
	invariant(bit32.band(var29, 48) == 0, "Should not already be working.")
	local callbackNode = p15.callbackNode
	
	if t.flushPassiveEffects() and p15.callbackNode ~= callbackNode then
		return nil
	end
	local var79 = getNextLanes(p15, if p15 == var30 then noLanes else reactFiberLaneModule.NoLanes)
	
	if var79 == reactFiberLaneModule.NoLanes then
		return nil
	end
	local var80 = t_2.renderRootConcurrent(p15, var79)
	
	if includesSomeLane(noLanes_1, noLanes_2) then
		t_2.prepareFreshStack(p15, reactFiberLaneModule.NoLanes)
	elseif var80 ~= 0 then
		if var80 == 2 then
			var29 = bit32.bor(var29, 64)
			
			if p15.hydrate then
				p15.hydrate = false
				reactFiberHostConfigModule.clearContainer(p15.containerInfo)
			end
			var79 = getLanesToRetrySynchronouslyOnError(p15)
			
			if var79 ~= reactFiberLaneModule.NoLanes then
				var80 = t_2.renderRootSync(p15, var79)
			end
		end
		if var80 == 1 then
			local var81 = var34
			t_2.prepareFreshStack(p15, reactFiberLaneModule.NoLanes)
			t_2.markRootSuspended(p15, var79)
			var20(p15, now())
			error(var81)
		end
		p15.finishedWork = p15.current.alternate
		p15.finishedLanes = var79
		t_2.finishConcurrentRender(p15, var80, var79)
	end
	var20(p15, now())
	
	return if p15.callbackNode == callbackNode then function() --[[ line: 968 ]]
		-- upvalues: robloxReactProfilingModule (copy), p15 (ref), t_2 (copy)
		local var82 = t_2.performConcurrentWorkOnRoot(p15)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p15))
		
		return var82
	end else nil
end

local var54 = 0
local var55 = false

function shouldForceFlushFallbacksInDEV() --[[ line: 985 ]]
	-- upvalues: dEV (ref), var54 (write)
	return dEV and var54 > 0
end

function t_2.finishConcurrentRender(p16, p17, p18) --[[ line: 990 ]]
	-- upvalues: invariant (ref), t_2 (ref), includesOnlyRetries (ref), var37 (write), now (ref), getNextLanes (ref), reactFiberLaneModule (ref), isSubsetOfLanes (ref), t (ref), markRootPinged (ref), reactFiberHostConfigModule (ref), includesOnlyTransitions (ref)
	if p17 == 0 or p17 == 1 then
		invariant(false, "Root did not complete. This is a bug in React.")
		
		return
	elseif p17 == 2 then
		t_2.commitRoot(p16)
		
		return
	elseif p17 == 3 then
		t_2.markRootSuspended(p16, p18)
		
		if includesOnlyRetries(p18) and not shouldForceFlushFallbacksInDEV() then
			local var83 = var37 + 500 - now()
			
			if var83 > 10 then
				if getNextLanes(p16, reactFiberLaneModule.NoLanes) ~= reactFiberLaneModule.NoLanes then return end
				local suspendedLanes = p16.suspendedLanes
				
				if isSubsetOfLanes(suspendedLanes, p18) then
					p16.timeoutHandle = reactFiberHostConfigModule.scheduleTimeout(function() --[[ line: 1039 ]]
						-- upvalues: t_2 (copy), p16 (ref)
						return t_2.commitRoot(p16)
					end, var83)
					
					return
				end
				markRootPinged(p16, suspendedLanes, t.requestEventTime())
				
				return
			else
				t_2.commitRoot(p16)
				
				return
			end
		end
	elseif p17 == 4 then
		t_2.markRootSuspended(p16, p18)
		
		if includesOnlyTransitions(p18) then return end
		if not shouldForceFlushFallbacksInDEV() then
			local var84 = now() - reactFiberLaneModule.getMostRecentEventTime(p16, p18)
			local var85 = jnd(var84) - var84
			
			if var85 > 10 then
				p16.timeoutHandle = reactFiberHostConfigModule.scheduleTimeout(function() --[[ line: 1074 ]]
					-- upvalues: t_2 (copy), p16 (ref)
					return t_2.commitRoot(p16)
				end, var85)
				
				return
			end
		end
		t_2.commitRoot(p16)
		
		return
	elseif p17 == 5 then
		t_2.commitRoot(p16)
		
		return
	end
	invariant(false, "Unknown root exit status.")
end

function t_2.markRootSuspended(p19, p20) --[[ line: 1090 ]]
	-- upvalues: removeLanes (ref), noLanes_3 (write), noLanes_2 (write), reactFiberLaneModule (ref)
	reactFiberLaneModule.markRootSuspended(p19, removeLanes(removeLanes(p20, noLanes_3), noLanes_2))
end

function t_2.performSyncWorkOnRoot(p21) --[[ line: 1102 ]]
	-- upvalues: invariant (ref), var29 (write), t (ref), var30 (write), includesSomeLane (ref), noLanes (write), t_2 (ref), noLanes_1 (write), noLanes_2 (write), getNextLanes (ref), reactFiberLaneModule (ref), legacyRoot (ref), reactFiberHostConfigModule (ref), getLanesToRetrySynchronouslyOnError (ref), var34 (write), var20 (write), now (ref)
	local var86, var87
	invariant(bit32.band(var29, 48) == 0, "Should not already be working.")
	t.flushPassiveEffects()
	local _ = nil
	local _ = nil
	
	if p21 == var30 and includesSomeLane(p21.expiredLanes, noLanes) then
		var86 = noLanes
		var87 = t_2.renderRootSync(p21, var86)
		
		if includesSomeLane(noLanes_1, noLanes_2) then
			var86 = getNextLanes(p21, var86)
			var87 = t_2.renderRootSync(p21, var86)
		end
	else
		var86 = getNextLanes(p21, reactFiberLaneModule.NoLanes)
		var87 = t_2.renderRootSync(p21, var86)
	end
	if p21.tag ~= legacyRoot and var87 == 2 then
		var29 = bit32.bor(var29, 64)
		
		if p21.hydrate then
			p21.hydrate = false
			reactFiberHostConfigModule.clearContainer(p21.containerInfo)
		end
		var86 = getLanesToRetrySynchronouslyOnError(p21)
		
		if var86 ~= reactFiberLaneModule.NoLanes then
			var87 = t_2.renderRootSync(p21, var86)
		end
	end
	if var87 == 1 then
		local var88 = var34
		t_2.prepareFreshStack(p21, reactFiberLaneModule.NoLanes)
		t_2.markRootSuspended(p21, var86)
		var20(p21, now())
		error(var88)
	end
	p21.finishedWork = p21.current.alternate
	p21.finishedLanes = var86
	t_2.commitRoot(p21)
	var20(p21, now())
	
	return nil
end

function t.flushRoot(p22, p23) --[[ line: 1184 ]]
	-- upvalues: markRootExpired (ref), var20 (write), now (ref), var29 (write), var38 (write), flushSyncCallbackQueue (ref)
	markRootExpired(p22, p23)
	var20(p22, now())
	
	if bit32.band(var29, 48) == 0 then
		var38 = now() + 500
		flushSyncCallbackQueue()
	end
end

function t.getExecutionContext() --[[ line: 1196 ]]
	-- upvalues: var29 (write)
	return var29
end

function t.flushDiscreteUpdates() --[[ line: 1200 ]]
	-- upvalues: var29 (write), dEV (ref), console (ref), t_2 (ref), t (ref)
	if bit32.band(var29, 49) == 0 then
		t_2.flushPendingDiscreteUpdates()
		t.flushPassiveEffects()
		
		return
	elseif dEV and bit32.band(var29, 16) ~= 0 then
		console.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
	end
end

function t.deferredUpdates(p24) --[[ line: 1230 ]]
	-- upvalues: reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), yOLO (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), normalPriority (ref)
	if not reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return runWithPriority(normalPriority, p24)
	end
	local var90, var91
	local var89 = getCurrentUpdateLanePriority()
	local _ = nil
	local _ = nil
	
	if yOLO then
		var90 = true
		setCurrentUpdateLanePriority(reactFiberLaneModule.DefaultLanePriority)
		var91 = runWithPriority(normalPriority, p24)
	else
		setCurrentUpdateLanePriority(reactFiberLaneModule.DefaultLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, normalPriority, p24)
		var90 = ok
		var91 = status
	end
	setCurrentUpdateLanePriority(var89)
	
	if var90 then
		return var91
	end
	error(var91)
end

function t_2.flushPendingDiscreteUpdates() --[[ line: 1259 ]]
	-- upvalues: var46 (write), markDiscreteUpdatesExpired (ref), var20 (write), now (ref), flushSyncCallbackQueue (ref)
	if var46 ~= nil then
		local var92 = var46
		var46 = nil
		var92:forEach(function(p25) --[[ line: 1265 ]]
			-- upvalues: markDiscreteUpdatesExpired (copy), var20 (copy), now (copy)
			markDiscreteUpdatesExpired(p25)
			var20(p25, now())
		end)
	end
	flushSyncCallbackQueue()
end

function t.batchedUpdates(p26, p27) --[[ line: 1274 ]]
	-- upvalues: var29 (write), yOLO (ref), describeError (ref), var38 (write), now (ref), flushSyncCallbackQueue (ref)
	local var93, var94
	var29 = bit32.bor(var29, 1)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var93 = true
		var94 = p26(p27)
	else
		local ok, status = xpcall(p26, describeError, p27)
		var93 = ok
		var94 = status
	end
	var29 = var29
	
	if var29 == 0 then
		var38 = now() + 500
		flushSyncCallbackQueue()
	end
	if var93 then
		return var94
	end
	error(var94)
end

function t.batchedEventUpdates(p28, p29) --[[ line: 1302 ]]
	-- upvalues: var29 (write), yOLO (ref), describeError (ref), var38 (write), now (ref), flushSyncCallbackQueue (ref)
	local var95, var96
	var29 = bit32.bor(var29, 2)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var95 = true
		var96 = p28(p29)
	else
		local ok, status = xpcall(p28, describeError, p29)
		var95 = ok
		var96 = status
	end
	var29 = var29
	
	if var29 == 0 then
		var38 = now() + 500
		flushSyncCallbackQueue()
	end
	if var95 then
		return var96
	end
	error(var96)
end

function t.discreteUpdates(p30, p31, p32, p33, p34) --[[ line: 1330 ]]
	-- upvalues: var29 (write), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), userBlockingPriority (ref), var38 (write), now (ref), flushSyncCallbackQueue (ref)
	var29 = bit32.bor(var29, 4)
	
	if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local var97 = getCurrentUpdateLanePriority()
		setCurrentUpdateLanePriority(reactFiberLaneModule.InputDiscreteLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, userBlockingPriority, function() --[[ line: 1342 ]]
			-- upvalues: p30 (ref), p31 (ref), p32 (ref), p33 (ref), p34 (ref)
			return p30(p31, p32, p33, p34)
		end)
		setCurrentUpdateLanePriority(var97)
		var29 = var29
		
		if var29 == 0 then
			var38 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return status
		end
		error(status)
		
		return
	else
		local ok, status = xpcall(runWithPriority, describeError, userBlockingPriority, function() --[[ line: 1366 ]]
			-- upvalues: p30 (ref), p31 (ref), p32 (ref), p33 (ref), p34 (ref)
			return p30(p31, p32, p33, p34)
		end)
		var29 = var29
		
		if var29 == 0 then
			var38 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return status
		end
		error(status)
	end
end

function t.unbatchedUpdates(p35, p36) --[[ line: 1387 ]]
	-- upvalues: var29 (write), yOLO (ref), describeError (ref), var38 (write), now (ref), flushSyncCallbackQueue (ref)
	local var98, var99
	var29 = bit32.band(var29, 4294967294)
	var29 = bit32.bor(var29, 8)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var98 = true
		var99 = p35(p36)
	else
		local ok, status = xpcall(p35, describeError, p36)
		var98 = ok
		var99 = status
	end
	var29 = var29
	
	if var29 == 0 then
		var38 = now() + 500
		flushSyncCallbackQueue()
	end
	if var98 then
		return var99
	end
	error(var99)
end

function t.flushSync(p37, p38) --[[ line: 1415 ]]
	-- upvalues: var29 (write), dEV (ref), console (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), yOLO (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), flushSyncCallbackQueue (ref)
	if bit32.band(var29, 48) == 0 then
		var29 = bit32.bor(var29, 1)
		
		if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local var101, var102
			local var100 = getCurrentUpdateLanePriority()
			setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
			local _ = nil
			local _ = nil
			
			if yOLO then
				var101 = true
				setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
				var102 = if p37 then runWithPriority(immediatePriority, function() --[[ line: 1458 ]]
					-- upvalues: p37 (ref), p38 (ref)
					return p37(p38)
				end) else nil
			elseif p37 then
				local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function() --[[ line: 1445 ]]
					-- upvalues: p37 (ref), p38 (ref)
					return p37(p38)
				end)
				var101 = ok
				var102 = status
			else
				var101 = true
				var102 = nil
			end
			setCurrentUpdateLanePriority(var100)
			var29 = var29
			flushSyncCallbackQueue()
			
			if not var101 then
				error(var102)
			end
			return var102
		else
			local var103, var104
			local _ = nil
			local _ = nil
			
			if yOLO then
				var103 = true
				var104 = if p37 then runWithPriority(immediatePriority, function() --[[ line: 1500 ]]
					-- upvalues: p37 (ref), p38 (ref)
					return p37(p38)
				end) else nil
			elseif p37 then
				local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function() --[[ line: 1488 ]]
					-- upvalues: p37 (ref), p38 (ref)
					return p37(p38)
				end)
				var103 = ok
				var104 = status
			else
				var103 = true
				var104 = nil
			end
			var29 = var29
			flushSyncCallbackQueue()
			
			if not var103 then
				error(var104)
			end
			return var104
		end
	elseif dEV then
		console.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
	end
	return p37(p38)
end

function t.flushControlled(p39) --[[ line: 1521 ]]
	-- upvalues: var29 (write), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), var38 (write), now (ref), flushSyncCallbackQueue (ref)
	var29 = bit32.bor(var29, 1)
	
	if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local var105 = getCurrentUpdateLanePriority()
		setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, immediatePriority, p39)
		setCurrentUpdateLanePriority(var105)
		var29 = var29
		
		if var29 == 0 then
			var38 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return
		else
			error(status)
			
			return
		end
	else
		local ok, status = xpcall(runWithPriority, describeError, immediatePriority, p39)
		var29 = var29
		
		if var29 == 0 then
			var38 = now() + 500
			flushSyncCallbackQueue()
		end
		if not ok then
			error(status)
		end
	end
end

function t.pushRenderLanes(p40, p41) --[[ line: 1561 ]]
	-- upvalues: push (ref), var32 (ref), t (ref), mergeLanes (ref), noLanes_1 (write)
	push(var32, t.subtreeRenderLanes, p40)
	t.subtreeRenderLanes = mergeLanes(t.subtreeRenderLanes, p41)
	noLanes_1 = mergeLanes(noLanes_1, p41)
end

function t.popRenderLanes(p42) --[[ line: 1567 ]]
	-- upvalues: t (ref), var32 (ref), pop (ref)
	t.subtreeRenderLanes = var32.current
	pop(var32, p42)
end

function t_2.prepareFreshStack(p43, p44) --[[ line: 1572 ]]
	-- upvalues: reactFiberLaneModule (ref), reactFiberHostConfigModule (ref), var31 (write), unwindInterruptedWork (ref), var30 (write), unknownModule_2 (ref), noLanes (write), t (ref), noLanes_1 (write), var33 (write), var34 (write), workInProgressRootSkippedLanes (ref), noLanes_2 (write), noLanes_3 (write), reactFeatureFlags (ref), var50 (write), dEV (ref), unknownModule_7 (ref)
	p43.finishedWork = nil
	p43.finishedLanes = reactFiberLaneModule.NoLanes
	local timeoutHandle = p43.timeoutHandle
	
	if timeoutHandle ~= reactFiberHostConfigModule.noTimeout then
		p43.timeoutHandle = reactFiberHostConfigModule.noTimeout
		reactFiberHostConfigModule.cancelTimeout(timeoutHandle)
	end
	if var31 ~= nil then
		local _return = var31.return_
		while _return ~= nil do
			unwindInterruptedWork(_return)
			_return = _return.return_
		end
	end
	var30 = p43
	var31 = unknownModule_2.createWorkInProgress(p43.current, nil)
	noLanes = p44
	t.subtreeRenderLanes = p44
	noLanes_1 = p44
	var33 = 0
	var34 = nil
	workInProgressRootSkippedLanes(reactFiberLaneModule.NoLanes)
	noLanes_2 = reactFiberLaneModule.NoLanes
	noLanes_3 = reactFiberLaneModule.NoLanes
	
	if reactFeatureFlags.enableSchedulerTracing then
		var50 = nil
	end
	if dEV then
		unknownModule_7.discardPendingWarnings()
	end
end

function t_2.handleError(p45, p46) --[[ line: 1612 ]]
	-- upvalues: var31 (write), resetContextDependencies (ref), t_1 (ref), var23 (write), resetCurrentFiber (ref), reactCurrentOwner (ref), var33 (write), var34 (write), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), throwException (ref), noLanes (write), t (ref), t_2 (ref)
	while true do
		local var106 = var31
		local ok, status = pcall(function() --[[ line: 1616 ]]
			-- upvalues: resetContextDependencies (copy), t_1 (copy), var23 (copy), resetCurrentFiber (copy), reactCurrentOwner (copy), var106 (write), var33 (copy), var34 (copy), p46 (write), var31 (copy), reactFeatureFlags (copy), reactTypeOfModeModule (copy), unknownModule_6 (copy), throwException (copy), p45 (ref), noLanes (copy), t (copy), t_2 (copy)
			resetContextDependencies()
			
			if not t_1.resetHooksAfterThrowRef then
				var23 = require(script.Parent["ReactFiberHooks.new"])
				t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
				t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
				t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = t_1.resetHooksAfterThrowRef()
			resetCurrentFiber()
			reactCurrentOwner.current = nil
			
			if var106 == nil or var106.return_ == nil then
				var33 = 1
				var34 = p46
				var31 = nil
				
				return
			elseif reactFeatureFlags.enableProfilerTimer and bit32.band(var106.mode, reactTypeOfModeModule.ProfileMode) ~= 0 then
				unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var106, true)
			end
			throwException(p45, var106.return_, var106, p46, noLanes, t.onUncaughtError, t.renderDidError)
			t_2.completeUnitOfWork(var106)
		end)
		if not ok then
			p46 = status
			
			if var31 == var106 and var106 ~= nil then
				var31 = var106.return_
			else
				var106 = var31
			end
		end
	end
end

function t_2.pushDispatcher() --[[ line: 1691 ]]
	-- upvalues: reactCurrentDispatcher (ref), t_1 (ref), var23 (write)
	local current = reactCurrentDispatcher.current
	local var107 = reactCurrentDispatcher
	
	if not t_1.ContextOnlyDispatcherRef then
		var23 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	var107.current = t_1.ContextOnlyDispatcherRef
	
	if current ~= nil then
		return current
	elseif not t_1.ContextOnlyDispatcherRef then
		var23 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.ContextOnlyDispatcherRef
end

function t_2.popDispatcher(p47) --[[ line: 1708 ]]
	-- upvalues: reactCurrentDispatcher (ref)
	reactCurrentDispatcher.current = p47
end

function t_2.pushInteractions(p48) --[[ line: 1712 ]]
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		local current = interactionsRef.current
		interactionsRef.current = p48.memoizedInteractions
		
		return current
	end
	return nil
end

function t_2.popInteractions(p49) --[[ line: 1721 ]]
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		interactionsRef.current = p49
	end
end

function t.markCommitTimeOfFallback() --[[ line: 1727 ]]
	-- upvalues: var37 (write), now (ref)
	var37 = now()
end

function t.markSkippedUpdateLanes(p50) --[[ line: 1731 ]]
	-- upvalues: reactFiberWorkInProgressModule (ref)
	reactFiberWorkInProgressModule.markSkippedUpdateLanes(p50)
end

function t.renderDidSuspend() --[[ line: 1735 ]]
	-- upvalues: var33 (write)
	if var33 == 0 then
		var33 = 3
	end
end

function t.renderDidSuspendDelayIfPossible() --[[ line: 1741 ]]
	-- upvalues: var33 (write), var30 (write), includesNonIdleWork (ref), workInProgressRootSkippedLanes (ref), noLanes_2 (write), t_2 (ref), noLanes (write)
	if var33 == 0 or var33 == 3 then
		var33 = 4
	end
	if var30 ~= nil and (includesNonIdleWork(workInProgressRootSkippedLanes()) or includesNonIdleWork(noLanes_2)) then
		t_2.markRootSuspended(var30, noLanes)
	end
end

function t.renderDidError() --[[ line: 1769 ]]
	-- upvalues: var33 (write)
	if var33 ~= 5 then
		var33 = 2
	end
end

function t.renderHasNotSuspendedYet() --[[ line: 1777 ]]
	-- upvalues: var33 (write)
	return var33 == 0
end

function t_2.renderRootSync(p51, p52) --[[ line: 1783 ]]
	-- upvalues: var29 (write), t_2 (ref), var30 (write), noLanes (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), yOLO (ref), describeError (ref), resetContextDependencies (ref), reactFeatureFlags (ref), var31 (write), invariant (ref), reactFiberLaneModule (ref), var33 (write)
	var29 = bit32.bor(var29, 16)
	local var108 = t_2.pushDispatcher()
	
	if var30 ~= p51 or noLanes ~= p52 then
		t_2.prepareFreshStack(p51, p52)
		t_2.startWorkOnPendingInteractions(p51, p52)
	end
	local var109 = t_2.pushInteractions(p51)
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStarted(p52)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStarted(p52)
	end
	while true do
		local var110 = nil
		local var111 = nil
		if yOLO then
			var110 = true
			t_2.workLoopSync()
		else
			local ok, status = xpcall(t_2.workLoopSync, describeError)
			var110 = ok
			var111 = status
		end
		if var110 then break end
		t_2.handleError(p51, var111)
	end
	resetContextDependencies()
	
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var109)
	end
	var29 = var29
	t_2.popDispatcher(var108)
	
	if var31 ~= nil then
		invariant(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
	end
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStopped()
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStopped()
	end
	var30 = nil
	noLanes = reactFiberLaneModule.NoLanes
	
	return var33
end

function t_2.workLoopSync() --[[ line: 1859 ]]
	-- upvalues: var31 (write), t_2 (ref)
	while var31 ~= nil do
		t_2.performUnitOfWork(var31)
	end
end

function t_2.renderRootConcurrent(p53, p54) --[[ line: 1866 ]]
	-- upvalues: var29 (write), t_2 (ref), var30 (write), noLanes (write), var38 (write), now (ref), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), yOLO (ref), describeError (ref), resetContextDependencies (ref), reactFeatureFlags (ref), var31 (write), reactFiberLaneModule (ref), var33 (write)
	var29 = bit32.bor(var29, 16)
	local var112 = t_2.pushDispatcher()
	
	if var30 ~= p53 or noLanes ~= p54 then
		var38 = now() + 500
		t_2.prepareFreshStack(p53, p54)
		t_2.startWorkOnPendingInteractions(p53, p54)
	end
	local var113 = t_2.pushInteractions(p53)
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStarted(p54)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStarted(p54)
	end
	local var115
	while true do
		local _ = nil
		local var114 = nil
		if yOLO then
			var115 = true
			var114 = "break"
			t_2.workLoopConcurrent()
		else
			local ok, status = xpcall(t_2.workLoopConcurrent, describeError)
			var115 = ok
			var114 = if var115 then "break" else status
		end
		if var114 == "break" then break end
		if not var115 then
			t_2.handleError(p53, var114)
		end
	end
	resetContextDependencies()
	
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var113)
	end
	t_2.popDispatcher(var112)
	var29 = var29
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStopped()
	end
	if var31 == nil then
		if enableSchedulingProfiler then
			schedulingProfilerModule.markRenderStopped()
		end
		var30 = nil
		noLanes = reactFiberLaneModule.NoLanes
		
		return var33
	elseif enableSchedulingProfiler then
		schedulingProfilerModule.markRenderYielded()
	end
	return 0
end

function t_2.workLoopConcurrent() --[[ line: 1950 ]]
	-- upvalues: var31 (write), shouldYield (ref), t_2 (ref)
	while var31 ~= nil and not shouldYield() do
		t_2.performUnitOfWork(var31)
	end
end

function t_2.performUnitOfWork(p55) --[[ line: 1957 ]]
	-- upvalues: robloxReactProfilingModule (ref), setCurrentFiber (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), t_2 (ref), t (ref), resetCurrentFiber (ref), var31 (write), reactCurrentOwner (ref)
	local var117
	local var116 = robloxReactProfilingModule.profileUnitOfWorkBefore(p55)
	local alternate = p55.alternate
	setCurrentFiber(p55)
	local _ = nil
	
	if reactFeatureFlags.enableProfilerTimer and bit32.band(p55.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
		unknownModule_6.startProfilerTimer(p55)
		var117 = t_2.beginWork(alternate, p55, t.subtreeRenderLanes)
		unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(p55, true)
	else
		var117 = t_2.beginWork(alternate, p55, t.subtreeRenderLanes)
	end
	resetCurrentFiber()
	p55.memoizedProps = p55.pendingProps
	
	if var117 == nil then
		t_2.completeUnitOfWork(p55)
	else
		var31 = var117
	end
	reactCurrentOwner.current = nil
	robloxReactProfilingModule.profileUnitOfWorkAfter(var116)
end

function t_2.completeUnitOfWork(p56) --[[ line: 1995 ]]
	-- upvalues: reactFiberFlagsModule (ref), setCurrentFiber (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), t (ref), t_1 (ref), unknownModule_6 (ref), resetCurrentFiber (ref), var31 (write), unwindWork (ref), var33 (write)
	local sibling
	local var118 = p56
	repeat
		local alternate = var118.alternate
		local _return = var118.return_
		if bit32.band(var118.flags, reactFiberFlagsModule.Incomplete) ~= reactFiberFlagsModule.NoFlags then
			sibling = unwindWork(var118, t.subtreeRenderLanes)
			
			if sibling == nil then
				if reactFeatureFlags.enableProfilerTimer and bit32.band(var118.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
					unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var118, false)
					local actualDuration = var118.actualDuration or 0
					local child = var118.child
					while child ~= nil do
						actualDuration += child.actualDuration or 0
						child = child.sibling
					end
					var118.actualDuration = actualDuration
				end
				if _return ~= nil then
					_return.flags = bit32.bor(_return.flags, reactFiberFlagsModule.Incomplete)
					_return.subtreeFlags = reactFiberFlagsModule.NoFlags
					_return.deletions = nil
				end
				sibling = var118.sibling
				
				if sibling == nil then
					var118 = _return
					var31 = var118
					continue
				end
				var31 = sibling
				
				return
			end
			sibling.flags = bit32.band(sibling.flags, reactFiberFlagsModule.HostEffectMask)
			var31 = sibling
			
			return
		end
		setCurrentFiber(var118)
		sibling = nil
		
		if reactFeatureFlags.enableProfilerTimer and bit32.band(var118.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			unknownModule_6.startProfilerTimer(var118)
			local subtreeRenderLanes = t.subtreeRenderLanes
			
			if not t_1.completeWorkRef then
				t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
			end
			sibling = t_1.completeWorkRef(alternate, var118, subtreeRenderLanes)
			unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var118, false)
		else
			local var119 = var118
			local subtreeRenderLanes = t.subtreeRenderLanes
			
			if not t_1.completeWorkRef then
				t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
			end
			sibling = t_1.completeWorkRef(alternate, var119, subtreeRenderLanes)
		end
		resetCurrentFiber()
		
		if sibling == nil then
		end
		var31 = sibling
		
		return
	until var118 == nil
	if var33 == 0 then
		var33 = 5
	end
end

function t_2.commitRoot(p57) --[[ line: 2103 ]]
	-- upvalues: getCurrentPriorityLevel (ref), runWithPriority (ref), immediatePriority (ref), robloxReactProfilingModule (ref), t_2 (ref)
	local var121 = getCurrentPriorityLevel()
	runWithPriority(immediatePriority, function() --[[ line: 2105 ]]
		-- upvalues: robloxReactProfilingModule (copy), t_2 (copy), p57 (ref), var121 (ref)
		robloxReactProfilingModule.profileCommitBefore()
		local var122 = t_2.commitRootImpl(p57, var121)
		robloxReactProfilingModule.profileCommitAfter()
		
		return var122
	end)
	
	return nil
end

function t_2.commitRootImpl(p58, p59) --[[ line: 2116 ]]
	-- upvalues: t (ref), var44 (write), invariant (ref), var29 (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), reactFiberLaneModule (ref), mergeLanes (ref), markRootFinished (ref), var46 (write), hasDiscreteLanes (ref), var30 (write), var31 (write), noLanes (write), reactFiberFlagsModule (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), t_2 (ref), reactCurrentOwner (ref), var52 (write), reactFiberHostConfigModule (ref), var53 (write), unknownModule_6 (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), recursivelyCommitLayoutEffects (ref), hasCaughtError (ref), clearCaughtError (ref), var27 (write), resetCurrentFiber (ref), yOLO (ref), describeError (ref), var43 (write), scheduleCallback (ref), normalPriority (ref), requestPaint (ref), noLanes_4 (write), var45 (write), var50 (write), var42 (write), enableDoubleInvokingEffects (ref), syncLane (ref), var48 (write), var47 (write), onCommitRoot (ref), onCommitRoot_1 (ref), var20 (write), now (ref), var40 (write), var41 (write), flushSyncCallbackQueue (ref)
	repeat
		t.flushPassiveEffects()
	until var44 == nil
	flushRenderPhaseStrictModeWarningsInDEV()
	invariant(bit32.band(var29, 48) == 0, "Should not already be working.")
	local finishedWork = p58.finishedWork
	local finishedLanes = p58.finishedLanes
	
	if dEV and enableDebugTracing then
		debugTracingModule.logCommitStarted(finishedLanes)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markCommitStarted(finishedLanes)
	end
	if finishedWork == nil then
		if dEV and enableDebugTracing then
			debugTracingModule.logCommitStopped()
		end
		if enableSchedulingProfiler then
			schedulingProfilerModule.markCommitStopped(p58)
		end
		return nil
	else
		p58.finishedWork = nil
		p58.finishedLanes = reactFiberLaneModule.NoLanes
		invariant(finishedWork ~= p58.current, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.")
		p58.callbackNode = nil
		local var123 = mergeLanes(finishedWork.lanes, finishedWork.childLanes)
		markRootFinished(p58, var123)
		
		if var46 ~= nil and not hasDiscreteLanes(var123) and var46:has(p58) then
			var46:delete(p58)
		end
		if p58 == var30 then
			var30 = nil
			var31 = nil
			noLanes = reactFiberLaneModule.NoLanes
		end
		if bit32.band(finishedWork.subtreeFlags, bit32.bor(reactFiberFlagsModule.BeforeMutationMask, reactFiberFlagsModule.MutationMask, reactFiberFlagsModule.LayoutMask, reactFiberFlagsModule.PassiveMask)) ~= reactFiberFlagsModule.NoFlags or bit32.band(finishedWork.flags, bit32.bor(reactFiberFlagsModule.BeforeMutationMask, reactFiberFlagsModule.MutationMask, reactFiberFlagsModule.LayoutMask, reactFiberFlagsModule.PassiveMask)) ~= reactFiberFlagsModule.NoFlags then
			local var124 = nil
			
			if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
				var124 = getCurrentUpdateLanePriority()
				setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
			end
			local var125 = var29
			var29 = bit32.bor(var29, 32)
			local var126 = t_2.pushInteractions(p58)
			reactCurrentOwner.current = nil
			var52 = reactFiberHostConfigModule.prepareForCommit(p58.containerInfo)
			var53 = false
			t_2.commitBeforeMutationEffects(finishedWork)
			var52 = nil
			
			if reactFeatureFlags.enableProfilerTimer then
				unknownModule_6.recordCommitTime()
			end
			t_2.commitMutationEffects(finishedWork, p58, p59)
			reactFiberHostConfigModule.resetAfterCommit(p58.containerInfo)
			p58.current = finishedWork
			
			if dEV and enableDebugTracing then
				debugTracingModule.logLayoutEffectsStarted(finishedLanes)
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markLayoutEffectsStarted(finishedLanes)
			end
			if dEV then
				setCurrentFiber(finishedWork)
				invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, finishedWork, p58, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
				
				if hasCaughtError() then
					var27(finishedWork, finishedWork, clearCaughtError())
				end
				resetCurrentFiber()
			else
				local var128
				local _ = nil
				local var127 = nil
				
				if yOLO then
					var128 = true
					recursivelyCommitLayoutEffects(finishedWork, p58, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
				else
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, finishedWork, p58, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
					var128 = ok
					var127 = status
				end
				if not var128 then
					var27(finishedWork, finishedWork, var127)
				end
			end
			if dEV and enableDebugTracing then
				debugTracingModule.logLayoutEffectsStopped()
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markLayoutEffectsStopped()
			end
			if (bit32.band(finishedWork.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags or bit32.band(finishedWork.flags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags) and not var43 then
				var43 = true
				scheduleCallback(normalPriority, function() --[[ line: 2350 ]]
					-- upvalues: t (copy)
					t.flushPassiveEffects()
					
					return nil
				end)
			end
			requestPaint()
			
			if reactFeatureFlags.enableSchedulerTracing then
				t_2.popInteractions(var126)
			end
			var29 = var125
			
			if reactFeatureFlags.decoupleUpdatePriorityFromScheduler and var124 ~= nil then
				setCurrentUpdateLanePriority(var124)
			end
		else
			p58.current = finishedWork
			
			if reactFeatureFlags.enableProfilerTimer then
				unknownModule_6.recordCommitTime()
			end
		end
		local var129 = var43
		
		if var43 then
			var43 = false
			var44 = p58
			noLanes_4 = finishedLanes
			var45 = p59
		end
		local pendingLanes = p58.pendingLanes
		
		if pendingLanes == reactFiberLaneModule.NoLanes then
			var42 = nil
		elseif reactFeatureFlags.enableSchedulerTracing then
			if var50 ~= nil then
				local var130 = var50
				var50 = nil
				
				for i = 1, #var130 do
					scheduleInteractions(p58, var130[i], p58.memoizedInteractions)
				end
			end
			t_2.schedulePendingInteractions(p58, pendingLanes)
		end
		if dEV and enableDoubleInvokingEffects and not var129 then
			commitDoubleInvokeEffectsInDEV(p58.current, false)
		end
		if reactFeatureFlags.enableSchedulerTracing and not var129 then
			t_2.finishPendingInteractions(p58, finishedLanes)
		end
		if pendingLanes ~= syncLane then
			var47 = 0
		elseif p58 == var48 then
			var47 += 1
		else
			var47 = 0
			var48 = p58
		end
		onCommitRoot(finishedWork.stateNode, p59)
		
		if dEV then
			onCommitRoot_1()
		end
		var20(p58, now())
		
		if var40 then
			var40 = false
			local var131 = var41
			var41 = nil
			error(var131)
		end
		if bit32.band(var29, 8) == 0 then
			flushSyncCallbackQueue()
			
			if dEV and enableDebugTracing then
				debugTracingModule.logCommitStopped()
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markCommitStopped(p58)
			end
			return nil
		elseif dEV and enableDebugTracing then
			debugTracingModule.logCommitStopped()
		end
		if enableSchedulingProfiler then
			schedulingProfilerModule.markCommitStopped(p58)
		end
		return nil
	end
end

function t_2.commitBeforeMutationEffects(p60) --[[ line: 2503 ]]
	-- upvalues: t_2 (ref), reactFiberFlagsModule (ref), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref), t (ref), resetCurrentFiber (ref), yOLO (ref), describeError (ref)
	local var132 = p60
	while var132 ~= nil do
		if var132.deletions ~= nil then
			t_2.commitBeforeMutationEffectsDeletions(var132.deletions)
		end
		if var132.child ~= nil and bit32.band(var132.subtreeFlags, reactFiberFlagsModule.BeforeMutationMask) ~= reactFiberFlagsModule.NoFlags then
			t_2.commitBeforeMutationEffects(var132.child)
		end
		if dEV then
			setCurrentFiber(var132)
			invokeGuardedCallback(nil, t_2.commitBeforeMutationEffectsImpl, nil, var132)
			
			if hasCaughtError() then
				t.captureCommitPhaseError(var132, var132.return_, clearCaughtError())
			end
			resetCurrentFiber()
		else
			local var134
			local _ = nil
			local var133 = nil
			
			if yOLO then
				var134 = true
				t_2.commitBeforeMutationEffectsImpl(var132)
			else
				local ok, status = xpcall(t_2.commitBeforeMutationEffectsImpl, describeError, var132)
				var134 = ok
				var133 = status
			end
			if not var134 then
				t.captureCommitPhaseError(var132, var132.return_, var133)
			end
		end
		var132 = var132.sibling
	end
end

function t_2.commitBeforeMutationEffectsImpl(p61) --[[ line: 2546 ]]
	-- upvalues: var53 (write), var52 (write), reactWorkTagsModule (ref), unknownModule_5 (ref), doesFiberContain (ref), reactFiberHostConfigModule (ref), reactFiberFlagsModule (ref), setCurrentFiber (ref), commitBeforeMutationLifeCycles (ref), resetCurrentFiber (ref), var43 (write), scheduleCallback (ref), normalPriority (ref), t (ref)
	local alternate = p61.alternate
	local flags = p61.flags
	
	if not var53 and var52 ~= nil and (p61.tag == reactWorkTagsModule.SuspenseComponent and unknownModule_5.isSuspenseBoundaryBeingHidden(alternate, p61)) and doesFiberContain(p61, var52) then
		var53 = true
		reactFiberHostConfigModule.beforeActiveInstanceBlur()
	end
	if bit32.band(flags, reactFiberFlagsModule.Snapshot) ~= reactFiberFlagsModule.NoFlags then
		setCurrentFiber(p61)
		commitBeforeMutationLifeCycles(alternate, p61)
		resetCurrentFiber()
	end
	if bit32.band(flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags and not var43 then
		var43 = true
		scheduleCallback(normalPriority, function() --[[ line: 2574 ]]
			-- upvalues: t (copy)
			t.flushPassiveEffects()
			
			return nil
		end)
	end
end

function t_2.commitBeforeMutationEffectsDeletions(p62) --[[ line: 2582 ]]
	-- upvalues: doesFiberContain (ref), var52 (write), var53 (write), reactFiberHostConfigModule (ref)
	for i = 1, #p62 do
		if doesFiberContain(p62[i], var52) then
			var53 = true
			reactFiberHostConfigModule.beforeActiveInstanceBlur()
		end
	end
end

function t_2.commitMutationEffects(p63, p64, p65) --[[ line: 2597 ]]
	-- upvalues: commitDeletion (ref), describeError (ref), t (ref), reactFiberFlagsModule (ref), t_2 (ref), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref), resetCurrentFiber (ref), yOLO (ref)
	local var135 = p63
	while var135 ~= nil do
		local deletions = var135.deletions
		
		if deletions ~= nil then
			for status, v in deletions do
				local ok, status = xpcall(commitDeletion, describeError, p64, v, var135, p65)
				
				if not ok then
					t.captureCommitPhaseError(v, var135, status)
				end
			end
		end
		if var135.child ~= nil and bit32.band(var135.subtreeFlags, reactFiberFlagsModule.MutationMask) ~= reactFiberFlagsModule.NoFlags then
			t_2.commitMutationEffects(var135.child, p64, p65)
		end
		if dEV then
			setCurrentFiber(var135)
			invokeGuardedCallback(nil, t_2.commitMutationEffectsImpl, nil, var135, p64, p65)
			
			if hasCaughtError() then
				t.captureCommitPhaseError(var135, var135.return_, clearCaughtError())
			end
			resetCurrentFiber()
		else
			local var137
			local _ = nil
			local var136 = nil
			
			if yOLO then
				var137 = true
				t_2.commitMutationEffectsImpl(var135, p64, p65)
			else
				local ok, status = xpcall(t_2.commitMutationEffectsImpl, describeError, var135, p64, p65)
				var137 = ok
				var136 = status
			end
			if not var137 then
				t.captureCommitPhaseError(var135, var135.return_, var136)
			end
		end
		var135 = var135.sibling
	end
end

function t_2.commitMutationEffectsImpl(p66, _, _) --[[ line: 2670 ]]
	-- upvalues: reactFiberFlagsModule (ref), commitDetachRef (ref), commitPlacement (ref), commitWork (ref)
	local flags = p66.flags
	
	if bit32.band(flags, reactFiberFlagsModule.Ref) ~= 0 then
		local alternate = p66.alternate
		
		if alternate ~= nil then
			commitDetachRef(alternate)
		end
	end
	local bits = bit32.band(flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Update, reactFiberFlagsModule.Hydrating))
	
	if bits == reactFiberFlagsModule.Placement then
		commitPlacement(p66)
		p66.flags = bit32.band(p66.flags, bit32.bnot(reactFiberFlagsModule.Placement))
		
		return
	elseif bits == reactFiberFlagsModule.PlacementAndUpdate then
		commitPlacement(p66)
		p66.flags = bit32.band(p66.flags, bit32.bnot(reactFiberFlagsModule.Placement))
		commitWork(p66.alternate, p66)
		
		return
	elseif bits == reactFiberFlagsModule.Update then
		commitWork(p66.alternate, p66)
	end
end

function t_2.commitMutationEffectsDeletions(p67, p68, p69, p70) --[[ line: 2739 ]]
	-- upvalues: commitDeletion (ref), describeError (ref), t (ref)
	for i, v in p67 do
		local ok, status = xpcall(commitDeletion, describeError, p69, v, p68, p70)
		
		if not ok then
			t.captureCommitPhaseError(v, p68, status)
		end
	end
end

function t.schedulePassiveEffectCallback() --[[ line: 2762 ]]
	-- upvalues: var43 (write), scheduleCallback (ref), normalPriority (ref), t (ref)
	if not var43 then
		var43 = true
		scheduleCallback(normalPriority, function() --[[ line: 2765 ]]
			-- upvalues: t (copy)
			t.flushPassiveEffects()
			
			return nil
		end)
	end
end

local var56 = nil

function t.flushPassiveEffects() --[[ line: 2774 ]]
	-- upvalues: var45 (write), noPriority (ref), normalPriority (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), schedulerPriorityToLanePriority (ref), yOLO (ref), runWithPriority (ref), describeError (ref), var56 (write)
	if var45 == noPriority then
		return false
	end
	local var139 = if normalPriority < var45 then normalPriority else var45
	var45 = noPriority
	
	if not reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return runWithPriority(var139, var56)
	end
	local var141, var142
	local var140 = getCurrentUpdateLanePriority()
	setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(var139))
	local _ = nil
	local _ = nil
	
	if yOLO then
		var141 = true
		setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(var139))
		var142 = runWithPriority(var139, var56)
	else
		local ok, status = xpcall(runWithPriority, describeError, var139, var56)
		var141 = ok
		var142 = status
	end
	setCurrentUpdateLanePriority(var140)
	
	if not var141 then
		error(var142)
	end
	return var142
end

local var57 = function(p71, p72) --[[ line: 2818 ]]
	-- upvalues: reactFeatureFlags (ref), reactWorkTagsModule (ref), var39 (write), reactFiberFlagsModule (ref), var57 (write), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), commitPassiveMount (ref), hasCaughtError (ref), clearCaughtError (ref), t (ref), resetCurrentFiber (ref), yOLO (ref), describeError (ref)
	local var143 = p72
	while var143 ~= nil do
		local var144 = nil
		
		if reactFeatureFlags.enableProfilerTimer and reactFeatureFlags.enableProfilerCommitHooks and var143.tag == reactWorkTagsModule.Profiler then
			var144 = var39
			var39 = var143
		end
		if var143.child ~= nil and bit32.band(var143.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags then
			var57(p71, var143.child)
		end
		if bit32.band(var143.flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags then
			if dEV then
				setCurrentFiber(var143)
				invokeGuardedCallback(nil, commitPassiveMount, nil, p71, var143)
				
				if hasCaughtError() then
					t.captureCommitPhaseError(var143, var143.return_, clearCaughtError())
				end
				resetCurrentFiber()
			else
				local var146
				local _ = nil
				local var145 = nil
				
				if yOLO then
					var146 = true
					commitPassiveMount(p71, var143)
				else
					local ok, status = xpcall(commitPassiveMount, describeError, p71, var143)
					var146 = ok
					var145 = status
				end
				if not var146 then
					t.captureCommitPhaseError(var143, var143.return_, var145)
				end
			end
		end
		if reactFeatureFlags.enableProfilerTimer and reactFeatureFlags.enableProfilerCommitHooks and var143.tag == reactWorkTagsModule.Profiler then
			if var144 ~= nil then
				var144.stateNode.passiveEffectDuration += var143.stateNode.passiveEffectDuration
			end
			var39 = var144
		end
		var143 = var143.sibling
	end
end

local function flushPassiveUnmountEffects(p73) --[[ line: 2887 ]]
	-- upvalues: t_2 (ref), enableNewTreeCleanupPath (ref), deletedTreeCleanUpLevel (ref), reactFiberFlagsModule (ref), flushPassiveUnmountEffects (ref), setCurrentFiber (ref), commitPassiveUnmount (ref), resetCurrentFiber (ref)
	local var147 = p73
	while var147 ~= nil do
		local deletions = var147.deletions
		
		if deletions ~= nil then
			local i
			for i = 1, #deletions do
				local var148 = deletions[i]
				t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(var148, var147)
				
				if not enableNewTreeCleanupPath or deletedTreeCleanUpLevel < 2 then
					t_2.detachFiberAfterEffects(var148)
				end
			end
			if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 1 then
				local alternate = var147.alternate
				
				if alternate ~= nil then
					local child = alternate.child
					
					if child ~= nil then
						alternate.child = nil
						repeat
							i = child.sibling
							child.sibling = nil
							child = i
						until child ~= nil
					end
				end
			end
		end
		local child = var147.child
		
		if child ~= nil and bit32.band(var147.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags then
			flushPassiveUnmountEffects(child)
		end
		if bit32.band(var147.flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags then
			setCurrentFiber(var147)
			commitPassiveUnmount(var147)
			resetCurrentFiber()
		end
		var147 = var147.sibling
	end
end

function t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(p74, p75) --[[ line: 2956 ]]
	-- upvalues: reactFiberFlagsModule (ref), enableNewTreeCleanupPath (ref), deletedTreeCleanUpLevel (ref), t_2 (ref), setCurrentFiber (ref), commitPassiveUnmountInsideDeletedTree (ref), resetCurrentFiber (ref)
	if bit32.band(p74.subtreeFlags, reactFiberFlagsModule.PassiveStatic) ~= reactFiberFlagsModule.NoFlags or enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		local child = p74.child
		while child ~= nil do
			local sibling = child.sibling
			t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(child, p75)
			child = sibling
		end
	end
	if bit32.band(p74.flags, reactFiberFlagsModule.PassiveStatic) ~= reactFiberFlagsModule.NoFlags then
		setCurrentFiber(p74)
		commitPassiveUnmountInsideDeletedTree(p74, p75)
		resetCurrentFiber()
	end
	if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		t_2.detachFiberAfterEffects(p74)
	end
end

var56 = function() --[[ line: 2997 ]]
	-- upvalues: var44 (write), noLanes_4 (write), reactFiberLaneModule (ref), invariant (ref), var29 (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), t_2 (ref), flushPassiveUnmountEffects (ref), var57 (write), enableDoubleInvokingEffects (ref), reactFeatureFlags (ref), flushSyncCallbackQueue (ref), var49 (write)
	if var44 == nil then
		return false
	end
	var44 = nil
	noLanes_4 = reactFiberLaneModule.NoLanes
	invariant(bit32.band(var29, 48) == 0, "Cannot flush passive effects while already rendering.")
	
	if dEV and enableDebugTracing then
		debugTracingModule.logPassiveEffectsStarted(noLanes_4)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markPassiveEffectsStarted(noLanes_4)
	end
	var29 = bit32.bor(var29, 32)
	local var149 = t_2.pushInteractions(var44)
	flushPassiveUnmountEffects(var44.current)
	var57(var44, var44.current)
	
	if dEV and enableDebugTracing then
		debugTracingModule.logPassiveEffectsStopped()
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markPassiveEffectsStopped(var44)
	end
	if dEV and enableDoubleInvokingEffects then
		commitDoubleInvokeEffectsInDEV(var44.current, true)
	end
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var149)
		t_2.finishPendingInteractions(var44, noLanes_4)
	end
	var29 = var29
	flushSyncCallbackQueue()
	var49 = if var44 == nil then 0 else var49 + 1
	
	return true
end

function t.isAlreadyFailedLegacyErrorBoundary(p76) --[[ line: 3071 ]]
	-- upvalues: var42 (write)
	return var42 ~= nil and var42:has(p76)
end

function t.markLegacyErrorBoundaryAsFailed(p77) --[[ line: 3076 ]]
	-- upvalues: var42 (write), set (ref)
	if var42 == nil then
		var42 = set.new({ p77 })
		
		return
	end
	var42:add(p77)
end

function t.prepareToThrowUncaughtError(p78) --[[ line: 3085 ]]
	-- upvalues: var40 (write), var41 (write)
	if not var40 then
		var40 = true
		var41 = p78
	end
end

var27 = function(p79, p80, p81) --[[ line: 3093 ]]
	-- upvalues: createCapturedValue (ref), createRootErrorUpdate (ref), syncLane (ref), t (ref), enqueueUpdate (ref), t_2 (ref), markRootUpdated (ref), var20 (write)
	enqueueUpdate(p79, createRootErrorUpdate(p79, createCapturedValue(p81, p80), syncLane, t.onUncaughtError))
	local var150 = t.requestEventTime()
	local var151 = t_2.markUpdateLaneFromFiberToRoot(p79, syncLane)
	
	if var151 ~= nil then
		markRootUpdated(var151, syncLane, var150)
		var20(var151, var150)
		t_2.schedulePendingInteractions(var151, syncLane)
	end
end

function t.captureCommitPhaseError(p82, p83, p84) --[[ line: 3113 ]]
	-- upvalues: reactWorkTagsModule (ref), var27 (write), skipUnmountedBoundaries (ref), t (ref), createCapturedValue (ref), createClassErrorUpdate (ref), syncLane (ref), enqueueUpdate (ref), t_2 (ref), markRootUpdated (ref), var20 (write)
	if p82.tag == reactWorkTagsModule.HostRoot then
		var27(p82, p82, p84)
		
		return
	end
	local _ = nil
	local var152 = if skipUnmountedBoundaries then p83 else p82.return_
	while var152 ~= nil do
		if var152.tag ~= reactWorkTagsModule.HostRoot then
			if var152.tag == reactWorkTagsModule.ClassComponent then
				local stateNode = var152.stateNode
				
				if typeof(var152.type.getDerivedStateFromError) ~= "function" and (typeof(stateNode.componentDidCatch) ~= "function" or t.isAlreadyFailedLegacyErrorBoundary(stateNode)) then
					var152 = var152.return_
					continue
				end
				enqueueUpdate(var152, createClassErrorUpdate(var152, createCapturedValue(p84, p82), syncLane))
				local var153 = t.requestEventTime()
				local var154 = t_2.markUpdateLaneFromFiberToRoot(var152, syncLane)
				
				if var154 ~= nil then
					markRootUpdated(var154, syncLane, var153)
					var20(var154, var153)
					t_2.schedulePendingInteractions(var154, syncLane)
				end
				return
			end
		end
		var27(var152, p82, p84)
		
		return
	end
end

function t.pingSuspendedRoot(p85, p86, p87) --[[ line: 3165 ]]
	-- upvalues: t (ref), markRootPinged (ref), var30 (write), isSubsetOfLanes (ref), noLanes (write), var33 (write), includesOnlyRetries (ref), now (ref), var37 (write), t_2 (ref), reactFiberLaneModule (ref), noLanes_3 (write), mergeLanes (ref), var20 (write)
	local pingCache = p85.pingCache
	
	if pingCache ~= nil then
		pingCache[p86] = nil
	end
	local var155 = t.requestEventTime()
	markRootPinged(p85, p87, var155)
	
	if var30 == p85 and isSubsetOfLanes(noLanes, p87) then
		if var33 == 4 or var33 == 3 and includesOnlyRetries(noLanes) and now() - var37 < 500 then
			t_2.prepareFreshStack(p85, reactFiberLaneModule.NoLanes)
		else
			noLanes_3 = mergeLanes(noLanes_3, p87)
		end
	end
	var20(p85, var155)
	t_2.schedulePendingInteractions(p85, p87)
end

function retryTimedOutBoundary(p88, p89) --[[ line: 3213 ]]
	-- upvalues: reactFiberLaneModule (ref), t (ref), t_2 (ref), markRootUpdated (ref), var20 (write)
	if p89 == reactFiberLaneModule.NoLane then
		p89 = requestRetryLane(p88)
	end
	local var156 = t.requestEventTime()
	local var157 = t_2.markUpdateLaneFromFiberToRoot(p88, p89)
	
	if var157 ~= nil then
		markRootUpdated(var157, p89, var156)
		var20(var157, var156)
		t_2.schedulePendingInteractions(var157, p89)
	end
end

function t.resolveRetryWakeable(p90, p91) --[[ line: 3240 ]]
	-- upvalues: reactFiberLaneModule (ref)
	local noLane = reactFiberLaneModule.NoLane
	local _ = nil
	local stateNode = p90.stateNode
	
	if stateNode ~= nil then
		stateNode:delete(p91)
	end
	retryTimedOutBoundary(p90, noLane)
end

function jnd(p92) --[[ line: 3284 ]]
	return if p92 < 120 then 120 elseif p92 < 480 then 480 elseif p92 < 1080 then 1080 elseif p92 < 1920 then 1920 elseif p92 < 3000 then 3000 elseif p92 < 4320 then 4320 else math.ceil(p92 / 1960) * 1960
end

function t_2.checkForNestedUpdates() --[[ line: 3302 ]]
	-- upvalues: var47 (write), var48 (write), invariant (ref), dEV (ref), var49 (write), console (ref)
	if var47 > 50 then
		var47 = 0
		var48 = nil
		invariant(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.")
	end
	if dEV and var49 > 50 then
		var49 = 0
		console.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.")
	end
end

function flushRenderPhaseStrictModeWarningsInDEV() --[[ line: 3328 ]]
	-- upvalues: dEV (ref), unknownModule_7 (ref), reactFeatureFlags (ref)
	if dEV then
		unknownModule_7.flushLegacyContextWarning()
		
		if reactFeatureFlags.warnAboutDeprecatedLifecycles then
			unknownModule_7.flushPendingUnsafeLifecycleWarnings()
		end
	end
end

function commitDoubleInvokeEffectsInDEV(p93, p94) --[[ line: 3338 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), setCurrentFiber (ref), reactFiberFlagsModule (ref), invokeLayoutEffectUnmountInDEV (ref), invokePassiveEffectUnmountInDEV (ref), invokeLayoutEffectMountInDEV (ref), invokePassiveEffectMountInDEV (ref), resetCurrentFiber (ref)
	if dEV and enableDoubleInvokingEffects then
		setCurrentFiber(p93)
		invokeEffectsInDev(p93, reactFiberFlagsModule.MountLayoutDev, invokeLayoutEffectUnmountInDEV)
		
		if p94 then
			invokeEffectsInDev(p93, reactFiberFlagsModule.MountPassiveDev, invokePassiveEffectUnmountInDEV)
		end
		invokeEffectsInDev(p93, reactFiberFlagsModule.MountLayoutDev, invokeLayoutEffectMountInDEV)
		
		if p94 then
			invokeEffectsInDev(p93, reactFiberFlagsModule.MountPassiveDev, invokePassiveEffectMountInDEV)
		end
		resetCurrentFiber()
	end
end

function invokeEffectsInDev(p95, p96, p97) --[[ line: 3370 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), reactFiberFlagsModule (ref)
	if dEV and enableDoubleInvokingEffects then
		local var158 = p95
		while var158 ~= nil do
			if var158.child ~= nil and bit32.band(var158.subtreeFlags, p96) ~= reactFiberFlagsModule.NoFlags then
				invokeEffectsInDev(var158.child, p96, p97)
			end
			if bit32.band(var158.flags, p96) ~= reactFiberFlagsModule.NoFlags then
				p97(var158)
			end
			var158 = var158.sibling
		end
	end
end

local var59 = nil

function t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p98) --[[ line: 3396 ]]
	-- upvalues: dEV (ref), var29 (write), reactTypeOfModeModule (ref), reactWorkTagsModule (ref), getComponentName (ref), var59 (write), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), resetCurrentFiber (ref)
	if dEV then
		if bit32.band(var29, 16) ~= 0 then return end
		if bit32.band(p98.mode, bit32.bor(reactTypeOfModeModule.BlockingMode, reactTypeOfModeModule.ConcurrentMode)) == 0 then return end
		local tag = p98.tag
		
		if tag ~= reactWorkTagsModule.IndeterminateComponent and tag ~= reactWorkTagsModule.HostRoot and (tag ~= reactWorkTagsModule.ClassComponent and tag ~= reactWorkTagsModule.FunctionComponent) and (tag ~= reactWorkTagsModule.ForwardRef and tag ~= reactWorkTagsModule.MemoComponent and (tag ~= reactWorkTagsModule.SimpleMemoComponent and tag ~= reactWorkTagsModule.Block)) then return end
		local type = getComponentName(p98.type) or "ReactComponent"
		
		if var59 == nil then
			var59 = { [type] = true }
		elseif var59[type] then return end
		var59[type] = true
		local current = reactCurrentFiberModule.current
		local ok, status = pcall(function() --[[ line: 3441 ]]
			-- upvalues: setCurrentFiber (copy), p98 (ref), console (copy)
			setCurrentFiber(p98)
			console.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
		end)
		
		if current then
			setCurrentFiber(p98)
		else
			resetCurrentFiber()
		end
		if not ok then
			error(status)
		end
	end
end

if dEV and reactFeatureFlags.replayFailedUnitOfWorkWithInvokeGuardedCallback then
	function t_2.beginWork(p99, p100, p101) --[[ line: 3467 ]]
		-- upvalues: unknownModule_2 (ref), var22 (ref), describeError (ref), resetContextDependencies (ref), t_1 (ref), var23 (write), unwindInterruptedWork (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref)
		local var160 = unknownModule_2.assignFiberPropertiesInDEV(nil, p100)
		local ok, status = xpcall(var22, describeError, p99, p100, p101)
		
		if not ok then
			if status ~= nil and typeof(status) == "table" and typeof(status.andThen) == "function" then
				error(status)
			end
			resetContextDependencies()
			
			if not t_1.resetHooksAfterThrowRef then
				var23 = require(script.Parent["ReactFiberHooks.new"])
				t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
				t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
				t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = t_1.resetHooksAfterThrowRef()
			unwindInterruptedWork(p100)
			unknownModule_2.assignFiberPropertiesInDEV(p100, var160)
			
			if reactFeatureFlags.enableProfilerTimer and bit32.band(p100.mode, reactTypeOfModeModule.ProfileMode) ~= 0 then
				unknownModule_6.startProfilerTimer(p100)
			end
			invokeGuardedCallback(nil, var22, nil, p99, p100, p101)
			
			if hasCaughtError() then
				error(clearCaughtError())
				
				return status
			end
			error(status)
		end
		return status
	end
else
	t_2.beginWork = var22
end
local var60 = false
local var61 = if dEV then {} else nil

function t_2.warnAboutRenderPhaseUpdatesInDEV(p102) --[[ line: 3537 ]]
	-- upvalues: dEV (ref), reactCurrentFiberModule (ref), var29 (write), t_1 (ref), var23 (write), reactWorkTagsModule (ref), var31 (write), getComponentName (ref), var61 (write), console (ref), var60 (write)
	if dEV and reactCurrentFiberModule.isRendering and bit32.band(var29, 16) ~= 0 then
		if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
			var23 = require(script.Parent["ReactFiberHooks.new"])
			t_1.resetHooksAfterThrowRef = var23.resetHooksAfterThrow
			t_1.ContextOnlyDispatcherRef = var23.ContextOnlyDispatcher
			t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var23.getIsUpdatingOpaqueValueInRenderPhaseInDEV
		end
		if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
			if p102.tag == reactWorkTagsModule.FunctionComponent or p102.tag == reactWorkTagsModule.ForwardRef or p102.tag == reactWorkTagsModule.SimpleMemoComponent then
				local type = var31 and getComponentName(var31.type) or "Unknown"
				
				if var61[type] == nil then
					var61[type] = true
					console.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", getComponentName(p102.type) or "Unknown", type, type)
					
					return
				end
			elseif p102.tag == reactWorkTagsModule.ClassComponent and not var60 then
				console.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
				var60 = true
			end
		end
	end
end

t.IsThisRendererActing = { current = false }

function t.warnIfNotScopedWithMatchingAct(p103) --[[ line: 3588 ]]
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), isSomeRendererActing (ref), t (ref), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), resetCurrentFiber (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (isSomeRendererActing.current == true and t.IsThisRendererActing.current ~= true) then
		local current = reactCurrentFiberModule.current
		local ok, status = pcall(function() --[[ line: 3596 ]]
			-- upvalues: setCurrentFiber (copy), p103 (ref), console (copy)
			setCurrentFiber(p103)
			console.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
		end)
		
		if current then
			setCurrentFiber(p103)
		else
			resetCurrentFiber()
		end
		if not ok then
			error(status)
		end
	end
end

function t.warnIfNotCurrentlyActingEffectsInDEV(p104) --[[ line: 3631 ]]
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), reactTypeOfModeModule (ref), isSomeRendererActing (ref), t (ref), console (ref), getComponentName (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (bit32.band(p104.mode, reactTypeOfModeModule.StrictMode) ~= reactTypeOfModeModule.NoMode and isSomeRendererActing.current == false) and t.IsThisRendererActing.current == false then
		console.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p104.type))
	end
end

function t.warnIfNotCurrentlyActingUpdatesInDEV(p105) --[[ line: 3657 ]]
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), var29 (write), isSomeRendererActing (ref), t (ref), current (ref), setCurrentFiber (ref), console (ref), getComponentName (ref), resetCurrentFiber (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (var29 == 0 and isSomeRendererActing.current == false) and t.IsThisRendererActing.current == false then
		local var162 = current
		local ok, status = pcall(function() --[[ line: 3666 ]]
			-- upvalues: setCurrentFiber (copy), p105 (ref), console (copy), getComponentName (copy)
			setCurrentFiber(p105)
			console.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p105.type))
		end)
		
		if var162 then
			setCurrentFiber(p105)
		else
			resetCurrentFiber()
		end
		if ok then
			return status
		end
	end
end

local var62 = false

function t.warnIfUnmockedScheduler(p106) --[[ line: 3707 ]]
	-- upvalues: dEV (ref), var62 (write), schedulerModule (ref), reactTypeOfModeModule (ref), console (ref), reactFeatureFlags (ref)
	if dEV and var62 == false and schedulerModule.unstable_flushAllWithoutAsserting == nil then
		if bit32.band(p106.mode, reactTypeOfModeModule.BlockingMode) ~= 0 or bit32.band(p106.mode, reactTypeOfModeModule.ConcurrentMode) ~= 0 then
			var62 = true
			console.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
			
			return
		elseif reactFeatureFlags.warnAboutUnmockedScheduler == true then
			var62 = true
			console.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
		end
	end
end

function computeThreadID(p107, p108) --[[ line: 3751 ]]
	return p108 * 1000 + p107.interactionThreadID
end

function t.markSpawnedWork(p109) --[[ line: 3759 ]]
	-- upvalues: reactFeatureFlags (ref), var50 (write)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	if var50 == nil then
		var50 = { p109 }
		
		return
	end
	table.insert(var50, p109)
end

function scheduleInteractions(p110, p111, p112) --[[ line: 3771 ]]
	-- upvalues: reactFeatureFlags (ref), set (ref), subscriberRef (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	if p112.size > 0 then
		local pendingInteractionMap = p110.pendingInteractionMap
		local var163 = pendingInteractionMap:get(p111)
		
		if var163 == nil then
			pendingInteractionMap:set(p111, set.new(p112))
			
			for i, v in p112 do
				v.__count += 1
			end
		else
			p112:forEach(function(p113) --[[ line: 3784 ]]
				-- upvalues: var163 (ref)
				if not var163:has(p113) then
					p113.__count += 1
				end
				var163:add(p113)
			end)
		end
		local current = subscriberRef.current
		
		if current ~= nil then
			current.onWorkScheduled(p112, computeThreadID(p110, p111))
		end
	end
end

function t_2.schedulePendingInteractions(p114, p115) --[[ line: 3809 ]]
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		scheduleInteractions(p114, p115, interactionsRef.current)
		
		return
	end
end

function t_2.startWorkOnPendingInteractions(p116, p117) --[[ line: 3820 ]]
	-- upvalues: reactFeatureFlags (ref), set (ref), includesSomeLane (ref), subscriberRef (ref), describeError (ref), scheduleCallback (ref), immediatePriority (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	local var164 = set.new()
	p116.pendingInteractionMap:forEach(function(p118, p119) --[[ line: 3830 ]]
		-- upvalues: includesSomeLane (copy), p117 (ref), var164 (ref)
		if includesSomeLane(p117, p119) then
			p118:forEach(function(p120) --[[ line: 3832 ]]
				-- upvalues: var164 (copy)
				var164:add(p120)
			end)
		end
	end)
	p116.memoizedInteractions = var164
	
	if var164.size > 0 then
		local current = subscriberRef.current
		
		if current ~= nil then
			local ok, status = xpcall(current.onWorkStarted, describeError, var164, computeThreadID(p116, p117))
			
			if not ok then
				scheduleCallback(immediatePriority, function() --[[ line: 3854 ]]
					-- upvalues: status (ref)
					error(status)
				end)
			end
		end
	end
end

function t_2.finishPendingInteractions(p121, p122) --[[ line: 3862 ]]
	-- upvalues: reactFeatureFlags (ref), subscriberRef (ref), describeError (ref), includesSomeLane (ref), scheduleCallback (ref), immediatePriority (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	local pendingLanes = p121.pendingLanes
	local current = nil
	local var165 = true
	local var166 = nil
	
	if current ~= nil and p121.memoizedInteractions.size > 0 then
		current = subscriberRef.current
		local ok, status = xpcall(current.onWorkStopped, describeError, p121.memoizedInteractions, computeThreadID(p121, p122))
		var165 = ok
		var166 = status
	end
	local pendingInteractionMap = p121.pendingInteractionMap
	pendingInteractionMap:forEach(function(p123, p124) --[[ line: 3893 ]]
		-- upvalues: includesSomeLane (copy), pendingLanes (ref), pendingInteractionMap (ref), current (write), describeError (copy), scheduleCallback (copy), immediatePriority (copy)
		if not includesSomeLane(pendingLanes, p124) then
			pendingInteractionMap:delete(p124)
			p123:forEach(function(p125) --[[ line: 3899 ]]
				-- upvalues: current (copy), describeError (copy), scheduleCallback (copy), immediatePriority (copy)
				p125.__count -= 1
				
				if current ~= nil and p125.__count == 0 then
					local ok, status = xpcall(current.onInteractionScheduledWorkCompleted, describeError, p125)
					
					if not ok then
						scheduleCallback(immediatePriority, function() --[[ line: 3910 ]]
							-- upvalues: status (ref)
							error(status)
						end)
					end
				end
			end)
		end
	end)
	
	if not var165 then
		scheduleCallback(immediatePriority, function() --[[ line: 3922 ]]
			-- upvalues: var166 (write)
			error(var166)
		end)
	end
end

local var63 = false
local var64 = false
local unstableFlushAllWithoutAsserting = schedulerModule.unstable_flushAllWithoutAsserting
local isFunction = typeof(unstableFlushAllWithoutAsserting) == "function"

local function flushActWork() --[[ line: 3941 ]]
	-- upvalues: unstableFlushAllWithoutAsserting (ref), var63 (write), describeError (ref), t (ref)
	if unstableFlushAllWithoutAsserting == nil then
		local var168 = var63
		var63 = true
		local ok, status = xpcall(function() --[[ line: 3961 ]]
			-- upvalues: t (copy)
			local var169 = false
			while t.flushPassiveEffects() do
				var169 = true
			end
			return var169
		end, describeError)
		var63 = var168
		
		if ok then
			return status
		end
		error(status)
		
		return
	else
		local var167 = var63
		var63 = true
		local ok, status = xpcall(unstableFlushAllWithoutAsserting, describeError)
		var63 = var167
		
		if ok then
			return status
		end
		error(status)
	end
end

local function flushWorkAndMicroTasks(p126) --[[ line: 3980 ]]
	-- upvalues: flushActWork (ref), describeError (ref), enqueueTask (ref), flushWorkAndMicroTasks (ref)
	local ok, status = xpcall(flushActWork, describeError)
	
	if ok then
		local ok_1, status_1 = xpcall(enqueueTask, describeError, function() --[[ line: 3984 ]]
			-- upvalues: flushActWork (copy), flushWorkAndMicroTasks (copy), p126 (ref)
			if flushActWork() then
				flushWorkAndMicroTasks(p126)
				
				return
			end
			p126()
		end)
		ok = ok_1
		status = status_1
	end
	if not ok then
		p126(status)
	end
end

function t.act(p127) --[[ line: 3998 ]]
	-- upvalues: dEV (ref), reactGlobalsModule (ref), var55 (write), console (ref), var54 (write), isSomeRendererActing (ref), t (ref), var64 (write), describeError (ref), promiseModule (ref), isFunction (ref), flushWorkAndMicroTasks (ref), flushActWork (ref)
	if not dEV and not reactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ and var55 == false then
		var55 = true
		console.error("act(...) is not supported in production builds of React, and might not behave as expected.")
	end
	local ok_1
	var54 += 1
	local current = isSomeRendererActing.current
	local current_1 = t.IsThisRendererActing.current
	isSomeRendererActing.current = true
	t.IsThisRendererActing.current = true
	var64 = true
	
	local function _() --[[ line: 4023 | named "onDone" ]]
		-- upvalues: var54 (copy), isSomeRendererActing (copy), current (ref), t (copy), current_1 (ref), var64 (copy), var64 (ref), dEV (copy), var54 (ref), console (copy)
		var54 -= 1
		isSomeRendererActing.current = current
		t.IsThisRendererActing.current = current_1
		var64 = var64
		
		if dEV and var54 < var54 then
			console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
	end
	
	local ok, status = xpcall(t.batchedUpdates, describeError, p127)
	
	if not ok then
		var54 -= 1
		isSomeRendererActing.current = current
		t.IsThisRendererActing.current = current_1
		var64 = var64
		
		if dEV and var54 < var54 then
			console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
		error(status)
	end
	if status == nil or typeof(status) ~= "table" or typeof(status.andThen) ~= "function" then
		if dEV and status ~= nil then
			console.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", tostring(status))
		end
		ok_1, status_1 = xpcall(function() --[[ line: 4118 ]]
			-- upvalues: var54 (copy), isFunction (copy), current (ref), flushActWork (copy), isSomeRendererActing (copy), t (copy), current_1 (ref), var64 (copy), var64 (ref), dEV (copy), var54 (ref), console (copy)
			if var54 == 1 and (isFunction == false or current == false) then
				flushActWork()
			end
			var54 -= 1
			isSomeRendererActing.current = current
			t.IsThisRendererActing.current = current_1
			var64 = var64
			
			if dEV and var54 < var54 then
				console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
		end, describeError)
		
		if not ok_1 then
			var54 -= 1
			isSomeRendererActing.current = current
			t.IsThisRendererActing.current = current_1
			var64 = var64
			
			if dEV and var54 < var54 then
				console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
			error(status_1)
		end
		return {
			andThen = function(_, p128, _) --[[ line: 4138 ]]
				-- upvalues: dEV (copy), console (copy)
				if dEV then
					console.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
				end
				p128()
			end
		}
	else
		ok_1 = false
		
		if dEV and typeof(promiseModule) ~= nil then
			promiseModule.resolve():andThen(function() --[[ line: 4056 ]] end):andThen(function() --[[ line: 4056 ]]
				-- upvalues: ok_1 (write), console (copy)
				if ok_1 == false then
					console.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);")
				end
			end)
		end
		return {
			andThen = function(_, p129, p130) --[[ line: 4075 ]]
				-- upvalues: ok_1 (write), status (ref), var54 (copy), isFunction (copy), current (ref), isSomeRendererActing (copy), t (copy), current_1 (ref), var64 (copy), var64 (ref), dEV (copy), var54 (ref), console (copy), flushWorkAndMicroTasks (copy)
				ok_1 = true
				
				return status:andThen(function() --[[ line: 4077 ]]
					-- upvalues: var54 (copy), isFunction (copy), current (copy), isSomeRendererActing (copy), t (copy), current_1 (copy), var64 (copy), var64 (copy), dEV (copy), var54 (copy), console (copy), p129 (ref), flushWorkAndMicroTasks (copy), p130 (ref)
					if var54 <= 1 and (isFunction ~= true or current ~= true) then
						flushWorkAndMicroTasks(function(p131) --[[ line: 4091 ]]
							-- upvalues: var54 (copy), isSomeRendererActing (copy), current (copy), t (copy), current_1 (copy), var64 (copy), var64 (copy), dEV (copy), var54 (copy), console (copy), p130 (copy), p129 (copy)
							var54 -= 1
							isSomeRendererActing.current = current
							t.IsThisRendererActing.current = current_1
							var64 = var64
							
							if dEV and var54 < var54 then
								console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
							end
							if p131 then
								p130(p131)
								
								return
							end
							p129()
						end)
						
						return
					end
					var54 -= 1
					isSomeRendererActing.current = current
					t.IsThisRendererActing.current = current_1
					var64 = var64
					
					if dEV and var54 < var54 then
						console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					p129()
				end, function(p132) --[[ line: 4099 ]]
					-- upvalues: var54 (copy), isSomeRendererActing (copy), current (copy), t (copy), current_1 (copy), var64 (copy), var64 (copy), dEV (copy), var54 (copy), console (copy), p130 (ref)
					var54 -= 1
					isSomeRendererActing.current = current
					t.IsThisRendererActing.current = current_1
					var64 = var64
					
					if dEV and var54 < var54 then
						console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					p130(p132)
				end)
			end
		}
	end
end

function t_2.detachFiberAfterEffects(p133) --[[ line: 4150 ]]
	-- upvalues: enableNewTreeCleanupPath (ref), t_2 (ref), deletedTreeCleanUpLevel (ref), dEV (ref)
	if enableNewTreeCleanupPath then
		local alternate = p133.alternate
		
		if alternate ~= nil then
			p133.alternate = nil
			t_2.detachFiberAfterEffects(alternate)
		end
	end
	if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		p133.child = nil
		p133.deletions = nil
		p133.sibling = nil
		
		if dEV then
			p133._debugOwner = nil
		end
		if deletedTreeCleanUpLevel >= 3 then
			p133.return_ = nil
			p133.dependencies = nil
			p133.memoizedProps = nil
			p133.memoizedState = nil
			p133.pendingProps = nil
			p133.stateNode = nil
			p133.updateQueue = nil
		end
	else
		p133.child = nil
		p133.deletions = nil
		p133.dependencies = nil
		p133.memoizedProps = nil
		p133.memoizedState = nil
		p133.pendingProps = nil
		p133.sibling = nil
		p133.stateNode = nil
		p133.updateQueue = nil
		
		if dEV then
			p133._debugOwner = nil
			
			return
		end
	end
end

return t