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
local var1 = nil
local t_1 = {
	resetHooksAfterThrowRef = nil,
	ContextOnlyDispatcherRef = nil,
	getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil,
	originalBeginWorkRef = nil,
	completeWorkRef = nil
}

local var2 = function(p1, p2, p3)
	-- upvalues: t_1 (ref)
	if not t_1.originalBeginWorkRef then
		t_1.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork
	end
	return t_1.originalBeginWorkRef(p1, p2, p3)
end

local _ = function(p1, p2, p3)
	-- upvalues: t_1 (ref)
	if not t_1.completeWorkRef then
		t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
	end
	return t_1.completeWorkRef(p1, p2, p3)
end

local var3 = nil

local function _()
	-- upvalues: var3 (write), t_1 (ref)
	var3 = require(script.Parent["ReactFiberHooks.new"])
	t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
	t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
	t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end

local _ = function()
	-- upvalues: t_1 (ref), var3 (write)
	if not t_1.resetHooksAfterThrowRef then
		var3 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.resetHooksAfterThrowRef()
end

local _ = function()
	-- upvalues: t_1 (ref), var3 (write)
	if not t_1.ContextOnlyDispatcherRef then
		var3 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.ContextOnlyDispatcherRef
end

local _ = function()
	-- upvalues: t_1 (ref), var3 (write)
	if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
		var3 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
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
local var4 = nil
local _ = nil
local t_2 = {
	MutationWorkFlags = bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Update, reactFiberFlagsModule.Ref, reactFiberFlagsModule.HostUpdate)
}
local _ = {
	Incomplete = 0,
	FatalErrored = 1,
	Errored = 2,
	Suspended = 3,
	SuspendedWithDelay = 4,
	Completed = 5
}
local var5 = 0
local var6 = nil
local var7 = nil
local noLanes = reactFiberLaneModule.NoLanes
t.subtreeRenderLanes = reactFiberLaneModule.NoLanes
local var8 = createCursor(reactFiberLaneModule.NoLanes)
local var9 = 0
local var10 = nil
local noLanes_1 = reactFiberLaneModule.NoLanes
local reactFiberWorkInProgressModule = require(script.Parent.ReactFiberWorkInProgress)
local workInProgressRootSkippedLanes = reactFiberWorkInProgressModule.workInProgressRootSkippedLanes
local noLanes_2 = reactFiberLaneModule.NoLanes
local noLanes_3 = reactFiberLaneModule.NoLanes
local var11 = nil
local var12 = 0
local var13 = 1e999
local var14 = nil

local _ = function()
	-- upvalues: var13 (write), now (ref)
	var13 = now() + 500
end

function t.getRenderTargetTime()
	-- upvalues: var13 (write)
	return var13
end

local var15 = false
local var16 = nil
local var17 = nil
local var18 = false
local var19 = nil
local var20 = noPriority
local noLanes_4 = reactFiberLaneModule.NoLanes
local var21 = nil
local var22 = 0
local var23 = nil
local var24 = 0
local var25 = nil
local var26 = noTimestamp
local noLanes_5 = reactFiberLaneModule.NoLanes
local noLanes_6 = reactFiberLaneModule.NoLanes
local var27 = nil
local var28 = false

function t.getWorkInProgressRoot()
	-- upvalues: var6 (write)
	return var6
end

function t.requestEventTime()
	-- upvalues: var5 (write), now (ref), var26 (write), noTimestamp (ref)
	if bit32.band(var5, 48) ~= 0 then
		return now()
	elseif var26 == noTimestamp then
		var26 = now()
		
		return var26
	end
	return var26
end

function t.requestUpdateLane(p1)
	-- upvalues: reactTypeOfModeModule (ref), syncLane (ref), getCurrentPriorityLevel (ref), immediatePriority (ref), syncBatchedLane (ref), reactFeatureFlags (ref), var5 (write), noLanes (write), reactFiberLaneModule (ref), pickArbitraryLane (ref), noLanes_5 (write), noLanes_1 (write), reactFiberTransitionModule (ref), noLanes_6 (write), var11 (write), findTransitionLane (ref), userBlockingPriority (ref), findUpdateLane (ref), schedulerPriorityToLanePriority (ref), getCurrentUpdateLanePriority (ref), dEV (ref), console (ref)
	local mode = p1.mode
	
	if bit32.band(mode, reactTypeOfModeModule.BlockingMode) == reactTypeOfModeModule.NoMode then
		return syncLane
	elseif bit32.band(mode, reactTypeOfModeModule.ConcurrentMode) == reactTypeOfModeModule.NoMode then
		return if getCurrentPriorityLevel() == immediatePriority then syncLane else syncBatchedLane
	elseif not reactFeatureFlags.deferRenderPhaseUpdateToNextBatch and bit32.band(var5, 16) ~= 0 and noLanes ~= reactFiberLaneModule.NoLanes then
		return pickArbitraryLane(noLanes)
	elseif noLanes_5 == reactFiberLaneModule.NoLanes then
		noLanes_5 = noLanes_1
	end
	if reactFiberTransitionModule.requestCurrentTransition() ~= reactFiberTransitionModule.NoTransition then
		if noLanes_6 ~= reactFiberLaneModule.NoLanes then
			noLanes_6 = if var11 ~= nil then reactFiberLaneModule.NoLanes else var11.pendingLanes
		end
		return findTransitionLane(noLanes_5, noLanes_6)
	else
		local var29 = getCurrentPriorityLevel()
		local _ = nil
		
		if bit32.band(var5, 4) ~= 0 and var29 == userBlockingPriority then
			return findUpdateLane(reactFiberLaneModule.InputDiscreteLanePriority, noLanes_5)
		end
		local var30 = schedulerPriorityToLanePriority(var29)
		
		if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local var31 = getCurrentUpdateLanePriority()
			
			if var30 ~= var31 and var31 ~= reactFiberLaneModule.NoLanePriority and dEV then
				console.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(var30), tostring(var31))
			end
		end
		return findUpdateLane(var30, noLanes_5)
	end
end

function requestRetryLane(p1)
	-- upvalues: reactTypeOfModeModule (ref), syncLane (ref), getCurrentPriorityLevel (ref), immediatePriority (ref), syncBatchedLane (ref), noLanes_5 (write), reactFiberLaneModule (ref), noLanes_1 (write), findRetryLane (ref)
	local mode = p1.mode
	
	if bit32.band(mode, reactTypeOfModeModule.BlockingMode) == reactTypeOfModeModule.NoMode then
		return syncLane
	elseif bit32.band(mode, reactTypeOfModeModule.ConcurrentMode) == reactTypeOfModeModule.NoMode then
		return if getCurrentPriorityLevel() == immediatePriority then syncLane else syncBatchedLane
	elseif noLanes_5 == reactFiberLaneModule.NoLanes then
		noLanes_5 = noLanes_1
	end
	return findRetryLane(noLanes_5)
end

function t.scheduleUpdateOnFiber(p1, p2, p3)
	-- upvalues: t_2 (ref), markRootUpdated (ref), var6 (write), reactFeatureFlags (ref), var5 (write), noLanes_2 (write), mergeLanes (ref), var9 (write), noLanes (write), getCurrentPriorityLevel (ref), syncLane (ref), var1 (write), var13 (write), now (ref), flushSyncCallbackQueue (ref), userBlockingPriority (ref), immediatePriority (ref), var21 (write), set (ref), var11 (write)
	t_2.checkForNestedUpdates()
	local var29 = t_2.markUpdateLaneFromFiberToRoot(p1, p2)
	
	if var29 == nil then
		return nil
	end
	markRootUpdated(var29, p2, p3)
	
	if var29 == var6 then
		t_2.warnAboutRenderPhaseUpdatesInDEV(p1)
		
		if reactFeatureFlags.deferRenderPhaseUpdateToNextBatch or bit32.band(var5, 16) == 0 then
			noLanes_2 = mergeLanes(noLanes_2, p2)
		end
		if var9 == 4 then
			t_2.markRootSuspended(var29, noLanes)
		end
	end
	local var30 = getCurrentPriorityLevel()
	
	if p2 ~= syncLane then
		if bit32.band(var5, 4) ~= 0 and (var30 == userBlockingPriority or var30 == immediatePriority) then
			if var21 == nil then
				var21 = set.new({ var29 })
			else
				var21:add(var29)
			end
		end
		var1(var29, p3)
		t_2.schedulePendingInteractions(var29, p2)
	elseif bit32.band(var5, 8) == 0 or bit32.band(var5, 48) ~= 0 then
		var1(var29, p3)
		t_2.schedulePendingInteractions(var29, p2)
		
		if var5 == 0 then
			var13 = now() + 500
			flushSyncCallbackQueue()
		end
	else
		t_2.schedulePendingInteractions(var29, p2)
		t_2.performSyncWorkOnRoot(var29)
	end
	var11 = var29
	
	return var29
end

function t_2.markUpdateLaneFromFiberToRoot(p1, p2)
	-- upvalues: mergeLanes (ref), dEV (ref), reactFiberFlagsModule (ref), t_2 (ref), reactWorkTagsModule (ref)
	p1.lanes = mergeLanes(p1.lanes, p2)
	local alternate = p1.alternate
	
	if alternate ~= nil then
		alternate.lanes = mergeLanes(alternate.lanes, p2)
	end
	if dEV and alternate == nil and bit32.band(p1.flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Hydrating)) ~= reactFiberFlagsModule.NoFlags then
		t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p1)
	end
	local var29 = p1
	local _return = p1.return_
	while _return ~= nil do
		_return.childLanes = mergeLanes(_return.childLanes, p2)
		local alternate_1 = _return.alternate
		
		if alternate_1 ~= nil then
			alternate_1.childLanes = mergeLanes(alternate_1.childLanes, p2)
		elseif dEV and bit32.band(_return.flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Hydrating)) ~= reactFiberFlagsModule.NoFlags then
			t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p1)
		end
		var29 = _return
		_return = _return.return_
	end
	return if var29.tag == reactWorkTagsModule.HostRoot then var29.stateNode else nil
end

var1 = function(p3, p4)
	-- upvalues: markStarvedLanesAsExpired (ref), var6 (write), noLanes (write), reactFiberLaneModule (ref), getNextLanes (ref), returnNextLanesPriority (ref), cancelCallback (ref), scheduleSyncCallback (ref), robloxReactProfilingModule (ref), t_2 (ref), scheduleCallback (ref), immediatePriority (ref), lanePriorityToSchedulerPriority (ref)
	local callbackNode = p3.callbackNode
	markStarvedLanesAsExpired(p3, p4)
	local var30 = returnNextLanesPriority()
	
	if getNextLanes(p3, if p3 == var6 then noLanes else reactFiberLaneModule.NoLanes) == reactFiberLaneModule.NoLanes then
		if callbackNode ~= nil then
			cancelCallback(callbackNode)
			p3.callbackNode = nil
			p3.callbackPriority = reactFiberLaneModule.NoLanePriority
		end
		return
	elseif callbackNode ~= nil then
		if p3.callbackPriority == var30 then return end
		cancelCallback(callbackNode)
	end
	local var31 = if var30 == reactFiberLaneModule.SyncLanePriority then scheduleSyncCallback(function()
		-- upvalues: robloxReactProfilingModule (copy), p3 (ref), t_2 (copy)
		local var32 = t_2.performSyncWorkOnRoot(p3)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p3))
		
		return var32
	end) elseif var30 == reactFiberLaneModule.SyncBatchedLanePriority then scheduleCallback(immediatePriority, function()
		-- upvalues: robloxReactProfilingModule (copy), p3 (ref), t_2 (copy)
		local var32 = t_2.performSyncWorkOnRoot(p3)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p3))
		
		return var32
	end) else scheduleCallback(lanePriorityToSchedulerPriority(var30), function()
		-- upvalues: robloxReactProfilingModule (copy), p3 (ref), t_2 (copy)
		local var32 = t_2.performConcurrentWorkOnRoot(p3)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p3))
		
		return var32
	end)
	p3.callbackPriority = var30
	p3.callbackNode = var31
