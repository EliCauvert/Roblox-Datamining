local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local Set = require(Parent.LuauPolyfill).Set
local DEV = ReactGlobalsModule.__DEV__
local YOLO = ReactGlobalsModule.__YOLO__
local ReactFiberWorkLoopModule = {}
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local SchedulerModule = require(Parent.Scheduler)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ReactFiberStackNewModule = require(script.Parent["ReactFiberStack.new"])
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableDebugTracing = ReactFeatureFlags.enableDebugTracing
local EnableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local SkipUnmountedBoundaries = ReactFeatureFlags.skipUnmountedBoundaries
local EnableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local DeletedTreeCleanUpLevel = ReactFeatureFlags.deletedTreeCleanUpLevel
local EnableNewTreeCleanupPath = ReactFeatureFlags.enableNewTreeCleanupPath
local SharedModule = require(Parent.Shared)
local DescribeError = require(Parent.Shared).describeError
local ReactSharedInternals = SharedModule.ReactSharedInternals
local InvariantFunction = SharedModule.invariant
local SchedulerWithReactIntegrationNewModule = require(script.Parent["SchedulerWithReactIntegration.new"])
local ScheduleCallbackFunction = SchedulerWithReactIntegrationNewModule.scheduleCallback
local CancelCallbackFunction = SchedulerWithReactIntegrationNewModule.cancelCallback
local GetCurrentPriorityLevelFunction = SchedulerWithReactIntegrationNewModule.getCurrentPriorityLevel
local RunWithPriorityFunction = SchedulerWithReactIntegrationNewModule.runWithPriority
local ShouldYield = SchedulerWithReactIntegrationNewModule.shouldYield
local RequestPaintFunction = SchedulerWithReactIntegrationNewModule.requestPaint
local NowFunction = SchedulerWithReactIntegrationNewModule.now
local NoPriority = SchedulerWithReactIntegrationNewModule.NoPriority
local ImmediatePriority = SchedulerWithReactIntegrationNewModule.ImmediatePriority
local UserBlockingPriority = SchedulerWithReactIntegrationNewModule.UserBlockingPriority
local NormalPriority = SchedulerWithReactIntegrationNewModule.NormalPriority
local FlushSyncCallbackQueueFunction = SchedulerWithReactIntegrationNewModule.flushSyncCallbackQueue
local ScheduleSyncCallbackFunction = SchedulerWithReactIntegrationNewModule.scheduleSyncCallback
local DebugTracingModule = require(script.Parent.DebugTracing)
local SchedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local Tracing = require(Parent.Scheduler).tracing
local InteractionsRef = Tracing.__interactionsRef
local SubscriberRef = Tracing.__subscriberRef
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local ReactFiberNewModule = require(script.Parent["ReactFiber.new"])
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local LegacyRoot = require(script.Parent.ReactRootTags).LegacyRoot
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local SyncLane = ReactFiberLaneModule.SyncLane
local SyncBatchedLane = ReactFiberLaneModule.SyncBatchedLane
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local FindUpdateLaneFunction = ReactFiberLaneModule.findUpdateLane
local FindTransitionLaneFunction = ReactFiberLaneModule.findTransitionLane
local FindRetryLaneFunction = ReactFiberLaneModule.findRetryLane
local IncludesSomeLaneFunction = ReactFiberLaneModule.includesSomeLane
local IsSubsetOfLanesFunction = ReactFiberLaneModule.isSubsetOfLanes
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local RemoveLanesFunction = ReactFiberLaneModule.removeLanes
local PickArbitraryLaneFunction = ReactFiberLaneModule.pickArbitraryLane
local HasDiscreteLanesFunction = ReactFiberLaneModule.hasDiscreteLanes
local IncludesNonIdleWorkFunction = ReactFiberLaneModule.includesNonIdleWork
local IncludesOnlyRetriesFunction = ReactFiberLaneModule.includesOnlyRetries
local IncludesOnlyTransitionsFunction = ReactFiberLaneModule.includesOnlyTransitions
local GetNextLanesFunction = ReactFiberLaneModule.getNextLanes
local ReturnNextLanesPriorityFunction = ReactFiberLaneModule.returnNextLanesPriority
local SetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.setCurrentUpdateLanePriority
local GetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.getCurrentUpdateLanePriority
local MarkStarvedLanesAsExpiredFunction = ReactFiberLaneModule.markStarvedLanesAsExpired
local GetLanesToRetrySynchronouslyOnErrorFunction = ReactFiberLaneModule.getLanesToRetrySynchronouslyOnError
local MarkRootUpdatedFunction = ReactFiberLaneModule.markRootUpdated
local MarkRootPingedFunction = ReactFiberLaneModule.markRootPinged
local MarkRootExpiredFunction = ReactFiberLaneModule.markRootExpired
local MarkDiscreteUpdatesExpiredFunction = ReactFiberLaneModule.markDiscreteUpdatesExpired
local MarkRootFinishedFunction = ReactFiberLaneModule.markRootFinished
local SchedulerPriorityToLanePriorityFunction = ReactFiberLaneModule.schedulerPriorityToLanePriority
local LanePriorityToSchedulerPriorityFunction = ReactFiberLaneModule.lanePriorityToSchedulerPriority
local ReactFiberTransitionModule = require(script.Parent.ReactFiberTransition)
local ReactFiberUnwindWorkNewModule = require(script.Parent["ReactFiberUnwindWork.new"])
local UnwindWorkFunction = ReactFiberUnwindWorkNewModule.unwindWork
local UnwindInterruptedWorkFunction = ReactFiberUnwindWorkNewModule.unwindInterruptedWork
local ReactFiberThrowNewModule = require(script.Parent["ReactFiberThrow.new"])
local ThrowExceptionFunction = ReactFiberThrowNewModule.throwException
local CreateRootErrorUpdateFunction = ReactFiberThrowNewModule.createRootErrorUpdate
local CreateClassErrorUpdateFunction = ReactFiberThrowNewModule.createClassErrorUpdate
local ReactFiberCommitWorkNewModule = require(script.Parent["ReactFiberCommitWork.new"])
local CommitBeforeMutationLifeCyclesFunction = ReactFiberCommitWorkNewModule.commitBeforeMutationLifeCycles
local CommitPlacementFunction = ReactFiberCommitWorkNewModule.commitPlacement
local CommitWorkFunction = ReactFiberCommitWorkNewModule.commitWork
local CommitDeletion = ReactFiberCommitWorkNewModule.commitDeletion
local CommitPassiveUnmountFunction = ReactFiberCommitWorkNewModule.commitPassiveUnmount
local CommitPassiveUnmountInsideDeletedTreeFunction = ReactFiberCommitWorkNewModule.commitPassiveUnmountInsideDeletedTree
local CommitPassiveMountFunction = ReactFiberCommitWorkNewModule.commitPassiveMount
local CommitDetachRefFunction = ReactFiberCommitWorkNewModule.commitDetachRef
local InvokeLayoutEffectMountInDEV = ReactFiberCommitWorkNewModule.invokeLayoutEffectMountInDEV
local InvokePassiveEffectMountInDEV = ReactFiberCommitWorkNewModule.invokePassiveEffectMountInDEV
local InvokeLayoutEffectUnmountInDEV = ReactFiberCommitWorkNewModule.invokeLayoutEffectUnmountInDEV
local InvokePassiveEffectUnmountInDEV = ReactFiberCommitWorkNewModule.invokePassiveEffectUnmountInDEV
local RecursivelyCommitLayoutEffectsFunction = ReactFiberCommitWorkNewModule.recursivelyCommitLayoutEffects
local PromiseModule = require(Parent.Promise)
local EnqueueUpdateFunction = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate
local ResetContextDependenciesFunction = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies
local RobloxReactProfilingModule = require(script.Parent.RobloxReactProfiling)
local Callback = nil
local config = {
	resetHooksAfterThrowRef = nil,
	ContextOnlyDispatcherRef = nil,
	getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil,
	originalBeginWorkRef = nil,
	completeWorkRef = nil
}

local function BeginWork(p1, p2, p3)
	-- upvalues: config (copy)
	if not config.originalBeginWorkRef then
		config.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork
	end
	return config.originalBeginWorkRef(p1, p2, p3)
end

local function _(p1, p2, p3)
	-- upvalues: config (copy)
	if not config.completeWorkRef then
		config.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
	end
	return config.completeWorkRef(p1, p2, p3)
end

local ReactFiberHooksNewModule = nil

local _ = function()
	-- upvalues: ReactFiberHooksNewModule (ref), config (copy)
	ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
	config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
	config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
	config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end

local _ = function()
	-- upvalues: config (copy), ReactFiberHooksNewModule (ref)
	if not config.resetHooksAfterThrowRef then
		ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
		config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
		config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return config.resetHooksAfterThrowRef()
end

local _ = function()
	-- upvalues: config (copy), ReactFiberHooksNewModule (ref)
	if not config.ContextOnlyDispatcherRef then
		ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
		config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
		config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return config.ContextOnlyDispatcherRef
end

local _ = function()
	-- upvalues: config (copy), ReactFiberHooksNewModule (ref)
	if not config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
		ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
		config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
		config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef()
end

local CreateCapturedValueFunction = require(script.Parent.ReactCapturedValue).createCapturedValue
local PushFunction = ReactFiberStackNewModule.push
local PopFunction = ReactFiberStackNewModule.pop
local CreateCursorFunction = ReactFiberStackNewModule.createCursor
local ReactProfilerTimerNewModule = require(script.Parent["ReactProfilerTimer.new"])
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactStrictModeWarningsNewModule = require(script.Parent["ReactStrictModeWarnings.new"])
local ReactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local Current = ReactCurrentFiberModule.current
local ResetCurrentFiberFunction = ReactCurrentFiberModule.resetCurrentFiber
local SetCurrentFiberFunction = ReactCurrentFiberModule.setCurrentFiber
local ReactErrorUtils = require(Parent.Shared).ReactErrorUtils
local InvokeGuardedCallbackFunction = ReactErrorUtils.invokeGuardedCallback
local HasCaughtErrorFunction = ReactErrorUtils.hasCaughtError
local ClearCaughtErrorFunction = ReactErrorUtils.clearCaughtError
local OnCommitRootFunction = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitRoot
local OnCommitRootFunction1 = require(script.Parent.ReactTestSelectors).onCommitRoot
local EnqueueTask = require(Parent.Shared).enqueueTask
local DoesFiberContainFunction = require(script.Parent.ReactFiberTreeReflection).doesFiberContain
local ReactCurrentDispatcher = ReactSharedInternals.ReactCurrentDispatcher
local ReactCurrentOwner = ReactSharedInternals.ReactCurrentOwner
local IsSomeRendererActing = ReactSharedInternals.IsSomeRendererActing
local Callback1 = nil
local _ = nil
local config1 = {
	MutationWorkFlags = bit32.bor(ReactFiberFlagsModule.Placement, ReactFiberFlagsModule.Update, ReactFiberFlagsModule.Ref, ReactFiberFlagsModule.HostUpdate)
}
ReactFiberWorkLoopModule.NoContext = 0
ReactFiberWorkLoopModule.RetryAfterError = 64
local Bits = 0
local v1 = nil
local WorkInProgress = nil
local NoLanes = ReactFiberLaneModule.NoLanes
ReactFiberWorkLoopModule.subtreeRenderLanes = ReactFiberLaneModule.NoLanes
local Cursor = CreateCursorFunction(ReactFiberLaneModule.NoLanes)
local v2 = 0
local v3 = nil
local NoLanes1 = ReactFiberLaneModule.NoLanes
local ReactFiberWorkInProgressModule = require(script.Parent.ReactFiberWorkInProgress)
local WorkInProgressRootSkippedLanesFunction = ReactFiberWorkInProgressModule.workInProgressRootSkippedLanes
local NoLanes2 = ReactFiberLaneModule.NoLanes
local NoLanes3 = ReactFiberLaneModule.NoLanes
local v4 = nil
local v5 = 0
local v6 = 1e999
local v7 = nil

local _ = function()
	-- upvalues: v6 (ref), NowFunction (copy)
	v6 = NowFunction() + 500
end

function ReactFiberWorkLoopModule.getRenderTargetTime()
	-- upvalues: v6 (ref)
	return v6
end

local Flag = false
local v8 = nil
local NewResult = nil
local Flag1 = false
local v9 = nil
local NoPriority1 = NoPriority
local NoLanes4 = ReactFiberLaneModule.NoLanes
local NewResult1 = nil
local Count = 0
local v10 = nil
local Count1 = 0
local List = nil
local NoTimestamp1 = NoTimestamp
local NoLanes5 = ReactFiberLaneModule.NoLanes
local NoLanes6 = ReactFiberLaneModule.NoLanes
local PrepareForCommitResult = nil
local Flag2 = false

function ReactFiberWorkLoopModule.getWorkInProgressRoot()
	-- upvalues: v1 (ref)
	return v1
end

function ReactFiberWorkLoopModule.requestEventTime()
	-- upvalues: Bits (ref), NowFunction (copy), NoTimestamp1 (ref), NoTimestamp (copy)
	if bit32.band(Bits, 48) ~= 0 then
		return NowFunction()
	elseif NoTimestamp1 == NoTimestamp then
		NoTimestamp1 = NowFunction()
		
		return NoTimestamp1
	else
		return NoTimestamp1
	end
end

function ReactFiberWorkLoopModule.requestUpdateLane(p1)
	-- upvalues: ReactTypeOfModeModule (copy), SyncLane (copy), GetCurrentPriorityLevelFunction (copy), ImmediatePriority (copy), SyncBatchedLane (copy), ReactFeatureFlags (copy), Bits (ref), NoLanes (ref), ReactFiberLaneModule (copy), PickArbitraryLaneFunction (copy), NoLanes5 (ref), NoLanes1 (ref), ReactFiberTransitionModule (copy), NoLanes6 (ref), v4 (ref), FindTransitionLaneFunction (copy), UserBlockingPriority (copy), FindUpdateLaneFunction (copy), SchedulerPriorityToLanePriorityFunction (copy), GetCurrentUpdateLanePriorityFunction (copy), DEV (copy), Console (copy)
	local Mode: number = p1.mode
	
	if bit32.band(Mode, ReactTypeOfModeModule.BlockingMode) == ReactTypeOfModeModule.NoMode then
		return SyncLane
	end
	if bit32.band(Mode, ReactTypeOfModeModule.ConcurrentMode) == ReactTypeOfModeModule.NoMode then
		return if GetCurrentPriorityLevelFunction() == ImmediatePriority then SyncLane else SyncBatchedLane
	end
	if not ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch and bit32.band(Bits, 16) ~= 0 and NoLanes ~= ReactFiberLaneModule.NoLanes then
		return PickArbitraryLaneFunction(NoLanes)
	end
	if NoLanes5 == ReactFiberLaneModule.NoLanes then
		NoLanes5 = NoLanes1
	end
	if ReactFiberTransitionModule.requestCurrentTransition() ~= ReactFiberTransitionModule.NoTransition then
		if NoLanes6 ~= ReactFiberLaneModule.NoLanes then
			NoLanes6 = if v4 == nil then ReactFiberLaneModule.NoLanes else v4.pendingLanes
		end
		return FindTransitionLaneFunction(NoLanes5, NoLanes6)
	else
		local CurrentPriorityLevel = GetCurrentPriorityLevelFunction()
		
		if bit32.band(Bits, 4) ~= 0 and CurrentPriorityLevel == UserBlockingPriority then
			return (FindUpdateLaneFunction(ReactFiberLaneModule.InputDiscreteLanePriority, NoLanes5))
		end
		local SchedulerPriorityToLanePriorityResult = SchedulerPriorityToLanePriorityFunction(CurrentPriorityLevel)
		
		if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
			
			if SchedulerPriorityToLanePriorityResult ~= CurrentUpdateLanePriority and CurrentUpdateLanePriority ~= ReactFiberLaneModule.NoLanePriority and DEV then
				Console.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(SchedulerPriorityToLanePriorityResult), (tostring(CurrentUpdateLanePriority)))
			end
		end
		return (FindUpdateLaneFunction(SchedulerPriorityToLanePriorityResult, NoLanes5))
	end
end

