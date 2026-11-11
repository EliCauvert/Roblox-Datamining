local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.Shared)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local DEV = ReactGlobalsModule.__DEV__
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactRootTagsModule = require(script.Parent.ReactRootTags)
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local _ = require(script.Parent.ReactFiberHostConfig)
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local FundamentalComponent = ReactWorkTagsModule.FundamentalComponent
local _ = require(Parent.Shared)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ReactFiberTreeReflectionModule = require(script.Parent.ReactFiberTreeReflection)
local FindCurrentHostFiberFunction = ReactFiberTreeReflectionModule.findCurrentHostFiber
local FindCurrentHostFiberWithNoPortalsFunction = ReactFiberTreeReflectionModule.findCurrentHostFiberWithNoPortals
local GetFunction = require(Parent.Shared).ReactInstanceMap.get
local HostComponent = ReactWorkTagsModule.HostComponent
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local InvariantFunction = require(Parent.Shared).invariant
local DescribeError = require(Parent.Shared).describeError
local EnableSchedulingProfiler = require(Parent.Shared).ReactFeatureFlags.enableSchedulingProfiler
local ReactSharedInternals = require(Parent.Shared).ReactSharedInternals
local GetPublicInstanceFunction = require(script.Parent.ReactFiberHostConfig).getPublicInstance
local ReactFiberContextNewModule = require(script.Parent["ReactFiberContext.new"])
local FindCurrentUnmaskedContextFunction = ReactFiberContextNewModule.findCurrentUnmaskedContext
local ProcessChildContextFunction = ReactFiberContextNewModule.processChildContext
local EmptyContextObject = ReactFiberContextNewModule.emptyContextObject
local IsContextProviderFunction = ReactFiberContextNewModule.isContextProvider
local CreateFiberRootFunction = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot
local ReactFiberDevToolsHookNewModule = require(script.Parent["ReactFiberDevToolsHook.new"])
local InjectInternalsFunction = ReactFiberDevToolsHookNewModule.injectInternals
local OnScheduleRootFunction = ReactFiberDevToolsHookNewModule.onScheduleRoot
local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
local RequestEventTimeFunction = ReactFiberWorkLoopNewModule.requestEventTime
local RequestUpdateLaneFunction = ReactFiberWorkLoopNewModule.requestUpdateLane
local ScheduleUpdateOnFiberFunction = ReactFiberWorkLoopNewModule.scheduleUpdateOnFiber
local FlushRootFunction = ReactFiberWorkLoopNewModule.flushRoot
local BatchedEventUpdates = ReactFiberWorkLoopNewModule.batchedEventUpdates
local BatchedUpdates = ReactFiberWorkLoopNewModule.batchedUpdates
local UnbatchedUpdates = ReactFiberWorkLoopNewModule.unbatchedUpdates
local FlushSyncFunction = ReactFiberWorkLoopNewModule.flushSync
local FlushControlled = ReactFiberWorkLoopNewModule.flushControlled
local DeferredUpdates = ReactFiberWorkLoopNewModule.deferredUpdates
local DiscreteUpdates = ReactFiberWorkLoopNewModule.discreteUpdates
local FlushDiscreteUpdates = ReactFiberWorkLoopNewModule.flushDiscreteUpdates
local FlushPassiveEffects = ReactFiberWorkLoopNewModule.flushPassiveEffects
local WarnIfNotScopedWithMatchingActFunction = ReactFiberWorkLoopNewModule.warnIfNotScopedWithMatchingAct
local WarnIfUnmockedSchedulerFunction = ReactFiberWorkLoopNewModule.warnIfUnmockedScheduler
local IsThisRendererActing = ReactFiberWorkLoopNewModule.IsThisRendererActing
local Act = ReactFiberWorkLoopNewModule.act
local ReactUpdateQueueNewModule = require(script.Parent["ReactUpdateQueue.new"])
local CreateUpdateFunction = ReactUpdateQueueNewModule.createUpdate
local EnqueueUpdateFunction = ReactUpdateQueueNewModule.enqueueUpdate
local ReactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local IsRendering = ReactCurrentFiberModule.isRendering
local ResetCurrentFiberFunction = ReactCurrentFiberModule.resetCurrentFiber
local SetCurrentFiberFunction = ReactCurrentFiberModule.setCurrentFiber
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local StrictMode = ReactTypeOfModeModule.StrictMode
local SyncLane = ReactFiberLaneModule.SyncLane
local InputDiscreteHydrationLane = ReactFiberLaneModule.InputDiscreteHydrationLane
local SelectiveHydrationLane = ReactFiberLaneModule.SelectiveHydrationLane
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local GetHighestPriorityPendingLanesFunction = ReactFiberLaneModule.getHighestPriorityPendingLanes
local HigherPriorityLaneFunction = ReactFiberLaneModule.higherPriorityLane
local GetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.getCurrentUpdateLanePriority
local SetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.setCurrentUpdateLanePriority
local ReactFiberHotReloadingNewModule = require(script.Parent["ReactFiberHotReloading.new"])
local ScheduleRefresh = ReactFiberHotReloadingNewModule.scheduleRefresh
local ScheduleRoot = ReactFiberHotReloadingNewModule.scheduleRoot
local SetRefreshHandler = ReactFiberHotReloadingNewModule.setRefreshHandler
local FindHostInstancesForRefresh = ReactFiberHotReloadingNewModule.findHostInstancesForRefresh
local SchedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local MarkRenderScheduledFunction = SchedulingProfilerModule.markRenderScheduled
local ReactFiberReconcilerModule = {
	ReactRootTags = ReactRootTagsModule,
	ReactWorkTags = ReactWorkTagsModule,
	ReactTypeOfMode = ReactTypeOfModeModule,
	ReactFiberFlags = ReactFiberFlagsModule,
	getNearestMountedFiber = ReactFiberTreeReflectionModule.getNearestMountedFiber,
	findCurrentFiberUsingSlowPath = ReactFiberTreeReflectionModule.findCurrentFiberUsingSlowPath,
	createPortal = require(script.Parent.ReactPortal).createPortal
}
local Flag: boolean? = nil
local v1 = nil