end

function t_2.performConcurrentWorkOnRoot(p3)
	-- upvalues: var26 (write), noTimestamp (ref), noLanes_5 (write), reactFiberLaneModule (ref), noLanes_6 (write), invariant (ref), var5 (write), t (ref), getNextLanes (ref), var6 (write), noLanes (write), t_2 (ref), includesSomeLane (ref), noLanes_1 (write), noLanes_2 (write), reactFiberHostConfigModule (ref), getLanesToRetrySynchronouslyOnError (ref), var10 (write), var1 (write), now (ref), robloxReactProfilingModule (ref)
	var26 = noTimestamp
	noLanes_5 = reactFiberLaneModule.NoLanes
	noLanes_6 = reactFiberLaneModule.NoLanes
	invariant(bit32.band(var5, 48) == 0, "Should not already be working.")
	local callbackNode = p3.callbackNode
	
	if t.flushPassiveEffects() and p3.callbackNode ~= callbackNode then
		return nil
	end
	local var30 = getNextLanes(p3, if p3 == var6 then noLanes else reactFiberLaneModule.NoLanes)
	
	if var30 == reactFiberLaneModule.NoLanes then
		return nil
	end
	local var31 = t_2.renderRootConcurrent(p3, var30)
	
	if includesSomeLane(noLanes_1, noLanes_2) then
		t_2.prepareFreshStack(p3, reactFiberLaneModule.NoLanes)
	elseif var31 ~= 0 then
		if var31 == 2 then
			var5 = bit32.bor(var5, 64)
			
			if p3.hydrate then
				p3.hydrate = false
				reactFiberHostConfigModule.clearContainer(p3.containerInfo)
			end
			var30 = getLanesToRetrySynchronouslyOnError(p3)
			
			if var30 ~= reactFiberLaneModule.NoLanes then
				var31 = t_2.renderRootSync(p3, var30)
			end
		end
		if var31 == 1 then
			local var32 = var10
			t_2.prepareFreshStack(p3, reactFiberLaneModule.NoLanes)
			t_2.markRootSuspended(p3, var30)
			var1(p3, now())
			error(var32)
		end
		p3.finishedWork = p3.current.alternate
		p3.finishedLanes = var30
		t_2.finishConcurrentRender(p3, var31, var30)
	end
	var1(p3, now())
	
	return if p3.callbackNode == callbackNode then function()
		-- upvalues: robloxReactProfilingModule (copy), p3 (ref), t_2 (copy)
		local var33 = t_2.performConcurrentWorkOnRoot(p3)
		robloxReactProfilingModule.profileRootAfterYielding(robloxReactProfilingModule.profileRootBeforeUnitOfWork(p3))
		
		return var33
	end else nil
end

local var30 = 0
local var31 = false

function shouldForceFlushFallbacksInDEV()
	-- upvalues: dEV (ref), var30 (write)
	return dEV and var30 > 0
end

function t_2.finishConcurrentRender(p3, p4, p5)
	-- upvalues: invariant (ref), t_2 (ref), includesOnlyRetries (ref), var12 (write), now (ref), getNextLanes (ref), reactFiberLaneModule (ref), isSubsetOfLanes (ref), t (ref), markRootPinged (ref), reactFiberHostConfigModule (ref), includesOnlyTransitions (ref)
	if p4 == 0 or p4 == 1 then
		invariant(false, "Root did not complete. This is a bug in React.")
		
		return
	elseif p4 == 2 then
		t_2.commitRoot(p3)
		
		return
	elseif p4 == 3 then
		t_2.markRootSuspended(p3, p5)
		
		if includesOnlyRetries(p5) and not shouldForceFlushFallbacksInDEV() then
			local var32 = var12 + 500 - now()
			
			if var32 > 10 then
				if getNextLanes(p3, reactFiberLaneModule.NoLanes) ~= reactFiberLaneModule.NoLanes then return end
				local suspendedLanes = p3.suspendedLanes
				
				if isSubsetOfLanes(suspendedLanes, p5) then
					p3.timeoutHandle = reactFiberHostConfigModule.scheduleTimeout(function()
						-- upvalues: t_2 (copy), p3 (ref)
						return t_2.commitRoot(p3)
					end, var32)
					
					return
				end
				markRootPinged(p3, suspendedLanes, t.requestEventTime())
				
				return
			else
				t_2.commitRoot(p3)
				
				return
			end
		end
	elseif p4 == 4 then
		t_2.markRootSuspended(p3, p5)
		
		if includesOnlyTransitions(p5) then return end
		if not shouldForceFlushFallbacksInDEV() then
			local var33 = now() - reactFiberLaneModule.getMostRecentEventTime(p3, p5)
			local var34 = jnd(var33) - var33
			
			if var34 > 10 then
				p3.timeoutHandle = reactFiberHostConfigModule.scheduleTimeout(function()
					-- upvalues: t_2 (copy), p3 (ref)
					return t_2.commitRoot(p3)
				end, var34)
				
				return
			end
		end
		t_2.commitRoot(p3)
		
		return
	elseif p4 == 5 then
		t_2.commitRoot(p3)
		
		return
	end
	invariant(false, "Unknown root exit status.")
end

function t_2.markRootSuspended(p3, p4)
	-- upvalues: removeLanes (ref), noLanes_3 (write), noLanes_2 (write), reactFiberLaneModule (ref)
	reactFiberLaneModule.markRootSuspended(p3, removeLanes(removeLanes(p4, noLanes_3), noLanes_2))
end

function t_2.performSyncWorkOnRoot(p3)
	-- upvalues: invariant (ref), var5 (write), t (ref), var6 (write), includesSomeLane (ref), noLanes (write), t_2 (ref), noLanes_1 (write), noLanes_2 (write), getNextLanes (ref), reactFiberLaneModule (ref), legacyRoot (ref), reactFiberHostConfigModule (ref), getLanesToRetrySynchronouslyOnError (ref), var10 (write), var1 (write), now (ref)
	local var32, var33
	invariant(bit32.band(var5, 48) == 0, "Should not already be working.")
	t.flushPassiveEffects()
	local _ = nil
	local _ = nil
	
	if p3 == var6 and includesSomeLane(p3.expiredLanes, noLanes) then
		var32 = noLanes
		var33 = t_2.renderRootSync(p3, var32)
		
		if includesSomeLane(noLanes_1, noLanes_2) then
			var32 = getNextLanes(p3, var32)
			var33 = t_2.renderRootSync(p3, var32)
		end
	else
		var32 = getNextLanes(p3, reactFiberLaneModule.NoLanes)
		var33 = t_2.renderRootSync(p3, var32)
	end
	if p3.tag ~= legacyRoot and var33 == 2 then
		var5 = bit32.bor(var5, 64)
		
		if p3.hydrate then
			p3.hydrate = false
			reactFiberHostConfigModule.clearContainer(p3.containerInfo)
		end
		var32 = getLanesToRetrySynchronouslyOnError(p3)
		
		if var32 ~= reactFiberLaneModule.NoLanes then
			var33 = t_2.renderRootSync(p3, var32)
		end
	end
	if var33 == 1 then
		local var34 = var10
		t_2.prepareFreshStack(p3, reactFiberLaneModule.NoLanes)
		t_2.markRootSuspended(p3, var32)
		var1(p3, now())
		error(var34)
	end
	p3.finishedWork = p3.current.alternate
	p3.finishedLanes = var32
	t_2.commitRoot(p3)
	var1(p3, now())
	
	return nil
end

function t.flushRoot(p3, p4)
	-- upvalues: markRootExpired (ref), var1 (write), now (ref), var5 (write), var13 (write), flushSyncCallbackQueue (ref)
	markRootExpired(p3, p4)
	var1(p3, now())
	
	if bit32.band(var5, 48) == 0 then
		var13 = now() + 500
		flushSyncCallbackQueue()
	end
end

function t.getExecutionContext()
	-- upvalues: var5 (write)
	return var5
end

function t.flushDiscreteUpdates()
	-- upvalues: var5 (write), dEV (ref), console (ref), t_2 (ref), t (ref)
	if bit32.band(var5, 49) == 0 then
		t_2.flushPendingDiscreteUpdates()
		t.flushPassiveEffects()
		
		return
	elseif dEV and bit32.band(var5, 16) ~= 0 then
		console.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
	end
end

function t.deferredUpdates(p3)
	-- upvalues: reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), yOLO (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), normalPriority (ref)
	if not reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return runWithPriority(normalPriority, p3)
	end
	local var32, var33
	local var34 = getCurrentUpdateLanePriority()
	local _ = nil
	local _ = nil
	
	if yOLO then
		var32 = true
		setCurrentUpdateLanePriority(reactFiberLaneModule.DefaultLanePriority)
		var33 = runWithPriority(normalPriority, p3)
	else
		setCurrentUpdateLanePriority(reactFiberLaneModule.DefaultLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, normalPriority, p3)
		var32 = ok
		var33 = status
	end
	setCurrentUpdateLanePriority(var34)
	
	if var32 then
		return var33
	end
	error(var33)
end

function t_2.flushPendingDiscreteUpdates()
	-- upvalues: var21 (write), markDiscreteUpdatesExpired (ref), var1 (write), now (ref), flushSyncCallbackQueue (ref)
	if var21 ~= nil then
		local var32 = var21
		var21 = nil
		var32:forEach(function(p3)
			-- upvalues: markDiscreteUpdatesExpired (copy), var1 (copy), now (copy)
			markDiscreteUpdatesExpired(p3)
			var1(p3, now())
		end)
	end
	flushSyncCallbackQueue()
end

function t.batchedUpdates(p3, p4)
	-- upvalues: var5 (write), yOLO (ref), describeError (ref), var13 (write), now (ref), flushSyncCallbackQueue (ref)
	local var32, var33
	var5 = bit32.bor(var5, 1)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var32 = true
		var33 = p3(p4)
	else
		local ok, status = xpcall(p3, describeError, p4)
		var32 = ok
		var33 = status
	end
	var5 = var5
	
	if var5 == 0 then
		var13 = now() + 500
		flushSyncCallbackQueue()
	end
	if var32 then
		return var33
	end
	error(var33)
end

function t.batchedEventUpdates(p3, p4)
	-- upvalues: var5 (write), yOLO (ref), describeError (ref), var13 (write), now (ref), flushSyncCallbackQueue (ref)
	local var32, var33
	var5 = bit32.bor(var5, 2)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var32 = true
		var33 = p3(p4)
	else
		local ok, status = xpcall(p3, describeError, p4)
		var32 = ok
		var33 = status
	end
	var5 = var5
	
	if var5 == 0 then
		var13 = now() + 500
		flushSyncCallbackQueue()
	end
	if var32 then
		return var33
	end
	error(var33)
end

function t.discreteUpdates(p3, p4, p5, p6, p7)
	-- upvalues: var5 (write), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), userBlockingPriority (ref), var13 (write), now (ref), flushSyncCallbackQueue (ref)
	var5 = bit32.bor(var5, 4)
	
	if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local var32 = getCurrentUpdateLanePriority()
		setCurrentUpdateLanePriority(reactFiberLaneModule.InputDiscreteLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, userBlockingPriority, function()
			-- upvalues: p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
			return p3(p4, p5, p6, p7)
		end)
		setCurrentUpdateLanePriority(var32)
		var5 = var5
		
		if var5 == 0 then
			var13 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return status
		end
		error(status)
		
		return
	else
		local ok, status = xpcall(runWithPriority, describeError, userBlockingPriority, function()
			-- upvalues: p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
			return p3(p4, p5, p6, p7)
		end)
		var5 = var5
		
		if var5 == 0 then
			var13 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return status
		end
		error(status)
	end
end