function requestRetryLane(p1)
	-- upvalues: ReactTypeOfModeModule (copy), SyncLane (copy), GetCurrentPriorityLevelFunction (copy), ImmediatePriority (copy), SyncBatchedLane (copy), NoLanes5 (ref), ReactFiberLaneModule (copy), NoLanes1 (ref), FindRetryLaneFunction (copy)
	local Mode: number = p1.mode
	
	if bit32.band(Mode, ReactTypeOfModeModule.BlockingMode) == ReactTypeOfModeModule.NoMode then
		return SyncLane
	end
	if bit32.band(Mode, ReactTypeOfModeModule.ConcurrentMode) == ReactTypeOfModeModule.NoMode then
		return if GetCurrentPriorityLevelFunction() == ImmediatePriority then SyncLane else SyncBatchedLane
	end
	if NoLanes5 == ReactFiberLaneModule.NoLanes then
		NoLanes5 = NoLanes1
	end
	return FindRetryLaneFunction(NoLanes5)
end

function ReactFiberWorkLoopModule.scheduleUpdateOnFiber(p1, SyncLane1, p2)
	-- upvalues: config1 (copy), MarkRootUpdatedFunction (copy), v1 (ref), ReactFeatureFlags (copy), Bits (ref), NoLanes2 (ref), MergeLanesFunction (copy), v2 (ref), NoLanes (ref), GetCurrentPriorityLevelFunction (copy), SyncLane (copy), Callback (ref), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy), UserBlockingPriority (copy), ImmediatePriority (copy), NewResult1 (ref), Set (copy), v4 (ref)
	config1.checkForNestedUpdates()
	local MarkUpdateLaneFromFiberToRootResult = config1.markUpdateLaneFromFiberToRoot(p1, SyncLane1)
	
	if MarkUpdateLaneFromFiberToRootResult == nil then
		return nil
	end
	MarkRootUpdatedFunction(MarkUpdateLaneFromFiberToRootResult, SyncLane1, p2)
	
	if MarkUpdateLaneFromFiberToRootResult == v1 then
		config1.warnAboutRenderPhaseUpdatesInDEV(p1)
		
		if ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch or bit32.band(Bits, 16) == 0 then
			NoLanes2 = MergeLanesFunction(NoLanes2, SyncLane1)
		end
		if v2 == 4 then
			config1.markRootSuspended(MarkUpdateLaneFromFiberToRootResult, NoLanes)
		end
	end
	local CurrentPriorityLevel = GetCurrentPriorityLevelFunction()
	
	if SyncLane1 == SyncLane then
		if bit32.band(Bits, 8) == 0 or bit32.band(Bits, 48) ~= 0 then
			Callback(MarkUpdateLaneFromFiberToRootResult, p2)
			config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane1)
			
			if Bits == 0 then
				v6 = NowFunction() + 500
				FlushSyncCallbackQueueFunction()
			end
		else
			config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane1)
			config1.performSyncWorkOnRoot(MarkUpdateLaneFromFiberToRootResult)
		end
	else
		if bit32.band(Bits, 4) ~= 0 and (CurrentPriorityLevel == UserBlockingPriority or CurrentPriorityLevel == ImmediatePriority) then
			if NewResult1 == nil then
				NewResult1 = Set.new({ MarkUpdateLaneFromFiberToRootResult })
			else
				NewResult1:add(MarkUpdateLaneFromFiberToRootResult)
			end
		end
		Callback(MarkUpdateLaneFromFiberToRootResult, p2)
		config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane1)
	end
	v4 = MarkUpdateLaneFromFiberToRootResult
	
	return MarkUpdateLaneFromFiberToRootResult
end

function config1.markUpdateLaneFromFiberToRoot(Return, SyncLane)
	-- upvalues: MergeLanesFunction (copy), DEV (copy), ReactFiberFlagsModule (copy), config1 (copy), ReactWorkTagsModule (copy)
	Return.lanes = MergeLanesFunction(Return.lanes, SyncLane)
	local Alternate = Return.alternate
	
	if Alternate ~= nil then
		Alternate.lanes = MergeLanesFunction(Alternate.lanes, SyncLane)
	end
	if DEV and Alternate == nil and bit32.band(Return.flags, (bit32.bor(ReactFiberFlagsModule.Placement, ReactFiberFlagsModule.Hydrating))) ~= ReactFiberFlagsModule.NoFlags then
		config1.warnAboutUpdateOnNotYetMountedFiberInDEV(Return)
	end
	local Return1 = Return
	local Return2 = Return.return_
	while Return2 ~= nil do
		Return2.childLanes = MergeLanesFunction(Return2.childLanes, SyncLane)
		local Alternate1 = Return2.alternate
		
		if Alternate1 == nil then
			if DEV and bit32.band(Return2.flags, (bit32.bor(ReactFiberFlagsModule.Placement, ReactFiberFlagsModule.Hydrating))) ~= ReactFiberFlagsModule.NoFlags then
				config1.warnAboutUpdateOnNotYetMountedFiberInDEV(Return)
			end
		else
			Alternate1.childLanes = MergeLanesFunction(Alternate1.childLanes, SyncLane)
		end
		Return1 = Return2
		Return2 = Return2.return_
	end
	return if Return1.tag == ReactWorkTagsModule.HostRoot then Return1.stateNode else nil
end

Callback = function(MarkUpdateLaneFromFiberToRootResult, RequestEventTimeResult)
	-- upvalues: MarkStarvedLanesAsExpiredFunction (copy), v1 (ref), NoLanes (ref), ReactFiberLaneModule (copy), GetNextLanesFunction (copy), ReturnNextLanesPriorityFunction (copy), CancelCallbackFunction (copy), ScheduleSyncCallbackFunction (copy), RobloxReactProfilingModule (copy), config1 (copy), ScheduleCallbackFunction (copy), ImmediatePriority (copy), LanePriorityToSchedulerPriorityFunction (copy)
	local CallbackNode = MarkUpdateLaneFromFiberToRootResult.callbackNode
	MarkStarvedLanesAsExpiredFunction(MarkUpdateLaneFromFiberToRootResult, RequestEventTimeResult)
	local NextLanes = GetNextLanesFunction(MarkUpdateLaneFromFiberToRootResult, if MarkUpdateLaneFromFiberToRootResult == v1 then NoLanes else ReactFiberLaneModule.NoLanes)
	local NextLanesPriority = ReturnNextLanesPriorityFunction()
	
	if NextLanes ~= ReactFiberLaneModule.NoLanes then
		if CallbackNode ~= nil then
			if MarkUpdateLaneFromFiberToRootResult.callbackPriority == NextLanesPriority then return end
			CancelCallbackFunction(CallbackNode)
		end
		MarkUpdateLaneFromFiberToRootResult.callbackPriority = NextLanesPriority
		MarkUpdateLaneFromFiberToRootResult.callbackNode = if NextLanesPriority == ReactFiberLaneModule.SyncLanePriority then ScheduleSyncCallbackFunction(function()
			-- upvalues: RobloxReactProfilingModule (upval), MarkUpdateLaneFromFiberToRootResult (copy), config1 (upval)
			local PerformSyncWorkOnRootResult = config1.performSyncWorkOnRoot(MarkUpdateLaneFromFiberToRootResult)
			RobloxReactProfilingModule.profileRootAfterYielding((RobloxReactProfilingModule.profileRootBeforeUnitOfWork(MarkUpdateLaneFromFiberToRootResult)))
			
			return PerformSyncWorkOnRootResult
		end) elseif NextLanesPriority == ReactFiberLaneModule.SyncBatchedLanePriority then ScheduleCallbackFunction(ImmediatePriority, function()
			-- upvalues: RobloxReactProfilingModule (upval), MarkUpdateLaneFromFiberToRootResult (copy), config1 (upval)
			local PerformSyncWorkOnRootResult = config1.performSyncWorkOnRoot(MarkUpdateLaneFromFiberToRootResult)
			RobloxReactProfilingModule.profileRootAfterYielding((RobloxReactProfilingModule.profileRootBeforeUnitOfWork(MarkUpdateLaneFromFiberToRootResult)))
			
			return PerformSyncWorkOnRootResult
		end) else ScheduleCallbackFunction(LanePriorityToSchedulerPriorityFunction(NextLanesPriority), function()
			-- upvalues: RobloxReactProfilingModule (upval), MarkUpdateLaneFromFiberToRootResult (copy), config1 (upval)
			local PerformConcurrentWorkOnRootResult = config1.performConcurrentWorkOnRoot(MarkUpdateLaneFromFiberToRootResult)
			RobloxReactProfilingModule.profileRootAfterYielding((RobloxReactProfilingModule.profileRootBeforeUnitOfWork(MarkUpdateLaneFromFiberToRootResult)))
			
			return PerformConcurrentWorkOnRootResult
		end)
		
		return
	elseif CallbackNode ~= nil then
		CancelCallbackFunction(CallbackNode)
		MarkUpdateLaneFromFiberToRootResult.callbackNode = nil
		MarkUpdateLaneFromFiberToRootResult.callbackPriority = ReactFiberLaneModule.NoLanePriority
	end
end

function config1.performConcurrentWorkOnRoot(p1)
	-- upvalues: NoTimestamp1 (ref), NoTimestamp (copy), NoLanes5 (ref), ReactFiberLaneModule (copy), NoLanes6 (ref), InvariantFunction (copy), Bits (ref), ReactFiberWorkLoopModule (copy), GetNextLanesFunction (copy), v1 (ref), NoLanes (ref), config1 (copy), IncludesSomeLaneFunction (copy), NoLanes1 (ref), NoLanes2 (ref), ReactFiberHostConfigModule (copy), GetLanesToRetrySynchronouslyOnErrorFunction (copy), v3 (ref), Callback (ref), NowFunction (copy), RobloxReactProfilingModule (copy)
	NoTimestamp1 = NoTimestamp
	NoLanes5 = ReactFiberLaneModule.NoLanes
	NoLanes6 = ReactFiberLaneModule.NoLanes
	InvariantFunction(bit32.band(Bits, 48) == 0, "Should not already be working.")
	local CallbackNode = p1.callbackNode
	
	if ReactFiberWorkLoopModule.flushPassiveEffects() and p1.callbackNode ~= CallbackNode then
		return nil
	end
	local NextLanes = GetNextLanesFunction(p1, if p1 == v1 then NoLanes else ReactFiberLaneModule.NoLanes)
	
	if NextLanes == ReactFiberLaneModule.NoLanes then
		return nil
	end
	local RenderRootConcurrentResult = config1.renderRootConcurrent(p1, NextLanes)
	
	if IncludesSomeLaneFunction(NoLanes1, NoLanes2) then
		config1.prepareFreshStack(p1, ReactFiberLaneModule.NoLanes)
	elseif RenderRootConcurrentResult ~= 0 then
		if RenderRootConcurrentResult == 2 then
			Bits = bit32.bor(Bits, 64)
			
			if p1.hydrate then
				p1.hydrate = false
				ReactFiberHostConfigModule.clearContainer(p1.containerInfo)
			end
			NextLanes = GetLanesToRetrySynchronouslyOnErrorFunction(p1)
			
			if NextLanes ~= ReactFiberLaneModule.NoLanes then
				RenderRootConcurrentResult = config1.renderRootSync(p1, NextLanes)
			end
		end
		if RenderRootConcurrentResult == 1 then
			local v11 = v3
			config1.prepareFreshStack(p1, ReactFiberLaneModule.NoLanes)
			config1.markRootSuspended(p1, NextLanes)
			Callback(p1, NowFunction())
			error(v11)
		end
		p1.finishedWork = p1.current.alternate
		p1.finishedLanes = NextLanes
		config1.finishConcurrentRender(p1, RenderRootConcurrentResult, NextLanes)
	end
	Callback(p1, NowFunction())
	
	return if p1.callbackNode == CallbackNode then function()
		-- upvalues: RobloxReactProfilingModule (upval), p1 (copy), config1 (upval)
		local PerformConcurrentWorkOnRootResult = config1.performConcurrentWorkOnRoot(p1)
		RobloxReactProfilingModule.profileRootAfterYielding((RobloxReactProfilingModule.profileRootBeforeUnitOfWork(p1)))
		
		return PerformConcurrentWorkOnRootResult
	end else nil
end

local Count2 = 0
local Enabled1 = false

function shouldForceFlushFallbacksInDEV(): boolean
	-- upvalues: DEV (copy), Count2 (ref)
	return DEV and Count2 > 0
end

function config1.finishConcurrentRender(p1, RenderRootConcurrentResult, FinishedLanes)
	-- upvalues: InvariantFunction (copy), config1 (copy), IncludesOnlyRetriesFunction (copy), v5 (ref), NowFunction (copy), GetNextLanesFunction (copy), ReactFiberLaneModule (copy), IsSubsetOfLanesFunction (copy), ReactFiberWorkLoopModule (copy), MarkRootPingedFunction (copy), ReactFiberHostConfigModule (copy), IncludesOnlyTransitionsFunction (copy)
	if RenderRootConcurrentResult == 0 or RenderRootConcurrentResult == 1 then
		InvariantFunction(false, "Root did not complete. This is a bug in React.")
		
		return
	end
	if RenderRootConcurrentResult == 2 then
		config1.commitRoot(p1)
		
		return
	end
	if RenderRootConcurrentResult == 3 then
		config1.markRootSuspended(p1, FinishedLanes)
		
		if IncludesOnlyRetriesFunction(FinishedLanes) and not shouldForceFlushFallbacksInDEV() then
			local v11 = v5 + 500 - NowFunction()
			
			if v11 > 10 then
				if GetNextLanesFunction(p1, ReactFiberLaneModule.NoLanes) ~= ReactFiberLaneModule.NoLanes then return end
				local SuspendedLanes = p1.suspendedLanes
				
				if IsSubsetOfLanesFunction(SuspendedLanes, FinishedLanes) then
					p1.timeoutHandle = ReactFiberHostConfigModule.scheduleTimeout(function()
						-- upvalues: config1 (upval), p1 (copy)
						return config1.commitRoot(p1)
					end, v11)
					
					return
				else
					MarkRootPingedFunction(p1, SuspendedLanes, (ReactFiberWorkLoopModule.requestEventTime()))
					
					return
				end
			end
		end
		config1.commitRoot(p1)
		
		return
	elseif RenderRootConcurrentResult == 4 then
		config1.markRootSuspended(p1, FinishedLanes)
		
		if IncludesOnlyTransitionsFunction(FinishedLanes) then return end
		if not shouldForceFlushFallbacksInDEV() then
			local NowResultDelta = NowFunction() - ReactFiberLaneModule.getMostRecentEventTime(p1, FinishedLanes)
			local JndResultDelta = jnd(NowResultDelta) - NowResultDelta
			
			if JndResultDelta > 10 then
				p1.timeoutHandle = ReactFiberHostConfigModule.scheduleTimeout(function()
					-- upvalues: config1 (upval), p1 (copy)
					return config1.commitRoot(p1)
				end, JndResultDelta)
				
				return
			end
		end
		config1.commitRoot(p1)
		
		return
	elseif RenderRootConcurrentResult == 5 then
		config1.commitRoot(p1)
		
		return
	else
		InvariantFunction(false, "Unknown root exit status.")
	end
end

function config1.markRootSuspended(MarkUpdateLaneFromFiberToRootResult, FinishedLanes)
	-- upvalues: RemoveLanesFunction (copy), NoLanes3 (ref), NoLanes2 (ref), ReactFiberLaneModule (copy)
	ReactFiberLaneModule.markRootSuspended(MarkUpdateLaneFromFiberToRootResult, (RemoveLanesFunction(RemoveLanesFunction(FinishedLanes, NoLanes3), NoLanes2)))
end

