local function _(Text) --[[ Line: 12 | Named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. Text)
	error("FIXME (roblox): " .. Text .. " is unimplemented")
end

local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local DEV = ReactGlobalsModule.__DEV__
local CreateRefFunction = require(Parent.React).createRef
local CreateBindingFunction = require(Parent.React).createBinding
local Console = require(Parent.Shared).console
local MemoValues = require(Parent.Shared).MemoValues
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local ReactHookEffectTagsModule = require(script.Parent.ReactHookEffectTags)
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableDebugTracing = ReactFeatureFlags.enableDebugTracing
local EnableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local EnableNewReconciler = ReactFeatureFlags.enableNewReconciler
local EnableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local EnableAllocationTrims = ReactFeatureFlags.enableAllocationTrims
local EnableHookDoubleBuffering = ReactFeatureFlags.enableHookDoubleBuffering
local DebugTracingMode = require(script.Parent.ReactTypeOfMode).DebugTracingMode
local NoLane = ReactFiberLaneModule.NoLane
local NoLanes = ReactFiberLaneModule.NoLanes
local IsSubsetOfLanesFunction = ReactFiberLaneModule.isSubsetOfLanes
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local RemoveLanesFunction = ReactFiberLaneModule.removeLanes
local MarkRootEntangledFunction = ReactFiberLaneModule.markRootEntangled
local MarkRootMutableReadFunction = ReactFiberLaneModule.markRootMutableRead
local ReadContextFunction = require(script.Parent["ReactFiberNewContext.new"]).readContext
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Update = ReactFiberFlagsModule.Update
local Passive = ReactFiberFlagsModule.Passive
local PassiveStatic = ReactFiberFlagsModule.PassiveStatic
local MountLayoutDev = ReactFiberFlagsModule.MountLayoutDev
local MountPassiveDev = ReactFiberFlagsModule.MountPassiveDev
local HasEffect = ReactHookEffectTagsModule.HasEffect
local Layout = ReactHookEffectTagsModule.Layout
local Passive1 = ReactHookEffectTagsModule.Passive
local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
local WarnIfNotCurrentlyActingUpdatesInDEVFunction = ReactFiberWorkLoopNewModule.warnIfNotCurrentlyActingUpdatesInDEV
local ScheduleUpdateOnFiberFunction = ReactFiberWorkLoopNewModule.scheduleUpdateOnFiber
local WarnIfNotScopedWithMatchingActFunction = ReactFiberWorkLoopNewModule.warnIfNotScopedWithMatchingAct
local RequestEventTimeFunction = ReactFiberWorkLoopNewModule.requestEventTime
local RequestUpdateLaneFunction = ReactFiberWorkLoopNewModule.requestUpdateLane
local MarkSkippedUpdateLanesFunction = ReactFiberWorkLoopNewModule.markSkippedUpdateLanes
local GetWorkInProgressRootFunction = ReactFiberWorkLoopNewModule.getWorkInProgressRoot
local WarnIfNotCurrentlyActingEffectsInDEVFunction = ReactFiberWorkLoopNewModule.warnIfNotCurrentlyActingEffectsInDEV
local InvariantFunction = require(Parent.Shared).invariant
local GetComponentNameFunction = require(Parent.Shared).getComponentName

local _ = function(p1: number, p2: number): boolean --[[ Line: 120 | Named "is" ]]
	return p1 == p2 and (p1 ~= 0 or 1 / p1 == 1 / p2) or p1 ~= p1 and p2 ~= p2
end

local MarkWorkInProgressReceivedUpdateFunction = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate
local GetIsHydratingFunction = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating
local MakeClientId = require(script.Parent.ReactFiberHostConfig).makeClientId
local ReactMutableSourceNewModule = require(script.Parent["ReactMutableSource.new"])
local WarnAboutMultipleRenderersDEVFunction = ReactMutableSourceNewModule.warnAboutMultipleRenderersDEV
local GetWorkInProgressVersionFunction = ReactMutableSourceNewModule.getWorkInProgressVersion
local SetWorkInProgressVersionFunction = ReactMutableSourceNewModule.setWorkInProgressVersion
local MarkSourceAsDirtyFunction = ReactMutableSourceNewModule.markSourceAsDirty
local LogStateUpdateScheduledFunction = require(script.Parent.DebugTracing).logStateUpdateScheduled
local MarkStateUpdateScheduledFunction = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled
local ReactCurrentDispatcher = require(Parent.Shared).ReactSharedInternals.ReactCurrentDispatcher
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactCleanQueueOnUpdateBailout")()
local T = if DEV then {} else nil
local Value = NoLanes
local Alternate = nil
local Alternate1 = nil
local v2 = nil
local Next = nil
local LastEffect = nil
local Flag = false
local Flag1 = false
local v3 = nil
local List = nil
local Count = 0
local Current = nil
local Current1 = nil
local Current2 = nil
local v4 = nil
local Current3 = nil
local Current4 = nil
local Current5 = nil

local _ = function(List): number --[[ Line: 281 | Named "getHighestIndex" ]]
	local v5 = 0
	
	for i, _ in List do
		if v5 < i then
			v5 = i
		end
	end
	return v5
end

local _ = function(List): boolean --[[ Line: 291 | Named "isArrayOrSparseArray" ]]
	if type(List) ~= "table" then
		return false
	end
	for i, _ in List do
		if type(i) ~= "number" then
			return false
		end
	end
	return true
end

local _ = function() --[[ Line: 303 | Named "mountHookTypesDev" ]]
	-- upvalues: DEV (copy), v3 (ref), List (ref)
	if DEV then
		local v6 = v3
		
		if List == nil then
			List = { v6 }
			
			return
		end
		table.insert(List, v6)
	end
end

function updateHookTypesDev() --[[ Line: 316 ]]
	-- upvalues: DEV (copy), v3 (ref), List (ref), Count (ref)
	if DEV then
		local v6 = v3
		
		if List ~= nil then
			Count += 1
			
			if List[Count] ~= v6 then
				warnOnHookMismatchInDev(v6)
			end
		end
	end
end

local _ = function(List) --[[ Line: 330 | Named "checkDepsAreArrayDev" ]]
	-- upvalues: DEV (copy), Console (copy), v3 (ref)
	if DEV and List ~= nil then
		local Flag = nil
		if type(List) == "table" then
			Flag = true
			
			for i, _ in List do
				if type(i) ~= "number" then
					Flag = false
					break
				end
			end
		else
			Flag = false
		end
		if not Flag then
			Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(List)))
		end
	end
end

function warnOnHookMismatchInDev(p1) --[[ Line: 345 ]]
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), Alternate (ref), T (ref), List (ref), Count (ref), Console (copy)
	if DEV then
		local ComponentName = GetComponentNameFunction(Alternate.type) or "Component"
		
		if not T[ComponentName] then
			T[ComponentName] = true
			
			if List ~= nil then
				local Text = ""
				
				for i = 1, Count do
					local Entry = List[i]
					local Entry1 = if i == Count then p1 else Entry
					local Text1 = tostring(i) .. ". " .. (Entry or "undefined")
					while string.len(Text1) < 30 do
						Text1 ..= " "
					end
					Text ..= Text1 .. Entry1 .. "\n"
				end
				Console.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", ComponentName, Text)
			end
		end
	end
end