if DEV then
	Flag = false
	v1 = {}
end
local function _(p1)
	-- upvalues: EmptyContextObject (copy), GetFunction (copy), FindCurrentUnmaskedContextFunction (copy), ClassComponent (copy), IsContextProviderFunction (copy), ProcessChildContextFunction (copy)
	if not p1 then
		return EmptyContextObject
	end
	local GetResult = GetFunction(p1)
	local CurrentUnmaskedContext = FindCurrentUnmaskedContextFunction(GetResult)
	
	if GetResult.tag == ClassComponent then
		local Type = GetResult.type
		
		if IsContextProviderFunction(Type) then
			return ProcessChildContextFunction(GetResult, Type, CurrentUnmaskedContext)
		end
	end
	return CurrentUnmaskedContext
end

local function findHostInstance(p1)
	-- upvalues: GetFunction (copy), InvariantFunction (copy), Object (copy), FindCurrentHostFiberFunction (copy)
	local GetResult = GetFunction(p1)
	
	if GetResult == nil then
		if typeof(p1.render) == "function" then
			InvariantFunction(false, "Unable to find node on an unmounted component.")
		else
			InvariantFunction(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(p1)))
		end
	end
	local CurrentHostFiber = FindCurrentHostFiberFunction(GetResult)
	
	return if CurrentHostFiber == nil then nil else CurrentHostFiber.stateNode
end

local function findHostInstanceWithWarning(p1, p2)
	-- upvalues: DEV (copy), GetFunction (copy), InvariantFunction (copy), Object (copy), FindCurrentHostFiberFunction (copy), StrictMode (copy), GetComponentNameFunction (copy), v1 (ref), ReactCurrentFiberModule (copy), SetCurrentFiberFunction (copy), Console (copy), DescribeError (copy), ResetCurrentFiberFunction (copy), findHostInstance (copy)
	if not DEV then
		return (findHostInstance(p1))
	end
	local GetResult = GetFunction(p1)
	
	if GetResult == nil then
		if typeof(p1.render) == "function" then
			InvariantFunction(false, "Unable to find node on an unmounted component.")
		else
			InvariantFunction(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(p1)))
		end
	end
	local CurrentHostFiber = FindCurrentHostFiberFunction(GetResult)
	
	if CurrentHostFiber == nil then
		return nil
	end
	if bit32.band(CurrentHostFiber.mode, StrictMode) ~= 0 then
		local ComponentName = GetComponentNameFunction(GetResult.type) or "Component"
		
		if not v1[ComponentName] then
			v1[ComponentName] = true
			local Current = ReactCurrentFiberModule.current
			local Success, Result = xpcall(function()
				-- upvalues: SetCurrentFiberFunction (upval), CurrentHostFiber (copy), GetResult (copy), StrictMode (upval), Console (upval), p2 (copy), ComponentName (copy)
				SetCurrentFiberFunction(CurrentHostFiber)
				
				if bit32.band(GetResult.mode, StrictMode) == 0 then
					Console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, ComponentName)
					
					return
				else
					Console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, ComponentName)
				end
			end, DescribeError)
			
			if Current then
				SetCurrentFiberFunction(Current)
			else
				ResetCurrentFiberFunction()
			end
			if not Success then
				error(Result)
			end
		end
	end
	return CurrentHostFiber.stateNode