function config1.performSyncWorkOnRoot(MarkUpdateLaneFromFiberToRootResult)
	-- upvalues: InvariantFunction (copy), Bits (ref), ReactFiberWorkLoopModule (copy), v1 (ref), IncludesSomeLaneFunction (copy), NoLanes (ref), config1 (copy), NoLanes1 (ref), NoLanes2 (ref), GetNextLanesFunction (copy), ReactFiberLaneModule (copy), LegacyRoot (copy), ReactFiberHostConfigModule (copy), GetLanesToRetrySynchronouslyOnErrorFunction (copy), v3 (ref), Callback (ref), NowFunction (copy)
	InvariantFunction(bit32.band(Bits, 48) == 0, "Should not already be working.")
	ReactFiberWorkLoopModule.flushPassiveEffects()
	local NextLanes = nil
	local RenderRootSyncResult = nil
	
	if MarkUpdateLaneFromFiberToRootResult == v1 and IncludesSomeLaneFunction(MarkUpdateLaneFromFiberToRootResult.expiredLanes, NoLanes) then
		NextLanes = NoLanes
		RenderRootSyncResult = config1.renderRootSync(MarkUpdateLaneFromFiberToRootResult, NextLanes)
		
		if IncludesSomeLaneFunction(NoLanes1, NoLanes2) then
			NextLanes = GetNextLanesFunction(MarkUpdateLaneFromFiberToRootResult, NextLanes)
			RenderRootSyncResult = config1.renderRootSync(MarkUpdateLaneFromFiberToRootResult, NextLanes)
		end
	else
		NextLanes = GetNextLanesFunction(MarkUpdateLaneFromFiberToRootResult, ReactFiberLaneModule.NoLanes)
		RenderRootSyncResult = config1.renderRootSync(MarkUpdateLaneFromFiberToRootResult, NextLanes)
	end
	if MarkUpdateLaneFromFiberToRootResult.tag ~= LegacyRoot and RenderRootSyncResult == 2 then
		Bits = bit32.bor(Bits, 64)
		
		if MarkUpdateLaneFromFiberToRootResult.hydrate then
			MarkUpdateLaneFromFiberToRootResult.hydrate = false
			ReactFiberHostConfigModule.clearContainer(MarkUpdateLaneFromFiberToRootResult.containerInfo)
		end
		NextLanes = GetLanesToRetrySynchronouslyOnErrorFunction(MarkUpdateLaneFromFiberToRootResult)
		
		if NextLanes ~= ReactFiberLaneModule.NoLanes then
			RenderRootSyncResult = config1.renderRootSync(MarkUpdateLaneFromFiberToRootResult, NextLanes)
		end
	end
	if RenderRootSyncResult == 1 then
		local v11 = v3
		config1.prepareFreshStack(MarkUpdateLaneFromFiberToRootResult, ReactFiberLaneModule.NoLanes)
		config1.markRootSuspended(MarkUpdateLaneFromFiberToRootResult, NextLanes)
		Callback(MarkUpdateLaneFromFiberToRootResult, NowFunction())
		error(v11)
	end
	MarkUpdateLaneFromFiberToRootResult.finishedWork = MarkUpdateLaneFromFiberToRootResult.current.alternate
	MarkUpdateLaneFromFiberToRootResult.finishedLanes = NextLanes
	config1.commitRoot(MarkUpdateLaneFromFiberToRootResult)
	Callback(MarkUpdateLaneFromFiberToRootResult, NowFunction())
	
	return nil
end

function ReactFiberWorkLoopModule.flushRoot(p1, p2)
	-- upvalues: MarkRootExpiredFunction (copy), Callback (ref), NowFunction (copy), Bits (ref), v6 (ref), FlushSyncCallbackQueueFunction (copy)
	MarkRootExpiredFunction(p1, p2)
	Callback(p1, NowFunction())
	
	if bit32.band(Bits, 48) == 0 then
		v6 = NowFunction() + 500
		FlushSyncCallbackQueueFunction()
	end
end

function ReactFiberWorkLoopModule.getExecutionContext()
	-- upvalues: Bits (ref)
	return Bits
end

function ReactFiberWorkLoopModule.flushDiscreteUpdates()
	-- upvalues: Bits (ref), DEV (copy), Console (copy), config1 (copy), ReactFiberWorkLoopModule (copy)
	if bit32.band(Bits, 49) == 0 then
		config1.flushPendingDiscreteUpdates()
		ReactFiberWorkLoopModule.flushPassiveEffects()
		
		return
	end
	if DEV and bit32.band(Bits, 16) ~= 0 then
		Console.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
	end
end

function ReactFiberWorkLoopModule.deferredUpdates(p1)
	-- upvalues: ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), YOLO (copy), SetCurrentUpdateLanePriorityFunction (copy), ReactFiberLaneModule (copy), RunWithPriorityFunction (copy), DescribeError (copy), NormalPriority (copy)
	if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return RunWithPriorityFunction(NormalPriority, p1)
	end
	local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
	local Success = nil
	local Result = nil
	
	if YOLO then
		Success = true
		SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.DefaultLanePriority)
		Result = RunWithPriorityFunction(NormalPriority, p1)
	else
		SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.DefaultLanePriority)
		Success, Result = xpcall(RunWithPriorityFunction, DescribeError, NormalPriority, p1)
	end
	SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
	
	if Success then
		return Result
	else
		error(Result)
	end
end

function config1.flushPendingDiscreteUpdates()
	-- upvalues: NewResult1 (ref), MarkDiscreteUpdatesExpiredFunction (copy), Callback (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	if NewResult1 ~= nil then
		local NewResult = NewResult1
		NewResult1 = nil
		NewResult:forEach(function(p1)
			-- upvalues: MarkDiscreteUpdatesExpiredFunction (upval), Callback (upval), NowFunction (upval)
			MarkDiscreteUpdatesExpiredFunction(p1)
			Callback(p1, NowFunction())
		end)
	end
	FlushSyncCallbackQueueFunction()
end

function ReactFiberWorkLoopModule.batchedUpdates(Callback, p1)
	-- upvalues: Bits (ref), YOLO (copy), DescribeError (copy), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 1)
	local Success = nil
	local Result = nil
	
	if YOLO then
		Success = true
		Result = Callback(p1)
	else
		Success, Result = xpcall(Callback, DescribeError, p1)
	end
	Bits = Bits1
	
	if Bits == 0 then
		v6 = NowFunction() + 500
		FlushSyncCallbackQueueFunction()
	end
	if Success then
		return Result
	else
		error(Result)
	end
end

function ReactFiberWorkLoopModule.batchedEventUpdates(Callback, p1)
	-- upvalues: Bits (ref), YOLO (copy), DescribeError (copy), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 2)
	local Success = nil
	local Result = nil
	
	if YOLO then
		Success = true
		Result = Callback(p1)
	else
		Success, Result = xpcall(Callback, DescribeError, p1)
	end
	Bits = Bits1
	
	if Bits == 0 then
		v6 = NowFunction() + 500
		FlushSyncCallbackQueueFunction()
	end
	if Success then
		return Result
	else
		error(Result)
	end
end

function ReactFiberWorkLoopModule.discreteUpdates(Callback, p1, p2, p3, p4)
	-- upvalues: Bits (ref), ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), ReactFiberLaneModule (copy), RunWithPriorityFunction (copy), DescribeError (copy), UserBlockingPriority (copy), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 4)
	
	if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
		SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.InputDiscreteLanePriority)
		local Success, Result = xpcall(RunWithPriorityFunction, DescribeError, UserBlockingPriority, function()
			-- upvalues: Callback (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy)
			return Callback(p1, p2, p3, p4)
		end)
		SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
		Bits = Bits1
		
		if Bits == 0 then
			v6 = NowFunction() + 500
			FlushSyncCallbackQueueFunction()
		end
		if Success then
			return Result
		else
			error(Result)
			
			return
		end
	else
		local Success1, Result1 = xpcall(RunWithPriorityFunction, DescribeError, UserBlockingPriority, function()
			-- upvalues: Callback (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy)
			return Callback(p1, p2, p3, p4)
		end)
		Bits = Bits1
		
		if Bits == 0 then
			v6 = NowFunction() + 500
			FlushSyncCallbackQueueFunction()
		end
		if Success1 then
			return Result1
		else
			error(Result1)
		end
	end
end

function ReactFiberWorkLoopModule.unbatchedUpdates(Callback, p1)
	-- upvalues: Bits (ref), YOLO (copy), DescribeError (copy), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	local Bits1: number = Bits
	Bits = bit32.band(Bits, 4294967294)
	Bits = bit32.bor(Bits, 8)
	local Success = nil
	local Result = nil
	
	if YOLO then
		Success = true
		Result = Callback(p1)
	else
		Success, Result = xpcall(Callback, DescribeError, p1)
	end
	Bits = Bits1
	
	if Bits == 0 then
		v6 = NowFunction() + 500
		FlushSyncCallbackQueueFunction()
	end
	if Success then
		return Result
	else
		error(Result)
	end
end

function ReactFiberWorkLoopModule.flushSync(Callback, p1)
	-- upvalues: Bits (ref), DEV (copy), Console (copy), ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), ReactFiberLaneModule (copy), YOLO (copy), RunWithPriorityFunction (copy), DescribeError (copy), ImmediatePriority (copy), FlushSyncCallbackQueueFunction (copy)
	local Value: number = Bits
	
	if bit32.band(Value, 48) == 0 then
		Bits = bit32.bor(Bits, 1)
		
		if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
			local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
			SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.SyncLanePriority)
			local RunWithPriorityResult = nil
			local Flag = nil
			
			if YOLO then
				Flag = true
				SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.SyncLanePriority)
				RunWithPriorityResult = if Callback then RunWithPriorityFunction(ImmediatePriority, function()
					-- upvalues: Callback (copy), p1 (copy)
					return Callback(p1)
				end) else nil
			elseif Callback then
				Flag, RunWithPriorityResult = xpcall(RunWithPriorityFunction, DescribeError, ImmediatePriority, function()
					-- upvalues: Callback (copy), p1 (copy)
					return Callback(p1)
				end)
			else
				Flag = true
				RunWithPriorityResult = nil
			end
			SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
			Bits = Value
			FlushSyncCallbackQueueFunction()
			
			if not Flag then
				error(RunWithPriorityResult)
			end
			return RunWithPriorityResult
		else
			local RunWithPriorityResult = nil
			local Flag = nil
			if YOLO then
				Flag = true
				RunWithPriorityResult = if Callback then RunWithPriorityFunction(ImmediatePriority, function()
					-- upvalues: Callback (copy), p1 (copy)
					return Callback(p1)
				end) else nil
			elseif Callback then
				Flag, RunWithPriorityResult = xpcall(RunWithPriorityFunction, DescribeError, ImmediatePriority, function()
					-- upvalues: Callback (copy), p1 (copy)
					return Callback(p1)
				end)
			else
				Flag = true
				RunWithPriorityResult = nil
			end
			Bits = Value
			FlushSyncCallbackQueueFunction()
			
			if not Flag then
				error(RunWithPriorityResult)
			end
			return RunWithPriorityResult
		end
	else
		if DEV then
			Console.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
		end
		return Callback(p1)
	end
end

function ReactFiberWorkLoopModule.flushControlled(p1)
	-- upvalues: Bits (ref), ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), ReactFiberLaneModule (copy), RunWithPriorityFunction (copy), DescribeError (copy), ImmediatePriority (copy), v6 (ref), NowFunction (copy), FlushSyncCallbackQueueFunction (copy)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 1)
	
	if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
		SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.SyncLanePriority)
		local Success, Result = xpcall(RunWithPriorityFunction, DescribeError, ImmediatePriority, p1)
		SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
		Bits = Bits1
		
		if Bits == 0 then
			v6 = NowFunction() + 500
			FlushSyncCallbackQueueFunction()
		end
		if not Success then
			error(Result)
			
			return
		end
	else
		local Success1, Result1 = xpcall(RunWithPriorityFunction, DescribeError, ImmediatePriority, p1)
		Bits = Bits1
		
		if Bits == 0 then
			v6 = NowFunction() + 500
			FlushSyncCallbackQueueFunction()
		end
		if not Success1 then
			error(Result1)
		end
	end
end

function ReactFiberWorkLoopModule.pushRenderLanes(p1, p2)
	-- upvalues: PushFunction (copy), Cursor (copy), ReactFiberWorkLoopModule (copy), MergeLanesFunction (copy), NoLanes1 (ref)
	PushFunction(Cursor, ReactFiberWorkLoopModule.subtreeRenderLanes, p1)
	ReactFiberWorkLoopModule.subtreeRenderLanes = MergeLanesFunction(ReactFiberWorkLoopModule.subtreeRenderLanes, p2)
	NoLanes1 = MergeLanesFunction(NoLanes1, p2)
end

function ReactFiberWorkLoopModule.popRenderLanes(p1)
	-- upvalues: ReactFiberWorkLoopModule (copy), Cursor (copy), PopFunction (copy)
	ReactFiberWorkLoopModule.subtreeRenderLanes = Cursor.current
	PopFunction(Cursor, p1)
end

function config1.prepareFreshStack(p1, NoLanes4)
	-- upvalues: ReactFiberLaneModule (copy), ReactFiberHostConfigModule (copy), WorkInProgress (ref), UnwindInterruptedWorkFunction (copy), v1 (ref), ReactFiberNewModule (copy), NoLanes (ref), ReactFiberWorkLoopModule (copy), NoLanes1 (ref), v2 (ref), v3 (ref), WorkInProgressRootSkippedLanesFunction (copy), NoLanes2 (ref), NoLanes3 (ref), ReactFeatureFlags (copy), List (ref), DEV (copy), ReactStrictModeWarningsNewModule (copy)
	p1.finishedWork = nil
	p1.finishedLanes = ReactFiberLaneModule.NoLanes
	local TimeoutHandle = p1.timeoutHandle
	
	if TimeoutHandle ~= ReactFiberHostConfigModule.noTimeout then
		p1.timeoutHandle = ReactFiberHostConfigModule.noTimeout
		ReactFiberHostConfigModule.cancelTimeout(TimeoutHandle)
	end
	if WorkInProgress ~= nil then
		local Return = WorkInProgress.return_
		while Return ~= nil do
			UnwindInterruptedWorkFunction(Return)
			Return = Return.return_
		end
	end
	v1 = p1
	WorkInProgress = ReactFiberNewModule.createWorkInProgress(p1.current, nil)
	NoLanes = NoLanes4
	ReactFiberWorkLoopModule.subtreeRenderLanes = NoLanes4
	NoLanes1 = NoLanes4
	v2 = 0
	v3 = nil
	WorkInProgressRootSkippedLanesFunction(ReactFiberLaneModule.NoLanes)
	NoLanes2 = ReactFiberLaneModule.NoLanes
	NoLanes3 = ReactFiberLaneModule.NoLanes
	
	if ReactFeatureFlags.enableSchedulerTracing then
		List = nil
	end
	if DEV then
		ReactStrictModeWarningsNewModule.discardPendingWarnings()
	end
end

function config1.handleError(p2, p3)
	-- upvalues: WorkInProgress (ref), ResetContextDependenciesFunction (copy), config (copy), ReactFiberHooksNewModule (ref), ResetCurrentFiberFunction (copy), ReactCurrentOwner (copy), v2 (ref), v3 (ref), ReactFeatureFlags (copy), ReactTypeOfModeModule (copy), ReactProfilerTimerNewModule (copy), ThrowExceptionFunction (copy), NoLanes (ref), ReactFiberWorkLoopModule (copy), config1 (copy)
	while true do
		local Return = WorkInProgress
		local Success, Result = pcall(function()
			-- upvalues: ResetContextDependenciesFunction (upval), config (upval), ReactFiberHooksNewModule (upval), ResetCurrentFiberFunction (upval), ReactCurrentOwner (upval), Return (ref), v2 (upval), v3 (upval), p3 (ref), WorkInProgress (upval), ReactFeatureFlags (upval), ReactTypeOfModeModule (upval), ReactProfilerTimerNewModule (upval), ThrowExceptionFunction (upval), p2 (copy), NoLanes (upval), ReactFiberWorkLoopModule (upval), config1 (upval)
			ResetContextDependenciesFunction()
			
			if not config.resetHooksAfterThrowRef then
				ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
				config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
				config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
				config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = config.resetHooksAfterThrowRef()
			ResetCurrentFiberFunction()
			ReactCurrentOwner.current = nil
			
			if Return == nil or Return.return_ == nil then
				v2 = 1
				v3 = p3
				WorkInProgress = nil
				
				return
			end
			if ReactFeatureFlags.enableProfilerTimer and bit32.band(Return.mode, ReactTypeOfModeModule.ProfileMode) ~= 0 then
				ReactProfilerTimerNewModule.stopProfilerTimerIfRunningAndRecordDelta(Return, true)
			end
			ThrowExceptionFunction(p2, Return.return_, Return, p3, NoLanes, ReactFiberWorkLoopModule.onUncaughtError, ReactFiberWorkLoopModule.renderDidError)
			config1.completeUnitOfWork(Return)
		end)
		if Success then return end
		p3 = Result
		
		if WorkInProgress == Return and Return ~= nil then
			Return = Return.return_
			WorkInProgress = Return
		else
			Return = WorkInProgress
		end
	end
