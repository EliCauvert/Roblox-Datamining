local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Object = require(Parent.LuauPolyfill).Object
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent.ReactCapturedValue)
local ReactUpdateQueueNewModule = require(script.Parent["ReactUpdateQueue.new"])
local _ = require(Parent.Shared)
local ReactFiberSuspenseContextNewModule = require(script.Parent["ReactFiberSuspenseContext.new"])
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local IncompleteClassComponent = ReactWorkTagsModule.IncompleteClassComponent
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local DidCapture = ReactFiberFlagsModule.DidCapture
local Incomplete = ReactFiberFlagsModule.Incomplete
local NoFlags = ReactFiberFlagsModule.NoFlags
local ShouldCapture = ReactFiberFlagsModule.ShouldCapture
local LifecycleEffectMask = ReactFiberFlagsModule.LifecycleEffectMask
local ForceUpdateForLegacySuspense = ReactFiberFlagsModule.ForceUpdateForLegacySuspense
local ShouldCaptureSuspenseFunction = require(script.Parent["ReactFiberSuspenseComponent.new"]).shouldCaptureSuspense
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local NoMode = ReactTypeOfModeModule.NoMode
local BlockingMode = ReactTypeOfModeModule.BlockingMode
local DebugTracingMode = ReactTypeOfModeModule.DebugTracingMode
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableDebugTracing = ReactFeatureFlags.enableDebugTracing
local EnableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local CreateCapturedValueFunction = require(script.Parent.ReactCapturedValue).createCapturedValue
local EnqueueCapturedUpdateFunction = ReactUpdateQueueNewModule.enqueueCapturedUpdate
local CreateUpdateFunction = ReactUpdateQueueNewModule.createUpdate
local CaptureUpdate = ReactUpdateQueueNewModule.CaptureUpdate
local ForceUpdate = ReactUpdateQueueNewModule.ForceUpdate
local EnqueueUpdateFunction = ReactUpdateQueueNewModule.enqueueUpdate
local MarkFailedErrorBoundaryForHotReloadingFunction = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading
local HasSuspenseContextFunction = ReactFiberSuspenseContextNewModule.hasSuspenseContext
local InvisibleParentSuspenseContext = ReactFiberSuspenseContextNewModule.InvisibleParentSuspenseContext
local SuspenseStackCursor = ReactFiberSuspenseContextNewModule.suspenseStackCursor
local ReactFiberWorkLoopNewModule = nil
local MarkLegacyErrorBoundaryAsFailed = nil
local IsAlreadyFailedLegacyErrorBoundary = nil
local PingSuspendedRoot = nil

local function v37(...)
	-- upvalues: MarkLegacyErrorBoundaryAsFailed (ref), ReactFiberWorkLoopNewModule (ref)
	if not MarkLegacyErrorBoundaryAsFailed then
		ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
		MarkLegacyErrorBoundaryAsFailed = ReactFiberWorkLoopNewModule.markLegacyErrorBoundaryAsFailed
	end
	return MarkLegacyErrorBoundaryAsFailed(...)
end

local function v38(...)
	-- upvalues: ReactFiberWorkLoopNewModule (ref), PingSuspendedRoot (ref)
	if ReactFiberWorkLoopNewModule == nil then
		ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	PingSuspendedRoot = ReactFiberWorkLoopNewModule.pingSuspendedRoot
	
	return PingSuspendedRoot(...)
end

local function v39(...)
	-- upvalues: ReactFiberWorkLoopNewModule (ref), IsAlreadyFailedLegacyErrorBoundary (ref)
	if ReactFiberWorkLoopNewModule == nil then
		ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	IsAlreadyFailedLegacyErrorBoundary = ReactFiberWorkLoopNewModule.isAlreadyFailedLegacyErrorBoundary
	
	return IsAlreadyFailedLegacyErrorBoundary(...)
end

local LogCapturedErrorFunction = require(script.Parent.ReactFiberErrorLogger).logCapturedError
local LogComponentSuspendedFunction = require(script.Parent.DebugTracing).logComponentSuspended
local MarkComponentSuspendedFunction = require(script.Parent.SchedulingProfiler).markComponentSuspended
local SyncLane = ReactFiberLaneModule.SyncLane
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local IncludesSomeLaneFunction = ReactFiberLaneModule.includesSomeLane
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local PickArbitraryLaneFunction = ReactFiberLaneModule.pickArbitraryLane