end

function ReactFiberReconcilerModule.createContainer(p1, p2, p3, p4)
	-- upvalues: CreateFiberRootFunction (copy)
	return CreateFiberRootFunction(p1, p2, p3, p4)
end

function ReactFiberReconcilerModule.updateContainer(Element, p1, p2, Callback)
	-- upvalues: DEV (copy), OnScheduleRootFunction (copy), RequestEventTimeFunction (copy), ReactGlobalsModule (copy), WarnIfUnmockedSchedulerFunction (copy), WarnIfNotScopedWithMatchingActFunction (copy), RequestUpdateLaneFunction (copy), EnableSchedulingProfiler (copy), MarkRenderScheduledFunction (copy), EmptyContextObject (copy), GetFunction (copy), FindCurrentUnmaskedContextFunction (copy), ClassComponent (copy), IsContextProviderFunction (copy), ProcessChildContextFunction (copy), IsRendering (copy), ReactCurrentFiberModule (copy), Flag (ref), Console (copy), GetComponentNameFunction (copy), CreateUpdateFunction (copy), Object (copy), EnqueueUpdateFunction (copy), ScheduleUpdateOnFiberFunction (copy)
	if DEV then
		OnScheduleRootFunction(p1, Element)
	end
	local Current = p1.current
	local RequestEventTimeResult = RequestEventTimeFunction()
	
	if DEV and ReactGlobalsModule.__TESTEZ_RUNNING_TEST__ then
		WarnIfUnmockedSchedulerFunction(Current)
		WarnIfNotScopedWithMatchingActFunction(Current)
	end
	local RequestUpdateLaneResult = RequestUpdateLaneFunction(Current)
	local Context = nil
	
	if EnableSchedulingProfiler then
		MarkRenderScheduledFunction(RequestUpdateLaneResult)
	end
	repeat
		if not p2 then
			Context = EmptyContextObject
			break
		end
		local GetResult = GetFunction(p2)
		local CurrentUnmaskedContext = FindCurrentUnmaskedContextFunction(GetResult)
		
		if GetResult.tag == ClassComponent then
			local Type = GetResult.type
			
			if IsContextProviderFunction(Type) then
				Context = ProcessChildContextFunction(GetResult, Type, CurrentUnmaskedContext)
				break
			end
		end
		Context = CurrentUnmaskedContext
	until true
	if p1.context == nil then
		p1.context = Context
	else
		p1.pendingContext = Context
	end
	if DEV and IsRendering and ReactCurrentFiberModule.current ~= nil and not Flag then
		Flag = true
		Console.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", GetComponentNameFunction(ReactCurrentFiberModule.current.type) or "Unknown")
	end
	local Update = CreateUpdateFunction(RequestEventTimeResult, RequestUpdateLaneResult)
	
	if Element == nil then
		Element = Object.None
	end
	Update.payload = { element = Element }
	
	if Callback ~= nil then
		if DEV and typeof(Callback) ~= "function" then
			Console.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", (tostring(Callback)))
		end
		Update.callback = Callback
	end
	EnqueueUpdateFunction(Current, Update)
	ScheduleUpdateOnFiberFunction(Current, RequestUpdateLaneResult, RequestEventTimeResult)
	
	return RequestUpdateLaneResult
end