end

function config1.pushDispatcher()
	-- upvalues: ReactCurrentDispatcher (copy), config (copy), ReactFiberHooksNewModule (ref)
	local Current = ReactCurrentDispatcher.current
	
	if not config.ContextOnlyDispatcherRef then
		ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
		config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
		config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	ReactCurrentDispatcher.current = config.ContextOnlyDispatcherRef
	
	if Current ~= nil then
		return Current
	end
	if not config.ContextOnlyDispatcherRef then
		ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
		config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
		config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
		config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
	end
	return config.ContextOnlyDispatcherRef
end

function config1.popDispatcher(PushDispatcherResult)
	-- upvalues: ReactCurrentDispatcher (copy)
	ReactCurrentDispatcher.current = PushDispatcherResult
end

function config1.pushInteractions(p4)
	-- upvalues: ReactFeatureFlags (copy), InteractionsRef (copy)
	if ReactFeatureFlags.enableSchedulerTracing then
		local Current = InteractionsRef.current
		InteractionsRef.current = p4.memoizedInteractions
		
		return Current
	else
		return nil
	end
end

function config1.popInteractions(PushInteractionsResult)
	-- upvalues: ReactFeatureFlags (copy), InteractionsRef (copy)
	if ReactFeatureFlags.enableSchedulerTracing then
		InteractionsRef.current = PushInteractionsResult
	end
end

function ReactFiberWorkLoopModule.markCommitTimeOfFallback()
	-- upvalues: v5 (ref), NowFunction (copy)
	v5 = NowFunction()
end

function ReactFiberWorkLoopModule.markSkippedUpdateLanes(p4)
	-- upvalues: ReactFiberWorkInProgressModule (copy)
	ReactFiberWorkInProgressModule.markSkippedUpdateLanes(p4)
end

function ReactFiberWorkLoopModule.renderDidSuspend()
	-- upvalues: v2 (ref)
	if v2 == 0 then
		v2 = 3
	end
end

function ReactFiberWorkLoopModule.renderDidSuspendDelayIfPossible()
	-- upvalues: v2 (ref), v1 (ref), IncludesNonIdleWorkFunction (copy), WorkInProgressRootSkippedLanesFunction (copy), NoLanes2 (ref), config1 (copy), NoLanes (ref)
	if v2 == 0 or v2 == 3 then
		v2 = 4
	end
	if v1 ~= nil and (IncludesNonIdleWorkFunction(WorkInProgressRootSkippedLanesFunction()) or IncludesNonIdleWorkFunction(NoLanes2)) then
		config1.markRootSuspended(v1, NoLanes)
	end
end

function ReactFiberWorkLoopModule.renderDidError()
	-- upvalues: v2 (ref)
	if v2 ~= 5 then
		v2 = 2
	end
end

function ReactFiberWorkLoopModule.renderHasNotSuspendedYet(): boolean
	-- upvalues: v2 (ref)
	return v2 == 0
end

function config1.renderRootSync(p4, FinishedLanes)
	-- upvalues: Bits (ref), config1 (copy), v1 (ref), NoLanes (ref), DEV (copy), EnableDebugTracing (copy), DebugTracingModule (copy), EnableSchedulingProfiler (copy), SchedulingProfilerModule (copy), YOLO (copy), DescribeError (copy), ResetContextDependenciesFunction (copy), ReactFeatureFlags (copy), WorkInProgress (ref), InvariantFunction (copy), ReactFiberLaneModule (copy), v2 (ref)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 16)
	local PushDispatcherResult = config1.pushDispatcher()
	
	if v1 ~= p4 or NoLanes ~= FinishedLanes then
		config1.prepareFreshStack(p4, FinishedLanes)
		config1.startWorkOnPendingInteractions(p4, FinishedLanes)
	end
	local PushInteractionsResult = config1.pushInteractions(p4)
	
	if DEV and EnableDebugTracing then
		DebugTracingModule.logRenderStarted(FinishedLanes)
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markRenderStarted(FinishedLanes)
	end
	local Success = nil
	while true do
		local v11 = nil
		if YOLO then
			Success = true
			config1.workLoopSync()
		else
			Success, v188 = xpcall(config1.workLoopSync, DescribeError)
		end
		if Success then break end
		config1.handleError(p4, v11)
	end
	ResetContextDependenciesFunction()
	
	if ReactFeatureFlags.enableSchedulerTracing then
		config1.popInteractions(PushInteractionsResult)
	end
	Bits = Bits1
	config1.popDispatcher(PushDispatcherResult)
	
	if WorkInProgress ~= nil then
		InvariantFunction(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
	end
	if DEV and EnableDebugTracing then
		DebugTracingModule.logRenderStopped()
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markRenderStopped()
	end
	v1 = nil
	NoLanes = ReactFiberLaneModule.NoLanes
	
	return v2
end

function config1.workLoopSync()
	-- upvalues: WorkInProgress (ref), config1 (copy)
	while WorkInProgress ~= nil do
		config1.performUnitOfWork(WorkInProgress)
	end
end

function config1.renderRootConcurrent(p5, FinishedLanes)
	-- upvalues: Bits (ref), config1 (copy), v1 (ref), NoLanes (ref), v6 (ref), NowFunction (copy), DEV (copy), EnableDebugTracing (copy), DebugTracingModule (copy), EnableSchedulingProfiler (copy), SchedulingProfilerModule (copy), YOLO (copy), DescribeError (copy), ResetContextDependenciesFunction (copy), ReactFeatureFlags (copy), WorkInProgress (ref), ReactFiberLaneModule (copy), v2 (ref)
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 16)
	local PushDispatcherResult = config1.pushDispatcher()
	
	if v1 ~= p5 or NoLanes ~= FinishedLanes then
		v6 = NowFunction() + 500
		config1.prepareFreshStack(p5, FinishedLanes)
		config1.startWorkOnPendingInteractions(p5, FinishedLanes)
	end
	local PushInteractionsResult = config1.pushInteractions(p5)
	
	if DEV and EnableDebugTracing then
		DebugTracingModule.logRenderStarted(FinishedLanes)
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markRenderStarted(FinishedLanes)
	end
	local Success = nil
	local Result = nil
	while true do
		if YOLO then
			Success = true
			Result = "break"
			config1.workLoopConcurrent()
		else
			Success, Result = xpcall(config1.workLoopConcurrent, DescribeError)
			
			if Success then
				Result = "break"
			end
		end
		if Result == "break" then break end
		if not Success then
			config1.handleError(p5, Result)
		end
	end
	ResetContextDependenciesFunction()
	
	if ReactFeatureFlags.enableSchedulerTracing then
		config1.popInteractions(PushInteractionsResult)
	end
	config1.popDispatcher(PushDispatcherResult)
	Bits = Bits1
	
	if DEV and EnableDebugTracing then
		DebugTracingModule.logRenderStopped()
	end
	if WorkInProgress == nil then
		if EnableSchedulingProfiler then
			SchedulingProfilerModule.markRenderStopped()
		end
		v1 = nil
		NoLanes = ReactFiberLaneModule.NoLanes
		
		return v2
	else
		if EnableSchedulingProfiler then
			SchedulingProfilerModule.markRenderYielded()
		end
		return 0
	end
end

function config1.workLoopConcurrent()
	-- upvalues: WorkInProgress (ref), ShouldYield (copy), config1 (copy)
	while WorkInProgress ~= nil and not ShouldYield() do
		config1.performUnitOfWork(WorkInProgress)
	end
end