local function throwInvalidHookError() --[[ Line: 397 ]]
	-- upvalues: Error1 (copy)
	error(Error1.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end

local function areHookInputsEqual(BaseState, BaseState1): boolean --[[ Line: 412 ]]
	-- upvalues: DEV (copy), Console (copy), v3 (ref)
	if BaseState1 == nil then
		if DEV then
			Console.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", v3)
		end
		return false
	else
		local v6 = 0
		
		for i, _ in BaseState do
			if v6 < i then
				v6 = i
			end
		end
		local v7: number = v6
		local v8 = 0
		
		for i1, _ in BaseState1 do
			if v8 < i1 then
				v8 = i1
			end
		end
		local v9: number = v8
		
		if v7 ~= v9 then
			return false
		end
		for i2 = 1, math.min(v9, v7) do
			local BaseStateEntry: number = BaseState[i2]
			local BaseStateEntry1: number = BaseState1[i2]
			
			if (BaseStateEntry ~= BaseStateEntry1 or BaseStateEntry == 0 and 1 / BaseStateEntry ~= 1 / BaseStateEntry1) and (BaseStateEntry == BaseStateEntry or BaseStateEntry1 == BaseStateEntry1) then
				return false
			end
		end
		return true
	end
end

local ReactFiberHooksModule = {
	bailoutHooks = function(p2, p3, p4) --[[ Line: 476 ]]
		-- upvalues: EnableHookDoubleBuffering (copy), DEV (copy), EnableDoubleInvokingEffects (copy), MountPassiveDev (copy), Passive (copy), MountLayoutDev (copy), Update (copy), RemoveLanesFunction (copy)
		if EnableHookDoubleBuffering and p2.updateQueue ~= nil then
			p2.updateQueue.alternate = nil
		end
		p3.updateQueue = p2.updateQueue
		
		if DEV and EnableDoubleInvokingEffects then
			p3.flags = bit32.band(p3.flags, (bit32.bnot((bit32.bor(MountPassiveDev, Passive, MountLayoutDev, Update)))))
		else
			p3.flags = bit32.band(p3.flags, (bit32.bnot((bit32.bor(Passive, Update)))))
		end
		p2.lanes = RemoveLanesFunction(p2.lanes, p4)
	end
}
local Flag2 = false

function ReactFiberHooksModule.resetHooksAfterThrow() --[[ Line: 509 ]]
	-- upvalues: ReactCurrentDispatcher (copy), ReactFiberHooksModule (copy), Flag (ref), Alternate (ref), Value (ref), NoLanes (copy), Alternate1 (ref), v2 (ref), EnableHookDoubleBuffering (copy), Next (ref), LastEffect (ref), DEV (copy), List (ref), Count (ref), v3 (ref), Flag2 (ref), Flag1 (ref)
	ReactCurrentDispatcher.current = ReactFiberHooksModule.ContextOnlyDispatcher
	
	if Flag then
		local MemoizedState = Alternate.memoizedState
		while MemoizedState ~= nil do
			local Queue = MemoizedState.queue
			
			if Queue ~= nil then
				Queue.pending = nil
			end
			MemoizedState = MemoizedState.next
		end
		Flag = false
	end
	Value = NoLanes
	Alternate = nil
	Alternate1 = nil
	v2 = nil
	
	if EnableHookDoubleBuffering then
		Next = nil
		LastEffect = nil
	end
	if DEV then
		List = nil
		Count = 0
		v3 = nil
		Flag2 = false
	end
	Flag1 = false
end

local function mountWorkInProgressHook() --[[ Line: 558 ]]
	-- upvalues: EnableAllocationTrims (copy), v2 (ref), Alternate (ref)
	local Config = if EnableAllocationTrims then {
		memoizedState = nil,
		baseState = nil,
		queue = nil,
		next = nil
	} else {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if v2 == nil then
		Alternate.memoizedState = Config
		v2 = Config
	else
		v2.next = Config
		v2 = Config
	end
	return v2
end

local function updateWorkInProgressHook() --[[ Line: 596 ]]
	-- upvalues: Alternate1 (ref), Alternate (ref), v2 (ref), Error1 (copy), EnableHookDoubleBuffering (copy), EnableAllocationTrims (copy)
	local MemoizedState = nil
	if Alternate1 == nil then
		local Alternate2 = Alternate.alternate
		MemoizedState = if Alternate2 == nil then nil else Alternate2.memoizedState
	else
		MemoizedState = Alternate1.next
	end
	local MemoizedState1 = if v2 == nil then Alternate.memoizedState else v2.next
	
	if MemoizedState1 == nil then
		if MemoizedState == nil then
			error(Error1.new("Rendered more hooks than during the previous render."))
		end
		Alternate1 = MemoizedState
		local Alternate3 = nil
		
		if EnableHookDoubleBuffering then
			Alternate3 = Alternate1.alternate
			
			if Alternate3 == nil then
				Alternate3 = {
					next = nil,
					memoizedState = Alternate1.memoizedState,
					baseState = Alternate1.baseState,
					baseQueue = Alternate1.baseQueue,
					queue = Alternate1.queue,
					alternate = Alternate1
				}
				Alternate1.alternate = Alternate3
			else
				local MemoizedState2 = Alternate1.memoizedState
				
				if MemoizedState2 ~= nil or Alternate3.memoizedState ~= nil then
					Alternate3.memoizedState = MemoizedState2
				end
				local BaseState = Alternate1.baseState
				
				if BaseState ~= nil or Alternate3.baseState ~= nil then
					Alternate3.baseState = BaseState
				end
				local BaseQueue = Alternate1.baseQueue
				
				if BaseQueue ~= nil or Alternate3.baseQueue ~= nil then
					Alternate3.baseQueue = BaseQueue
				end
				local Queue = Alternate1.queue
				
				if Queue ~= nil or Alternate3.queue ~= nil then
					Alternate3.queue = Queue
				end
				if Alternate3.next ~= nil then
					Alternate3.next = nil
				end
			end
		elseif EnableAllocationTrims then
			local BaseQueue = Alternate1.baseQueue
			Alternate3 = if BaseQueue == nil then {
				next = nil,
				memoizedState = Alternate1.memoizedState,
				baseState = Alternate1.baseState,
				queue = Alternate1.queue
			} else {
				next = nil,
				memoizedState = Alternate1.memoizedState,
				baseState = Alternate1.baseState,
				baseQueue = BaseQueue,
				queue = Alternate1.queue
			}
		else
			Alternate3 = {
				next = nil,
				memoizedState = Alternate1.memoizedState,
				baseState = Alternate1.baseState,
				baseQueue = Alternate1.baseQueue,
				queue = Alternate1.queue
			}
		end
		if v2 == nil then
			v2 = Alternate3
			Alternate.memoizedState = Alternate3
		else
			v2.next = Alternate3
			v2 = Alternate3
		end
	else
		v2 = MemoizedState1
		local _ = v2.next
		Alternate1 = MemoizedState
	end
	return v2
end

function basicStateReducer(p2, Callback) --[[ Line: 735 ]]
	return if type(Callback) == "function" then Callback(p2) else Callback
end

function mountReducer(LastRenderedReducer, p2, Callback) --[[ Line: 744 ]]
	-- upvalues: mountWorkInProgressHook (copy), Alternate (ref)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	local CallbackResult = if Callback == nil then p2 else Callback(p2)
	MountWorkInProgressHookResult.baseState = CallbackResult
	MountWorkInProgressHookResult.memoizedState = MountWorkInProgressHookResult.baseState
	local Queue = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = LastRenderedReducer,
		lastRenderedState = CallbackResult
	}
	MountWorkInProgressHookResult.queue = Queue
	local Alternate1 = Alternate
	
	local function Dispatch(p3, ...) --[[ Line: 771 ]]
		-- upvalues: Alternate1 (copy), Queue (copy)
		dispatchAction(Alternate1, Queue, p3, ...)
	end
	
	Queue.dispatch = Dispatch
	
	return MountWorkInProgressHookResult.memoizedState, Dispatch
end

function updateReducer(Callback, _, _) --[[ Line: 781 ]]
	-- upvalues: updateWorkInProgressHook (copy), Alternate1 (ref), Value (ref), Alternate (ref), MergeLanesFunction (copy), MarkSkippedUpdateLanesFunction (copy), NoLane (copy), MarkWorkInProgressReceivedUpdateFunction (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	local Queue = UpdateWorkInProgressHookResult.queue
	assert(Queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	Queue.lastRenderedReducer = Callback
	local Alternate2 = Alternate1
	local BaseQueue = Alternate2.baseQueue
	local Pending = Queue.pending
	
	if Pending ~= nil then
		if BaseQueue ~= nil then
			local Next = BaseQueue.next
			BaseQueue.next = Pending.next
			Pending.next = Next
		end
		BaseQueue = Pending
		Alternate2.baseQueue = BaseQueue
		Queue.pending = nil
	end
	if BaseQueue ~= nil then
		local Next = BaseQueue.next
		local BaseState = Alternate2.baseState
		local BaseState1: number? = nil
		local v10 = nil
		local Next1 = nil
		local Next2 = Next
		repeat
			local Lane: number = Next2.lane
			if bit32.band(Value, Lane) == Lane then
				if Next1 ~= nil then
					Next1.next = {
						next = nil,
						lane = NoLane,
						action = Next2.action,
						eagerReducer = Next2.eagerReducer,
						eagerState = Next2.eagerState
					}
					Next1 = Next1.next
				end
				if Next2.eagerReducer == Callback then
					BaseState = Next2.eagerState
				else
					BaseState = Callback(BaseState, Next2.action)
				end
			else
				local config = {
					next = nil,
					lane = Lane,
					action = Next2.action,
					eagerReducer = Next2.eagerReducer,
					eagerState = Next2.eagerState
				}
				
				if Next1 == nil then
					Next1 = config
					v10 = Next1
					BaseState1 = BaseState
				else
					Next1.next = config
					Next1 = Next1.next
				end
				Alternate.lanes = MergeLanesFunction(Alternate.lanes, Lane)
				MarkSkippedUpdateLanesFunction(Lane)
			end
			Next2 = Next2.next
		until Next2 == nil or Next2 == Next
		if Next1 == nil then
			BaseState1 = BaseState
		else
			Next1.next = v10
		end
		local MemoizedState: number = UpdateWorkInProgressHookResult.memoizedState
		
		if (BaseState ~= MemoizedState or BaseState == 0 and 1 / BaseState ~= 1 / MemoizedState) and (BaseState == BaseState or MemoizedState == MemoizedState) then
			MarkWorkInProgressReceivedUpdateFunction()
		end
		UpdateWorkInProgressHookResult.memoizedState = BaseState
		UpdateWorkInProgressHookResult.baseState = BaseState1
		UpdateWorkInProgressHookResult.baseQueue = Next1
		Queue.lastRenderedState = BaseState
	end
	return UpdateWorkInProgressHookResult.memoizedState, Queue.dispatch
end

function rerenderReducer(Callback, _, _) --[[ Line: 922 ]]
	-- upvalues: updateWorkInProgressHook (copy), MarkWorkInProgressReceivedUpdateFunction (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	local Queue = UpdateWorkInProgressHookResult.queue
	assert(Queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	Queue.lastRenderedReducer = Callback
	local Dispatch = Queue.dispatch
	local Pending = Queue.pending
	local MemoizedState = UpdateWorkInProgressHookResult.memoizedState
	
	if Pending ~= nil then
		Queue.pending = nil
		local Next = Pending.next
		local Next1 = Next
		repeat
			MemoizedState = Callback(MemoizedState, Next1.action)
			Next1 = Next1.next
		until Next1 == Next
		local MemoizedState1: number = UpdateWorkInProgressHookResult.memoizedState
		
		if (MemoizedState ~= MemoizedState1 or MemoizedState == 0 and 1 / MemoizedState ~= 1 / MemoizedState1) and (MemoizedState == MemoizedState or MemoizedState1 == MemoizedState1) then
			MarkWorkInProgressReceivedUpdateFunction()
		end
		UpdateWorkInProgressHookResult.memoizedState = MemoizedState
		
		if UpdateWorkInProgressHookResult.baseQueue == nil then
			UpdateWorkInProgressHookResult.baseState = MemoizedState
		end
		Queue.lastRenderedState = MemoizedState
	end
	return MemoizedState, Dispatch
end

function readFromUnsubcribedMutableSource(p2, p3, Callback) --[[ Line: 987 ]]
	-- upvalues: DEV (copy), WarnAboutMultipleRenderersDEVFunction (copy), GetWorkInProgressVersionFunction (copy), IsSubsetOfLanesFunction (copy), Value (ref), SetWorkInProgressVersionFunction (copy), Console (copy), MarkSourceAsDirtyFunction (copy), Error1 (copy)
	if DEV then
		WarnAboutMultipleRenderersDEVFunction(p3)
	end
	local Version = p3._getVersion(p3._source)
	local WorkInProgressVersion = GetWorkInProgressVersionFunction(p3)
	local IsWorkInProgressVersionMatch = nil
	
	if WorkInProgressVersion == nil then
		IsWorkInProgressVersionMatch = IsSubsetOfLanesFunction(Value, p2.mutableReadLanes)
		
		if IsWorkInProgressVersionMatch then
			SetWorkInProgressVersionFunction(p3, Version)
		end
	else
		IsWorkInProgressVersionMatch = WorkInProgressVersion == Version
	end
	if not IsWorkInProgressVersionMatch then
		MarkSourceAsDirtyFunction(p3)
		error(Error1.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
		
		return
	end
	local CallbackResult = Callback(p3._source)
	
	if DEV and type(CallbackResult) == "function" then
		Console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
	end
	return CallbackResult
end

function useMutableSource(p2, Source: number, Callback: number, Callback1: number) --[[ Line: 1070 ]]
	-- upvalues: GetWorkInProgressRootFunction (copy), InvariantFunction (copy), ReactCurrentDispatcher (copy), v2 (ref), Alternate (ref), DEV (copy), Console (copy), RequestUpdateLaneFunction (copy), MarkRootMutableReadFunction (copy), MarkRootEntangledFunction (copy)
	local WorkInProgressRoot = GetWorkInProgressRootFunction()
	InvariantFunction(WorkInProgressRoot ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
	local GetVersionFunction = Source._getVersion
	local Version = GetVersionFunction(Source._source)
	local Current = ReactCurrentDispatcher.current
	assert(Current ~= nil, "dispatcher was nil, this is a bug in React")
	local UseStateResult, UseStateResult2 = Current.useState(function() --[[ Line: 1095 ]]
		-- upvalues: WorkInProgressRoot (copy), Source (copy), Callback (copy)
		return readFromUnsubcribedMutableSource(WorkInProgressRoot, Source, Callback)
	end)
	local v10 = v2
	local MemoizedState = p2.memoizedState
	
	if MemoizedState.refs == nil then
		error((tostring(debug.traceback())))
	end
	local Refs = MemoizedState.refs
	local GetSnapshot: number = Refs.getSnapshot
	local Source1: number = MemoizedState.source
	local Subscribe: number = MemoizedState.subscribe
	local Alternate1 = Alternate
	p2.memoizedState = { refs = Refs, source = Source, subscribe = Callback1 }
	Current.useEffect(function() --[[ Line: 1124 ]]
		-- upvalues: Refs (copy), Callback (copy), UseStateResult2 (ref), GetVersionFunction (copy), Source (copy), Version (copy), DEV (upval), Console (upval), UseStateResult (ref), RequestUpdateLaneFunction (upval), Alternate1 (copy), MarkRootMutableReadFunction (upval), WorkInProgressRoot (copy), MarkRootEntangledFunction (upval)
		Refs.getSnapshot = Callback
		Refs.setSnapshot = UseStateResult2
		local Version1: number = GetVersionFunction(Source._source)
		
		if (Version ~= Version1 or Version == 0 and 1 / Version ~= 1 / Version1) and (Version == Version or Version1 == Version1) then
			local CallbackResult: number = Callback(Source._source)
			
			if DEV and type(CallbackResult) == "function" then
				Console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
			end
			local FromUnsubcribedMutableSource: number = UseStateResult
			
			if (FromUnsubcribedMutableSource ~= CallbackResult or FromUnsubcribedMutableSource == 0 and 1 / FromUnsubcribedMutableSource ~= 1 / CallbackResult) and (FromUnsubcribedMutableSource == FromUnsubcribedMutableSource or CallbackResult == CallbackResult) then
				UseStateResult2(CallbackResult)
				MarkRootMutableReadFunction(WorkInProgressRoot, (RequestUpdateLaneFunction(Alternate1)))
			end
			MarkRootEntangledFunction(WorkInProgressRoot, WorkInProgressRoot.mutableReadLanes)
		end
	end, { Callback, Source, Callback1 })
	Current.useEffect(function() --[[ Line: 1162 ]]
		-- upvalues: Refs (copy), Source (copy), RequestUpdateLaneFunction (upval), Alternate1 (copy), MarkRootMutableReadFunction (upval), WorkInProgressRoot (copy), Callback1 (copy), DEV (upval), Console (upval)
		local CallbackResult = Callback1(Source._source, function() --[[ Line: 1163 ]]
			-- upvalues: Refs (upval), Source (upval), RequestUpdateLaneFunction (upval), Alternate1 (upval), MarkRootMutableReadFunction (upval), WorkInProgressRoot (upval)
			local GetSnapshotFunction = Refs.getSnapshot
			local SetSnapshotFunction: (any) -> () = Refs.setSnapshot
			local Success, Result = pcall(function() --[[ Line: 1168 ]]
				-- upvalues: SetSnapshotFunction (copy), GetSnapshotFunction (copy), Source (upval), RequestUpdateLaneFunction (upval), Alternate1 (upval), MarkRootMutableReadFunction (upval), WorkInProgressRoot (upval)
				SetSnapshotFunction(GetSnapshotFunction(Source._source))
				MarkRootMutableReadFunction(WorkInProgressRoot, (RequestUpdateLaneFunction(Alternate1)))
			end)
			
			if not Success then
				SetSnapshotFunction(function() --[[ Line: 1182 ]]
					-- upvalues: Result (copy)
					error(Result)
				end)
			end
		end)
		
		if DEV and type(CallbackResult) ~= "function" then
			Console.error("Mutable source subscribe function must return an unsubscribe function.")
		end
		return CallbackResult
	end, { Source, Callback1 })
	
	if (GetSnapshot ~= Callback or GetSnapshot == 0 and 1 / GetSnapshot ~= 1 / Callback) and (GetSnapshot == GetSnapshot or Callback == Callback) or (Source1 ~= Source or Source1 == 0 and 1 / Source1 ~= 1 / Source) and (Source1 == Source1 or Source == Source) or (Subscribe ~= Callback1 or Subscribe == 0 and 1 / Subscribe ~= 1 / Callback1) and (Subscribe == Subscribe or Callback1 == Callback1) then
		local Queue = {
			pending = nil,
			dispatch = nil,
			lastRenderedReducer = basicStateReducer,
			lastRenderedState = UseStateResult
		}
		local Alternate2 = Alternate
		
		UseStateResult2 = function(...) --[[ Line: 1231 ]]
			-- upvalues: Alternate2 (copy), Queue (copy)
			dispatchAction(Alternate2, Queue, ...)
		end
		
		Queue.dispatch = UseStateResult2
		v10.queue = Queue
		v10.baseQueue = nil
		UseStateResult = readFromUnsubcribedMutableSource(WorkInProgressRoot, Source, Callback)
		v10.baseState = UseStateResult
		v10.memoizedState = v10.baseState
	end
	return UseStateResult
end

function mountMutableSource(Source, GetSnapshot, Subscribe) --[[ Line: 1245 ]]
	-- upvalues: mountWorkInProgressHook (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	MountWorkInProgressHookResult.memoizedState = {
		refs = { setSnapshot = nil, getSnapshot = GetSnapshot },
		source = Source,
		subscribe = Subscribe
	}
	
	return useMutableSource(MountWorkInProgressHookResult, Source, GetSnapshot, Subscribe)
end

function updateMutableSource(p2, p3, p4) --[[ Line: 1268 ]]
	-- upvalues: updateWorkInProgressHook (copy)
	return useMutableSource(updateWorkInProgressHook(), p2, p3, p4)
end

function mountState(Callback) --[[ Line: 1283 ]]
	-- upvalues: mountWorkInProgressHook (copy), Alternate (ref)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	
	if type(Callback) == "function" then
		Callback = Callback()
	end
	MountWorkInProgressHookResult.baseState = Callback
	MountWorkInProgressHookResult.memoizedState = MountWorkInProgressHookResult.baseState
	local Queue = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = nil,
		lastRenderedState = Callback
	}
	Queue.lastRenderedReducer = basicStateReducer
	MountWorkInProgressHookResult.queue = Queue
	local Alternate1 = Alternate
	
	local function Dispatch(p2, ...) --[[ Line: 1305 ]]
		-- upvalues: Alternate1 (copy), Queue (copy)
		dispatchAction(Alternate1, Queue, p2, ...)
	end
	
	Queue.dispatch = Dispatch
	
	return MountWorkInProgressHookResult.memoizedState, Dispatch
end

function updateState(p2) --[[ Line: 1314 ]]
	return updateReducer(basicStateReducer, p2)
end

function rerenderState(p2) --[[ Line: 1318 ]]
	return rerenderReducer(basicStateReducer, p2)
end

local function reuseFunctionComponentUpdateQueue() --[[ Line: 1322 ]]
	-- upvalues: Alternate (ref), LastEffect (ref), Next (ref)
	local Alternate1 = Alternate.alternate
	local UpdateQueue = if Alternate1 == nil then nil else Alternate1.updateQueue
	local Alternate2 = if UpdateQueue == nil then nil else UpdateQueue.alternate
	
	if Alternate2 ~= nil then
		local LastEffect1 = Alternate2.lastEffect
		LastEffect = LastEffect1
		Next = if LastEffect1 == nil then nil else LastEffect1.next
		Alternate2.lastEffect = nil
		
		return Alternate2
	end
	Next = nil
	LastEffect = nil
	
	if UpdateQueue == nil then
		return { lastEffect = nil }
	else
		local Alternate3 = { lastEffect = nil, alternate = UpdateQueue }
		UpdateQueue.alternate = Alternate3
		
		return Alternate3
	end
end

local function pushEffect(Bits, Create, Destroy, Deps) --[[ Line: 1354 ]]
	-- upvalues: EnableHookDoubleBuffering (copy), Alternate (ref), reuseFunctionComponentUpdateQueue (copy), Next (ref), LastEffect (ref)
	if EnableHookDoubleBuffering then
		local UpdateQueue = Alternate.updateQueue
		
		if UpdateQueue == nil then
			UpdateQueue = reuseFunctionComponentUpdateQueue()
			Alternate.updateQueue = UpdateQueue
		end
		local LastEffect2 = Next
		
		if LastEffect2 == nil then
			LastEffect2 = {
				next = nil,
				tag = Bits,
				create = Create,
				destroy = Destroy,
				deps = Deps
			}
		else
			Next = if LastEffect2 == LastEffect then nil else LastEffect2.next
			LastEffect2.tag = Bits
			LastEffect2.create = Create
			
			if Destroy ~= nil or LastEffect2.destroy ~= nil then
				LastEffect2.destroy = Destroy
			end
			LastEffect2.deps = Deps
		end
		local LastEffect3 = UpdateQueue.lastEffect
		
		if LastEffect3 == nil then
			LastEffect2.next = LastEffect2
		else
			LastEffect2.next = LastEffect3.next
			LastEffect3.next = LastEffect2
		end
		UpdateQueue.lastEffect = LastEffect2
		
		return LastEffect2
	else
		local LastEffect1 = {
			next = nil,
			tag = Bits,
			create = Create,
			destroy = Destroy,
			deps = Deps
		}
		local UpdateQueue1 = Alternate.updateQueue
		
		if UpdateQueue1 == nil then
			UpdateQueue1 = { lastEffect = nil }
			Alternate.updateQueue = UpdateQueue1
			LastEffect1.next = LastEffect1
			UpdateQueue1.lastEffect = LastEffect1
			
			return LastEffect1
		end
		local LastEffect4 = UpdateQueue1.lastEffect
		
		if LastEffect4 == nil then
			UpdateQueue1.lastEffect = LastEffect1
			LastEffect1.next = LastEffect1
			
			return LastEffect1
		else
			LastEffect4.next = LastEffect1
			LastEffect1.next = LastEffect4.next
			UpdateQueue1.lastEffect = LastEffect1
			
			return LastEffect1
		end
	end
end

function mountBinding(p2) --[[ Line: 1428 ]]
	-- upvalues: mountWorkInProgressHook (copy), CreateBindingFunction (copy), EnableAllocationTrims (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	local Binding, Binding2 = CreateBindingFunction(p2)
	
	if EnableAllocationTrims then
		MountWorkInProgressHookResult.memoizedState = Binding
		MountWorkInProgressHookResult.baseState = Binding2
		
		return Binding, Binding2
	else
		MountWorkInProgressHookResult.memoizedState = { Binding, Binding2 }
		
		return Binding, Binding2
	end
end

function updateBinding(_) --[[ Line: 1444 ]]
	-- upvalues: updateWorkInProgressHook (copy), EnableAllocationTrims (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	
	if EnableAllocationTrims then
		return UpdateWorkInProgressHookResult.memoizedState, UpdateWorkInProgressHookResult.baseState
	else
		return unpack(UpdateWorkInProgressHookResult.memoizedState)
	end
end

function mountRef(Current) --[[ Line: 1452 ]]
	-- upvalues: mountWorkInProgressHook (copy), CreateRefFunction (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	local Ref = CreateRefFunction()
	Ref.current = Current
	MountWorkInProgressHookResult.memoizedState = Ref
	
	return Ref
end

function updateRef(_) --[[ Line: 1464 ]]
	-- upvalues: updateWorkInProgressHook (copy)
	return updateWorkInProgressHook().memoizedState
end

local function mountEffectImpl(Mask: number, Mask1: number, Create, ConcatResult) --[[ Line: 1469 ]]
	-- upvalues: mountWorkInProgressHook (copy), Alternate (ref), pushEffect (copy), HasEffect (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	Alternate.flags = bit32.bor(Alternate.flags, Mask)
	MountWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Mask1), Create, nil, ConcatResult)
end

function updateEffectImpl(Mask: number, Mask1: number, Create, Deps) --[[ Line: 1481 ]]
	-- upvalues: updateWorkInProgressHook (copy), Alternate1 (ref), areHookInputsEqual (copy), pushEffect (copy), Alternate (ref), HasEffect (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	local Destroy = nil
	
	if Alternate1 ~= nil then
		local MemoizedState = Alternate1.memoizedState
		Destroy = MemoizedState.destroy
		
		if Deps ~= nil and areHookInputsEqual(Deps, MemoizedState.deps) then
			UpdateWorkInProgressHookResult.memoizedState = pushEffect(Mask1, Create, Destroy, Deps)
			
			return
		end
	end
	Alternate.flags = bit32.bor(Alternate.flags, Mask)
	UpdateWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Mask1), Create, Destroy, Deps)
end

local function mountEffect(Create, Deps) --[[ Line: 1507 ]]
	-- upvalues: DEV (copy), ReactGlobalsModule (copy), WarnIfNotCurrentlyActingEffectsInDEVFunction (copy), Alternate (ref), EnableDoubleInvokingEffects (copy), MountPassiveDev (copy), Passive (copy), PassiveStatic (copy), Passive1 (copy), mountWorkInProgressHook (copy), pushEffect (copy), HasEffect (copy)
	if DEV and (type(_G.jest) ~= "nil" or ReactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		WarnIfNotCurrentlyActingEffectsInDEVFunction(Alternate)
	end
	if DEV and EnableDoubleInvokingEffects then
		local Bits = bit32.bor(MountPassiveDev, Passive, PassiveStatic)
		local MountWorkInProgressHookResult = mountWorkInProgressHook()
		Alternate.flags = bit32.bor(Alternate.flags, Bits)
		MountWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Passive1), Create, nil, Deps)
		
		return
	else
		local Bits = bit32.bor(Passive, PassiveStatic)
		local MountWorkInProgressHookResult = mountWorkInProgressHook()
		Alternate.flags = bit32.bor(Alternate.flags, Bits)
		MountWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Passive1), Create, nil, Deps)
	end
end

local function updateEffect(p2, p3) --[[ Line: 1537 ]]
	-- upvalues: DEV (copy), ReactGlobalsModule (copy), WarnIfNotCurrentlyActingEffectsInDEVFunction (copy), Alternate (ref), Passive (copy), Passive1 (copy)
	if DEV and (type(_G.jest) ~= "nil" or ReactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		WarnIfNotCurrentlyActingEffectsInDEVFunction(Alternate)
	end
	updateEffectImpl(Passive, Passive1, p2, p3)
end

local function mountLayoutEffect(Create, Deps) --[[ Line: 1552 ]]
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), MountLayoutDev (copy), Update (copy), Layout (copy), mountWorkInProgressHook (copy), Alternate (ref), pushEffect (copy), HasEffect (copy)
	if DEV and EnableDoubleInvokingEffects then
		local Bits = bit32.bor(MountLayoutDev, Update)
		local MountWorkInProgressHookResult = mountWorkInProgressHook()
		Alternate.flags = bit32.bor(Alternate.flags, Bits)
		MountWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Layout), Create, nil, Deps)
		
		return
	else
		local MountWorkInProgressHookResult = mountWorkInProgressHook()
		Alternate.flags = bit32.bor(Alternate.flags, Update)
		MountWorkInProgressHookResult.memoizedState = pushEffect(bit32.bor(HasEffect, Layout), Create, nil, Deps)
	end
end

local function updateLayoutEffect(p2, p3) --[[ Line: 1569 ]]
	-- upvalues: Update (copy), Layout (copy)
	updateEffectImpl(Update, Layout, p2, p3)
end

function imperativeHandleEffect(Callback1, Callback: (any) -> ()) --[[ Line: 1577 ]]
	-- upvalues: DEV (copy), Object (copy), Console (copy), Array (copy)
	if Callback ~= nil and type(Callback) == "function" then
		Callback((Callback1()))
		
		return function() --[[ Line: 1586 ]]
			-- upvalues: Callback (copy)
			return Callback(nil)
		end
	end
	if Callback == nil then
		return nil
	end
	if DEV and (getmetatable(Callback) == nil or #Object.keys(Callback) ~= 0) then
		Console.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. Array.join(Object.keys(Callback), ", ") .. "}")
	end
	Callback.current = Callback1()
	
	return function() --[[ Line: 1611 ]]
		-- upvalues: Callback (copy)
		Callback.current = nil
	end
end

function mountImperativeHandle(p2, Callback, p3) --[[ Line: 1620 ]]
	-- upvalues: DEV (copy), Console (copy), Array (copy), EnableDoubleInvokingEffects (copy), mountEffectImpl (copy), MountLayoutDev (copy), Update (copy), Layout (copy)
	if DEV and type(Callback) ~= "function" then
		Console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if Callback == nil then "nil" else type(Callback))
	end
	local ConcatResult = if p3 == nil then nil else Array.concat(p3, { p2 })
	
	return if DEV and EnableDoubleInvokingEffects then mountEffectImpl(bit32.bor(MountLayoutDev, Update), Layout, function() --[[ Line: 1643 ]]
		-- upvalues: Callback (copy), p2 (copy)
		return imperativeHandleEffect(Callback, p2)
	end, ConcatResult) else mountEffectImpl(Update, Layout, function() --[[ Line: 1649 ]]
		-- upvalues: Callback (copy), p2 (copy)
		return imperativeHandleEffect(Callback, p2)
	end, ConcatResult)
end

function updateImperativeHandle(p2, Callback, Tbl) --[[ Line: 1655 ]]
	-- upvalues: DEV (copy), Console (copy), Update (copy), Layout (copy)
	if DEV and type(Callback) ~= "function" then
		Console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if Callback then type(Callback) else "nil")
	end
	local List = nil
	
	if Tbl ~= nil then
		List = table.clone(Tbl)
		table.insert(List, p2)
	end
	return updateEffectImpl(Update, Layout, function() --[[ Line: 1682 ]]
		-- upvalues: Callback (copy), p2 (copy)
		return imperativeHandleEffect(Callback, p2)
	end, List)
end

function mountDebugValue(_, _) --[[ Line: 1687 ]] end

local Callback = mountDebugValue

function mountCallback(MemoizedState, BaseState) --[[ Line: 1698 ]]
	-- upvalues: mountWorkInProgressHook (copy), EnableAllocationTrims (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	
	if EnableAllocationTrims then
		MountWorkInProgressHookResult.memoizedState = MemoizedState
		MountWorkInProgressHookResult.baseState = BaseState
		
		return MemoizedState
	else
		MountWorkInProgressHookResult.memoizedState = { MemoizedState, BaseState }
		
		return MemoizedState
	end
end

function updateCallback(MemoizedState, BaseState) --[[ Line: 1711 ]]
	-- upvalues: updateWorkInProgressHook (copy), EnableAllocationTrims (copy), areHookInputsEqual (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	
	if not EnableAllocationTrims then
		local MemoizedState1 = UpdateWorkInProgressHookResult.memoizedState
		
		if MemoizedState1 == nil or BaseState == nil or not areHookInputsEqual(BaseState, MemoizedState1[2]) then
			UpdateWorkInProgressHookResult.memoizedState = { MemoizedState, BaseState }
			
			return MemoizedState
		else
			return MemoizedState1[1]
		end
	elseif BaseState == nil or not areHookInputsEqual(BaseState, UpdateWorkInProgressHookResult.baseState) then
		UpdateWorkInProgressHookResult.memoizedState = MemoizedState
		UpdateWorkInProgressHookResult.baseState = BaseState
		
		return MemoizedState
	else
		return UpdateWorkInProgressHookResult.memoizedState
	end
end

function mountMemo(Callback, BaseState) --[[ Line: 1742 ]]
	-- upvalues: mountWorkInProgressHook (copy), EnableAllocationTrims (copy), MemoValues (copy)
	local MountWorkInProgressHookResult = mountWorkInProgressHook()
	
	if EnableAllocationTrims then
		local PackResult = MemoValues.pack(Callback())
		MountWorkInProgressHookResult.memoizedState = PackResult
		MountWorkInProgressHookResult.baseState = BaseState
		
		return MemoValues.unpack(PackResult)
	else
		local list = { Callback() }
		MountWorkInProgressHookResult.memoizedState = { list, BaseState }
		
		return unpack(list)
	end
end

function updateMemo(Callback, BaseState) --[[ Line: 1761 ]]
	-- upvalues: updateWorkInProgressHook (copy), EnableAllocationTrims (copy), areHookInputsEqual (copy), MemoValues (copy)
	local UpdateWorkInProgressHookResult = updateWorkInProgressHook()
	
	if not EnableAllocationTrims then
		local MemoizedState = UpdateWorkInProgressHookResult.memoizedState
		
		if MemoizedState == nil or BaseState == nil or not areHookInputsEqual(BaseState, MemoizedState[2]) then
			local list = { Callback() }
			UpdateWorkInProgressHookResult.memoizedState = { list, BaseState }
			
			return unpack(list)
		else
			return unpack(MemoizedState[1])
		end
	elseif BaseState == nil or not areHookInputsEqual(BaseState, UpdateWorkInProgressHookResult.baseState) then
		local PackResult = MemoValues.pack(Callback())
		UpdateWorkInProgressHookResult.memoizedState = PackResult
		UpdateWorkInProgressHookResult.baseState = BaseState
		
		return MemoValues.unpack(PackResult)
	else
		return MemoValues.unpack(UpdateWorkInProgressHookResult.memoizedState)
	end
end

function ReactFiberHooksModule.getIsUpdatingOpaqueValueInRenderPhaseInDEV() --[[ Line: 1925 ]]
	-- upvalues: DEV (copy)
	return not DEV and nil
end

function mountOpaqueIdentifier() --[[ Line: 1947 ]]
	-- upvalues: DEV (copy), Console (copy), MakeClientId (copy), GetIsHydratingFunction (copy)
	local Callback = nil
	
	if DEV then
		Console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
	else
		Callback = MakeClientId
	end
	if GetIsHydratingFunction() then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
		error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
		
		return nil
	else
		local CallbackResult = Callback()
		mountState(CallbackResult)
		
		return CallbackResult
	end
end

function updateOpaqueIdentifier() --[[ Line: 2014 ]]
	local UpdateStateResult, _ = updateState(nil)
	
	return UpdateStateResult
end

function rerenderOpaqueIdentifier() --[[ Line: 2019 ]]
	local RerenderStateResult, _ = rerenderState(nil)
	
	return RerenderStateResult
end

function dispatchAction(p2, Queue, Action, ...) --[[ Line: 2024 ]]
	-- upvalues: DEV (copy), Console (copy), RequestEventTimeFunction (copy), RequestUpdateLaneFunction (copy), Alternate (ref), Flag (ref), Flag1 (ref), NoLanes (copy), ReactCurrentDispatcher (copy), Current4 (ref), ReactFeatureFlags (copy), v1 (copy), ReactGlobalsModule (copy), WarnIfNotScopedWithMatchingActFunction (copy), WarnIfNotCurrentlyActingUpdatesInDEVFunction (copy), ScheduleUpdateOnFiberFunction (copy), EnableDebugTracing (copy), DebugTracingMode (copy), GetComponentNameFunction (copy), LogStateUpdateScheduledFunction (copy), EnableSchedulingProfiler (copy), MarkStateUpdateScheduledFunction (copy)
	if DEV and type(if select("#", ...) == 1 then select(1, ...) else nil) == "function" then
		Console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
	end
	local RequestEventTimeResult = RequestEventTimeFunction()
	local RequestUpdateLaneResult = RequestUpdateLaneFunction(p2)
	local Pending = {
		eagerReducer = nil,
		eagerState = nil,
		next = nil,
		lane = RequestUpdateLaneResult,
		action = Action
	}
	local Pending1 = Queue.pending
	
	if Pending1 == nil then
		Pending.next = Pending
	else
		Pending.next = Pending1.next
		Pending1.next = Pending
	end
	Queue.pending = Pending
	local Alternate1 = p2.alternate
	
	if p2 == Alternate or Alternate1 ~= nil and Alternate1 == Alternate then
		Flag = true
		Flag1 = true
	else
		if p2.lanes == NoLanes and (Alternate1 == nil or Alternate1.lanes == NoLanes) then
			local LastRenderedReducer = Queue.lastRenderedReducer
			
			if LastRenderedReducer ~= nil then
				local Current = nil
				
				if DEV then
					Current = ReactCurrentDispatcher.current
					ReactCurrentDispatcher.current = Current4
				end
				local LastRenderedState: number = Queue.lastRenderedState
				local Success, Result = pcall(LastRenderedReducer, LastRenderedState, Action)
				
				if Success then
					Pending.eagerReducer = LastRenderedReducer
					Pending.eagerState = Result
				end
				if DEV then
					ReactCurrentDispatcher.current = Current
				end
				if ReactFeatureFlags.fixEagerReducerError then
					if Success and (Result == LastRenderedState and (Result ~= 0 or 1 / Result == 1 / LastRenderedState) or Result ~= Result and LastRenderedState ~= LastRenderedState) then
						if v1 then
							if Pending1 == nil then
								Queue.pending = nil
								
								return
							end
							Pending1.next = Pending.next
							Queue.pending = Pending1
						end
						return
					end
				elseif Result == LastRenderedState and (Result ~= 0 or 1 / Result == 1 / LastRenderedState) or Result ~= Result and LastRenderedState ~= LastRenderedState then
					if v1 then
						if Pending1 == nil then
							Queue.pending = nil
							
							return
						end
						Pending1.next = Pending.next
						Queue.pending = Pending1
					end
					return
				end
			end
		end
		if DEV and (type(_G.jest) ~= "nil" or ReactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
			WarnIfNotScopedWithMatchingActFunction(p2)
			WarnIfNotCurrentlyActingUpdatesInDEVFunction(p2)
		end
		ScheduleUpdateOnFiberFunction(p2, RequestUpdateLaneResult, RequestEventTimeResult)
	end
	if DEV and EnableDebugTracing and bit32.band(p2.mode, DebugTracingMode) ~= 0 then
		LogStateUpdateScheduledFunction(GetComponentNameFunction(p2.type) or "Unknown", RequestUpdateLaneResult, Action)
	end
	if EnableSchedulingProfiler then
		MarkStateUpdateScheduledFunction(p2, RequestUpdateLaneResult)
	end
end

local ContextOnlyDispatcher = {
	readContext = ReadContextFunction,
	useCallback = throwInvalidHookError,
	useContext = throwInvalidHookError,
	useEffect = throwInvalidHookError,
	useImperativeHandle = throwInvalidHookError,
	useLayoutEffect = throwInvalidHookError,
	useMemo = throwInvalidHookError,
	useReducer = throwInvalidHookError,
	useRef = throwInvalidHookError,
	useBinding = throwInvalidHookError,
	useState = throwInvalidHookError,
	useDebugValue = throwInvalidHookError,
	useMutableSource = throwInvalidHookError,
	useOpaqueIdentifier = throwInvalidHookError,
	unstable_isNewReconciler = EnableNewReconciler
}
ReactFiberHooksModule.ContextOnlyDispatcher = ContextOnlyDispatcher
local config = {
	readContext = ReadContextFunction,
	useCallback = mountCallback,
	useContext = ReadContextFunction,
	useEffect = mountEffect,
	useImperativeHandle = mountImperativeHandle,
	useLayoutEffect = mountLayoutEffect,
	useMemo = mountMemo,
	useReducer = mountReducer,
	useRef = mountRef,
	useBinding = mountBinding,
	useState = mountState,
	useDebugValue = mountDebugValue,
	useMutableSource = mountMutableSource,
	useOpaqueIdentifier = mountOpaqueIdentifier,
	unstable_isNewReconciler = EnableNewReconciler
}
local config1 = {
	readContext = ReadContextFunction,
	useCallback = updateCallback,
	useContext = ReadContextFunction,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	useMemo = updateMemo,
	useReducer = updateReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = updateState,
	useDebugValue = Callback,
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = updateOpaqueIdentifier,
	unstable_isNewReconciler = EnableNewReconciler
}
local config2 = {
	readContext = ReadContextFunction,
	useCallback = updateCallback,
	useContext = ReadContextFunction,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	useMemo = updateMemo,
	useReducer = rerenderReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = rerenderState,
	useDebugValue = Callback,
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = rerenderOpaqueIdentifier,
	unstable_isNewReconciler = EnableNewReconciler
}

if DEV then
	local _ = function() --[[ Line: 2273 ]]
		-- upvalues: Console (copy)
		Console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	
	local function restoreDispatcherAndReturn(Current, Success, ...) --[[ Line: 2283 ]]
		-- upvalues: ReactCurrentDispatcher (copy)
		ReactCurrentDispatcher.current = Current
		
		if not Success then
			error((...))
		end
		return ...
	end
	
	local _ = function() --[[ Line: 2291 ]]
		-- upvalues: Console (copy)
		Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
	end
	
	Current = {
		readContext = function(p2, p3) --[[ Line: 2301 ]]
			-- upvalues: ReadContextFunction (copy)
			return ReadContextFunction(p2, p3)
		end,
		useCallback = function(p2, List1) --[[ Line: 2307 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), Console (copy)
			v3 = "useCallback"
			
			if DEV then
				local v10: string = v3
				
				if List == nil then
					List = { v10 }
				else
					table.insert(List, v10)
				end
			end
			if DEV and List1 ~= nil then
				local Flag = nil
				if type(List1) == "table" then
					Flag = true
					
					for i, _ in List1 do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(List1)))
				end
			end
			return mountCallback(p2, List1)
		end,
		useContext = function(p3, p4) --[[ Line: 2313 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), ReadContextFunction (copy)
			v3 = "useContext"
			
			if DEV then
				local v11: string = v3
				
				if List == nil then
					List = { v11 }
				else
					table.insert(List, v11)
				end
			end
			return ReadContextFunction(p3, p4)
		end,
		useEffect = function(Create, Deps) --[[ Line: 2321 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), Console (copy), mountEffect (copy)
			v3 = "useEffect"
			
			if DEV then
				local v11: string = v3
				
				if List == nil then
					List = { v11 }
				else
					table.insert(List, v11)
				end
			end
			if DEV and Deps ~= nil then
				local Flag = nil
				if type(Deps) == "table" then
					Flag = true
					
					for i, _ in Deps do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(Deps)))
				end
			end
			return mountEffect(Create, Deps)
		end,
		useImperativeHandle = function(p3, p4, List1) --[[ Line: 2331 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), Console (copy)
			v3 = "useImperativeHandle"
			
			if DEV then
				local v12: string = v3
				
				if List == nil then
					List = { v12 }
				else
					table.insert(List, v12)
				end
			end
			if DEV and List1 ~= nil then
				local Flag = nil
				if type(List1) == "table" then
					Flag = true
					
					for i, _ in List1 do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(List1)))
				end
			end
			return mountImperativeHandle(p3, p4, List1)
		end,
		useLayoutEffect = function(Create, Deps) --[[ Line: 2341 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), Console (copy), mountLayoutEffect (copy)
			v3 = "useLayoutEffect"
			
			if DEV then
				local v13: string = v3
				
				if List == nil then
					List = { v13 }
				else
					table.insert(List, v13)
				end
			end
			if DEV and Deps ~= nil then
				local Flag = nil
				if type(Deps) == "table" then
					Flag = true
					
					for i, _ in Deps do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(Deps)))
				end
			end
			return mountLayoutEffect(Create, Deps)
		end,
		useMemo = function(p5, List1) --[[ Line: 2352 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), Console (copy), ReactCurrentDispatcher (copy), Current3 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			
			if DEV then
				local v14: string = v3
				
				if List == nil then
					List = { v14 }
				else
					table.insert(List, v14)
				end
			end
			if DEV and List1 ~= nil then
				local Flag = nil
				if type(List1) == "table" then
					Flag = true
					
					for i, _ in List1 do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(List1)))
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(mountMemo, p5, List1))
			end
			local list = { pcall(mountMemo, p5, List1) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p6, p7, p8) --[[ Line: 2377 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useReducer"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountReducer, p6, p7, p8)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p6) --[[ Line: 2395 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref)
			v3 = "useRef"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountRef(p6)
		end,
		useBinding = function(p6) --[[ Line: 2401 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref)
			v3 = "useBinding"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountBinding(p6)
		end,
		useState = function(p6) --[[ Line: 2406 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useState"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountState, p6)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p6, p7) --[[ Line: 2422 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref)
			v3 = "useDebugValue"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountDebugValue(p6, p7)
		end,
		useMutableSource = function(p6, p7, p8) --[[ Line: 2437 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref)
			v3 = "useMutableSource"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountMutableSource(p6, p7, p8)
		end,
		useOpaqueIdentifier = function() --[[ Line: 2452 ]]
			-- upvalues: v3 (ref), DEV (copy), List (ref)
			v3 = "useOpaqueIdentifier"
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	Current1 = {
		readContext = function(p6, p7) --[[ Line: 2462 ]]
			-- upvalues: ReadContextFunction (copy)
			return ReadContextFunction(p6, p7)
		end,
		useCallback = function(p6, List) --[[ Line: 2468 ]]
			-- upvalues: v3 (ref), DEV (copy), Console (copy)
			v3 = "useCallback"
			updateHookTypesDev()
			
			if DEV and List ~= nil then
				local Flag = nil
				if type(List) == "table" then
					Flag = true
					
					for i, _ in List do
						if type(i) ~= "number" then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					Console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v3, (type(List)))
				end
			end
			return mountCallback(p6, List)
		end,
		useContext = function(p7, p8) --[[ Line: 2474 ]]
			-- upvalues: v3 (ref), ReadContextFunction (copy)
			v3 = "useContext"
			updateHookTypesDev()
			
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(Create, Deps) --[[ Line: 2482 ]]
			-- upvalues: v3 (ref), mountEffect (copy)
			v3 = "useEffect"
			updateHookTypesDev()
			
			return mountEffect(Create, Deps)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 2491 ]]
			-- upvalues: v3 (ref)
			v3 = "useImperativeHandle"
			updateHookTypesDev()
			
			return mountImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(Create, Deps) --[[ Line: 2500 ]]
			-- upvalues: v3 (ref), mountLayoutEffect (copy)
			v3 = "useLayoutEffect"
			updateHookTypesDev()
			
			return mountLayoutEffect(Create, Deps)
		end,
		useMemo = function(p7, p8) --[[ Line: 2510 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current3 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(mountMemo, p7, p8))
			end
			local list = { pcall(mountMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 2533 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useReducer"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 2551 ]]
			-- upvalues: v3 (ref)
			v3 = "useRef"
			updateHookTypesDev()
			
			return mountRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 2557 ]]
			-- upvalues: v3 (ref)
			v3 = "useBinding"
			updateHookTypesDev()
			
			return mountBinding(p7)
		end,
		useState = function(p7) --[[ Line: 2562 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useState"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 2578 ]]
			-- upvalues: v3 (ref)
			v3 = "useDebugValue"
			updateHookTypesDev()
			
			return mountDebugValue(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 2593 ]]
			-- upvalues: v3 (ref)
			v3 = "useMutableSource"
			updateHookTypesDev()
			
			return mountMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 2608 ]]
			-- upvalues: v3 (ref)
			v3 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	Current2 = {
		readContext = function(p7, p8) --[[ Line: 2618 ]]
			-- upvalues: ReadContextFunction (copy)
			return ReadContextFunction(p7, p8)
		end,
		useCallback = function(p7, p8) --[[ Line: 2624 ]]
			-- upvalues: v3 (ref)
			v3 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p7, p8)
		end,
		useContext = function(p7, p8) --[[ Line: 2629 ]]
			-- upvalues: v3 (ref), ReadContextFunction (copy)
			v3 = "useContext"
			updateHookTypesDev()
			
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(p7, p8) --[[ Line: 2637 ]]
			-- upvalues: v3 (ref), updateEffect (copy)
			v3 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p7, p8)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 2646 ]]
			-- upvalues: v3 (ref)
			v3 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(p7, p8) --[[ Line: 2655 ]]
			-- upvalues: v3 (ref), updateLayoutEffect (copy)
			v3 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p7, p8)
		end,
		useMemo = function(p7, p8) --[[ Line: 2665 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current4 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(updateMemo, p7, p8))
			end
			local list = { pcall(updateMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 2688 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useReducer"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(updateReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 2706 ]]
			-- upvalues: v3 (ref)
			v3 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 2712 ]]
			-- upvalues: v3 (ref)
			v3 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p7)
		end,
		useState = function(p7) --[[ Line: 2717 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useState"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(updateState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 2733 ]]
			-- upvalues: v3 (ref), Callback (copy)
			v3 = "useDebugValue"
			updateHookTypesDev()
			
			return Callback(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 2748 ]]
			-- upvalues: v3 (ref)
			v3 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 2763 ]]
			-- upvalues: v3 (ref)
			v3 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	v4 = {
		readContext = function(p7, p8) --[[ Line: 2773 ]]
			-- upvalues: ReadContextFunction (copy)
			return ReadContextFunction(p7, p8)
		end,
		useCallback = function(p7, p8) --[[ Line: 2779 ]]
			-- upvalues: v3 (ref)
			v3 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p7, p8)
		end,
		useContext = function(p7, p8) --[[ Line: 2784 ]]
			-- upvalues: v3 (ref), ReadContextFunction (copy)
			v3 = "useContext"
			updateHookTypesDev()
			
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(p7, p8) --[[ Line: 2792 ]]
			-- upvalues: v3 (ref), updateEffect (copy)
			v3 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p7, p8)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 2801 ]]
			-- upvalues: v3 (ref)
			v3 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(p7, p8) --[[ Line: 2810 ]]
			-- upvalues: v3 (ref), updateLayoutEffect (copy)
			v3 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p7, p8)
		end,
		useMemo = function(p7, p8) --[[ Line: 2820 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current5 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current5
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(updateMemo, p7, p8))
			end
			local list = { pcall(updateMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 2843 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current5 (ref)
			v3 = "useReducer"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current5
			local Success, Result, Result3 = pcall(rerenderReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 2862 ]]
			-- upvalues: v3 (ref)
			v3 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 2868 ]]
			-- upvalues: v3 (ref)
			v3 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p7)
		end,
		useState = function(p7) --[[ Line: 2873 ]]
			-- upvalues: v3 (ref), ReactCurrentDispatcher (copy), Current5 (ref)
			v3 = "useState"
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current5
			local Success, Result, Result3 = pcall(rerenderState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 2889 ]]
			-- upvalues: v3 (ref), Callback (copy)
			v3 = "useDebugValue"
			updateHookTypesDev()
			
			return Callback(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 2904 ]]
			-- upvalues: v3 (ref)
			v3 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 2919 ]]
			-- upvalues: v3 (ref)
			v3 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	Current3 = {
		readContext = function(p7, p8) --[[ Line: 2929 ]]
			-- upvalues: Console (copy), ReadContextFunction (copy)
			Console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return ReadContextFunction(p7, p8)
		end,
		useCallback = function(p7, p8) --[[ Line: 2936 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useCallback"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountCallback(p7, p8)
		end,
		useContext = function(p7, p8) --[[ Line: 2942 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), ReadContextFunction (copy)
			v3 = "useContext"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(Create, Deps) --[[ Line: 2951 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), mountEffect (copy)
			v3 = "useEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountEffect(Create, Deps)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 2961 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useImperativeHandle"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(Create, Deps) --[[ Line: 2971 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), mountLayoutEffect (copy)
			v3 = "useLayoutEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountLayoutEffect(Create, Deps)
		end,
		useMemo = function(p7, p8) --[[ Line: 2982 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), ReactCurrentDispatcher (copy), Current3 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(mountMemo, p7, p8))
			end
			local list = { pcall(mountMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 3006 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useReducer"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 3025 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useRef"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 3032 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useBinding"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountBinding(p7)
		end,
		useState = function(p7) --[[ Line: 3038 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref), ReactCurrentDispatcher (copy), Current3 (ref)
			v3 = "useState"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current3
			local Success, Result, Result3 = pcall(mountState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 3055 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useDebugValue"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountDebugValue(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 3073 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useMutableSource"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 3089 ]]
			-- upvalues: v3 (ref), Console (copy), DEV (copy), List (ref)
			v3 = "useOpaqueIdentifier"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if DEV then
				local v15: string = v3
				
				if List == nil then
					List = { v15 }
				else
					table.insert(List, v15)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	Current4 = {
		readContext = function(p7, p8) --[[ Line: 3100 ]]
			-- upvalues: Console (copy), ReadContextFunction (copy)
			Console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return ReadContextFunction(p7, p8)
		end,
		useCallback = function(p7, p8) --[[ Line: 3107 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useCallback"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return mountCallback(p7, p8)
		end,
		useContext = function(p7, p8) --[[ Line: 3113 ]]
			-- upvalues: v3 (ref), Console (copy), ReadContextFunction (copy)
			v3 = "useContext"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(p7, p8) --[[ Line: 3122 ]]
			-- upvalues: v3 (ref), Console (copy), updateEffect (copy)
			v3 = "useEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p7, p8)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 3132 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useImperativeHandle"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(p7, p8) --[[ Line: 3142 ]]
			-- upvalues: v3 (ref), Console (copy), updateLayoutEffect (copy)
			v3 = "useLayoutEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p7, p8)
		end,
		useMemo = function(p7, p8) --[[ Line: 3153 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(updateMemo, p7, p8))
			end
			local list = { pcall(updateMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 3177 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useReducer"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(updateReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 3197 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useRef"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 3204 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useBinding"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p7)
		end,
		useState = function(p7) --[[ Line: 3210 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useState"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(updateState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 3227 ]]
			-- upvalues: v3 (ref), Console (copy), Callback (copy)
			v3 = "useDebugValue"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return Callback(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 3245 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useMutableSource"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 3261 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useOpaqueIdentifier"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
	Current5 = {
		readContext = function(p7, p8) --[[ Line: 3272 ]]
			-- upvalues: Console (copy), ReadContextFunction (copy)
			Console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return ReadContextFunction(p7, p8)
		end,
		useCallback = function(p7, p8) --[[ Line: 3279 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useCallback"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateCallback(p7, p8)
		end,
		useContext = function(p7, p8) --[[ Line: 3285 ]]
			-- upvalues: v3 (ref), Console (copy), ReadContextFunction (copy)
			v3 = "useContext"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return ReadContextFunction(p7, p8)
		end,
		useEffect = function(p7, p8) --[[ Line: 3294 ]]
			-- upvalues: v3 (ref), Console (copy), updateEffect (copy)
			v3 = "useEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p7, p8)
		end,
		useImperativeHandle = function(p7, p8, p9) --[[ Line: 3304 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useImperativeHandle"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p7, p8, p9)
		end,
		useLayoutEffect = function(p7, p8) --[[ Line: 3314 ]]
			-- upvalues: v3 (ref), Console (copy), updateLayoutEffect (copy)
			v3 = "useLayoutEffect"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p7, p8)
		end,
		useMemo = function(p7, p8) --[[ Line: 3325 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref), EnableAllocationTrims (copy), restoreDispatcherAndReturn (copy)
			v3 = "useMemo"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			
			if EnableAllocationTrims then
				return restoreDispatcherAndReturn(Current, pcall(updateMemo, p7, p8))
			end
			local list = { pcall(updateMemo, p7, p8) }
			ReactCurrentDispatcher.current = Current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p7, p8, p9) --[[ Line: 3349 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useReducer"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(rerenderReducer, p7, p8, p9)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useRef = function(p7) --[[ Line: 3369 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useRef"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p7)
		end,
		useBinding = function(p7) --[[ Line: 3376 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useBinding"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p7)
		end,
		useState = function(p7) --[[ Line: 3382 ]]
			-- upvalues: v3 (ref), Console (copy), ReactCurrentDispatcher (copy), Current4 (ref)
			v3 = "useState"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local Current = ReactCurrentDispatcher.current
			ReactCurrentDispatcher.current = Current4
			local Success, Result, Result3 = pcall(rerenderState, p7)
			ReactCurrentDispatcher.current = Current
			
			if not Success then
				error(Result)
			end
			return Result, Result3
		end,
		useDebugValue = function(p7, p8) --[[ Line: 3399 ]]
			-- upvalues: v3 (ref), Console (copy), Callback (copy)
			v3 = "useDebugValue"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return Callback(p7, p8)
		end,
		useMutableSource = function(p7, p8, p9) --[[ Line: 3417 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useMutableSource"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p7, p8, p9)
		end,
		useOpaqueIdentifier = function() --[[ Line: 3433 ]]
			-- upvalues: v3 (ref), Console (copy)
			v3 = "useOpaqueIdentifier"
			Console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = EnableNewReconciler
	}
end
function ReactFiberHooksModule.renderWithHooks(p6, p7, Callback, p8, p9, p10) --[[ Line: 3444 ]]
	-- upvalues: Value (ref), Alternate (ref), DEV (copy), List (ref), Count (ref), ReactFeatureFlags (copy), NoLanes (copy), ReactCurrentDispatcher (copy), Current2 (ref), Current1 (ref), Current (ref), config (copy), config1 (copy), Flag1 (ref), Error1 (copy), Alternate1 (ref), v2 (ref), v4 (ref), config2 (copy), ContextOnlyDispatcher (copy), EnableHookDoubleBuffering (copy), Next (ref), LastEffect (ref), v3 (ref), Flag (ref), GetComponentNameFunction (copy)
	Value = p10
	Alternate = p7
	
	if DEV then
		List = if p6 == nil then nil else p6._debugHookTypes
		Count = 0
	end
	if ReactFeatureFlags.enableWorkLoopTrims then
		if p7.memoizedState ~= nil then
			p7.memoizedState = nil
		end
		if p7.updateQueue ~= nil then
			p7.updateQueue = nil
		end
	else
		p7.memoizedState = nil
		p7.updateQueue = nil
	end
	p7.lanes = NoLanes
	
	if DEV then
		if p6 == nil or p6.memoizedState == nil then
			if List == nil then
				ReactCurrentDispatcher.current = Current
			else
				ReactCurrentDispatcher.current = Current1
			end
		else
			ReactCurrentDispatcher.current = Current2
		end
	else
		ReactCurrentDispatcher.current = (p6 == nil or p6.memoizedState == nil) and config or config1
	end
	local CallbackResult = Callback(p8, p9)
	
	if Flag1 then
		local Count1 = 0
		repeat
			Flag1 = false
			if Count1 >= 25 then
				error(Error1.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
			end
			Count1 += 1
			Alternate1 = nil
			v2 = nil
			p7.updateQueue = nil
			
			if DEV then
				Count = 0
			end
			ReactCurrentDispatcher.current = DEV and v4 or config2
			CallbackResult = Callback(p8, p9)
		until not Flag1
	end
	ReactCurrentDispatcher.current = ContextOnlyDispatcher
	
	if DEV then
		p7._debugHookTypes = List
	end
	local HasNext: boolean = Alternate1 ~= nil and Alternate1.next ~= nil
	Value = NoLanes
	Alternate = nil
	Alternate1 = nil
	v2 = nil
	
	if EnableHookDoubleBuffering then
		Next = nil
		LastEffect = nil
	end
	if DEV then
		v3 = nil
		List = nil
		Count = 0
	end
	Flag = false
	
	if HasNext then
		local v15 = "unknown"
		
		if CallbackResult and CallbackResult.type then
			v15 = GetComponentNameFunction(CallbackResult.type) or v15
		end
		error(Error1.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement. Inside '" .. v15 .. "'"))
	end
	return CallbackResult
end

return ReactFiberHooksModule