ReactFiberReconcilerModule.batchedEventUpdates = BatchedEventUpdates
ReactFiberReconcilerModule.batchedUpdates = BatchedUpdates
ReactFiberReconcilerModule.unbatchedUpdates = UnbatchedUpdates
ReactFiberReconcilerModule.deferredUpdates = DeferredUpdates
ReactFiberReconcilerModule.discreteUpdates = DiscreteUpdates
ReactFiberReconcilerModule.flushDiscreteUpdates = FlushDiscreteUpdates
ReactFiberReconcilerModule.flushControlled = FlushControlled
ReactFiberReconcilerModule.flushSync = FlushSyncFunction
ReactFiberReconcilerModule.flushPassiveEffects = FlushPassiveEffects
ReactFiberReconcilerModule.IsThisRendererActing = IsThisRendererActing
ReactFiberReconcilerModule.act = Act

function ReactFiberReconcilerModule.getPublicRootInstance(p1)
	-- upvalues: HostComponent (copy), GetPublicInstanceFunction (copy)
	local Current = p1.current
	
	return if Current.child then if Current.child.tag == HostComponent then GetPublicInstanceFunction(Current.child.stateNode) else Current.child.stateNode else nil
end

local Callback = nil

function ReactFiberReconcilerModule.attemptSynchronousHydration(p1)
	-- upvalues: HostRoot (copy), GetHighestPriorityPendingLanesFunction (copy), FlushRootFunction (copy), SuspenseComponent (copy), RequestEventTimeFunction (copy), FlushSyncFunction (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), InputDiscreteHydrationLane (copy), Callback (ref)
	if p1.tag == HostRoot then
		local StateNode = p1.stateNode
		
		if StateNode.hydrate then
			FlushRootFunction(StateNode, (GetHighestPriorityPendingLanesFunction(StateNode)))
			
			return
		end
	elseif p1.tag == SuspenseComponent then
		local RequestEventTimeResult = RequestEventTimeFunction()
		FlushSyncFunction(function()
			-- upvalues: ScheduleUpdateOnFiberFunction (upval), p1 (copy), SyncLane (upval), RequestEventTimeResult (copy)
			return ScheduleUpdateOnFiberFunction(p1, SyncLane, RequestEventTimeResult)
		end)
		Callback(p1, InputDiscreteHydrationLane)
	end
end

local _ = function(p1, p2)
	-- upvalues: HigherPriorityLaneFunction (copy)
	local MemoizedState = p1.memoizedState
	
	if MemoizedState and MemoizedState ~= nil and MemoizedState.dehydrated ~= nil then
		MemoizedState.retryLane = HigherPriorityLaneFunction(MemoizedState.retryLane, p2)
	end
end

Callback = function(p1, InputDiscreteHydrationLane)
	-- upvalues: HigherPriorityLaneFunction (copy)
	local MemoizedState = p1.memoizedState
	
	if MemoizedState and MemoizedState ~= nil and MemoizedState.dehydrated ~= nil then
		MemoizedState.retryLane = HigherPriorityLaneFunction(MemoizedState.retryLane, InputDiscreteHydrationLane)
	end
	local Alternate = p1.alternate
	
	if Alternate then
		local MemoizedState1 = Alternate.memoizedState
		
		if MemoizedState1 and MemoizedState1 ~= nil and MemoizedState1.dehydrated ~= nil then
			MemoizedState1.retryLane = HigherPriorityLaneFunction(MemoizedState1.retryLane, InputDiscreteHydrationLane)
		end
	end
end

function ReactFiberReconcilerModule.attemptUserBlockingHydration(p1)
	-- upvalues: SuspenseComponent (copy), RequestEventTimeFunction (copy), InputDiscreteHydrationLane (copy), ScheduleUpdateOnFiberFunction (copy), Callback (ref)
	if p1.tag == SuspenseComponent then
		ScheduleUpdateOnFiberFunction(p1, InputDiscreteHydrationLane, (RequestEventTimeFunction()))
		Callback(p1, InputDiscreteHydrationLane)
		
		return
	end
end

function ReactFiberReconcilerModule.attemptContinuousHydration(p1)
	-- upvalues: SuspenseComponent (copy), RequestEventTimeFunction (copy), SelectiveHydrationLane (copy), ScheduleUpdateOnFiberFunction (copy), Callback (ref)
	if p1.tag == SuspenseComponent then
		ScheduleUpdateOnFiberFunction(p1, SelectiveHydrationLane, (RequestEventTimeFunction()))
		Callback(p1, SelectiveHydrationLane)
		
		return
	end