if ReactFeatureFlags.enableWorkLoopTrims then
	function config1.performUnitOfWork(WorkInProgress1)
		-- upvalues: RobloxReactProfilingModule (copy), DEV (copy), SetCurrentFiberFunction (copy), ReactFeatureFlags (copy), ReactTypeOfModeModule (copy), ReactProfilerTimerNewModule (copy), config1 (copy), ReactFiberWorkLoopModule (copy), ResetCurrentFiberFunction (copy), WorkInProgress (ref), ReactCurrentOwner (copy)
		local EnableUnitOfWorkProfiling = RobloxReactProfilingModule.enableUnitOfWorkProfiling
		local ProfileUnitOfWorkBeforeResult = if EnableUnitOfWorkProfiling then RobloxReactProfilingModule.profileUnitOfWorkBefore(WorkInProgress1) else nil
		local Alternate = WorkInProgress1.alternate
		
		if DEV then
			SetCurrentFiberFunction(WorkInProgress1)
		end
		local BeginWorkResult = nil
		if ReactFeatureFlags.enableProfilerTimer and bit32.band(WorkInProgress1.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
			ReactProfilerTimerNewModule.startProfilerTimer(WorkInProgress1)
			BeginWorkResult = config1.beginWork(Alternate, WorkInProgress1, ReactFiberWorkLoopModule.subtreeRenderLanes)
			ReactProfilerTimerNewModule.stopProfilerTimerIfRunningAndRecordDelta(WorkInProgress1, true)
		else
			BeginWorkResult = config1.beginWork(Alternate, WorkInProgress1, ReactFiberWorkLoopModule.subtreeRenderLanes)
		end
		if DEV then
			ResetCurrentFiberFunction()
		end
		WorkInProgress1.memoizedProps = WorkInProgress1.pendingProps
		
		if BeginWorkResult == nil then
			config1.completeUnitOfWork(WorkInProgress1)
		else
			WorkInProgress = BeginWorkResult
		end
		ReactCurrentOwner.current = nil
		
		if EnableUnitOfWorkProfiling then
			RobloxReactProfilingModule.profileUnitOfWorkAfter(ProfileUnitOfWorkBeforeResult)
		end
	end
else
	function config1.performUnitOfWork(p6)
		-- upvalues: RobloxReactProfilingModule (copy), SetCurrentFiberFunction (copy), ReactFeatureFlags (copy), ReactTypeOfModeModule (copy), ReactProfilerTimerNewModule (copy), config1 (copy), ReactFiberWorkLoopModule (copy), ResetCurrentFiberFunction (copy), WorkInProgress (ref), ReactCurrentOwner (copy)
		local ProfileUnitOfWorkBeforeResult = RobloxReactProfilingModule.profileUnitOfWorkBefore(p6)
		local Alternate = p6.alternate
		SetCurrentFiberFunction(p6)
		local BeginWorkResult = nil
		
		if ReactFeatureFlags.enableProfilerTimer and bit32.band(p6.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
			ReactProfilerTimerNewModule.startProfilerTimer(p6)
			BeginWorkResult = config1.beginWork(Alternate, p6, ReactFiberWorkLoopModule.subtreeRenderLanes)
			ReactProfilerTimerNewModule.stopProfilerTimerIfRunningAndRecordDelta(p6, true)
		else
			BeginWorkResult = config1.beginWork(Alternate, p6, ReactFiberWorkLoopModule.subtreeRenderLanes)
		end
		ResetCurrentFiberFunction()
		p6.memoizedProps = p6.pendingProps
		
		if BeginWorkResult == nil then
			config1.completeUnitOfWork(p6)
		else
			WorkInProgress = BeginWorkResult
		end
		ReactCurrentOwner.current = nil
		RobloxReactProfilingModule.profileUnitOfWorkAfter(ProfileUnitOfWorkBeforeResult)
	end
end
function config1.completeUnitOfWork(Return)
	-- upvalues: ReactFiberFlagsModule (copy), ReactFeatureFlags (copy), DEV (copy), SetCurrentFiberFunction (copy), ReactTypeOfModeModule (copy), ReactFiberWorkLoopModule (copy), config (copy), ReactProfilerTimerNewModule (copy), ResetCurrentFiberFunction (copy), WorkInProgress (ref), UnwindWorkFunction (copy), v2 (ref)
	local Return1 = Return
	local Sibling = nil
	local UnwindWorkResult = nil
	local CompleteWorkRefResult = nil
	repeat
		local Alternate = Return1.alternate
		local Return4 = Return1.return_
		if bit32.band(Return1.flags, ReactFiberFlagsModule.Incomplete) == ReactFiberFlagsModule.NoFlags then
			if ReactFeatureFlags.enableWorkLoopTrims then
				if DEV then
					SetCurrentFiberFunction(Return1)
				end
			else
				SetCurrentFiberFunction(Return1)
			end
			if ReactFeatureFlags.enableProfilerTimer and bit32.band(Return1.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
				ReactProfilerTimerNewModule.startProfilerTimer(Return1)
				local Return3 = Return1
				local SubtreeRenderLanes1 = ReactFiberWorkLoopModule.subtreeRenderLanes
				
				if not config.completeWorkRef then
					config.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
				end
				CompleteWorkRefResult = config.completeWorkRef(Alternate, Return3, SubtreeRenderLanes1)
				ReactProfilerTimerNewModule.stopProfilerTimerIfRunningAndRecordDelta(Return1, false)
			else
				local Return2 = Return1
				local SubtreeRenderLanes = ReactFiberWorkLoopModule.subtreeRenderLanes
				
				if not config.completeWorkRef then
					config.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork
				end
				CompleteWorkRefResult = config.completeWorkRef(Alternate, Return2, SubtreeRenderLanes)
			end
			if ReactFeatureFlags.enableWorkLoopTrims then
				if DEV then
					ResetCurrentFiberFunction()
				end
			else
				ResetCurrentFiberFunction()
			end
			if CompleteWorkRefResult ~= nil then
				WorkInProgress = CompleteWorkRefResult
				
				return
			end
		else
			UnwindWorkResult = UnwindWorkFunction(Return1, ReactFiberWorkLoopModule.subtreeRenderLanes)
			
			if UnwindWorkResult ~= nil then
				UnwindWorkResult.flags = bit32.band(UnwindWorkResult.flags, ReactFiberFlagsModule.HostEffectMask)
				WorkInProgress = UnwindWorkResult
				
				return
			elseif ReactFeatureFlags.enableProfilerTimer and bit32.band(Return1.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
				ReactProfilerTimerNewModule.stopProfilerTimerIfRunningAndRecordDelta(Return1, false)
				local ActualDuration = Return1.actualDuration or 0
				local Child = Return1.child
				while Child ~= nil do
					ActualDuration += Child.actualDuration or 0
					Child = Child.sibling
				end
				Return1.actualDuration = ActualDuration
			end
			if Return4 ~= nil then
				Return4.flags = bit32.bor(Return4.flags, ReactFiberFlagsModule.Incomplete)
				Return4.subtreeFlags = ReactFiberFlagsModule.NoFlags
				Return4.deletions = nil
			end
		end
		Sibling = Return1.sibling
		
		if Sibling ~= nil then
			WorkInProgress = Sibling
			
			return
		end
		Return1 = Return4
		WorkInProgress = Return1
	until Return1 == nil
	if v2 == 0 then
		v2 = 5
	end
end

function config1.commitRoot(p6)
	-- upvalues: GetCurrentPriorityLevelFunction (copy), RunWithPriorityFunction (copy), ImmediatePriority (copy), RobloxReactProfilingModule (copy), config1 (copy)
	local CurrentPriorityLevel = GetCurrentPriorityLevelFunction()
	RunWithPriorityFunction(ImmediatePriority, function()
		-- upvalues: RobloxReactProfilingModule (upval), config1 (upval), p6 (copy), CurrentPriorityLevel (copy)
		RobloxReactProfilingModule.profileCommitBefore()
		local CommitRootImplResult = config1.commitRootImpl(p6, CurrentPriorityLevel)
		RobloxReactProfilingModule.profileCommitAfter()
		
		return CommitRootImplResult
	end)
	
	return nil
end

function config1.commitRootImpl(p6, p7)
	-- upvalues: ReactFiberWorkLoopModule (copy), v9 (ref), InvariantFunction (copy), Bits (ref), DEV (copy), EnableDebugTracing (copy), DebugTracingModule (copy), EnableSchedulingProfiler (copy), SchedulingProfilerModule (copy), ReactFiberLaneModule (copy), MergeLanesFunction (copy), MarkRootFinishedFunction (copy), NewResult1 (ref), HasDiscreteLanesFunction (copy), v1 (ref), WorkInProgress (ref), NoLanes (ref), ReactFiberFlagsModule (copy), ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), config1 (copy), ReactCurrentOwner (copy), Flag1 (ref), ScheduleCallbackFunction (copy), NormalPriority (copy), PrepareForCommitResult (ref), ReactFiberHostConfigModule (copy), Flag2 (ref), ReactProfilerTimerNewModule (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), RecursivelyCommitLayoutEffectsFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), Callback1 (ref), ResetCurrentFiberFunction (copy), YOLO (copy), DescribeError (copy), RequestPaintFunction (copy), NoLanes4 (ref), NoPriority1 (ref), List (ref), NewResult (ref), EnableDoubleInvokingEffects (copy), SyncLane (copy), v10 (ref), Count (ref), OnCommitRootFunction (copy), OnCommitRootFunction1 (copy), Callback (ref), NowFunction (copy), Flag (ref), v8 (ref), FlushSyncCallbackQueueFunction (copy)
	repeat
		ReactFiberWorkLoopModule.flushPassiveEffects()
	until v9 == nil
	flushRenderPhaseStrictModeWarningsInDEV()
	InvariantFunction(bit32.band(Bits, 48) == 0, "Should not already be working.")
	local FinishedWork = p6.finishedWork
	local FinishedLanes = p6.finishedLanes
	
	if DEV and EnableDebugTracing then
		DebugTracingModule.logCommitStarted(FinishedLanes)
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markCommitStarted(FinishedLanes)
	end
	if FinishedWork == nil then
		if DEV and EnableDebugTracing then
			DebugTracingModule.logCommitStopped()
		end
		if EnableSchedulingProfiler then
			SchedulingProfilerModule.markCommitStopped(p6)
		end
		return nil
	else
		p6.finishedWork = nil
		p6.finishedLanes = ReactFiberLaneModule.NoLanes
		InvariantFunction(FinishedWork ~= p6.current, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.")
		p6.callbackNode = nil
		local MergeLanesResult = MergeLanesFunction(FinishedWork.lanes, FinishedWork.childLanes)
		MarkRootFinishedFunction(p6, MergeLanesResult)
		
		if NewResult1 ~= nil and not HasDiscreteLanesFunction(MergeLanesResult) and NewResult1:has(p6) then
			NewResult1:delete(p6)
		end
		if p6 == v1 then
			v1 = nil
			WorkInProgress = nil
			NoLanes = ReactFiberLaneModule.NoLanes
		end
		local IsNotBitsMatch = bit32.band(FinishedWork.flags, (bit32.bor(ReactFiberFlagsModule.BeforeMutationMask, ReactFiberFlagsModule.MutationMask, ReactFiberFlagsModule.LayoutMask, ReactFiberFlagsModule.PassiveMask))) ~= ReactFiberFlagsModule.NoFlags
		
		if bit32.band(FinishedWork.subtreeFlags, (bit32.bor(ReactFiberFlagsModule.BeforeMutationMask, ReactFiberFlagsModule.MutationMask, ReactFiberFlagsModule.LayoutMask, ReactFiberFlagsModule.PassiveMask))) ~= ReactFiberFlagsModule.NoFlags or IsNotBitsMatch then
			local v12 = nil
			
			if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
				v12 = GetCurrentUpdateLanePriorityFunction()
				SetCurrentUpdateLanePriorityFunction(ReactFiberLaneModule.SyncLanePriority)
			end
			local Bits1: number = Bits
			Bits = bit32.bor(Bits, 32)
			local PushInteractionsResult = config1.pushInteractions(p6)
			ReactCurrentOwner.current = nil
			
			if ReactFeatureFlags.enableCommitTraversalTrims and bit32.band(bit32.bor(FinishedWork.subtreeFlags, FinishedWork.flags), ReactFiberFlagsModule.Passive) ~= ReactFiberFlagsModule.NoFlags and not Flag1 then
				Flag1 = true
				ScheduleCallbackFunction(NormalPriority, function()
					-- upvalues: ReactFiberWorkLoopModule (upval)
					ReactFiberWorkLoopModule.flushPassiveEffects()
					
					return nil
				end)
			end
			PrepareForCommitResult = ReactFiberHostConfigModule.prepareForCommit(p6.containerInfo)
			Flag2 = false
			config1.commitBeforeMutationEffects(FinishedWork)
			PrepareForCommitResult = nil
			
			if ReactFeatureFlags.enableProfilerTimer then
				ReactProfilerTimerNewModule.recordCommitTime()
			end
			config1.commitMutationEffects(FinishedWork, p6, p7)
			
			if Flag2 then
				ReactFiberHostConfigModule.afterActiveInstanceBlur()
			end
			ReactFiberHostConfigModule.resetAfterCommit(p6.containerInfo)
			p6.current = FinishedWork
			
			if DEV and EnableDebugTracing then
				DebugTracingModule.logLayoutEffectsStarted(FinishedLanes)
			end
			if EnableSchedulingProfiler then
				SchedulingProfilerModule.markLayoutEffectsStarted(FinishedLanes)
			end
			if DEV then
				SetCurrentFiberFunction(FinishedWork)
				InvokeGuardedCallbackFunction(nil, RecursivelyCommitLayoutEffectsFunction, nil, FinishedWork, p6, ReactFiberWorkLoopModule.captureCommitPhaseError, ReactFiberWorkLoopModule.schedulePassiveEffectCallback)
				
				if HasCaughtErrorFunction() then
					Callback1(FinishedWork, FinishedWork, (ClearCaughtErrorFunction()))
				end
				ResetCurrentFiberFunction()
			else
				local v13 = nil
				local Success = nil
				
				if YOLO then
					Success = true
					RecursivelyCommitLayoutEffectsFunction(FinishedWork, p6, ReactFiberWorkLoopModule.captureCommitPhaseError, ReactFiberWorkLoopModule.schedulePassiveEffectCallback)
				else
					Success, v223 = xpcall(RecursivelyCommitLayoutEffectsFunction, DescribeError, FinishedWork, p6, ReactFiberWorkLoopModule.captureCommitPhaseError, ReactFiberWorkLoopModule.schedulePassiveEffectCallback)
				end
				if not Success then
					Callback1(FinishedWork, FinishedWork, v13)
				end
			end
			if DEV and EnableDebugTracing then
				DebugTracingModule.logLayoutEffectsStopped()
			end
			if EnableSchedulingProfiler then
				SchedulingProfilerModule.markLayoutEffectsStopped()
			end
			if (bit32.band(FinishedWork.subtreeFlags, ReactFiberFlagsModule.PassiveMask) ~= ReactFiberFlagsModule.NoFlags or bit32.band(FinishedWork.flags, ReactFiberFlagsModule.PassiveMask) ~= ReactFiberFlagsModule.NoFlags) and not Flag1 then
				Flag1 = true
				ScheduleCallbackFunction(NormalPriority, function()
					-- upvalues: ReactFiberWorkLoopModule (upval)
					ReactFiberWorkLoopModule.flushPassiveEffects()
					
					return nil
				end)
			end
			RequestPaintFunction()
			
			if ReactFeatureFlags.enableSchedulerTracing then
				config1.popInteractions(PushInteractionsResult)
			end
			Bits = Bits1
			
			if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler and v12 ~= nil then
				SetCurrentUpdateLanePriorityFunction(v12)
			end
		else
			p6.current = FinishedWork
			
			if ReactFeatureFlags.enableProfilerTimer then
				ReactProfilerTimerNewModule.recordCommitTime()
			end
		end
		local Flag3: boolean = Flag1
		
		if Flag1 then
			Flag1 = false
			v9 = p6
			NoLanes4 = FinishedLanes
			NoPriority1 = p7
		end
		local PendingLanes = p6.pendingLanes
		
		if PendingLanes == ReactFiberLaneModule.NoLanes then
			NewResult = nil
		elseif ReactFeatureFlags.enableSchedulerTracing then
			if List ~= nil then
				local List1 = List
				List = nil
				
				for i = 1, #List1 do
					scheduleInteractions(p6, List1[i], p6.memoizedInteractions)
				end
			end
			config1.schedulePendingInteractions(p6, PendingLanes)
		end
		if DEV and (EnableDoubleInvokingEffects and not Flag3) then
			commitDoubleInvokeEffectsInDEV(p6.current, false)
		end
		if ReactFeatureFlags.enableSchedulerTracing and not Flag3 then
			config1.finishPendingInteractions(p6, FinishedLanes)
		end
		if PendingLanes == SyncLane then
			if p6 == v10 then
				Count += 1
			else
				Count = 0
				v10 = p6
			end
		else
			Count = 0
		end
		OnCommitRootFunction(FinishedWork.stateNode, p7)
		
		if DEV then
			OnCommitRootFunction1()
		end
		Callback(p6, NowFunction())
		
		if Flag then
			Flag = false
			local v14 = v8
			v8 = nil
			error(v14)
		end
		if bit32.band(Bits, 8) == 0 then
			FlushSyncCallbackQueueFunction()
			
			if DEV and EnableDebugTracing then
				DebugTracingModule.logCommitStopped()
			end
			if EnableSchedulingProfiler then
				SchedulingProfilerModule.markCommitStopped(p6)
			end
			return nil
		else
			if DEV and EnableDebugTracing then
				DebugTracingModule.logCommitStopped()
			end
			if EnableSchedulingProfiler then
				SchedulingProfilerModule.markCommitStopped(p6)
			end
			return nil
		end
	end
end

function config1.commitBeforeMutationEffects(Child)
	-- upvalues: config1 (copy), ReactFiberFlagsModule (copy), ReactFeatureFlags (copy), PrepareForCommitResult (ref), DEV (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), ReactFiberWorkLoopModule (copy), ResetCurrentFiberFunction (copy), YOLO (copy), DescribeError (copy)
	local Sibling = Child
	while Sibling ~= nil do
		if Sibling.deletions ~= nil then
			config1.commitBeforeMutationEffectsDeletions(Sibling.deletions)
		end
		if Sibling.child ~= nil and bit32.band(Sibling.subtreeFlags, ReactFiberFlagsModule.BeforeMutationMask) ~= ReactFiberFlagsModule.NoFlags then
			config1.commitBeforeMutationEffects(Sibling.child)
		end
		if ReactFeatureFlags.enableCommitTraversalTrims then
			if PrepareForCommitResult ~= nil or bit32.band(Sibling.flags, ReactFiberFlagsModule.Snapshot) ~= ReactFiberFlagsModule.NoFlags then
				if DEV then
					SetCurrentFiberFunction(Sibling)
					InvokeGuardedCallbackFunction(nil, config1.commitBeforeMutationEffectsImpl, nil, Sibling)
					
					if HasCaughtErrorFunction() then
						ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, (ClearCaughtErrorFunction()))
					end
					ResetCurrentFiberFunction()
				else
					local v15 = nil
					local Success = nil
					
					if YOLO then
						Success = true
						config1.commitBeforeMutationEffectsImpl(Sibling)
					else
						Success, v230 = xpcall(config1.commitBeforeMutationEffectsImpl, DescribeError, Sibling)
					end
					if not Success then
						ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, v15)
					end
				end
			end
		elseif DEV then
			SetCurrentFiberFunction(Sibling)
			InvokeGuardedCallbackFunction(nil, config1.commitBeforeMutationEffectsImpl, nil, Sibling)
			
			if HasCaughtErrorFunction() then
				ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, (ClearCaughtErrorFunction()))
			end
			ResetCurrentFiberFunction()
		else
			local v16 = nil
			local Success1 = nil
			
			if YOLO then
				Success1 = true
				config1.commitBeforeMutationEffectsImpl(Sibling)
			else
				Success1, v232 = xpcall(config1.commitBeforeMutationEffectsImpl, DescribeError, Sibling)
			end
			if not Success1 then
				ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, v16)
			end
		end
		Sibling = Sibling.sibling
	end
end

function config1.commitBeforeMutationEffectsImpl(Sibling)
	-- upvalues: Flag2 (ref), PrepareForCommitResult (ref), ReactWorkTagsModule (copy), ReactFiberCommitWorkNewModule (copy), DoesFiberContainFunction (copy), ReactFiberHostConfigModule (copy), ReactFiberFlagsModule (copy), SetCurrentFiberFunction (copy), CommitBeforeMutationLifeCyclesFunction (copy), ResetCurrentFiberFunction (copy), ReactFeatureFlags (copy), Flag1 (ref), ScheduleCallbackFunction (copy), NormalPriority (copy), ReactFiberWorkLoopModule (copy)
	local Alternate = Sibling.alternate
	local Flags: number = Sibling.flags
	
	if not Flag2 and PrepareForCommitResult ~= nil and Sibling.tag == ReactWorkTagsModule.SuspenseComponent and ReactFiberCommitWorkNewModule.isSuspenseBoundaryBeingHidden(Alternate, Sibling) and DoesFiberContainFunction(Sibling, PrepareForCommitResult) then
		Flag2 = true
		ReactFiberHostConfigModule.beforeActiveInstanceBlur()
	end
	if bit32.band(Flags, ReactFiberFlagsModule.Snapshot) ~= ReactFiberFlagsModule.NoFlags then
		SetCurrentFiberFunction(Sibling)
		CommitBeforeMutationLifeCyclesFunction(Alternate, Sibling)
		ResetCurrentFiberFunction()
	end
	if not ReactFeatureFlags.enableCommitTraversalTrims and bit32.band(Flags, ReactFiberFlagsModule.Passive) ~= ReactFiberFlagsModule.NoFlags and not Flag1 then
		Flag1 = true
		ScheduleCallbackFunction(NormalPriority, function()
			-- upvalues: ReactFiberWorkLoopModule (upval)
			ReactFiberWorkLoopModule.flushPassiveEffects()
			
			return nil
		end)
	end
end

function config1.commitBeforeMutationEffectsDeletions(Deletions)
	-- upvalues: DoesFiberContainFunction (copy), PrepareForCommitResult (ref), Flag2 (ref), ReactFiberHostConfigModule (copy)
	for i = 1, #Deletions do
		if DoesFiberContainFunction(Deletions[i], PrepareForCommitResult) then
			Flag2 = true
			ReactFiberHostConfigModule.beforeActiveInstanceBlur()
		end
	end
end

function config1.commitMutationEffects(Child, p8, p9)
	-- upvalues: CommitDeletion (copy), DescribeError (copy), ReactFiberWorkLoopModule (copy), ReactFiberFlagsModule (copy), config1 (copy), ReactFeatureFlags (copy), DEV (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), ResetCurrentFiberFunction (copy), YOLO (copy)
	local Sibling = Child
	while Sibling ~= nil do
		local Deletions = Sibling.deletions
		
		if Deletions ~= nil then
			for _, deletion in Deletions do
				local Success, Result = xpcall(CommitDeletion, DescribeError, p8, deletion, Sibling, p9)
				
				if not Success then
					ReactFiberWorkLoopModule.captureCommitPhaseError(deletion, Sibling, Result)
				end
			end
		end
		if Sibling.child ~= nil and bit32.band(Sibling.subtreeFlags, ReactFiberFlagsModule.MutationMask) ~= ReactFiberFlagsModule.NoFlags then
			config1.commitMutationEffects(Sibling.child, p8, p9)
		end
		if ReactFeatureFlags.enableCommitTraversalTrims then
			if bit32.band(Sibling.flags, config1.MutationWorkFlags) ~= ReactFiberFlagsModule.NoFlags then
				if DEV then
					SetCurrentFiberFunction(Sibling)
					InvokeGuardedCallbackFunction(nil, config1.commitMutationEffectsImpl, nil, Sibling, p8, p9)
					
					if HasCaughtErrorFunction() then
						ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, (ClearCaughtErrorFunction()))
					end
					ResetCurrentFiberFunction()
				else
					local v17 = nil
					local Success1 = nil
					
					if YOLO then
						Success1 = true
						config1.commitMutationEffectsImpl(Sibling, p8, p9)
					else
						Success1, v240 = xpcall(config1.commitMutationEffectsImpl, DescribeError, Sibling, p8, p9)
					end
					if not Success1 then
						ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, v17)
					end
				end
			end
		elseif DEV then
			SetCurrentFiberFunction(Sibling)
			InvokeGuardedCallbackFunction(nil, config1.commitMutationEffectsImpl, nil, Sibling, p8, p9)
			
			if HasCaughtErrorFunction() then
				ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, (ClearCaughtErrorFunction()))
			end
			ResetCurrentFiberFunction()
		else
			local v18 = nil
			local Success2 = nil
			
			if YOLO then
				Success2 = true
				config1.commitMutationEffectsImpl(Sibling, p8, p9)
			else
				Success2, v242 = xpcall(config1.commitMutationEffectsImpl, DescribeError, Sibling, p8, p9)
			end
			if not Success2 then
				ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, v18)
			end
		end
		Sibling = Sibling.sibling
	end