function t.unbatchedUpdates(p3, p4)
	-- upvalues: var5 (write), yOLO (ref), describeError (ref), var13 (write), now (ref), flushSyncCallbackQueue (ref)
	local var32, var33
	var5 = bit32.band(var5, 4294967294)
	var5 = bit32.bor(var5, 8)
	local _ = nil
	local _ = nil
	
	if yOLO then
		var32 = true
		var33 = p3(p4)
	else
		local ok, status = xpcall(p3, describeError, p4)
		var32 = ok
		var33 = status
	end
	var5 = var5
	
	if var5 == 0 then
		var13 = now() + 500
		flushSyncCallbackQueue()
	end
	if var32 then
		return var33
	end
	error(var33)
end

function t.flushSync(p3, p4)
	-- upvalues: var5 (write), dEV (ref), console (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), yOLO (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), flushSyncCallbackQueue (ref)
	if bit32.band(var5, 48) == 0 then
		var5 = bit32.bor(var5, 1)
		
		if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local var32, var33
			local var34 = getCurrentUpdateLanePriority()
			setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
			local _ = nil
			local _ = nil
			
			if yOLO then
				var32 = true
				setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
				var33 = if p3 then runWithPriority(immediatePriority, function()
					-- upvalues: p3 (ref), p4 (ref)
					return p3(p4)
				end) else nil
			elseif p3 then
				local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
					-- upvalues: p3 (ref), p4 (ref)
					return p3(p4)
				end)
				var32 = ok
				var33 = status
			else
				var32 = true
				var33 = nil
			end
			setCurrentUpdateLanePriority(var34)
			var5 = var5
			flushSyncCallbackQueue()
			
			if not var32 then
				error(var33)
			end
			return var33
		else
			local var35, var36
			local _ = nil
			local _ = nil
			
			if yOLO then
				var35 = true
				var36 = if p3 then runWithPriority(immediatePriority, function()
					-- upvalues: p3 (ref), p4 (ref)
					return p3(p4)
				end) else nil
			elseif p3 then
				local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
					-- upvalues: p3 (ref), p4 (ref)
					return p3(p4)
				end)
				var35 = ok
				var36 = status
			else
				var35 = true
				var36 = nil
			end
			var5 = var5
			flushSyncCallbackQueue()
			
			if not var35 then
				error(var36)
			end
			return var36
		end
	elseif dEV then
		console.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
	end
	return p3(p4)
end

function t.flushControlled(p3)
	-- upvalues: var5 (write), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), reactFiberLaneModule (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), var13 (write), now (ref), flushSyncCallbackQueue (ref)
	var5 = bit32.bor(var5, 1)
	
	if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local var32 = getCurrentUpdateLanePriority()
		setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
		local ok, status = xpcall(runWithPriority, describeError, immediatePriority, p3)
		setCurrentUpdateLanePriority(var32)
		var5 = var5
		
		if var5 == 0 then
			var13 = now() + 500
			flushSyncCallbackQueue()
		end
		if ok then
			return
		else
			error(status)
			
			return
		end
	else
		local ok, status = xpcall(runWithPriority, describeError, immediatePriority, p3)
		var5 = var5
		
		if var5 == 0 then
			var13 = now() + 500
			flushSyncCallbackQueue()
		end
		if not ok then
			error(status)
		end
	end
end

function t.pushRenderLanes(p3, p4)
	-- upvalues: push (ref), var8 (ref), t (ref), mergeLanes (ref), noLanes_1 (write)
	push(var8, t.subtreeRenderLanes, p3)
	t.subtreeRenderLanes = mergeLanes(t.subtreeRenderLanes, p4)
	noLanes_1 = mergeLanes(noLanes_1, p4)
end

function t.popRenderLanes(p3)
	-- upvalues: t (ref), var8 (ref), pop (ref)
	t.subtreeRenderLanes = var8.current
	pop(var8, p3)
end

function t_2.prepareFreshStack(p3, p4)
	-- upvalues: reactFiberLaneModule (ref), reactFiberHostConfigModule (ref), var7 (write), unwindInterruptedWork (ref), var6 (write), unknownModule_2 (ref), noLanes (write), t (ref), noLanes_1 (write), var9 (write), var10 (write), workInProgressRootSkippedLanes (ref), noLanes_2 (write), noLanes_3 (write), reactFeatureFlags (ref), var25 (write), dEV (ref), unknownModule_7 (ref)
	p3.finishedWork = nil
	p3.finishedLanes = reactFiberLaneModule.NoLanes
	local timeoutHandle = p3.timeoutHandle
	
	if timeoutHandle ~= reactFiberHostConfigModule.noTimeout then
		p3.timeoutHandle = reactFiberHostConfigModule.noTimeout
		reactFiberHostConfigModule.cancelTimeout(timeoutHandle)
	end
	if var7 ~= nil then
		local _return = var7.return_
		while _return ~= nil do
			unwindInterruptedWork(_return)
			_return = _return.return_
		end
	end
	var6 = p3
	var7 = unknownModule_2.createWorkInProgress(p3.current, nil)
	noLanes = p4
	t.subtreeRenderLanes = p4
	noLanes_1 = p4
	var9 = 0
	var10 = nil
	workInProgressRootSkippedLanes(reactFiberLaneModule.NoLanes)
	noLanes_2 = reactFiberLaneModule.NoLanes
	noLanes_3 = reactFiberLaneModule.NoLanes
	
	if reactFeatureFlags.enableSchedulerTracing then
		var25 = nil
	end
	if dEV then
		unknownModule_7.discardPendingWarnings()
	end
end

function t_2.handleError(p5, p6)
	-- upvalues: var7 (write), resetContextDependencies (ref), t_1 (ref), var3 (write), resetCurrentFiber (ref), reactCurrentOwner (ref), var9 (write), var10 (write), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), throwException (ref), noLanes (write), t (ref), t_2 (ref)
	while true do
		local var32 = var7
		local ok, status = pcall(function()
			-- upvalues: resetContextDependencies (copy), t_1 (copy), var3 (copy), resetCurrentFiber (copy), reactCurrentOwner (copy), var32 (write), var9 (copy), var10 (copy), p6 (write), var7 (copy), reactFeatureFlags (copy), reactTypeOfModeModule (copy), unknownModule_6 (copy), throwException (copy), p5 (ref), noLanes (copy), t (copy), t_2 (copy)
			resetContextDependencies()
			
			if not t_1.resetHooksAfterThrowRef then
				var3 = require(script.Parent["ReactFiberHooks.new"])
				t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
				t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
				t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = t_1.resetHooksAfterThrowRef()
			resetCurrentFiber()
			reactCurrentOwner.current = nil
			
			if var32 == nil or var32.return_ == nil then
				var9 = 1
				var10 = p6
				var7 = nil
				
				return
			elseif reactFeatureFlags.enableProfilerTimer and bit32.band(var32.mode, reactTypeOfModeModule.ProfileMode) ~= 0 then
				unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var32, true)
			end
			throwException(p5, var32.return_, var32, p6, noLanes, t.onUncaughtError, t.renderDidError)
			t_2.completeUnitOfWork(var32)
		end)
		if not ok then
			p6 = status
			
			if var7 == var32 and var32 ~= nil then
				var7 = var32.return_
			else
				var32 = var7
			end
		end
	end
end

function t_2.pushDispatcher()
	-- upvalues: reactCurrentDispatcher (ref), t_1 (ref), var3 (write)
	local current = reactCurrentDispatcher.current
	local var33 = reactCurrentDispatcher
	
	if not t_1.ContextOnlyDispatcherRef then
		var3 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	var33.current = t_1.ContextOnlyDispatcherRef
	
	if current ~= nil then
		return current
	elseif not t_1.ContextOnlyDispatcherRef then
		var3 = require(script.Parent["ReactFiberHooks.new"])
		t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
		t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
		t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return t_1.ContextOnlyDispatcherRef
end

function t_2.popDispatcher(p7)
	-- upvalues: reactCurrentDispatcher (ref)
	reactCurrentDispatcher.current = p7
end

function t_2.pushInteractions(p7)
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		local current = interactionsRef.current
		interactionsRef.current = p7.memoizedInteractions
		
		return current
	end
	return nil
end

function t_2.popInteractions(p7)
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		interactionsRef.current = p7
	end
end

function t.markCommitTimeOfFallback()
	-- upvalues: var12 (write), now (ref)
	var12 = now()
end

function t.markSkippedUpdateLanes(p7)
	-- upvalues: reactFiberWorkInProgressModule (ref)
	reactFiberWorkInProgressModule.markSkippedUpdateLanes(p7)
end

function t.renderDidSuspend()
	-- upvalues: var9 (write)
	if var9 == 0 then
		var9 = 3
	end
end

function t.renderDidSuspendDelayIfPossible()
	-- upvalues: var9 (write), var6 (write), includesNonIdleWork (ref), workInProgressRootSkippedLanes (ref), noLanes_2 (write), t_2 (ref), noLanes (write)
	if var9 == 0 or var9 == 3 then
		var9 = 4
	end
	if var6 ~= nil and (includesNonIdleWork(workInProgressRootSkippedLanes()) or includesNonIdleWork(noLanes_2)) then
		t_2.markRootSuspended(var6, noLanes)
	end
end

function t.renderDidError()
	-- upvalues: var9 (write)
	if var9 ~= 5 then
		var9 = 2
	end
end

function t.renderHasNotSuspendedYet()
	-- upvalues: var9 (write)
	return var9 == 0
end

function t_2.renderRootSync(p7, p8)
	-- upvalues: var5 (write), t_2 (ref), var6 (write), noLanes (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), yOLO (ref), describeError (ref), resetContextDependencies (ref), reactFeatureFlags (ref), var7 (write), invariant (ref), reactFiberLaneModule (ref), var9 (write)
	var5 = bit32.bor(var5, 16)
	local var33 = t_2.pushDispatcher()
	
	if var6 ~= p7 or noLanes ~= p8 then
		t_2.prepareFreshStack(p7, p8)
		t_2.startWorkOnPendingInteractions(p7, p8)
	end
	local var34 = t_2.pushInteractions(p7)
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStarted(p8)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStarted(p8)
	end
	while true do
		local var35 = nil
		local var36 = nil
		if yOLO then
			var35 = true
			t_2.workLoopSync()
		else
			local ok, status = xpcall(t_2.workLoopSync, describeError)
			var35 = ok
			var36 = status
		end
		if var35 then break end
		t_2.handleError(p7, var36)
	end
	resetContextDependencies()
	
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var34)
	end
	var5 = var5
	t_2.popDispatcher(var33)
	
	if var7 ~= nil then
		invariant(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
	end
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStopped()
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStopped()
	end
	var6 = nil
	noLanes = reactFiberLaneModule.NoLanes
	
	return var9
end

function t_2.workLoopSync()
	-- upvalues: var7 (write), t_2 (ref)
	while var7 ~= nil do
		t_2.performUnitOfWork(var7)
	end
end

function t_2.renderRootConcurrent(p9, p10)
	-- upvalues: var5 (write), t_2 (ref), var6 (write), noLanes (write), var13 (write), now (ref), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), yOLO (ref), describeError (ref), resetContextDependencies (ref), reactFeatureFlags (ref), var7 (write), reactFiberLaneModule (ref), var9 (write)
	var5 = bit32.bor(var5, 16)
	local var37 = t_2.pushDispatcher()
	
	if var6 ~= p9 or noLanes ~= p10 then
		var13 = now() + 500
		t_2.prepareFreshStack(p9, p10)
		t_2.startWorkOnPendingInteractions(p9, p10)
	end
	local var38 = t_2.pushInteractions(p9)
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStarted(p10)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markRenderStarted(p10)
	end
	local var39
	while true do
		local _ = nil
		local var40 = nil
		if yOLO then
			var39 = true
			var40 = "break"
			t_2.workLoopConcurrent()
		else
			local ok, status = xpcall(t_2.workLoopConcurrent, describeError)
			var39 = ok
			var40 = if var39 then "break" else status
		end
		if var40 == "break" then break end
		if not var39 then
			t_2.handleError(p9, var40)
		end
	end
	resetContextDependencies()
	
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var38)
	end
	t_2.popDispatcher(var37)
	var5 = var5
	
	if dEV and enableDebugTracing then
		debugTracingModule.logRenderStopped()
	end
	if var7 == nil then
		if enableSchedulingProfiler then
			schedulingProfilerModule.markRenderStopped()
		end
		var6 = nil
		noLanes = reactFiberLaneModule.NoLanes
		
		return var9
	elseif enableSchedulingProfiler then
		schedulingProfilerModule.markRenderYielded()
	end
	return 0