function createRootErrorUpdate(p1, p2, p3, Callback)
	-- upvalues: CreateUpdateFunction (copy), NoTimestamp (copy), CaptureUpdate (copy), Object (copy), LogCapturedErrorFunction (copy)
	local Update = CreateUpdateFunction(NoTimestamp, p3)
	Update.tag = CaptureUpdate
	Update.payload = { element = Object.None }
	local Value = p2.value
	
	function Update.callback()
		-- upvalues: Callback (copy), Value (copy), LogCapturedErrorFunction (upval), p1 (copy), p2 (copy)
		if Callback ~= nil then
			Callback(Value)
		end
		LogCapturedErrorFunction(p1, p2)
	end
	
	return Update
end

function createClassErrorUpdate(p1, p2, p3)
	-- upvalues: CreateUpdateFunction (copy), NoTimestamp (copy), CaptureUpdate (copy), LogCapturedErrorFunction (copy), ReactGlobalsModule (copy), MarkFailedErrorBoundaryForHotReloadingFunction (copy), v37 (copy), IncludesSomeLaneFunction (copy), SyncLane (copy), Console (copy), GetComponentNameFunction (copy)
	local Update = CreateUpdateFunction(NoTimestamp, p3)
	Update.tag = CaptureUpdate
	local GetDerivedStateFromErrorFunction = p1.type.getDerivedStateFromError
	
	if typeof(GetDerivedStateFromErrorFunction) == "function" then
		local Value = p2.value
		
		function Update.payload()
			-- upvalues: LogCapturedErrorFunction (upval), p1 (copy), p2 (copy), GetDerivedStateFromErrorFunction (copy), Value (copy)
			LogCapturedErrorFunction(p1, p2)
			
			return GetDerivedStateFromErrorFunction(Value)
		end
	end
	local StateNode = p1.stateNode
	
	if StateNode ~= nil and typeof(StateNode.componentDidCatch) == "function" then
		function Update.callback()
			-- upvalues: ReactGlobalsModule (upval), MarkFailedErrorBoundaryForHotReloadingFunction (upval), p1 (copy), GetDerivedStateFromErrorFunction (copy), v37 (upval), StateNode (copy), LogCapturedErrorFunction (upval), p2 (copy), IncludesSomeLaneFunction (upval), SyncLane (upval), Console (upval), GetComponentNameFunction (upval)
			if ReactGlobalsModule.__DEV__ then
				MarkFailedErrorBoundaryForHotReloadingFunction(p1)
			end
			if typeof(GetDerivedStateFromErrorFunction) ~= "function" then
				v37(StateNode)
				LogCapturedErrorFunction(p1, p2)
			end
			StateNode:componentDidCatch(p2.value, { componentStack = p2.stack or "" })
			
			if ReactGlobalsModule.__DEV__ and typeof(GetDerivedStateFromErrorFunction) ~= "function" and not IncludesSomeLaneFunction(p1.lanes, SyncLane) then
				Console.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", GetComponentNameFunction(p1.type) or "Unknown")
			end
		end
		
		return Update
	end
	if ReactGlobalsModule.__DEV__ then
		function Update.callback()
			-- upvalues: MarkFailedErrorBoundaryForHotReloadingFunction (upval), p1 (copy)
			MarkFailedErrorBoundaryForHotReloadingFunction(p1)
		end
	end
	return Update
end

local function attachPingListener(p1, Promise, Lanes)
	-- upvalues: v38 (copy)
	local PingCache = p1.pingCache
	local t = nil
	
	if PingCache == nil then
		t = {}
		p1.pingCache = { [Promise] = t }
		local _ = p1.pingCache
	else
		t = PingCache[Promise]
		
		if t == nil then
			t = {}
			PingCache[Promise] = t
		end
	end
	if not t[Lanes] then
		t[Lanes] = true
		
		local function v51()
			-- upvalues: v38 (upval), p1 (copy), Promise (copy), Lanes (copy)
			return v38(p1, Promise, Lanes)
		end
		
		Promise:andThen(v51, v51)
	end
end