end

function config1.commitMutationEffectsImpl(Sibling, _, _)
	-- upvalues: ReactFiberFlagsModule (copy), CommitDetachRefFunction (copy), ReactFeatureFlags (copy), CommitPlacementFunction (copy), CommitWorkFunction (copy)
	local Flags: number = Sibling.flags
	
	if bit32.band(Flags, ReactFiberFlagsModule.Ref) ~= 0 then
		local Alternate = Sibling.alternate
		
		if Alternate ~= nil then
			CommitDetachRefFunction(Alternate)
		end
	end
	local Bits = bit32.band(Flags, (bit32.bor(ReactFiberFlagsModule.Placement, ReactFiberFlagsModule.Update, ReactFiberFlagsModule.Hydrating)))
	
	if ReactFeatureFlags.enableCommitTraversalTrims and bit32.band(Flags, ReactFiberFlagsModule.HostUpdate) ~= ReactFiberFlagsModule.NoFlags then
		Bits = bit32.bor(Bits, ReactFiberFlagsModule.Update)
	end
	if Bits == ReactFiberFlagsModule.Placement then
		CommitPlacementFunction(Sibling)
		Sibling.flags = bit32.band(Sibling.flags, (bit32.bnot(ReactFiberFlagsModule.Placement)))
		
		return
	end
	if Bits == ReactFiberFlagsModule.PlacementAndUpdate then
		CommitPlacementFunction(Sibling)
		Sibling.flags = bit32.band(Sibling.flags, (bit32.bnot(ReactFiberFlagsModule.Placement)))
		CommitWorkFunction(Sibling.alternate, Sibling)
		
		return
	elseif Bits == ReactFiberFlagsModule.Update then
		CommitWorkFunction(Sibling.alternate, Sibling)
	end
end

function config1.commitMutationEffectsDeletions(List, p10, p11, p12)
	-- upvalues: CommitDeletion (copy), DescribeError (copy), ReactFiberWorkLoopModule (copy)
	for _, value in List do
		local Success, Result = xpcall(CommitDeletion, DescribeError, p11, value, p10, p12)
		
		if not Success then
			ReactFiberWorkLoopModule.captureCommitPhaseError(value, p10, Result)
		end
	end
end

function ReactFiberWorkLoopModule.schedulePassiveEffectCallback()
	-- upvalues: Flag1 (ref), ScheduleCallbackFunction (copy), NormalPriority (copy), ReactFiberWorkLoopModule (copy)
	if not Flag1 then
		Flag1 = true
		ScheduleCallbackFunction(NormalPriority, function()
			-- upvalues: ReactFiberWorkLoopModule (upval)
			ReactFiberWorkLoopModule.flushPassiveEffects()
			
			return nil
		end)
	end
end

local v19 = nil

function ReactFiberWorkLoopModule.flushPassiveEffects()
	-- upvalues: NoPriority1 (ref), NoPriority (copy), NormalPriority (copy), ReactFeatureFlags (copy), GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), SchedulerPriorityToLanePriorityFunction (copy), YOLO (copy), RunWithPriorityFunction (copy), DescribeError (copy), v19 (ref)
	if NoPriority1 == NoPriority then
		return false
	end
	local NormalPriority1 = if NormalPriority < NoPriority1 then NormalPriority else NoPriority1
	NoPriority1 = NoPriority
	
	if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
		return RunWithPriorityFunction(NormalPriority1, v19)
	end
	local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
	SetCurrentUpdateLanePriorityFunction(SchedulerPriorityToLanePriorityFunction(NormalPriority1))
	local Success = nil
	local Result = nil
	
	if YOLO then
		Success = true
		SetCurrentUpdateLanePriorityFunction(SchedulerPriorityToLanePriorityFunction(NormalPriority1))
		Result = RunWithPriorityFunction(NormalPriority1, v19)
	else
		Success, Result = xpcall(RunWithPriorityFunction, DescribeError, NormalPriority1, v19)
	end
	SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
	
	if not Success then
		error(Result)
	end
	return Result
end

local function v107(p13, Current)
	-- upvalues: ReactFeatureFlags (copy), ReactWorkTagsModule (copy), v7 (ref), ReactFiberFlagsModule (copy), v107 (ref), DEV (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), CommitPassiveMountFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), ReactFiberWorkLoopModule (copy), ResetCurrentFiberFunction (copy), YOLO (copy), DescribeError (copy)
	local Sibling = Current
	while Sibling ~= nil do
		local v20 = nil
		
		if ReactFeatureFlags.enableProfilerTimer and ReactFeatureFlags.enableProfilerCommitHooks and Sibling.tag == ReactWorkTagsModule.Profiler then
			v20 = v7
			v7 = Sibling
		end
		local Bits = bit32.band(Sibling.subtreeFlags, ReactFiberFlagsModule.PassiveMask)
		
		if Sibling.child ~= nil and Bits ~= ReactFiberFlagsModule.NoFlags then
			v107(p13, Sibling.child)
		end
		if bit32.band(Sibling.flags, ReactFiberFlagsModule.Passive) ~= ReactFiberFlagsModule.NoFlags then
			if DEV then
				SetCurrentFiberFunction(Sibling)
				InvokeGuardedCallbackFunction(nil, CommitPassiveMountFunction, nil, p13, Sibling)
				
				if HasCaughtErrorFunction() then
					ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, (ClearCaughtErrorFunction()))
				end
				ResetCurrentFiberFunction()
			else
				local v21 = nil
				local Success = nil
				
				if YOLO then
					Success = true
					CommitPassiveMountFunction(p13, Sibling)
				else
					Success, v256 = xpcall(CommitPassiveMountFunction, DescribeError, p13, Sibling)
				end
				if not Success then
					ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Sibling.return_, v21)
				end
			end
		end
		if ReactFeatureFlags.enableProfilerTimer and ReactFeatureFlags.enableProfilerCommitHooks and Sibling.tag == ReactWorkTagsModule.Profiler then
			if v20 ~= nil then
				local StateNode = v20.stateNode
				StateNode.passiveEffectDuration += Sibling.stateNode.passiveEffectDuration
			end
			v7 = v20
		end
		Sibling = Sibling.sibling
	end
end

function config1.commitPassiveMountEffectsOnFibers(p14, PassiveMountFibers)
	-- upvalues: DEV (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), CommitPassiveMountFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), ReactFiberWorkLoopModule (copy), ResetCurrentFiberFunction (copy), YOLO (copy), DescribeError (copy)
	for i = 1, #PassiveMountFibers do
		local PassiveMountFiber = PassiveMountFibers[i]
		
		if DEV then
			SetCurrentFiberFunction(PassiveMountFiber)
			InvokeGuardedCallbackFunction(nil, CommitPassiveMountFunction, nil, p14, PassiveMountFiber)
			
			if HasCaughtErrorFunction() then
				ReactFiberWorkLoopModule.captureCommitPhaseError(PassiveMountFiber, PassiveMountFiber.return_, (ClearCaughtErrorFunction()))
			end
			ResetCurrentFiberFunction()
		else
			local v22 = nil
			local Success = nil
			
			if YOLO then
				Success = true
				CommitPassiveMountFunction(p14, PassiveMountFiber)
			else
				Success, v260 = xpcall(CommitPassiveMountFunction, DescribeError, p14, PassiveMountFiber)
			end
			if not Success then
				ReactFiberWorkLoopModule.captureCommitPhaseError(PassiveMountFiber, PassiveMountFiber.return_, v22)
			end
		end
	end
end

local function flushPassiveUnmountEffects(Current)
	-- upvalues: config1 (copy), EnableNewTreeCleanupPath (copy), DeletedTreeCleanUpLevel (copy), ReactFiberFlagsModule (copy), flushPassiveUnmountEffects (copy), SetCurrentFiberFunction (copy), CommitPassiveUnmountFunction (copy), ResetCurrentFiberFunction (copy)
	local Sibling = Current
	while Sibling ~= nil do
		local Deletions = Sibling.deletions
		
		if Deletions ~= nil then
			for i = 1, #Deletions do
				local Deletion = Deletions[i]
				config1.flushPassiveUnmountEffectsInsideOfDeletedTree(Deletion, Sibling)
				
				if not EnableNewTreeCleanupPath or DeletedTreeCleanUpLevel < 2 then
					config1.detachFiberAfterEffects(Deletion)
				end
			end
			if EnableNewTreeCleanupPath and DeletedTreeCleanUpLevel >= 1 then
				local Alternate = Sibling.alternate
				local NoAlternate = Alternate == nil
				local Child1 = nil
				
				if not NoAlternate then
					Child1 = Alternate.child
					NoAlternate = Child1 == nil
				end
				if not NoAlternate then
					Alternate.child = nil
					repeat
						Child1.sibling = nil
						Child1 = Child1.sibling
					until Child1 == nil
				end
			end
		end
		local Child = Sibling.child
		
		if Child ~= nil and bit32.band(Sibling.subtreeFlags, ReactFiberFlagsModule.PassiveMask) ~= ReactFiberFlagsModule.NoFlags then
			flushPassiveUnmountEffects(Child)
		end
		if bit32.band(Sibling.flags, ReactFiberFlagsModule.Passive) ~= ReactFiberFlagsModule.NoFlags then
			SetCurrentFiberFunction(Sibling)
			CommitPassiveUnmountFunction(Sibling)
			ResetCurrentFiberFunction()
		end
		Sibling = Sibling.sibling
	end
end

function config1.flushPassiveUnmountEffectsCollecting(Child, List)
	-- upvalues: config1 (copy), EnableNewTreeCleanupPath (copy), DeletedTreeCleanUpLevel (copy), ReactFiberFlagsModule (copy), SetCurrentFiberFunction (copy), CommitPassiveUnmountFunction (copy), ResetCurrentFiberFunction (copy)
	local Sibling = Child
	while Sibling ~= nil do
		local Deletions = Sibling.deletions
		
		if Deletions ~= nil then
			for i = 1, #Deletions do
				local Deletion = Deletions[i]
				config1.flushPassiveUnmountEffectsInsideOfDeletedTree(Deletion, Sibling)
				
				if not EnableNewTreeCleanupPath or DeletedTreeCleanUpLevel < 2 then
					config1.detachFiberAfterEffects(Deletion)
				end
			end
			if EnableNewTreeCleanupPath and DeletedTreeCleanUpLevel >= 1 then
				local Alternate = Sibling.alternate
				local NoAlternate = Alternate == nil
				local Child2 = nil
				
				if not NoAlternate then
					Child2 = Alternate.child
					NoAlternate = Child2 == nil
				end
				if not NoAlternate then
					Alternate.child = nil
					repeat
						Child2.sibling = nil
						Child2 = Child2.sibling
					until Child2 == nil
				end
			end
		end
		local Child1 = Sibling.child
		
		if Child1 ~= nil and bit32.band(Sibling.subtreeFlags, ReactFiberFlagsModule.PassiveMask) ~= ReactFiberFlagsModule.NoFlags then
			config1.flushPassiveUnmountEffectsCollecting(Child1, List)
		end
		if bit32.band(Sibling.flags, ReactFiberFlagsModule.Passive) ~= ReactFiberFlagsModule.NoFlags then
			table.insert(List, Sibling)
			SetCurrentFiberFunction(Sibling)
			CommitPassiveUnmountFunction(Sibling)
			ResetCurrentFiberFunction()
		end
		Sibling = Sibling.sibling
	end
end

function config1.flushPassiveUnmountEffectsInsideOfDeletedTree(Child, Sibling)
	-- upvalues: ReactFiberFlagsModule (copy), EnableNewTreeCleanupPath (copy), DeletedTreeCleanUpLevel (copy), config1 (copy), SetCurrentFiberFunction (copy), CommitPassiveUnmountInsideDeletedTreeFunction (copy), ResetCurrentFiberFunction (copy)
	if bit32.band(Child.subtreeFlags, ReactFiberFlagsModule.PassiveStatic) ~= ReactFiberFlagsModule.NoFlags or EnableNewTreeCleanupPath and DeletedTreeCleanUpLevel >= 2 then
		local Child1 = Child.child
		while Child1 ~= nil do
			local Sibling1 = Child1.sibling
			config1.flushPassiveUnmountEffectsInsideOfDeletedTree(Child1, Sibling)
			Child1 = Sibling1
		end
	end
	if bit32.band(Child.flags, ReactFiberFlagsModule.PassiveStatic) ~= ReactFiberFlagsModule.NoFlags then
		SetCurrentFiberFunction(Child)
		CommitPassiveUnmountInsideDeletedTreeFunction(Child, Sibling)
		ResetCurrentFiberFunction()
	end
	if EnableNewTreeCleanupPath and DeletedTreeCleanUpLevel >= 2 then
		config1.detachFiberAfterEffects(Child)
	end
end

v19 = function(): boolean
	-- upvalues: v9 (ref), NoLanes4 (ref), ReactFiberLaneModule (copy), InvariantFunction (copy), Bits (ref), DEV (copy), EnableDebugTracing (copy), DebugTracingModule (copy), EnableSchedulingProfiler (copy), SchedulingProfilerModule (copy), config1 (copy), ReactFeatureFlags (copy), flushPassiveUnmountEffects (copy), v107 (ref), EnableDoubleInvokingEffects (copy), FlushSyncCallbackQueueFunction (copy), Count1 (ref)
	if v9 == nil then
		return false
	end
	local v23 = v9
	local NoLanes = NoLanes4
	v9 = nil
	NoLanes4 = ReactFiberLaneModule.NoLanes
	InvariantFunction(bit32.band(Bits, 48) == 0, "Cannot flush passive effects while already rendering.")
	
	if DEV and EnableDebugTracing then
		DebugTracingModule.logPassiveEffectsStarted(NoLanes)
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markPassiveEffectsStarted(NoLanes)
	end
	local Bits1: number = Bits
	Bits = bit32.bor(Bits, 32)
	local PushInteractionsResult = config1.pushInteractions(v23)
	
	if ReactFeatureFlags.enableCommitTraversalTrims then
		if ReactFeatureFlags.enableProfilerTimer and ReactFeatureFlags.enableProfilerCommitHooks then
			flushPassiveUnmountEffects(v23.current)
			v107(v23, v23.current)
		else
			local PassiveMountFibers = config1.passiveMountFibers or {}
			config1.passiveMountFibers = nil
			config1.flushPassiveUnmountEffectsCollecting(v23.current, PassiveMountFibers)
			config1.commitPassiveMountEffectsOnFibers(v23, PassiveMountFibers)
			table.clear(PassiveMountFibers)
			config1.passiveMountFibers = PassiveMountFibers
		end
	else
		flushPassiveUnmountEffects(v23.current)
		v107(v23, v23.current)
	end
	if DEV and EnableDebugTracing then
		DebugTracingModule.logPassiveEffectsStopped()
	end
	if EnableSchedulingProfiler then
		SchedulingProfilerModule.markPassiveEffectsStopped(v23)
	end
	if DEV and EnableDoubleInvokingEffects then
		commitDoubleInvokeEffectsInDEV(v23.current, true)
	end
	if ReactFeatureFlags.enableSchedulerTracing then
		config1.popInteractions(PushInteractionsResult)
		config1.finishPendingInteractions(v23, NoLanes)
	end
	Bits = Bits1
	FlushSyncCallbackQueueFunction()
	
	if v9 == nil then
		Count1 = 0
	else
		Count1 += 1
	end
	return true