end

function ReactFiberReconcilerModule.attemptHydrationAtCurrentPriority(p1)
	-- upvalues: SuspenseComponent (copy), RequestEventTimeFunction (copy), RequestUpdateLaneFunction (copy), ScheduleUpdateOnFiberFunction (copy), Callback (ref)
	if p1.tag == SuspenseComponent then
		local RequestEventTimeResult = RequestEventTimeFunction()
		local RequestUpdateLaneResult = RequestUpdateLaneFunction(p1)
		ScheduleUpdateOnFiberFunction(p1, RequestUpdateLaneResult, RequestEventTimeResult)
		Callback(p1, RequestUpdateLaneResult)
		
		return
	end
end

function ReactFiberReconcilerModule.runWithPriority(p1, p2)
	-- upvalues: GetCurrentUpdateLanePriorityFunction (copy), SetCurrentUpdateLanePriorityFunction (copy), DescribeError (copy)
	local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
	SetCurrentUpdateLanePriorityFunction(p1)
	local Success, Result = xpcall(p2, DescribeError)
	SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
	
	if not Success then
		error(Result)
	end
	return Result
end

ReactFiberReconcilerModule.getCurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction
ReactFiberReconcilerModule.findHostInstance = findHostInstance
ReactFiberReconcilerModule.findHostInstanceWithWarning = findHostInstanceWithWarning

function ReactFiberReconcilerModule.findHostInstanceWithNoPortals(p1)
	-- upvalues: FindCurrentHostFiberWithNoPortalsFunction (copy), FundamentalComponent (copy)
	local CurrentHostFiberWithNoPortals = FindCurrentHostFiberWithNoPortalsFunction(p1)
	
	return if CurrentHostFiberWithNoPortals == nil then nil elseif CurrentHostFiberWithNoPortals.tag == FundamentalComponent then CurrentHostFiberWithNoPortals.stateNode.instance else CurrentHostFiberWithNoPortals.stateNode
end

local function shouldSuspendImpl(_): boolean
	return false
end

function ReactFiberReconcilerModule.shouldSuspend(p1)
	-- upvalues: shouldSuspendImpl (ref)
	return shouldSuspendImpl(p1)
end

local OverrideHookState: ((any, any, any, any) -> ())? = nil
local OverrideHookStateDeletePath: ((any, any, any) -> ())? = nil
local OverrideHookStateRenamePath: ((any, any, any, any) -> ())? = nil
local OverrideProps: ((any, any, any) -> ())? = nil
local OverridePropsDeletePath: ((any, any) -> ())? = nil
local OverridePropsRenamePath: ((any, any, any) -> ())? = nil
local ScheduleUpdate: ((any) -> ())? = nil
local SetSuspenseHandler: ((any) -> ())? = nil