function throwException(p1, Return, p2, p3: string, Lanes, p4, Callback: () -> ())
	-- upvalues: Incomplete (copy), ReactGlobalsModule (copy), EnableDebugTracing (copy), DebugTracingMode (copy), GetComponentNameFunction (copy), LogComponentSuspendedFunction (copy), EnableSchedulingProfiler (copy), MarkComponentSuspendedFunction (copy), BlockingMode (copy), NoMode (copy), HasSuspenseContextFunction (copy), SuspenseStackCursor (copy), InvisibleParentSuspenseContext (copy), SuspenseComponent (copy), ShouldCaptureSuspenseFunction (copy), DidCapture (copy), ForceUpdateForLegacySuspense (copy), LifecycleEffectMask (copy), ClassComponent (copy), IncompleteClassComponent (copy), CreateUpdateFunction (copy), NoTimestamp (copy), SyncLane (copy), ForceUpdate (copy), EnqueueUpdateFunction (copy), MergeLanesFunction (copy), attachPingListener (copy), ShouldCapture (copy), CreateCapturedValueFunction (copy), HostRoot (copy), PickArbitraryLaneFunction (copy), EnqueueCapturedUpdateFunction (copy), NoFlags (copy), v39 (copy)
	p2.flags = bit32.bor(p2.flags, Incomplete)
	
	if p3 ~= nil and typeof(p3) == "table" and typeof(p3.andThen) == "function" then
		local Promise: string = p3
		
		if ReactGlobalsModule.__DEV__ and EnableDebugTracing and bit32.band(p2.mode, DebugTracingMode) ~= 0 then
			LogComponentSuspendedFunction(GetComponentNameFunction(p2.type) or "Unknown", Promise)
		end
		if EnableSchedulingProfiler then
			MarkComponentSuspendedFunction(p2, Promise)
		end
		if bit32.band(p2.mode, BlockingMode) == NoMode then
			local Alternate = p2.alternate
			
			if Alternate then
				p2.updateQueue = Alternate.updateQueue
				p2.memoizedState = Alternate.memoizedState
				p2.lanes = Alternate.lanes
			else
				p2.updateQueue = nil
				p2.memoizedState = nil
			end
		end
		local HasSuspenseContext = HasSuspenseContextFunction(SuspenseStackCursor.current, InvisibleParentSuspenseContext)
		local Return2 = Return
		repeat
			if Return2.tag ~= SuspenseComponent or not ShouldCaptureSuspenseFunction(Return2, HasSuspenseContext) then
				Return2 = Return2.return_
				continue
			end
		until Return2 == nil
		local UpdateQueue = Return2.updateQueue
		
		if UpdateQueue == nil then
			Return2.updateQueue = { [Promise] = true }
		else
			UpdateQueue[Promise] = true
		end
		if bit32.band(Return2.mode, BlockingMode) ~= NoMode then
			attachPingListener(p1, Promise, Lanes)
			Return2.flags = bit32.bor(Return2.flags, ShouldCapture)
			Return2.lanes = Lanes
			
			return
		end
		Return2.flags = bit32.bor(Return2.flags, DidCapture)
		p2.flags = bit32.bor(p2.flags, ForceUpdateForLegacySuspense)
		p2.flags = bit32.band(p2.flags, (bit32.bnot((bit32.bor(LifecycleEffectMask, Incomplete)))))
		
		if p2.tag == ClassComponent then
			if p2.alternate == nil then
				p2.tag = IncompleteClassComponent
			else
				local Update = CreateUpdateFunction(NoTimestamp, SyncLane)
				Update.tag = ForceUpdate
				EnqueueUpdateFunction(p2, Update)
			end
		end
		p2.lanes = MergeLanesFunction(p2.lanes, SyncLane)
		
		return
	end
	Callback()
	local CapturedValue = CreateCapturedValueFunction(p3, p2)
	local Return1 = Return
	repeat
		if Return1.tag == HostRoot then
			Return1.flags = bit32.bor(Return1.flags, ShouldCapture)
			local PickArbitraryLaneResult = PickArbitraryLaneFunction(Lanes)
			Return1.lanes = MergeLanesFunction(Return1.lanes, PickArbitraryLaneResult)
			EnqueueCapturedUpdateFunction(Return1, (createRootErrorUpdate(Return1, CapturedValue, PickArbitraryLaneResult, p4)))
			break
		end
		if Return1.tag == ClassComponent then
			local Type = Return1.type
			local StateNode = Return1.stateNode
			
			if bit32.band(Return1.flags, DidCapture) == NoFlags and (typeof(Type.getDerivedStateFromError) == "function" or StateNode ~= nil and typeof(StateNode.componentDidCatch) == "function" and not v39(StateNode)) then
				Return1.flags = bit32.bor(Return1.flags, ShouldCapture)
				local PickArbitraryLaneResult = PickArbitraryLaneFunction(Lanes)
				Return1.lanes = MergeLanesFunction(Return1.lanes, PickArbitraryLaneResult)
				EnqueueCapturedUpdateFunction(Return1, (createClassErrorUpdate(Return1, CapturedValue, PickArbitraryLaneResult)))
				break
			end
		end
		Return1 = Return1.return_
	until Return1 == nil
end

return {
	throwException = throwException,
	createRootErrorUpdate = createRootErrorUpdate,
	createClassErrorUpdate = createClassErrorUpdate
}