end

function ReactFiberWorkLoopModule.isAlreadyFailedLegacyErrorBoundary(StateNode)
	-- upvalues: NewResult (ref)
	return NewResult ~= nil and NewResult:has(StateNode)
end

function ReactFiberWorkLoopModule.markLegacyErrorBoundaryAsFailed(p15)
	-- upvalues: NewResult (ref), Set (copy)
	if NewResult == nil then
		NewResult = Set.new({ p15 })
		
		return
	else
		NewResult:add(p15)
	end
end

function ReactFiberWorkLoopModule.onUncaughtError(p15)
	-- upvalues: Flag (ref), v8 (ref)
	if not Flag then
		Flag = true
		v8 = p15
	end
end

Callback1 = function(FinishedWork, FinishedWork1, p15)
	-- upvalues: CreateCapturedValueFunction (copy), CreateRootErrorUpdateFunction (copy), SyncLane (copy), ReactFiberWorkLoopModule (copy), EnqueueUpdateFunction (copy), config1 (copy), MarkRootUpdatedFunction (copy), Callback (ref)
	EnqueueUpdateFunction(FinishedWork, (CreateRootErrorUpdateFunction(FinishedWork, CreateCapturedValueFunction(p15, FinishedWork1), SyncLane, ReactFiberWorkLoopModule.onUncaughtError)))
	local RequestEventTimeResult = ReactFiberWorkLoopModule.requestEventTime()
	local MarkUpdateLaneFromFiberToRootResult = config1.markUpdateLaneFromFiberToRoot(FinishedWork, SyncLane)
	
	if MarkUpdateLaneFromFiberToRootResult ~= nil then
		MarkRootUpdatedFunction(MarkUpdateLaneFromFiberToRootResult, SyncLane, RequestEventTimeResult)
		Callback(MarkUpdateLaneFromFiberToRootResult, RequestEventTimeResult)
		config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane)
	end
end

function ReactFiberWorkLoopModule.captureCommitPhaseError(Sibling, Return, p15)
	-- upvalues: ReactWorkTagsModule (copy), Callback1 (ref), SkipUnmountedBoundaries (copy), ReactFiberWorkLoopModule (copy), CreateCapturedValueFunction (copy), CreateClassErrorUpdateFunction (copy), SyncLane (copy), EnqueueUpdateFunction (copy), config1 (copy), MarkRootUpdatedFunction (copy), Callback (ref)
	if Sibling.tag == ReactWorkTagsModule.HostRoot then
		Callback1(Sibling, Sibling, p15)
		
		return
	end
	local Return1 = if SkipUnmountedBoundaries then Return else Sibling.return_
	while Return1 ~= nil do
		if Return1.tag == ReactWorkTagsModule.HostRoot then
			Callback1(Return1, Sibling, p15)
			break
		end
		if Return1.tag == ReactWorkTagsModule.ClassComponent then
			local StateNode = Return1.stateNode
			
			if typeof(Return1.type.getDerivedStateFromError) == "function" or typeof(StateNode.componentDidCatch) == "function" and not ReactFiberWorkLoopModule.isAlreadyFailedLegacyErrorBoundary(StateNode) then
				EnqueueUpdateFunction(Return1, (CreateClassErrorUpdateFunction(Return1, CreateCapturedValueFunction(p15, Sibling), SyncLane)))
				local RequestEventTimeResult = ReactFiberWorkLoopModule.requestEventTime()
				local MarkUpdateLaneFromFiberToRootResult = config1.markUpdateLaneFromFiberToRoot(Return1, SyncLane)
				
				if MarkUpdateLaneFromFiberToRootResult ~= nil then
					MarkRootUpdatedFunction(MarkUpdateLaneFromFiberToRootResult, SyncLane, RequestEventTimeResult)
					Callback(MarkUpdateLaneFromFiberToRootResult, RequestEventTimeResult)
					config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane)
				end
				break
			end
		end
		Return1 = Return1.return_
	end
end

function ReactFiberWorkLoopModule.pingSuspendedRoot(p16, Key, p17)
	-- upvalues: ReactFiberWorkLoopModule (copy), MarkRootPingedFunction (copy), v1 (ref), IsSubsetOfLanesFunction (copy), NoLanes (ref), v2 (ref), IncludesOnlyRetriesFunction (copy), NowFunction (copy), v5 (ref), config1 (copy), ReactFiberLaneModule (copy), NoLanes3 (ref), MergeLanesFunction (copy), Callback (ref)
	local PingCache = p16.pingCache
	
	if PingCache ~= nil then
		PingCache[Key] = nil
	end
	local RequestEventTimeResult = ReactFiberWorkLoopModule.requestEventTime()
	MarkRootPingedFunction(p16, p17, RequestEventTimeResult)
	
	if v1 == p16 and IsSubsetOfLanesFunction(NoLanes, p17) then
		if v2 == 4 or v2 == 3 and IncludesOnlyRetriesFunction(NoLanes) and NowFunction() - v5 < 500 then
			config1.prepareFreshStack(p16, ReactFiberLaneModule.NoLanes)
		else
			NoLanes3 = MergeLanesFunction(NoLanes3, p17)
		end
	end
	Callback(p16, RequestEventTimeResult)
	config1.schedulePendingInteractions(p16, p17)
end

function retryTimedOutBoundary(p16, NoLane)
	-- upvalues: ReactFiberLaneModule (copy), ReactFiberWorkLoopModule (copy), config1 (copy), MarkRootUpdatedFunction (copy), Callback (ref)
	if NoLane == ReactFiberLaneModule.NoLane then
		NoLane = requestRetryLane(p16)
	end
	local RequestEventTimeResult = ReactFiberWorkLoopModule.requestEventTime()
	local MarkUpdateLaneFromFiberToRootResult = config1.markUpdateLaneFromFiberToRoot(p16, NoLane)
	
	if MarkUpdateLaneFromFiberToRootResult ~= nil then
		MarkRootUpdatedFunction(MarkUpdateLaneFromFiberToRootResult, NoLane, RequestEventTimeResult)
		Callback(MarkUpdateLaneFromFiberToRootResult, RequestEventTimeResult)
		config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, NoLane)
	end
end

function ReactFiberWorkLoopModule.resolveRetryWakeable(p16, p17)
	-- upvalues: ReactFiberLaneModule (copy)
	local NoLane = ReactFiberLaneModule.NoLane
	local StateNode = p16.stateNode
	
	if StateNode ~= nil then
		StateNode:delete(p17)
	end
	retryTimedOutBoundary(p16, NoLane)
end

function jnd(p16: number): number
	return if p16 < 120 then 120 elseif p16 < 480 then 480 elseif p16 < 1080 then 1080 elseif p16 < 1920 then 1920 elseif p16 < 3000 then 3000 elseif p16 < 4320 then 4320 else math.ceil(p16 / 1960) * 1960
end

function config1.checkForNestedUpdates()
	-- upvalues: Count (ref), v10 (ref), InvariantFunction (copy), DEV (copy), Count1 (ref), Console (copy)
	if Count > 50 then
		Count = 0
		v10 = nil
		InvariantFunction(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.")
	end
	if DEV and Count1 > 50 then
		Count1 = 0
		Console.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.")
	end
end

function flushRenderPhaseStrictModeWarningsInDEV()
	-- upvalues: DEV (copy), ReactStrictModeWarningsNewModule (copy), ReactFeatureFlags (copy)
	if DEV then
		ReactStrictModeWarningsNewModule.flushLegacyContextWarning()
		
		if ReactFeatureFlags.warnAboutDeprecatedLifecycles then
			ReactStrictModeWarningsNewModule.flushPendingUnsafeLifecycleWarnings()
		end
	end
end

function commitDoubleInvokeEffectsInDEV(p16, p17)
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), SetCurrentFiberFunction (copy), ReactFiberFlagsModule (copy), InvokeLayoutEffectUnmountInDEV (copy), InvokePassiveEffectUnmountInDEV (copy), InvokeLayoutEffectMountInDEV (copy), InvokePassiveEffectMountInDEV (copy), ResetCurrentFiberFunction (copy)
	if DEV and EnableDoubleInvokingEffects then
		SetCurrentFiberFunction(p16)
		invokeEffectsInDev(p16, ReactFiberFlagsModule.MountLayoutDev, InvokeLayoutEffectUnmountInDEV)
		
		if p17 then
			invokeEffectsInDev(p16, ReactFiberFlagsModule.MountPassiveDev, InvokePassiveEffectUnmountInDEV)
		end
		invokeEffectsInDev(p16, ReactFiberFlagsModule.MountLayoutDev, InvokeLayoutEffectMountInDEV)
		
		if p17 then
			invokeEffectsInDev(p16, ReactFiberFlagsModule.MountPassiveDev, InvokePassiveEffectMountInDEV)
		end
		ResetCurrentFiberFunction()
	end
end

function invokeEffectsInDev(Sibling, Mask: number, Callback: (any) -> ())
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), ReactFiberFlagsModule (copy)
	if DEV and EnableDoubleInvokingEffects then
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			if Sibling1.child ~= nil and bit32.band(Sibling1.subtreeFlags, Mask) ~= ReactFiberFlagsModule.NoFlags then
				invokeEffectsInDev(Sibling1.child, Mask, Callback)
			end
			if bit32.band(Sibling1.flags, Mask) ~= ReactFiberFlagsModule.NoFlags then
				Callback(Sibling1)
			end
			Sibling1 = Sibling1.sibling
		end
	end
end

local Config = nil

function config1.warnAboutUpdateOnNotYetMountedFiberInDEV(p16)
	-- upvalues: DEV (copy), Bits (ref), ReactTypeOfModeModule (copy), ReactWorkTagsModule (copy), GetComponentNameFunction (copy), Config (ref), ReactCurrentFiberModule (copy), SetCurrentFiberFunction (copy), Console (copy), ResetCurrentFiberFunction (copy)
	if DEV then
		if bit32.band(Bits, 16) ~= 0 then return end
		if bit32.band(p16.mode, (bit32.bor(ReactTypeOfModeModule.BlockingMode, ReactTypeOfModeModule.ConcurrentMode))) == 0 then return end
		local Tag = p16.tag
		
		if Tag ~= ReactWorkTagsModule.IndeterminateComponent and Tag ~= ReactWorkTagsModule.HostRoot and Tag ~= ReactWorkTagsModule.ClassComponent and Tag ~= ReactWorkTagsModule.FunctionComponent and Tag ~= ReactWorkTagsModule.ForwardRef and Tag ~= ReactWorkTagsModule.MemoComponent and Tag ~= ReactWorkTagsModule.SimpleMemoComponent and Tag ~= ReactWorkTagsModule.Block then return end
		local ComponentName = GetComponentNameFunction(p16.type) or "ReactComponent"
		
		if Config == nil then
			Config = { [ComponentName] = true }
		else
			if Config[ComponentName] then return end
			Config[ComponentName] = true
		end
		local Current = ReactCurrentFiberModule.current
		local Success, Result = pcall(function()
			-- upvalues: SetCurrentFiberFunction (upval), p16 (copy), Console (upval)
			SetCurrentFiberFunction(p16)
			Console.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
		end)
		
		if Current then
			SetCurrentFiberFunction(p16)
		else
			ResetCurrentFiberFunction()
		end
		if not Success then
			error(Result)
		end
	end
end

if DEV and ReactFeatureFlags.replayFailedUnitOfWorkWithInvokeGuardedCallback then
	function config1.beginWork(Alternate, p16, SubtreeRenderLanes)
		-- upvalues: ReactFiberNewModule (copy), BeginWork (copy), DescribeError (copy), ResetContextDependenciesFunction (copy), config (copy), ReactFiberHooksNewModule (ref), UnwindInterruptedWorkFunction (copy), ReactFeatureFlags (copy), ReactTypeOfModeModule (copy), ReactProfilerTimerNewModule (copy), InvokeGuardedCallbackFunction (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy)
		local AssignFiberPropertiesInDEVResult = ReactFiberNewModule.assignFiberPropertiesInDEV(nil, p16)
		local Success, Result = xpcall(BeginWork, DescribeError, Alternate, p16, SubtreeRenderLanes)
		
		if not Success then
			if Result ~= nil and typeof(Result) == "table" and typeof(Result.andThen) == "function" then
				error(Result)
			end
			ResetContextDependenciesFunction()
			
			if not config.resetHooksAfterThrowRef then
				ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
				config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
				config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
				config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
			end
			local _ = config.resetHooksAfterThrowRef()
			UnwindInterruptedWorkFunction(p16)
			ReactFiberNewModule.assignFiberPropertiesInDEV(p16, AssignFiberPropertiesInDEVResult)
			
			if ReactFeatureFlags.enableProfilerTimer and bit32.band(p16.mode, ReactTypeOfModeModule.ProfileMode) ~= 0 then
				ReactProfilerTimerNewModule.startProfilerTimer(p16)
			end
			InvokeGuardedCallbackFunction(nil, BeginWork, nil, Alternate, p16, SubtreeRenderLanes)
			
			if HasCaughtErrorFunction() then
				error((ClearCaughtErrorFunction()))
				
				return Result
			end
			error(Result)
		end
		return Result
	end
else
	config1.beginWork = BeginWork
end
local Flag3 = false
local T = if DEV then {} else nil

function config1.warnAboutRenderPhaseUpdatesInDEV(p16)
	-- upvalues: DEV (copy), ReactCurrentFiberModule (copy), Bits (ref), config (copy), ReactFiberHooksNewModule (ref), ReactWorkTagsModule (copy), WorkInProgress (ref), GetComponentNameFunction (copy), T (ref), Console (copy), Flag3 (ref)
	if DEV and ReactCurrentFiberModule.isRendering and bit32.band(Bits, 16) ~= 0 then
		if not config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
			ReactFiberHooksNewModule = require(script.Parent["ReactFiberHooks.new"])
			config.resetHooksAfterThrowRef = ReactFiberHooksNewModule.resetHooksAfterThrow
			config.ContextOnlyDispatcherRef = ReactFiberHooksNewModule.ContextOnlyDispatcher
			config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = ReactFiberHooksNewModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV
		end
		if not config.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
			if p16.tag == ReactWorkTagsModule.FunctionComponent or p16.tag == ReactWorkTagsModule.ForwardRef or p16.tag == ReactWorkTagsModule.SimpleMemoComponent then
				local ComponentName = WorkInProgress and GetComponentNameFunction(WorkInProgress.type) or "Unknown"
				
				if T[ComponentName] == nil then
					T[ComponentName] = true
					Console.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", GetComponentNameFunction(p16.type) or "Unknown", ComponentName, ComponentName)
					
					return
				end
			elseif p16.tag == ReactWorkTagsModule.ClassComponent and not Flag3 then
				Console.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
				Flag3 = true
			end
		end
	end
end

ReactFiberWorkLoopModule.IsThisRendererActing = { current = false }

function ReactFiberWorkLoopModule.warnIfNotScopedWithMatchingAct(p16)
	-- upvalues: DEV (copy), ReactFiberHostConfigModule (copy), IsSomeRendererActing (copy), ReactFiberWorkLoopModule (copy), ReactCurrentFiberModule (copy), SetCurrentFiberFunction (copy), Console (copy), ResetCurrentFiberFunction (copy)
	if DEV and ReactFiberHostConfigModule.warnsIfNotActing == true and IsSomeRendererActing.current == true and ReactFiberWorkLoopModule.IsThisRendererActing.current ~= true then
		local Current = ReactCurrentFiberModule.current
		local Success, Result = pcall(function()
			-- upvalues: SetCurrentFiberFunction (upval), p16 (copy), Console (upval)
			SetCurrentFiberFunction(p16)
			Console.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
		end)
		
		if Current then
			SetCurrentFiberFunction(p16)
		else
			ResetCurrentFiberFunction()
		end
		if not Success then
			error(Result)
		end
	end
end