if DEV then
	local function copyWithDeleteImpl(Tbl, p1, p2: number)
		-- upvalues: Array (copy), copyWithDeleteImpl (copy)
		local v2 = p1[p2]
		local SliceResult = if Array.isArray(Tbl) then Array.slice(Tbl) else table.clone(Tbl)
		
		if p2 + 1 ~= #p1 then
			SliceResult[v2] = copyWithDeleteImpl(Tbl[v2], p1, p2 + 1)
			
			return SliceResult
		elseif Array.isArray(SliceResult) then
			Array.splice(SliceResult, v2, 1)
			
			return SliceResult
		else
			SliceResult[v2] = nil
			
			return SliceResult
		end
	end
	
	local _ = function(p1, p2)
		-- upvalues: copyWithDeleteImpl (copy)
		return (copyWithDeleteImpl(p1, p2, 0))
	end
	
	local function copyWithRenameImpl(Tbl, p1, p2, p3: number)
		-- upvalues: Array (copy), copyWithRenameImpl (copy)
		local v2 = p1[p3]
		local SliceResult = if Array.isArray(Tbl) then Array.slice(Tbl) else table.clone(Tbl)
		
		if p3 + 1 ~= #p1 then
			SliceResult[v2] = copyWithRenameImpl(Tbl[v2], p1, p2, p3 + 1)
			
			return SliceResult
		end
		SliceResult[p2[p3]] = SliceResult[v2]
		
		if Array.isArray(SliceResult) then
			Array.splice(SliceResult, v2, 1)
			
			return SliceResult
		else
			SliceResult[v2] = nil
			
			return SliceResult
		end
	end
	
	local function copyWithRename(MemoizedProps, p1, p2)
		-- upvalues: Console (copy), copyWithRenameImpl (copy)
		if #p1 ~= #p2 then
			Console.warn("copyWithRename() expects paths of the same length")
			
			return nil
		end
		for i = 1, #p2 do
			if p1[i] ~= p2[i] then
				Console.warn("copyWithRename() expects paths to be the same except for the deepest key")
				
				return nil
			end
		end
		return (copyWithRenameImpl(MemoizedProps, p1, p2, 0))
	end
	
	local function copyWithSetImpl(Tbl, p3, p4: number, p5)
		-- upvalues: Array (copy), copyWithSetImpl (copy)
		if #p3 + 1 <= p4 then
			return p5
		else
			local v2 = p3[p4]
			local SliceResult = if Array.isArray(Tbl) then Array.slice(Tbl) else table.clone(Tbl)
			SliceResult[v2] = copyWithSetImpl(Tbl[v2], p3, p4 + 2, p5)
			
			return SliceResult
		end
	end
	
	local _ = function(p3, p4, p5)
		-- upvalues: copyWithSetImpl (copy)
		return (copyWithSetImpl(p3, p4, 1, p5))
	end
	
	local _ = function(p3, p4: number)
		local MemoizedState = p3.memoizedState
		while MemoizedState ~= nil and p4 > 1 do
			MemoizedState = MemoizedState.next
			p4 -= 1
		end
		return MemoizedState
	end
	
	OverrideHookState = function(p5, Count, p6, p7)
		-- upvalues: copyWithSetImpl (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		local Count1: number = Count
		local MemoizedState = p5.memoizedState
		while MemoizedState ~= nil and Count1 > 1 do
			MemoizedState = MemoizedState.next
			Count1 -= 1
		end
		local MemoizedState1 = MemoizedState
		
		if MemoizedState1 ~= nil then
			local CopyWithSetImplResult = copyWithSetImpl(MemoizedState1.memoizedState, p6, 1, p7)
			MemoizedState1.memoizedState = CopyWithSetImplResult
			MemoizedState1.baseState = CopyWithSetImplResult
			p5.memoizedProps = table.clone(p5.memoizedProps)
			ScheduleUpdateOnFiberFunction(p5, SyncLane, NoTimestamp)
		end
	end
	
	OverrideHookStateDeletePath = function(p8, Count, p9)
		-- upvalues: copyWithDeleteImpl (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		local Count1: number = Count
		local MemoizedState = p8.memoizedState
		while MemoizedState ~= nil and Count1 > 1 do
			MemoizedState = MemoizedState.next
			Count1 -= 1
		end
		local MemoizedState1 = MemoizedState
		
		if MemoizedState1 ~= nil then
			local CopyWithDeleteImplResult = copyWithDeleteImpl(MemoizedState1.memoizedState, p9, 0)
			MemoizedState1.memoizedState = CopyWithDeleteImplResult
			MemoizedState1.baseState = CopyWithDeleteImplResult
			p8.memoizedProps = table.clone(p8.memoizedProps)
			ScheduleUpdateOnFiberFunction(p8, SyncLane, NoTimestamp)
		end
	end
	
	OverrideHookStateRenamePath = function(p10, Count, p11, p12)
		-- upvalues: copyWithRename (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		local Count1: number = Count
		local MemoizedState = p10.memoizedState
		while MemoizedState ~= nil and Count1 > 1 do
			MemoizedState = MemoizedState.next
			Count1 -= 1
		end
		local MemoizedState1 = MemoizedState
		
		if MemoizedState1 ~= nil then
			local CopyWithRenameResult = copyWithRename(MemoizedState1.memoizedState, p11, p12)
			MemoizedState1.memoizedState = CopyWithRenameResult
			MemoizedState1.baseState = CopyWithRenameResult
			p10.memoizedProps = table.clone(p10.memoizedProps)
			ScheduleUpdateOnFiberFunction(p10, SyncLane, NoTimestamp)
		end
	end
	
	OverrideProps = function(p13, p14, p15)
		-- upvalues: copyWithSetImpl (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		p13.pendingProps = copyWithSetImpl(p13.memoizedProps, p14, 1, p15)
		local Alternate = p13.alternate
		
		if Alternate then
			Alternate.pendingProps = p13.pendingProps
		end
		ScheduleUpdateOnFiberFunction(p13, SyncLane, NoTimestamp)
	end
	
	OverridePropsDeletePath = function(p13, p14)
		-- upvalues: copyWithDeleteImpl (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		p13.pendingProps = copyWithDeleteImpl(p13.memoizedProps, p14, 0)
		local Alternate = p13.alternate
		
		if Alternate then
			Alternate.pendingProps = p13.pendingProps
		end
		ScheduleUpdateOnFiberFunction(p13, SyncLane, NoTimestamp)
	end
	
	OverridePropsRenamePath = function(p13, p14, p15)
		-- upvalues: copyWithRename (copy), ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		p13.pendingProps = copyWithRename(p13.memoizedProps, p14, p15)
		local Alternate = p13.alternate
		
		if Alternate then
			Alternate.pendingProps = p13.pendingProps
		end
		ScheduleUpdateOnFiberFunction(p13, SyncLane, NoTimestamp)
	end
	
	ScheduleUpdate = function(p13)
		-- upvalues: ScheduleUpdateOnFiberFunction (copy), SyncLane (copy), NoTimestamp (copy)
		ScheduleUpdateOnFiberFunction(p13, SyncLane, NoTimestamp)
	end
	
	SetSuspenseHandler = function(p13)
		-- upvalues: shouldSuspendImpl (ref)
		shouldSuspendImpl = p13
	end
end
function findHostInstanceByFiber(p10)
	-- upvalues: FindCurrentHostFiberFunction (copy)
	local CurrentHostFiber = FindCurrentHostFiberFunction(p10)
	
	return if CurrentHostFiber == nil then nil else CurrentHostFiber.stateNode
end

function emptyFindFiberByHostInstance(_)
	return nil
end

function getCurrentFiberForDevTools()
	-- upvalues: ReactCurrentFiberModule (copy)
	return ReactCurrentFiberModule.current
end

function ReactFiberReconcilerModule.injectIntoDevTools(p10)
	-- upvalues: ReactSharedInternals (copy), DEV (copy), InjectInternalsFunction (copy), OverrideHookState (ref), OverrideHookStateDeletePath (ref), OverrideHookStateRenamePath (ref), OverrideProps (ref), OverridePropsDeletePath (ref), OverridePropsRenamePath (ref), SetSuspenseHandler (ref), ScheduleUpdate (ref), FindHostInstancesForRefresh (copy), ScheduleRefresh (copy), ScheduleRoot (copy), SetRefreshHandler (copy)
	return InjectInternalsFunction({
		bundleType = p10.bundleType,
		version = p10.version,
		rendererPackageName = p10.rendererPackageName,
		rendererConfig = p10.rendererConfig,
		overrideHookState = OverrideHookState,
		overrideHookStateDeletePath = OverrideHookStateDeletePath,
		overrideHookStateRenamePath = OverrideHookStateRenamePath,
		overrideProps = OverrideProps,
		overridePropsDeletePath = OverridePropsDeletePath,
		overridePropsRenamePath = OverridePropsRenamePath,
		setSuspenseHandler = SetSuspenseHandler,
		scheduleUpdate = ScheduleUpdate,
		currentDispatcherRef = ReactSharedInternals.ReactCurrentDispatcher,
		findHostInstanceByFiber = findHostInstanceByFiber,
		findFiberByHostInstance = p10.findFiberByHostInstance or emptyFindFiberByHostInstance,
		findHostInstancesForRefresh = if DEV then FindHostInstancesForRefresh else nil,
		scheduleRefresh = if DEV then ScheduleRefresh else nil,
		scheduleRoot = if DEV then ScheduleRoot else nil,
		setRefreshHandler = if DEV then SetRefreshHandler else nil,
		getCurrentFiber = if DEV then getCurrentFiberForDevTools else nil
	})
end

ReactFiberReconcilerModule.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)
ReactFiberReconcilerModule.schedulingProfiler = {
	profilerEventTypes = SchedulingProfilerModule.profilerEventTypes,
	registerProfilerEventCallback = SchedulingProfilerModule.registerProfilerEventCallback
}

return ReactFiberReconcilerModule