end

function t_2.workLoopConcurrent()
	-- upvalues: var7 (write), shouldYield (ref), t_2 (ref)
	while var7 ~= nil and not shouldYield() do
		t_2.performUnitOfWork(var7)
	end
end

if reactFeatureFlags.enableWorkLoopTrims then
	function t_2.performUnitOfWork(p11)
		-- upvalues: robloxReactProfilingModule (ref), dEV (ref), setCurrentFiber (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), t_2 (ref), t (ref), resetCurrentFiber (ref), var7 (write), reactCurrentOwner (ref)
		local enableUnitOfWorkProfiling = robloxReactProfilingModule.enableUnitOfWorkProfiling
		local var41 = if enableUnitOfWorkProfiling then robloxReactProfilingModule.profileUnitOfWorkBefore(p11) else nil
		local alternate = p11.alternate
		
		if dEV then
			setCurrentFiber(p11)
		end
		local var42
		local _ = nil
		
		if reactFeatureFlags.enableProfilerTimer and bit32.band(p11.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			unknownModule_6.startProfilerTimer(p11)
			var42 = t_2.beginWork(alternate, p11, t.subtreeRenderLanes)
			unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(p11, true)
		else
			var42 = t_2.beginWork(alternate, p11, t.subtreeRenderLanes)
		end
		if dEV then
			resetCurrentFiber()
		end
		p11.memoizedProps = p11.pendingProps
		
		if var42 == nil then
			t_2.completeUnitOfWork(p11)
		else
			var7 = var42
		end
		reactCurrentOwner.current = nil
		
		if enableUnitOfWorkProfiling then
			robloxReactProfilingModule.profileUnitOfWorkAfter(var41)
		end
	end
else
	function t_2.performUnitOfWork(p11)
		-- upvalues: robloxReactProfilingModule (ref), setCurrentFiber (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), t_2 (ref), t (ref), resetCurrentFiber (ref), var7 (write), reactCurrentOwner (ref)
		local var41
		local var42 = robloxReactProfilingModule.profileUnitOfWorkBefore(p11)
		local alternate = p11.alternate
		setCurrentFiber(p11)
		local _ = nil
		
		if reactFeatureFlags.enableProfilerTimer and bit32.band(p11.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			unknownModule_6.startProfilerTimer(p11)
			var41 = t_2.beginWork(alternate, p11, t.subtreeRenderLanes)
			unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(p11, true)
		else
			var41 = t_2.beginWork(alternate, p11, t.subtreeRenderLanes)
		end
		resetCurrentFiber()
		p11.memoizedProps = p11.pendingProps
		
		if var41 == nil then
			t_2.completeUnitOfWork(p11)
		else
			var7 = var41
		end
		reactCurrentOwner.current = nil
		robloxReactProfilingModule.profileUnitOfWorkAfter(var42)
	end
end
function t_2.completeUnitOfWork(p11)
	-- upvalues: reactFiberFlagsModule (ref), reactFeatureFlags (ref), dEV (ref), setCurrentFiber (ref), reactTypeOfModeModule (ref), t (ref), t_1 (ref), unknownModule_6 (ref), resetCurrentFiber (ref), var7 (write), unwindWork (ref), var9 (write)
	local sibling
	local var41 = p11
	repeat
		local alternate = var41.alternate
		local _return = var41.return_
		if bit32.band(var41.flags, reactFiberFlagsModule.Incomplete) ~= reactFiberFlagsModule.NoFlags then
			sibling = unwindWork(var41, t.subtreeRenderLanes)
			
			if sibling == nil then
				if reactFeatureFlags.enableProfilerTimer and bit32.band(var41.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
					unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var41, false)
					local actualDuration = var41.actualDuration or 0
					local child = var41.child
					while child ~= nil do
						actualDuration += child.actualDuration or 0
						child = child.sibling
					end
					var41.actualDuration = actualDuration
				end
				if _return ~= nil then
					_return.flags = bit32.bor(_return.flags, reactFiberFlagsModule.Incomplete)
					_return.subtreeFlags = reactFiberFlagsModule.NoFlags
					_return.deletions = nil
				end
				sibling = var41.sibling
				
				if sibling == nil then
					var41 = _return
					var7 = var41
					continue
				end
				var7 = sibling
				
				return
			end
			sibling.flags = bit32.band(sibling.flags, reactFiberFlagsModule.HostEffectMask)
			var7 = sibling
			
			return
		end
		if not reactFeatureFlags.enableWorkLoopTrims then
			setCurrentFiber(var41)
		elseif dEV then
			setCurrentFiber(var41)
		end
		sibling = nil
		
		if reactFeatureFlags.enableProfilerTimer and bit32.band(var41.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			unknownModule_6.startProfilerTimer(var41)
			local subtreeRenderLanes = t.subtreeRenderLanes
			
			if not t_1.completeWorkRef then
				t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
			end
			sibling = t_1.completeWorkRef(alternate, var41, subtreeRenderLanes)
			unknownModule_6.stopProfilerTimerIfRunningAndRecordDelta(var41, false)
		else
			local var42 = var41
			local subtreeRenderLanes = t.subtreeRenderLanes
			
			if not t_1.completeWorkRef then
				t_1.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
			end
			sibling = t_1.completeWorkRef(alternate, var42, subtreeRenderLanes)
		end
		if not reactFeatureFlags.enableWorkLoopTrims then
			resetCurrentFiber()
		elseif dEV then
			resetCurrentFiber()
		end
		if sibling == nil then
		end
		var7 = sibling
		
		return
	until var41 == nil
	if var9 == 0 then
		var9 = 5
	end
end

function t_2.commitRoot(p11)
	-- upvalues: getCurrentPriorityLevel (ref), runWithPriority (ref), immediatePriority (ref), robloxReactProfilingModule (ref), t_2 (ref)
	local var41 = getCurrentPriorityLevel()
	runWithPriority(immediatePriority, function()
		-- upvalues: robloxReactProfilingModule (copy), t_2 (copy), p11 (ref), var41 (ref)
		robloxReactProfilingModule.profileCommitBefore()
		local var42 = t_2.commitRootImpl(p11, var41)
		robloxReactProfilingModule.profileCommitAfter()
		
		return var42
	end)
	
	return nil
end

function t_2.commitRootImpl(p11, p12)
	-- upvalues: t (ref), var19 (write), invariant (ref), var5 (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), reactFiberLaneModule (ref), mergeLanes (ref), markRootFinished (ref), var21 (write), hasDiscreteLanes (ref), var6 (write), var7 (write), noLanes (write), reactFiberFlagsModule (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), t_2 (ref), reactCurrentOwner (ref), var18 (write), scheduleCallback (ref), normalPriority (ref), var27 (write), reactFiberHostConfigModule (ref), var28 (write), unknownModule_6 (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), recursivelyCommitLayoutEffects (ref), hasCaughtError (ref), clearCaughtError (ref), var4 (write), resetCurrentFiber (ref), yOLO (ref), describeError (ref), requestPaint (ref), noLanes_4 (write), var20 (write), var25 (write), var17 (write), enableDoubleInvokingEffects (ref), syncLane (ref), var23 (write), var22 (write), onCommitRoot (ref), onCommitRoot_1 (ref), var1 (write), now (ref), var15 (write), var16 (write), flushSyncCallbackQueue (ref)
	repeat
		t.flushPassiveEffects()
	until var19 == nil
	flushRenderPhaseStrictModeWarningsInDEV()
	invariant(bit32.band(var5, 48) == 0, "Should not already be working.")
	local finishedWork = p11.finishedWork
	local finishedLanes = p11.finishedLanes
	
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
			schedulingProfilerModule.markCommitStopped(p11)
		end
		return nil
	else
		p11.finishedWork = nil
		p11.finishedLanes = reactFiberLaneModule.NoLanes
		invariant(finishedWork ~= p11.current, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.")
		p11.callbackNode = nil
		local var41 = mergeLanes(finishedWork.lanes, finishedWork.childLanes)
		markRootFinished(p11, var41)
		
		if var21 ~= nil and not hasDiscreteLanes(var41) and var21:has(p11) then
			var21:delete(p11)
		end
		if p11 == var6 then
			var6 = nil
			var7 = nil
			noLanes = reactFiberLaneModule.NoLanes
		end
		if bit32.band(finishedWork.subtreeFlags, bit32.bor(reactFiberFlagsModule.BeforeMutationMask, reactFiberFlagsModule.MutationMask, reactFiberFlagsModule.LayoutMask, reactFiberFlagsModule.PassiveMask)) ~= reactFiberFlagsModule.NoFlags or bit32.band(finishedWork.flags, bit32.bor(reactFiberFlagsModule.BeforeMutationMask, reactFiberFlagsModule.MutationMask, reactFiberFlagsModule.LayoutMask, reactFiberFlagsModule.PassiveMask)) ~= reactFiberFlagsModule.NoFlags then
			local var42 = nil
			
			if reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
				var42 = getCurrentUpdateLanePriority()
				setCurrentUpdateLanePriority(reactFiberLaneModule.SyncLanePriority)
			end
			local var43 = var5
			var5 = bit32.bor(var5, 32)
			local var44 = t_2.pushInteractions(p11)
			reactCurrentOwner.current = nil
			
			if reactFeatureFlags.enableCommitTraversalTrims and bit32.band(bit32.bor(finishedWork.subtreeFlags, finishedWork.flags), reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags and not var18 then
				var18 = true
				scheduleCallback(normalPriority, function()
					-- upvalues: t (copy)
					t.flushPassiveEffects()
					
					return nil
				end)
			end
			var27 = reactFiberHostConfigModule.prepareForCommit(p11.containerInfo)
			var28 = false
			t_2.commitBeforeMutationEffects(finishedWork)
			var27 = nil
			
			if reactFeatureFlags.enableProfilerTimer then
				unknownModule_6.recordCommitTime()
			end
			t_2.commitMutationEffects(finishedWork, p11, p12)
			reactFiberHostConfigModule.resetAfterCommit(p11.containerInfo)
			p11.current = finishedWork
			
			if dEV and enableDebugTracing then
				debugTracingModule.logLayoutEffectsStarted(finishedLanes)
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markLayoutEffectsStarted(finishedLanes)
			end
			if dEV then
				setCurrentFiber(finishedWork)
				invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, finishedWork, p11, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
				
				if hasCaughtError() then
					var4(finishedWork, finishedWork, clearCaughtError())
				end
				resetCurrentFiber()
			else
				local var45
				local _ = nil
				local var46 = nil
				
				if yOLO then
					var45 = true
					recursivelyCommitLayoutEffects(finishedWork, p11, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
				else
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, finishedWork, p11, t.captureCommitPhaseError, t.schedulePassiveEffectCallback)
					var45 = ok
					var46 = status
				end
				if not var45 then
					var4(finishedWork, finishedWork, var46)
				end
			end
			if dEV and enableDebugTracing then
				debugTracingModule.logLayoutEffectsStopped()
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markLayoutEffectsStopped()
			end
			if (bit32.band(finishedWork.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags or bit32.band(finishedWork.flags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags) and not var18 then
				var18 = true
				scheduleCallback(normalPriority, function()
					-- upvalues: t (copy)
					t.flushPassiveEffects()
					
					return nil
				end)
			end
			requestPaint()
			
			if reactFeatureFlags.enableSchedulerTracing then
				t_2.popInteractions(var44)
			end
			var5 = var43
			
			if reactFeatureFlags.decoupleUpdatePriorityFromScheduler and var42 ~= nil then
				setCurrentUpdateLanePriority(var42)
			end
		else
			p11.current = finishedWork
			
			if reactFeatureFlags.enableProfilerTimer then
				unknownModule_6.recordCommitTime()
			end
		end
		local var47 = var18
		
		if var18 then
			var18 = false
			var19 = p11
			noLanes_4 = finishedLanes
			var20 = p12
		end
		local pendingLanes = p11.pendingLanes
		
		if pendingLanes == reactFiberLaneModule.NoLanes then
			var17 = nil
		elseif reactFeatureFlags.enableSchedulerTracing then
			if var25 ~= nil then
				local var48 = var25
				var25 = nil
				
				for i = 1, #var48 do
					scheduleInteractions(p11, var48[i], p11.memoizedInteractions)
				end
			end
			t_2.schedulePendingInteractions(p11, pendingLanes)
		end
		if dEV and enableDoubleInvokingEffects and not var47 then
			commitDoubleInvokeEffectsInDEV(p11.current, false)
		end
		if reactFeatureFlags.enableSchedulerTracing and not var47 then
			t_2.finishPendingInteractions(p11, finishedLanes)
		end
		if pendingLanes ~= syncLane then
			var22 = 0
		elseif p11 == var23 then
			var22 += 1
		else
			var22 = 0
			var23 = p11
		end
		onCommitRoot(finishedWork.stateNode, p12)
		
		if dEV then
			onCommitRoot_1()
		end
		var1(p11, now())
		
		if var15 then
			var15 = false
			local var49 = var16
			var16 = nil
			error(var49)
		end
		if bit32.band(var5, 8) == 0 then
			flushSyncCallbackQueue()
			
			if dEV and enableDebugTracing then
				debugTracingModule.logCommitStopped()
			end
			if enableSchedulingProfiler then
				schedulingProfilerModule.markCommitStopped(p11)
			end
			return nil
		elseif dEV and enableDebugTracing then
			debugTracingModule.logCommitStopped()
		end
		if enableSchedulingProfiler then
			schedulingProfilerModule.markCommitStopped(p11)
		end
		return nil
	end
end

function t_2.commitBeforeMutationEffects(p13)
	-- upvalues: t_2 (ref), reactFiberFlagsModule (ref), reactFeatureFlags (ref), var27 (write), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref), t (ref), resetCurrentFiber (ref), yOLO (ref), describeError (ref)
	local var50 = p13
	while var50 ~= nil do
		if var50.deletions ~= nil then
			t_2.commitBeforeMutationEffectsDeletions(var50.deletions)
		end
		if var50.child ~= nil and bit32.band(var50.subtreeFlags, reactFiberFlagsModule.BeforeMutationMask) ~= reactFiberFlagsModule.NoFlags then
			t_2.commitBeforeMutationEffects(var50.child)
		end
		if reactFeatureFlags.enableCommitTraversalTrims then
			if var27 ~= nil or bit32.band(var50.flags, reactFiberFlagsModule.Snapshot) ~= reactFiberFlagsModule.NoFlags then
				if dEV then
					setCurrentFiber(var50)
					invokeGuardedCallback(nil, t_2.commitBeforeMutationEffectsImpl, nil, var50)
					
					if hasCaughtError() then
						t.captureCommitPhaseError(var50, var50.return_, clearCaughtError())
					end
					resetCurrentFiber()
				else
					local var51
					local _ = nil
					local var52 = nil
					
					if yOLO then
						var51 = true
						t_2.commitBeforeMutationEffectsImpl(var50)
					else
						local ok, status = xpcall(t_2.commitBeforeMutationEffectsImpl, describeError, var50)
						var51 = ok
						var52 = status
					end
					if not var51 then
						t.captureCommitPhaseError(var50, var50.return_, var52)
					end
				end
			end
		elseif dEV then
			setCurrentFiber(var50)
			invokeGuardedCallback(nil, t_2.commitBeforeMutationEffectsImpl, nil, var50)
			
			if hasCaughtError() then
				t.captureCommitPhaseError(var50, var50.return_, clearCaughtError())
			end
			resetCurrentFiber()
		else
			local var53
			local _ = nil
			local var54 = nil
			
			if yOLO then
				var53 = true
				t_2.commitBeforeMutationEffectsImpl(var50)
			else
				local ok, status = xpcall(t_2.commitBeforeMutationEffectsImpl, describeError, var50)
				var53 = ok
				var54 = status
			end
			if not var53 then
				t.captureCommitPhaseError(var50, var50.return_, var54)
			end
		end
		var50 = var50.sibling
	end
end

function t_2.commitBeforeMutationEffectsImpl(p14)
	-- upvalues: var28 (write), var27 (write), reactWorkTagsModule (ref), unknownModule_5 (ref), doesFiberContain (ref), reactFiberHostConfigModule (ref), reactFiberFlagsModule (ref), setCurrentFiber (ref), commitBeforeMutationLifeCycles (ref), resetCurrentFiber (ref), reactFeatureFlags (ref), var18 (write), scheduleCallback (ref), normalPriority (ref), t (ref)
	local alternate = p14.alternate
	local flags = p14.flags
	
	if not var28 and var27 ~= nil and (p14.tag == reactWorkTagsModule.SuspenseComponent and unknownModule_5.isSuspenseBoundaryBeingHidden(alternate, p14)) and doesFiberContain(p14, var27) then
		var28 = true
		reactFiberHostConfigModule.beforeActiveInstanceBlur()
	end
	if bit32.band(flags, reactFiberFlagsModule.Snapshot) ~= reactFiberFlagsModule.NoFlags then
		setCurrentFiber(p14)
		commitBeforeMutationLifeCycles(alternate, p14)
		resetCurrentFiber()
	end
	if not reactFeatureFlags.enableCommitTraversalTrims and bit32.band(flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags and not var18 then
		var18 = true
		scheduleCallback(normalPriority, function()
			-- upvalues: t (copy)
			t.flushPassiveEffects()
			
			return nil
		end)
	end
end

function t_2.commitBeforeMutationEffectsDeletions(p14)
	-- upvalues: doesFiberContain (ref), var27 (write), var28 (write), reactFiberHostConfigModule (ref)
	for i = 1, #p14 do
		if doesFiberContain(p14[i], var27) then
			var28 = true
			reactFiberHostConfigModule.beforeActiveInstanceBlur()
		end
	end
end

function t_2.commitMutationEffects(p15, p16, p17)
	-- upvalues: commitDeletion (ref), describeError (ref), t (ref), reactFiberFlagsModule (ref), t_2 (ref), reactFeatureFlags (ref), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref), resetCurrentFiber (ref), yOLO (ref)
	local var55 = p15
	while var55 ~= nil do
		local status
		local deletions = var55.deletions
		
		if deletions ~= nil then
			for status, v in deletions do
				local ok, status = xpcall(commitDeletion, describeError, p16, v, var55, p17)
				
				if not ok then
					t.captureCommitPhaseError(v, var55, status)
				end
			end
		end
		if var55.child ~= nil and bit32.band(var55.subtreeFlags, reactFiberFlagsModule.MutationMask) ~= reactFiberFlagsModule.NoFlags then
			t_2.commitMutationEffects(var55.child, p16, p17)
		end
		if reactFeatureFlags.enableCommitTraversalTrims then
			if bit32.band(var55.flags, t_2.MutationWorkFlags) ~= reactFiberFlagsModule.NoFlags then
				if dEV then
					setCurrentFiber(var55)
					invokeGuardedCallback(nil, t_2.commitMutationEffectsImpl, nil, var55, p16, p17)
					
					if hasCaughtError() then
						t.captureCommitPhaseError(var55, var55.return_, clearCaughtError())
					end
					resetCurrentFiber()
				else
					local var56
					local _ = nil
					local var57 = nil
					
					if yOLO then
						var56 = true
						t_2.commitMutationEffectsImpl(var55, p16, p17)
					else
						ok, status = xpcall(t_2.commitMutationEffectsImpl, describeError, var55, p16, p17)
						var56 = ok
						var57 = status
					end
					if not var56 then
						t.captureCommitPhaseError(var55, var55.return_, var57)
					end
				end
			end
		elseif dEV then
			setCurrentFiber(var55)
			invokeGuardedCallback(nil, t_2.commitMutationEffectsImpl, nil, var55, p16, p17)
			
			if hasCaughtError() then
				t.captureCommitPhaseError(var55, var55.return_, clearCaughtError())
			end
			resetCurrentFiber()
		else
			local var58
			local _ = nil
			local var59 = nil
			
			if yOLO then
				var58 = true
				t_2.commitMutationEffectsImpl(var55, p16, p17)
			else
				ok, status = xpcall(t_2.commitMutationEffectsImpl, describeError, var55, p16, p17)
				var58 = ok
				var59 = status
			end
			if not var58 then
				t.captureCommitPhaseError(var55, var55.return_, var59)
			end
		end
		var55 = var55.sibling
	end
end

function t_2.commitMutationEffectsImpl(p18, _, _)
	-- upvalues: reactFiberFlagsModule (ref), commitDetachRef (ref), reactFeatureFlags (ref), commitPlacement (ref), commitWork (ref)
	local flags = p18.flags
	
	if bit32.band(flags, reactFiberFlagsModule.Ref) ~= 0 then
		local alternate = p18.alternate
		
		if alternate ~= nil then
			commitDetachRef(alternate)
		end
	end
	local bits = bit32.band(flags, bit32.bor(reactFiberFlagsModule.Placement, reactFiberFlagsModule.Update, reactFiberFlagsModule.Hydrating))
	
	if reactFeatureFlags.enableCommitTraversalTrims and bit32.band(flags, reactFiberFlagsModule.HostUpdate) ~= reactFiberFlagsModule.NoFlags then
		bits = bit32.bor(bits, reactFiberFlagsModule.Update)
	end
	if bits == reactFiberFlagsModule.Placement then
		commitPlacement(p18)
		p18.flags = bit32.band(p18.flags, bit32.bnot(reactFiberFlagsModule.Placement))
		
		return
	elseif bits == reactFiberFlagsModule.PlacementAndUpdate then
		commitPlacement(p18)
		p18.flags = bit32.band(p18.flags, bit32.bnot(reactFiberFlagsModule.Placement))
		commitWork(p18.alternate, p18)
		
		return
	elseif bits == reactFiberFlagsModule.Update then
		commitWork(p18.alternate, p18)
	end
end

function t_2.commitMutationEffectsDeletions(p18, p19, p20, p21)
	-- upvalues: commitDeletion (ref), describeError (ref), t (ref)
	for i, v in p18 do
		local ok, status = xpcall(commitDeletion, describeError, p20, v, p19, p21)
		
		if not ok then
			t.captureCommitPhaseError(v, p19, status)
		end
	end
end

function t.schedulePassiveEffectCallback()
	-- upvalues: var18 (write), scheduleCallback (ref), normalPriority (ref), t (ref)
	if not var18 then
		var18 = true
		scheduleCallback(normalPriority, function()
			-- upvalues: t (copy)
			t.flushPassiveEffects()
			
			return nil
		end)
	end
end

local var60 = nil

function t.flushPassiveEffects()
	-- upvalues: var20 (write), noPriority (ref), normalPriority (ref), reactFeatureFlags (ref), getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), schedulerPriorityToLanePriority (ref), yOLO (ref), runWithPriority (ref), describeError (ref), var60 (write)
	if var20 == noPriority then
		return false
	end
	local var61 = if normalPriority < var20 then normalPriority else var20
	var20 = noPriority
	
	if not reactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return runWithPriority(var61, var60)
	end
	local var62, var63
	local var64 = getCurrentUpdateLanePriority()
	setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(var61))
	local _ = nil
	local _ = nil
	
	if yOLO then
		var62 = true
		setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(var61))
		var63 = runWithPriority(var61, var60)
	else
		local ok, status = xpcall(runWithPriority, describeError, var61, var60)
		var62 = ok
		var63 = status
	end
	setCurrentUpdateLanePriority(var64)
	
	if not var62 then
		error(var63)
	end
	return var63
end

local var61 = function(p22, p23)
	-- upvalues: reactFeatureFlags (ref), reactWorkTagsModule (ref), var14 (write), reactFiberFlagsModule (ref), var61 (write), dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), commitPassiveMount (ref), hasCaughtError (ref), clearCaughtError (ref), t (ref), resetCurrentFiber (ref), yOLO (ref), describeError (ref)
	local var62 = p23
	while var62 ~= nil do
		local var63 = nil
		
		if reactFeatureFlags.enableProfilerTimer and reactFeatureFlags.enableProfilerCommitHooks and var62.tag == reactWorkTagsModule.Profiler then
			var63 = var14
			var14 = var62
		end
		if var62.child ~= nil and bit32.band(var62.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags then
			var61(p22, var62.child)
		end
		if bit32.band(var62.flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags then
			if dEV then
				setCurrentFiber(var62)
				invokeGuardedCallback(nil, commitPassiveMount, nil, p22, var62)
				
				if hasCaughtError() then
					t.captureCommitPhaseError(var62, var62.return_, clearCaughtError())
				end
				resetCurrentFiber()
			else
				local var64
				local _ = nil
				local var65 = nil
				
				if yOLO then
					var64 = true
					commitPassiveMount(p22, var62)
				else
					local ok, status = xpcall(commitPassiveMount, describeError, p22, var62)
					var64 = ok
					var65 = status
				end
				if not var64 then
					t.captureCommitPhaseError(var62, var62.return_, var65)
				end
			end
		end
		if reactFeatureFlags.enableProfilerTimer and reactFeatureFlags.enableProfilerCommitHooks and var62.tag == reactWorkTagsModule.Profiler then
			if var63 ~= nil then
				var63.stateNode.passiveEffectDuration += var62.stateNode.passiveEffectDuration
			end
			var14 = var63
		end
		var62 = var62.sibling
	end
end

function t_2.commitPassiveMountEffectsOnFibers(p24, p25)
	-- upvalues: dEV (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), commitPassiveMount (ref), hasCaughtError (ref), clearCaughtError (ref), t (ref), resetCurrentFiber (ref), yOLO (ref), describeError (ref)
	for i = 1, #p25 do
		local var66 = p25[i]
		
		if dEV then
			setCurrentFiber(var66)
			invokeGuardedCallback(nil, commitPassiveMount, nil, p24, var66)
			
			if hasCaughtError() then
				t.captureCommitPhaseError(var66, var66.return_, clearCaughtError())
			end
			resetCurrentFiber()
		end
		local var67
		local _ = nil
		local var68 = nil
		
		if yOLO then
			var67 = true
			commitPassiveMount(p24, var66)
		else
			local ok, status = xpcall(commitPassiveMount, describeError, p24, var66)
			var67 = ok
			var68 = status
		end
		if not var67 then
			t.captureCommitPhaseError(var66, var66.return_, var68)
		end
	end
end

local function flushPassiveUnmountEffects(p26)
	-- upvalues: t_2 (ref), enableNewTreeCleanupPath (ref), deletedTreeCleanUpLevel (ref), reactFiberFlagsModule (ref), flushPassiveUnmountEffects (ref), setCurrentFiber (ref), commitPassiveUnmount (ref), resetCurrentFiber (ref)
	local var69 = p26
	while var69 ~= nil do
		local deletions = var69.deletions
		
		if deletions ~= nil then
			local i
			for i = 1, #deletions do
				local var70 = deletions[i]
				t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(var70, var69)
				
				if not enableNewTreeCleanupPath or deletedTreeCleanUpLevel < 2 then
					t_2.detachFiberAfterEffects(var70)
				end
			end
			if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 1 then
				local alternate = var69.alternate
				
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
		local child = var69.child
		
		if child ~= nil and bit32.band(var69.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags then
			flushPassiveUnmountEffects(child)
		end
		if bit32.band(var69.flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags then
			setCurrentFiber(var69)
			commitPassiveUnmount(var69)
			resetCurrentFiber()
		end
		var69 = var69.sibling
	end
end

function t_2.flushPassiveUnmountEffectsCollecting(p27, p28)
	-- upvalues: t_2 (ref), enableNewTreeCleanupPath (ref), deletedTreeCleanUpLevel (ref), reactFiberFlagsModule (ref), setCurrentFiber (ref), commitPassiveUnmount (ref), resetCurrentFiber (ref)
	local var71 = p27
	while var71 ~= nil do
		local deletions = var71.deletions
		
		if deletions ~= nil then
			local i
			for i = 1, #deletions do
				local var72 = deletions[i]
				t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(var72, var71)
				
				if not enableNewTreeCleanupPath or deletedTreeCleanUpLevel < 2 then
					t_2.detachFiberAfterEffects(var72)
				end
			end
			if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 1 then
				local alternate = var71.alternate
				
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
		local child = var71.child
		
		if child ~= nil and bit32.band(var71.subtreeFlags, reactFiberFlagsModule.PassiveMask) ~= reactFiberFlagsModule.NoFlags then
			t_2.flushPassiveUnmountEffectsCollecting(child, p28)
		end
		if bit32.band(var71.flags, reactFiberFlagsModule.Passive) ~= reactFiberFlagsModule.NoFlags then
			table.insert(p28, var71)
			setCurrentFiber(var71)
			commitPassiveUnmount(var71)
			resetCurrentFiber()
		end
		var71 = var71.sibling
	end
end

function t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(p29, p30)
	-- upvalues: reactFiberFlagsModule (ref), enableNewTreeCleanupPath (ref), deletedTreeCleanUpLevel (ref), t_2 (ref), setCurrentFiber (ref), commitPassiveUnmountInsideDeletedTree (ref), resetCurrentFiber (ref)
	if bit32.band(p29.subtreeFlags, reactFiberFlagsModule.PassiveStatic) ~= reactFiberFlagsModule.NoFlags or enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		local child = p29.child
		while child ~= nil do
			local sibling = child.sibling
			t_2.flushPassiveUnmountEffectsInsideOfDeletedTree(child, p30)
			child = sibling
		end
	end
	if bit32.band(p29.flags, reactFiberFlagsModule.PassiveStatic) ~= reactFiberFlagsModule.NoFlags then
		setCurrentFiber(p29)
		commitPassiveUnmountInsideDeletedTree(p29, p30)
		resetCurrentFiber()
	end
	if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		t_2.detachFiberAfterEffects(p29)
	end
end

var60 = function()
	-- upvalues: var19 (write), noLanes_4 (write), reactFiberLaneModule (ref), invariant (ref), var5 (write), dEV (ref), enableDebugTracing (ref), debugTracingModule (ref), enableSchedulingProfiler (ref), schedulingProfilerModule (ref), t_2 (ref), reactFeatureFlags (ref), flushPassiveUnmountEffects (ref), var61 (write), enableDoubleInvokingEffects (ref), flushSyncCallbackQueue (ref), var24 (write)
	if var19 == nil then
		return false
	end
	var19 = nil
	noLanes_4 = reactFiberLaneModule.NoLanes
	invariant(bit32.band(var5, 48) == 0, "Cannot flush passive effects while already rendering.")
	
	if dEV and enableDebugTracing then
		debugTracingModule.logPassiveEffectsStarted(noLanes_4)
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markPassiveEffectsStarted(noLanes_4)
	end
	var5 = bit32.bor(var5, 32)
	local var73 = t_2.pushInteractions(var19)
	
	if not reactFeatureFlags.enableCommitTraversalTrims then
		flushPassiveUnmountEffects(var19.current)
		var61(var19, var19.current)
	elseif reactFeatureFlags.enableProfilerTimer and reactFeatureFlags.enableProfilerCommitHooks then
		flushPassiveUnmountEffects(var19.current)
		var61(var19, var19.current)
	else
		local passiveMountFibers = t_2.passiveMountFibers or {}
		t_2.passiveMountFibers = nil
		t_2.flushPassiveUnmountEffectsCollecting(var19.current, passiveMountFibers)
		t_2.commitPassiveMountEffectsOnFibers(var19, passiveMountFibers)
		table.clear(passiveMountFibers)
		t_2.passiveMountFibers = passiveMountFibers
	end
	if dEV and enableDebugTracing then
		debugTracingModule.logPassiveEffectsStopped()
	end
	if enableSchedulingProfiler then
		schedulingProfilerModule.markPassiveEffectsStopped(var19)
	end
	if dEV and enableDoubleInvokingEffects then
		commitDoubleInvokeEffectsInDEV(var19.current, true)
	end
	if reactFeatureFlags.enableSchedulerTracing then
		t_2.popInteractions(var73)
		t_2.finishPendingInteractions(var19, noLanes_4)
	end
	var5 = var5
	flushSyncCallbackQueue()
	var24 = if var19 == nil then 0 else var24 + 1
	
	return true
end

function t.isAlreadyFailedLegacyErrorBoundary(p31)
	-- upvalues: var17 (write)
	return var17 ~= nil and var17:has(p31)
end

function t.markLegacyErrorBoundaryAsFailed(p31)
	-- upvalues: var17 (write), set (ref)
	if var17 == nil then
		var17 = set.new({ p31 })
		
		return
	end
	var17:add(p31)
end

function t.prepareToThrowUncaughtError(p31)
	-- upvalues: var15 (write), var16 (write)
	if not var15 then
		var15 = true
		var16 = p31
	end
end

var4 = function(p31, p32, p33)
	-- upvalues: createCapturedValue (ref), createRootErrorUpdate (ref), syncLane (ref), t (ref), enqueueUpdate (ref), t_2 (ref), markRootUpdated (ref), var1 (write)
	enqueueUpdate(p31, createRootErrorUpdate(p31, createCapturedValue(p33, p32), syncLane, t.onUncaughtError))
	local var73 = t.requestEventTime()
	local var74 = t_2.markUpdateLaneFromFiberToRoot(p31, syncLane)
	
	if var74 ~= nil then
		markRootUpdated(var74, syncLane, var73)
		var1(var74, var73)
		t_2.schedulePendingInteractions(var74, syncLane)
	end
end

function t.captureCommitPhaseError(p31, p32, p33)
	-- upvalues: reactWorkTagsModule (ref), var4 (write), skipUnmountedBoundaries (ref), t (ref), createCapturedValue (ref), createClassErrorUpdate (ref), syncLane (ref), enqueueUpdate (ref), t_2 (ref), markRootUpdated (ref), var1 (write)
	if p31.tag == reactWorkTagsModule.HostRoot then
		var4(p31, p31, p33)
		
		return
	end
	local _ = nil
	local var73 = if skipUnmountedBoundaries then p32 else p31.return_
	while var73 ~= nil do
		if var73.tag ~= reactWorkTagsModule.HostRoot then
			if var73.tag == reactWorkTagsModule.ClassComponent then
				local stateNode = var73.stateNode
				
				if typeof(var73.type.getDerivedStateFromError) ~= "function" and (typeof(stateNode.componentDidCatch) ~= "function" or t.isAlreadyFailedLegacyErrorBoundary(stateNode)) then
					var73 = var73.return_
					continue
				end
				enqueueUpdate(var73, createClassErrorUpdate(var73, createCapturedValue(p33, p31), syncLane))
				local var74 = t.requestEventTime()
				local var75 = t_2.markUpdateLaneFromFiberToRoot(var73, syncLane)
				
				if var75 ~= nil then
					markRootUpdated(var75, syncLane, var74)
					var1(var75, var74)
					t_2.schedulePendingInteractions(var75, syncLane)
				end
				return
			end
		end
		var4(var73, p31, p33)
		
		return
	end
end

function t.pingSuspendedRoot(p34, p35, p36)
	-- upvalues: t (ref), markRootPinged (ref), var6 (write), isSubsetOfLanes (ref), noLanes (write), var9 (write), includesOnlyRetries (ref), now (ref), var12 (write), t_2 (ref), reactFiberLaneModule (ref), noLanes_3 (write), mergeLanes (ref), var1 (write)
	local pingCache = p34.pingCache
	
	if pingCache ~= nil then
		pingCache[p35] = nil
	end
	local var76 = t.requestEventTime()
	markRootPinged(p34, p36, var76)
	
	if var6 == p34 and isSubsetOfLanes(noLanes, p36) then
		if var9 == 4 or var9 == 3 and includesOnlyRetries(noLanes) and now() - var12 < 500 then
			t_2.prepareFreshStack(p34, reactFiberLaneModule.NoLanes)
		else
			noLanes_3 = mergeLanes(noLanes_3, p36)
		end
	end
	var1(p34, var76)
	t_2.schedulePendingInteractions(p34, p36)
end

function retryTimedOutBoundary(p34, p35)
	-- upvalues: reactFiberLaneModule (ref), t (ref), t_2 (ref), markRootUpdated (ref), var1 (write)
	if p35 == reactFiberLaneModule.NoLane then
		p35 = requestRetryLane(p34)
	end
	local var76 = t.requestEventTime()
	local var77 = t_2.markUpdateLaneFromFiberToRoot(p34, p35)
	
	if var77 ~= nil then
		markRootUpdated(var77, p35, var76)
		var1(var77, var76)
		t_2.schedulePendingInteractions(var77, p35)
	end
end

function t.resolveRetryWakeable(p34, p35)
	-- upvalues: reactFiberLaneModule (ref)
	local noLane = reactFiberLaneModule.NoLane
	local _ = nil
	local stateNode = p34.stateNode
	
	if stateNode ~= nil then
		stateNode:delete(p35)
	end
	retryTimedOutBoundary(p34, noLane)
end

function jnd(p34)
	return if p34 < 120 then 120 elseif p34 < 480 then 480 elseif p34 < 1080 then 1080 elseif p34 < 1920 then 1920 elseif p34 < 3000 then 3000 elseif p34 < 4320 then 4320 else math.ceil(p34 / 1960) * 1960
end

function t_2.checkForNestedUpdates()
	-- upvalues: var22 (write), var23 (write), invariant (ref), dEV (ref), var24 (write), console (ref)
	if var22 > 50 then
		var22 = 0
		var23 = nil
		invariant(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.")
	end
	if dEV and var24 > 50 then
		var24 = 0
		console.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.")
	end
end

function flushRenderPhaseStrictModeWarningsInDEV()
	-- upvalues: dEV (ref), unknownModule_7 (ref), reactFeatureFlags (ref)
	if dEV then
		unknownModule_7.flushLegacyContextWarning()
		
		if reactFeatureFlags.warnAboutDeprecatedLifecycles then
			unknownModule_7.flushPendingUnsafeLifecycleWarnings()
		end
	end
end

function commitDoubleInvokeEffectsInDEV(p34, p35)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), setCurrentFiber (ref), reactFiberFlagsModule (ref), invokeLayoutEffectUnmountInDEV (ref), invokePassiveEffectUnmountInDEV (ref), invokeLayoutEffectMountInDEV (ref), invokePassiveEffectMountInDEV (ref), resetCurrentFiber (ref)
	if dEV and enableDoubleInvokingEffects then
		setCurrentFiber(p34)
		invokeEffectsInDev(p34, reactFiberFlagsModule.MountLayoutDev, invokeLayoutEffectUnmountInDEV)
		
		if p35 then
			invokeEffectsInDev(p34, reactFiberFlagsModule.MountPassiveDev, invokePassiveEffectUnmountInDEV)
		end
		invokeEffectsInDev(p34, reactFiberFlagsModule.MountLayoutDev, invokeLayoutEffectMountInDEV)
		
		if p35 then
			invokeEffectsInDev(p34, reactFiberFlagsModule.MountPassiveDev, invokePassiveEffectMountInDEV)
		end
		resetCurrentFiber()
	end
end

function invokeEffectsInDev(p34, p35, p36)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), reactFiberFlagsModule (ref)
	if dEV and enableDoubleInvokingEffects then
		local var76 = p34
		while var76 ~= nil do
			if var76.child ~= nil and bit32.band(var76.subtreeFlags, p35) ~= reactFiberFlagsModule.NoFlags then
				invokeEffectsInDev(var76.child, p35, p36)
			end
			if bit32.band(var76.flags, p35) ~= reactFiberFlagsModule.NoFlags then
				p36(var76)
			end
			var76 = var76.sibling
		end
	end
end

local var77 = nil

function t_2.warnAboutUpdateOnNotYetMountedFiberInDEV(p37)
	-- upvalues: dEV (ref), var5 (write), reactTypeOfModeModule (ref), reactWorkTagsModule (ref), getComponentName (ref), var77 (write), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), resetCurrentFiber (ref)
	if dEV then
		if bit32.band(var5, 16) ~= 0 then return end
		if bit32.band(p37.mode, bit32.bor(reactTypeOfModeModule.BlockingMode, reactTypeOfModeModule.ConcurrentMode)) == 0 then return end
		local tag = p37.tag
		
		if tag ~= reactWorkTagsModule.IndeterminateComponent and tag ~= reactWorkTagsModule.HostRoot and (tag ~= reactWorkTagsModule.ClassComponent and tag ~= reactWorkTagsModule.FunctionComponent) and (tag ~= reactWorkTagsModule.ForwardRef and tag ~= reactWorkTagsModule.MemoComponent and (tag ~= reactWorkTagsModule.SimpleMemoComponent and tag ~= reactWorkTagsModule.Block)) then return end
		local type = getComponentName(p37.type) or "ReactComponent"
		
		if var77 == nil then
			var77 = { [type] = true }
		elseif var77[type] then return end
		var77[type] = true
		local current = reactCurrentFiberModule.current
		local ok, status = pcall(function()
			-- upvalues: setCurrentFiber (copy), p37 (ref), console (copy)
			setCurrentFiber(p37)
			console.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
		end)
		
		if current then
			setCurrentFiber(p37)
		else
			resetCurrentFiber()
		end
		if not ok then
			error(status)
		end
	end
end

if dEV and reactFeatureFlags.replayFailedUnitOfWorkWithInvokeGuardedCallback then
	function t_2.beginWork(p37, p38, p39)
		-- upvalues: unknownModule_2 (ref), var2 (ref), describeError (ref), resetContextDependencies (ref), t_1 (ref), var3 (write), unwindInterruptedWork (ref), reactFeatureFlags (ref), reactTypeOfModeModule (ref), unknownModule_6 (ref), invokeGuardedCallback (ref), hasCaughtError (ref), clearCaughtError (ref)
		local var78 = unknownModule_2.assignFiberPropertiesInDEV(nil, p38)
		local ok, status = xpcall(var2, describeError, p37, p38, p39)
		
		if not ok then
			if status ~= nil and typeof(status) == "table" and typeof(status.andThen) == "function" then
				error(status)
			end
			resetContextDependencies()
			
			if not t_1.resetHooksAfterThrowRef then
				var3 = require(script.Parent["ReactFiberHooks.new"])
				t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
				t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
				t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = t_1.resetHooksAfterThrowRef()
			unwindInterruptedWork(p38)
			unknownModule_2.assignFiberPropertiesInDEV(p38, var78)
			
			if reactFeatureFlags.enableProfilerTimer and bit32.band(p38.mode, reactTypeOfModeModule.ProfileMode) ~= 0 then
				unknownModule_6.startProfilerTimer(p38)
			end
			invokeGuardedCallback(nil, var2, nil, p37, p38, p39)
			
			if hasCaughtError() then
				error(clearCaughtError())
				
				return status
			end
			error(status)
		end
		return status
	end
else
	t_2.beginWork = var2
end
local var78 = false
local var79 = if dEV then {} else nil

function t_2.warnAboutRenderPhaseUpdatesInDEV(p37)
	-- upvalues: dEV (ref), reactCurrentFiberModule (ref), var5 (write), t_1 (ref), var3 (write), reactWorkTagsModule (ref), var7 (write), getComponentName (ref), var79 (write), console (ref), var78 (write)
	if dEV and reactCurrentFiberModule.isRendering and bit32.band(var5, 16) ~= 0 then
		if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
			var3 = require(script.Parent["ReactFiberHooks.new"])
			t_1.resetHooksAfterThrowRef = var3.resetHooksAfterThrow
			t_1.ContextOnlyDispatcherRef = var3.ContextOnlyDispatcher
			t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = var3.getIsUpdatingOpaqueValueInRenderPhaseInDEV
		end
		if not t_1.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
			if p37.tag == reactWorkTagsModule.FunctionComponent or p37.tag == reactWorkTagsModule.ForwardRef or p37.tag == reactWorkTagsModule.SimpleMemoComponent then
				local type = var7 and getComponentName(var7.type) or "Unknown"
				
				if var79[type] == nil then
					var79[type] = true
					console.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", getComponentName(p37.type) or "Unknown", type, type)
					
					return
				end
			elseif p37.tag == reactWorkTagsModule.ClassComponent and not var78 then
				console.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
				var78 = true
			end
		end
	end
end

t.IsThisRendererActing = { current = false }

function t.warnIfNotScopedWithMatchingAct(p37)
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), isSomeRendererActing (ref), t (ref), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), resetCurrentFiber (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (isSomeRendererActing.current == true and t.IsThisRendererActing.current ~= true) then
		local current = reactCurrentFiberModule.current
		local ok, status = pcall(function()
			-- upvalues: setCurrentFiber (copy), p37 (ref), console (copy)
			setCurrentFiber(p37)
			console.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
		end)
		
		if current then
			setCurrentFiber(p37)
		else
			resetCurrentFiber()
		end
		if not ok then
			error(status)
		end
	end
end

function t.warnIfNotCurrentlyActingEffectsInDEV(p37)
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), reactTypeOfModeModule (ref), isSomeRendererActing (ref), t (ref), console (ref), getComponentName (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (bit32.band(p37.mode, reactTypeOfModeModule.StrictMode) ~= reactTypeOfModeModule.NoMode and isSomeRendererActing.current == false) and t.IsThisRendererActing.current == false then
		console.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p37.type))
	end
end

function t.warnIfNotCurrentlyActingUpdatesInDEV(p37)
	-- upvalues: dEV (ref), reactFiberHostConfigModule (ref), var5 (write), isSomeRendererActing (ref), t (ref), current (ref), setCurrentFiber (ref), console (ref), getComponentName (ref), resetCurrentFiber (ref)
	if dEV and reactFiberHostConfigModule.warnsIfNotActing == true and (var5 == 0 and isSomeRendererActing.current == false) and t.IsThisRendererActing.current == false then
		local var80 = current
		local ok, status = pcall(function()
			-- upvalues: setCurrentFiber (copy), p37 (ref), console (copy), getComponentName (copy)
			setCurrentFiber(p37)
			console.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", getComponentName(p37.type))
		end)
		
		if var80 then
			setCurrentFiber(p37)
		else
			resetCurrentFiber()
		end
		if ok then
			return status
		end
	end
end

local var80 = false

function t.warnIfUnmockedScheduler(p37)
	-- upvalues: dEV (ref), var80 (write), schedulerModule (ref), reactTypeOfModeModule (ref), console (ref), reactFeatureFlags (ref)
	if dEV and var80 == false and schedulerModule.unstable_flushAllWithoutAsserting == nil then
		if bit32.band(p37.mode, reactTypeOfModeModule.BlockingMode) ~= 0 or bit32.band(p37.mode, reactTypeOfModeModule.ConcurrentMode) ~= 0 then
			var80 = true
			console.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
			
			return
		elseif reactFeatureFlags.warnAboutUnmockedScheduler == true then
			var80 = true
			console.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
		end
	end
end

function computeThreadID(p37, p38)
	return p38 * 1000 + p37.interactionThreadID
end

function t.markSpawnedWork(p37)
	-- upvalues: reactFeatureFlags (ref), var25 (write)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	if var25 == nil then
		var25 = { p37 }
		
		return
	end
	table.insert(var25, p37)
end

function scheduleInteractions(p37, p38, p39)
	-- upvalues: reactFeatureFlags (ref), set (ref), subscriberRef (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	if p39.size > 0 then
		local pendingInteractionMap = p37.pendingInteractionMap
		local var81 = pendingInteractionMap:get(p38)
		
		if var81 == nil then
			pendingInteractionMap:set(p38, set.new(p39))
			
			for i, v in p39 do
				v.__count += 1
			end
		else
			p39:forEach(function(p40)
				-- upvalues: var81 (ref)
				if not var81:has(p40) then
					p40.__count += 1
				end
				var81:add(p40)
			end)
		end
		local current = subscriberRef.current
		
		if current ~= nil then
			current.onWorkScheduled(p39, computeThreadID(p37, p38))
		end
	end
end

function t_2.schedulePendingInteractions(p40, p41)
	-- upvalues: reactFeatureFlags (ref), interactionsRef (ref)
	if reactFeatureFlags.enableSchedulerTracing then
		scheduleInteractions(p40, p41, interactionsRef.current)
		
		return
	end
end

function t_2.startWorkOnPendingInteractions(p40, p41)
	-- upvalues: reactFeatureFlags (ref), set (ref), includesSomeLane (ref), subscriberRef (ref), describeError (ref), scheduleCallback (ref), immediatePriority (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	local var82 = set.new()
	p40.pendingInteractionMap:forEach(function(p42, p43)
		-- upvalues: includesSomeLane (copy), p41 (ref), var82 (ref)
		if includesSomeLane(p41, p43) then
			p42:forEach(function(p44)
				-- upvalues: var82 (copy)
				var82:add(p44)
			end)
		end
	end)
	p40.memoizedInteractions = var82
	
	if var82.size > 0 then
		local current = subscriberRef.current
		
		if current ~= nil then
			local ok, status = xpcall(current.onWorkStarted, describeError, var82, computeThreadID(p40, p41))
			
			if not ok then
				scheduleCallback(immediatePriority, function()
					-- upvalues: status (ref)
					error(status)
				end)
			end
		end
	end
end

function t_2.finishPendingInteractions(p40, p41)
	-- upvalues: reactFeatureFlags (ref), subscriberRef (ref), describeError (ref), includesSomeLane (ref), scheduleCallback (ref), immediatePriority (ref)
	if not reactFeatureFlags.enableSchedulerTracing then return end
	local pendingLanes = p40.pendingLanes
	local current = nil
	local var82 = true
	local var83 = nil
	
	if current ~= nil and p40.memoizedInteractions.size > 0 then
		current = subscriberRef.current
		local ok, status = xpcall(current.onWorkStopped, describeError, p40.memoizedInteractions, computeThreadID(p40, p41))
		var82 = ok
		var83 = status
	end
	local pendingInteractionMap = p40.pendingInteractionMap
	pendingInteractionMap:forEach(function(p42, p43)
		-- upvalues: includesSomeLane (copy), pendingLanes (ref), pendingInteractionMap (ref), current (write), describeError (copy), scheduleCallback (copy), immediatePriority (copy)
		if not includesSomeLane(pendingLanes, p43) then
			pendingInteractionMap:delete(p43)
			p42:forEach(function(p44)
				-- upvalues: current (copy), describeError (copy), scheduleCallback (copy), immediatePriority (copy)
				p44.__count -= 1
				
				if current ~= nil and p44.__count == 0 then
					local ok, status = xpcall(current.onInteractionScheduledWorkCompleted, describeError, p44)
					
					if not ok then
						scheduleCallback(immediatePriority, function()
							-- upvalues: status (ref)
							error(status)
						end)
					end
				end
			end)
		end
	end)
	
	if not var82 then
		scheduleCallback(immediatePriority, function()
			-- upvalues: var83 (write)
			error(var83)
		end)
	end
end

local var82 = false
local var83 = false
local unstableFlushAllWithoutAsserting = schedulerModule.unstable_flushAllWithoutAsserting
local isFunction = typeof(unstableFlushAllWithoutAsserting) == "function"

local function flushActWork()
	-- upvalues: unstableFlushAllWithoutAsserting (ref), var82 (write), describeError (ref), t (ref)
	if unstableFlushAllWithoutAsserting == nil then
		local var84 = var82
		var82 = true
		local ok, status = xpcall(function()
			-- upvalues: t (copy)
			local var85 = false
			while t.flushPassiveEffects() do
				var85 = true
			end
			return var85
		end, describeError)
		var82 = var84
		
		if ok then
			return status
		end
		error(status)
		
		return
	else
		local var86 = var82
		var82 = true
		local ok, status = xpcall(unstableFlushAllWithoutAsserting, describeError)
		var82 = var86
		
		if ok then
			return status
		end
		error(status)
	end
end

local function flushWorkAndMicroTasks(p40)
	-- upvalues: flushActWork (ref), describeError (ref), enqueueTask (ref), flushWorkAndMicroTasks (ref)
	local ok, status = xpcall(flushActWork, describeError)
	
	if ok then
		local ok_1, status_1 = xpcall(enqueueTask, describeError, function()
			-- upvalues: flushActWork (copy), flushWorkAndMicroTasks (copy), p40 (ref)
			if flushActWork() then
				flushWorkAndMicroTasks(p40)
				
				return
			end
			p40()
		end)
		ok = ok_1
		status = status_1
	end
	if not ok then
		p40(status)
	end
end

function t.act(p40)
	-- upvalues: dEV (ref), reactGlobalsModule (ref), var31 (write), console (ref), var30 (write), isSomeRendererActing (ref), t (ref), var83 (write), describeError (ref), promiseModule (ref), isFunction (ref), flushWorkAndMicroTasks (ref), flushActWork (ref)
	if not dEV and not reactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ and var31 == false then
		var31 = true
		console.error("act(...) is not supported in production builds of React, and might not behave as expected.")
	end
	local ok_1
	var30 += 1
	local current = isSomeRendererActing.current
	local current_1 = t.IsThisRendererActing.current
	isSomeRendererActing.current = true
	t.IsThisRendererActing.current = true
	var83 = true
	
	local function _()
		-- upvalues: var30 (copy), isSomeRendererActing (copy), current (ref), t (copy), current_1 (ref), var83 (copy), var83 (ref), dEV (copy), var30 (ref), console (copy)
		var30 -= 1
		isSomeRendererActing.current = current
		t.IsThisRendererActing.current = current_1
		var83 = var83
		
		if dEV and var30 < var30 then
			console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
	end
	
	local ok, status = xpcall(t.batchedUpdates, describeError, p40)
	
	if not ok then
		var30 -= 1
		isSomeRendererActing.current = current
		t.IsThisRendererActing.current = current_1
		var83 = var83
		
		if dEV and var30 < var30 then
			console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
		error(status)
	end
	if status == nil or typeof(status) ~= "table" or typeof(status.andThen) ~= "function" then
		if dEV and status ~= nil then
			console.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", tostring(status))
		end
		ok_1, status_1 = xpcall(function()
			-- upvalues: var30 (copy), isFunction (copy), current (ref), flushActWork (copy), isSomeRendererActing (copy), t (copy), current_1 (ref), var83 (copy), var83 (ref), dEV (copy), var30 (ref), console (copy)
			if var30 == 1 and (isFunction == false or current == false) then
				flushActWork()
			end
			var30 -= 1
			isSomeRendererActing.current = current
			t.IsThisRendererActing.current = current_1
			var83 = var83
			
			if dEV and var30 < var30 then
				console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
		end, describeError)
		
		if not ok_1 then
			var30 -= 1
			isSomeRendererActing.current = current
			t.IsThisRendererActing.current = current_1
			var83 = var83
			
			if dEV and var30 < var30 then
				console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
			error(status_1)
		end
		return {
			andThen = function(_, p41, _)
				-- upvalues: dEV (copy), console (copy)
				if dEV then
					console.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
				end
				p41()
			end
		}
	else
		ok_1 = false
		
		if dEV and typeof(promiseModule) ~= nil then
			promiseModule.resolve():andThen(function() end):andThen(function()
				-- upvalues: ok_1 (write), console (copy)
				if ok_1 == false then
					console.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);")
				end
			end)
		end
		return {
			andThen = function(_, p41, p42)
				-- upvalues: ok_1 (write), status (ref), var30 (copy), isFunction (copy), current (ref), isSomeRendererActing (copy), t (copy), current_1 (ref), var83 (copy), var83 (ref), dEV (copy), var30 (ref), console (copy), flushWorkAndMicroTasks (copy)
				ok_1 = true
				
				return status:andThen(function()
					-- upvalues: var30 (copy), isFunction (copy), current (copy), isSomeRendererActing (copy), t (copy), current_1 (copy), var83 (copy), var83 (copy), dEV (copy), var30 (copy), console (copy), p41 (ref), flushWorkAndMicroTasks (copy), p42 (ref)
					if var30 <= 1 and (isFunction ~= true or current ~= true) then
						flushWorkAndMicroTasks(function(p43)
							-- upvalues: var30 (copy), isSomeRendererActing (copy), current (copy), t (copy), current_1 (copy), var83 (copy), var83 (copy), dEV (copy), var30 (copy), console (copy), p42 (copy), p41 (copy)
							var30 -= 1
							isSomeRendererActing.current = current
							t.IsThisRendererActing.current = current_1
							var83 = var83
							
							if dEV and var30 < var30 then
								console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
							end
							if p43 then
								p42(p43)
								
								return
							end
							p41()
						end)
						
						return
					end
					var30 -= 1
					isSomeRendererActing.current = current
					t.IsThisRendererActing.current = current_1
					var83 = var83
					
					if dEV and var30 < var30 then
						console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					p41()
				end, function(p43)
					-- upvalues: var30 (copy), isSomeRendererActing (copy), current (copy), t (copy), current_1 (copy), var83 (copy), var83 (copy), dEV (copy), var30 (copy), console (copy), p42 (ref)
					var30 -= 1
					isSomeRendererActing.current = current
					t.IsThisRendererActing.current = current_1
					var83 = var83
					
					if dEV and var30 < var30 then
						console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					p42(p43)
				end)
			end
		}
	end
end

function t_2.detachFiberAfterEffects(p40)
	-- upvalues: enableNewTreeCleanupPath (ref), t_2 (ref), deletedTreeCleanUpLevel (ref), dEV (ref)
	if enableNewTreeCleanupPath then
		local alternate = p40.alternate
		
		if alternate ~= nil then
			p40.alternate = nil
			t_2.detachFiberAfterEffects(alternate)
		end
	end
	if enableNewTreeCleanupPath and deletedTreeCleanUpLevel >= 2 then
		p40.child = nil
		p40.deletions = nil
		p40.sibling = nil
		
		if dEV then
			p40._debugOwner = nil
		end
		if deletedTreeCleanUpLevel >= 3 then
			p40.return_ = nil
			p40.dependencies = nil
			p40.memoizedProps = nil
			p40.memoizedState = nil
			p40.pendingProps = nil
			p40.stateNode = nil
			p40.updateQueue = nil
		end
	else
		p40.child = nil
		p40.deletions = nil
		p40.dependencies = nil
		p40.memoizedProps = nil
		p40.memoizedState = nil
		p40.pendingProps = nil
		p40.sibling = nil
		p40.stateNode = nil
		p40.updateQueue = nil
		
		if dEV then
			p40._debugOwner = nil
			
			return
		end
	end
end

return t