function ReactFiberWorkLoopModule.warnIfNotCurrentlyActingEffectsInDEV(p16)
	-- upvalues: DEV (copy), ReactFiberHostConfigModule (copy), ReactTypeOfModeModule (copy), IsSomeRendererActing (copy), ReactFiberWorkLoopModule (copy), Console (copy), GetComponentNameFunction (copy)
	if DEV and ReactFiberHostConfigModule.warnsIfNotActing == true and bit32.band(p16.mode, ReactTypeOfModeModule.StrictMode) ~= ReactTypeOfModeModule.NoMode and IsSomeRendererActing.current == false and ReactFiberWorkLoopModule.IsThisRendererActing.current == false then
		Console.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", GetComponentNameFunction(p16.type))
	end
end

function ReactFiberWorkLoopModule.warnIfNotCurrentlyActingUpdatesInDEV(p16)
	-- upvalues: DEV (copy), ReactFiberHostConfigModule (copy), Bits (ref), IsSomeRendererActing (copy), ReactFiberWorkLoopModule (copy), Current (copy), SetCurrentFiberFunction (copy), Console (copy), GetComponentNameFunction (copy), ResetCurrentFiberFunction (copy)
	if DEV and ReactFiberHostConfigModule.warnsIfNotActing == true and Bits == 0 and IsSomeRendererActing.current == false and ReactFiberWorkLoopModule.IsThisRendererActing.current == false then
		local Success, Result = pcall(function()
			-- upvalues: SetCurrentFiberFunction (upval), p16 (copy), Console (upval), GetComponentNameFunction (upval)
			SetCurrentFiberFunction(p16)
			Console.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", GetComponentNameFunction(p16.type))
		end)
		
		if Current then
			SetCurrentFiberFunction(p16)
		else
			ResetCurrentFiberFunction()
		end
		if Success then
			return Result
		end
	end
end

local Enabled = false

function ReactFiberWorkLoopModule.warnIfUnmockedScheduler(p16)
	-- upvalues: DEV (copy), Enabled (ref), SchedulerModule (copy), ReactTypeOfModeModule (copy), Console (copy), ReactFeatureFlags (copy)
	if DEV and Enabled == false and SchedulerModule.unstable_flushAllWithoutAsserting == nil then
		if bit32.band(p16.mode, ReactTypeOfModeModule.BlockingMode) ~= 0 or bit32.band(p16.mode, ReactTypeOfModeModule.ConcurrentMode) ~= 0 then
			Enabled = true
			Console.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
			
			return
		end
		if ReactFeatureFlags.warnAboutUnmockedScheduler == true then
			Enabled = true
			Console.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
		end
	end
end

function computeThreadID(p16, p17: number): number
	return p17 * 1000 + p16.interactionThreadID
end

function ReactFiberWorkLoopModule.markSpawnedWork(p16)
	-- upvalues: ReactFeatureFlags (copy), List (ref)
	if not ReactFeatureFlags.enableSchedulerTracing then return end
	if List == nil then
		List = { p16 }
		
		return
	else
		table.insert(List, p16)
	end
end

function scheduleInteractions(p16, p17, List)
	-- upvalues: ReactFeatureFlags (copy), Set (copy), SubscriberRef (copy)
	if not ReactFeatureFlags.enableSchedulerTracing then return end
	if List.size > 0 then
		local PendingInteractionMap = p16.pendingInteractionMap
		local GetResult = PendingInteractionMap:get(p17)
		
		if GetResult == nil then
			PendingInteractionMap:set(p17, Set.new(List))
			
			for _, value in List do
				value.__count += 1
			end
		else
			List:forEach(function(p18)
				-- upvalues: GetResult (copy)
				if not GetResult:has(p18) then
					p18.__count += 1
				end
				GetResult:add(p18)
			end)
		end
		local Current = SubscriberRef.current
		
		if Current ~= nil then
			Current.onWorkScheduled(List, (computeThreadID(p16, p17)))
		end
	end
end

function config1.schedulePendingInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane)
	-- upvalues: ReactFeatureFlags (copy), InteractionsRef (copy)
	if ReactFeatureFlags.enableSchedulerTracing then
		scheduleInteractions(MarkUpdateLaneFromFiberToRootResult, SyncLane, InteractionsRef.current)
		
		return
	end
end

function config1.startWorkOnPendingInteractions(p18, SubtreeRenderLanes)
	-- upvalues: ReactFeatureFlags (copy), Set (copy), IncludesSomeLaneFunction (copy), SubscriberRef (copy), DescribeError (copy), ScheduleCallbackFunction (copy), ImmediatePriority (copy)
	if not ReactFeatureFlags.enableSchedulerTracing then return end
	local NewSet = Set.new()
	p18.pendingInteractionMap:forEach(function(p19, p20)
		-- upvalues: IncludesSomeLaneFunction (upval), SubtreeRenderLanes (copy), NewSet (copy)
		if IncludesSomeLaneFunction(SubtreeRenderLanes, p20) then
			p19:forEach(function(p21)
				-- upvalues: NewSet (upval)
				NewSet:add(p21)
			end)
		end
	end)
	p18.memoizedInteractions = NewSet
	
	if NewSet.size > 0 then
		local Current = SubscriberRef.current
		
		if Current ~= nil then
			local Success, Result = xpcall(Current.onWorkStarted, DescribeError, NewSet, (computeThreadID(p18, SubtreeRenderLanes)))
			
			if not Success then
				ScheduleCallbackFunction(ImmediatePriority, function()
					-- upvalues: Result (copy)
					error(Result)
				end)
			end
		end
	end
end

function config1.finishPendingInteractions(p18, FinishedLanes)
	-- upvalues: ReactFeatureFlags (copy), SubscriberRef (copy), DescribeError (copy), IncludesSomeLaneFunction (copy), ScheduleCallbackFunction (copy), ImmediatePriority (copy)
	if not ReactFeatureFlags.enableSchedulerTracing then return end
	local PendingLanes = p18.pendingLanes
	local Current = nil
	local v23 = true
	local v24 = nil
	
	if Current ~= nil and p18.memoizedInteractions.size > 0 then
		Current = SubscriberRef.current
		v23, v321 = xpcall(Current.onWorkStopped, DescribeError, p18.memoizedInteractions, (computeThreadID(p18, FinishedLanes)))
	end
	local PendingInteractionMap = p18.pendingInteractionMap
	PendingInteractionMap:forEach(function(p19, p20)
		-- upvalues: IncludesSomeLaneFunction (upval), PendingLanes (copy), PendingInteractionMap (copy), Current (ref), DescribeError (upval), ScheduleCallbackFunction (upval), ImmediatePriority (upval)
		if not IncludesSomeLaneFunction(PendingLanes, p20) then
			PendingInteractionMap:delete(p20)
			p19:forEach(function(p21)
				-- upvalues: Current (upval), DescribeError (upval), ScheduleCallbackFunction (upval), ImmediatePriority (upval)
				p21.__count -= 1
				
				if Current ~= nil and p21.__count == 0 then
					local Success, Result = xpcall(Current.onInteractionScheduledWorkCompleted, DescribeError, p21)
					
					if not Success then
						ScheduleCallbackFunction(ImmediatePriority, function()
							-- upvalues: Result (copy)
							error(Result)
						end)
					end
				end
			end)
		end
	end)
	
	if not v23 then
		ScheduleCallbackFunction(ImmediatePriority, function()
			-- upvalues: v24 (ref)
			error(v24)
		end)
	end
end

local Flag4 = false
local Flag5 = false
local UnstableFlushAllWithoutAsserting = SchedulerModule.unstable_flushAllWithoutAsserting
local IsFunction = typeof(UnstableFlushAllWithoutAsserting) == "function"

local function flushActWork()
	-- upvalues: UnstableFlushAllWithoutAsserting (copy), Flag4 (ref), DescribeError (copy), ReactFiberWorkLoopModule (copy)
	if UnstableFlushAllWithoutAsserting == nil then
		local Flag: boolean = Flag4
		Flag4 = true
		local Success1, Result1 = xpcall(function(): boolean
			-- upvalues: ReactFiberWorkLoopModule (upval)
			local Flag = false
			while ReactFiberWorkLoopModule.flushPassiveEffects() do
				Flag = true
			end
			return Flag
		end, DescribeError)
		Flag4 = Flag
		
		if Success1 then
			return Result1
		else
			error(Result1)
			
			return
		end
	else
		local Flag: boolean = Flag4
		Flag4 = true
		local Success, Result = xpcall(UnstableFlushAllWithoutAsserting, DescribeError)
		Flag4 = Flag
		
		if Success then
			return Result
		else
			error(Result)
		end
	end
end

local function flushWorkAndMicroTasks(Callback: (any) -> ())
	-- upvalues: flushActWork (copy), DescribeError (copy), EnqueueTask (copy), flushWorkAndMicroTasks (copy)
	local Success, Result = xpcall(flushActWork, DescribeError)
	
	if Success then
		Success, Result = xpcall(EnqueueTask, DescribeError, function()
			-- upvalues: flushActWork (upval), flushWorkAndMicroTasks (upval), Callback (copy)
			if flushActWork() then
				flushWorkAndMicroTasks(Callback)
				
				return
			else
				Callback()
			end
		end)
	end
	if not Success then
		Callback(Result)
	end
end

function ReactFiberWorkLoopModule.act(p18)
	-- upvalues: DEV (copy), ReactGlobalsModule (copy), Enabled1 (ref), Console (copy), Count2 (ref), IsSomeRendererActing (copy), ReactFiberWorkLoopModule (copy), Flag5 (ref), DescribeError (copy), PromiseModule (copy), IsFunction (copy), flushWorkAndMicroTasks (copy), flushActWork (copy)
	if not DEV and not ReactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ and Enabled1 == false then
		Enabled1 = true
		Console.error("act(...) is not supported in production builds of React, and might not behave as expected.")
	end
	local Count: number = Count2
	Count2 += 1
	local Current = IsSomeRendererActing.current
	local Current1 = ReactFiberWorkLoopModule.IsThisRendererActing.current
	local Flag: boolean = Flag5
	IsSomeRendererActing.current = true
	ReactFiberWorkLoopModule.IsThisRendererActing.current = true
	Flag5 = true
	
	local function _()
		-- upvalues: Count2 (upval), IsSomeRendererActing (upval), Current (copy), ReactFiberWorkLoopModule (upval), Current1 (copy), Flag5 (upval), Flag (copy), DEV (upval), Count (copy), Console (upval)
		Count2 -= 1
		IsSomeRendererActing.current = Current
		ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
		Flag5 = Flag
		
		if DEV and Count < Count2 then
			Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
	end
	
	local Success, Result = xpcall(ReactFiberWorkLoopModule.batchedUpdates, DescribeError, p18)
	
	if not Success then
		Count2 -= 1
		IsSomeRendererActing.current = Current
		ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
		Flag5 = Flag
		
		if DEV and Count < Count2 then
			Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
		end
		error(Result)
	end
	if Result == nil or typeof(Result) ~= "table" or typeof(Result.andThen) ~= "function" then
		local Enabled = DEV
		
		if Enabled and Result ~= nil then
			Enabled = Console
			Enabled = Enabled.error
			Enabled("The callback passed to act(...) function must return nil, or a Promise. You returned %s", (tostring(Result)))
		end
		Enabled = xpcall
		local CallbackResult, CallbackResult2 = Enabled(function()
			-- upvalues: Count2 (upval), IsFunction (upval), Current (copy), flushActWork (upval), IsSomeRendererActing (upval), ReactFiberWorkLoopModule (upval), Current1 (copy), Flag5 (upval), Flag (copy), DEV (upval), Count (copy), Console (upval)
			if Count2 == 1 and (IsFunction == false or Current == false) then
				flushActWork()
			end
			Count2 -= 1
			IsSomeRendererActing.current = Current
			ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
			Flag5 = Flag
			
			if DEV and Count < Count2 then
				Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
		end, DescribeError)
		
		if not CallbackResult then
			Count2 -= 1
			IsSomeRendererActing.current = Current
			ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
			Flag5 = Flag
			
			if DEV and Count < Count2 then
				Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
			end
			error(CallbackResult2)
		end
		return {
			andThen = function(_, Callback: () -> (), _)
				-- upvalues: DEV (upval), Console (upval)
				if DEV then
					Console.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
				end
				Callback()
			end
		}
	else
		local Enabled = false
		
		if DEV and typeof(PromiseModule) ~= nil then
			PromiseModule.resolve():andThen(function() end):andThen(function()
				-- upvalues: Enabled (ref), Console (upval)
				if Enabled == false then
					Console.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);")
				end
			end)
		end
		return {
			andThen = function(_, Callback, Callback1)
				-- upvalues: Enabled (ref), Result (copy), Count2 (upval), IsFunction (upval), Current (copy), IsSomeRendererActing (upval), ReactFiberWorkLoopModule (upval), Current1 (copy), Flag5 (upval), Flag (copy), DEV (upval), Count (copy), Console (upval), flushWorkAndMicroTasks (upval)
				Enabled = true
				
				return Result:andThen(function()
					-- upvalues: Count2 (upval), IsFunction (upval), Current (upval), IsSomeRendererActing (upval), ReactFiberWorkLoopModule (upval), Current1 (upval), Flag5 (upval), Flag (upval), DEV (upval), Count (upval), Console (upval), Callback (copy), flushWorkAndMicroTasks (upval), Callback1 (copy)
					if Count2 <= 1 and (IsFunction ~= true or Current ~= true) then
						flushWorkAndMicroTasks(function(p19)
							-- upvalues: Count2 (upval), IsSomeRendererActing (upval), Current (upval), ReactFiberWorkLoopModule (upval), Current1 (upval), Flag5 (upval), Flag (upval), DEV (upval), Count (upval), Console (upval), Callback1 (upval), Callback (upval)
							Count2 -= 1
							IsSomeRendererActing.current = Current
							ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
							Flag5 = Flag
							
							if DEV and Count < Count2 then
								Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
							end
							if p19 then
								Callback1(p19)
								
								return
							else
								Callback()
							end
						end)
						
						return
					end
					Count2 -= 1
					IsSomeRendererActing.current = Current
					ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
					Flag5 = Flag
					
					if DEV and Count < Count2 then
						Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					Callback()
				end, function(p19)
					-- upvalues: Count2 (upval), IsSomeRendererActing (upval), Current (upval), ReactFiberWorkLoopModule (upval), Current1 (upval), Flag5 (upval), Flag (upval), DEV (upval), Count (upval), Console (upval), Callback1 (copy)
					Count2 -= 1
					IsSomeRendererActing.current = Current
					ReactFiberWorkLoopModule.IsThisRendererActing.current = Current1
					Flag5 = Flag
					
					if DEV and Count < Count2 then
						Console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
					end
					Callback1(p19)
				end)
			end
		}
	end
end

function config1.detachFiberAfterEffects(Alternate)
	-- upvalues: EnableNewTreeCleanupPath (copy), config1 (copy), DeletedTreeCleanUpLevel (copy), DEV (copy)
	if EnableNewTreeCleanupPath then
		local Alternate1 = Alternate.alternate
		
		if Alternate1 ~= nil then
			Alternate.alternate = nil
			config1.detachFiberAfterEffects(Alternate1)
		end
	end
	if EnableNewTreeCleanupPath and DeletedTreeCleanUpLevel >= 2 then
		Alternate.child = nil
		Alternate.deletions = nil
		Alternate.sibling = nil
		
		if DEV then
			Alternate._debugOwner = nil
		end
		if DeletedTreeCleanUpLevel >= 3 then
			Alternate.return_ = nil
			Alternate.dependencies = nil
			Alternate.memoizedProps = nil
			Alternate.memoizedState = nil
			Alternate.pendingProps = nil
			Alternate.stateNode = nil
			Alternate.updateQueue = nil
		end
	else
		Alternate.child = nil
		Alternate.deletions = nil
		Alternate.dependencies = nil
		Alternate.memoizedProps = nil
		Alternate.memoizedState = nil
		Alternate.pendingProps = nil
		Alternate.sibling = nil
		Alternate.stateNode = nil
		Alternate.updateQueue = nil
		
		if DEV then
			Alternate._debugOwner = nil
			
			return
		end
	end
end

return ReactFiberWorkLoopModule