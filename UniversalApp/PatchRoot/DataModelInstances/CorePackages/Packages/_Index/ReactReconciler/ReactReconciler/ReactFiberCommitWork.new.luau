local function unimplemented(Text) --[[ Line: 11 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(Text))
	error("FIXME (roblox): " .. Text .. " is unimplemented", 2)
end

local Count = 0

local function _(p1): boolean --[[ Line: 25 | Named "isCallable" ]]
	if typeof(p1) == "function" then
		return true
	end
	if typeof(p1) == "table" then
		local Meta = getmetatable(p1)
		
		if Meta and rawget(Meta, "__call") then
			return true
		elseif p1._isMockFunction then
			return true
		end
	end
	return false
end

local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Error1 = LuauPolyfillModule.Error
local Set = LuauPolyfillModule.Set
local DEV = ReactGlobalsModule.__DEV__
local YOLO = ReactGlobalsModule.__YOLO__
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local ReactHookEffectTagsModule = require(script.Parent.ReactHookEffectTags)
local UnstableWrapFunction = require(Parent.Scheduler).tracing.unstable_wrap
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local EnableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local EnableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local EnableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local EnableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local EnableNewTreeCleanupPath = ReactFeatureFlags.enableNewTreeCleanupPath
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local ForwardRef = ReactWorkTagsModule.ForwardRef
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local HostComponent = ReactWorkTagsModule.HostComponent
local HostText = ReactWorkTagsModule.HostText
local HostPortal = ReactWorkTagsModule.HostPortal
local Profiler = ReactWorkTagsModule.Profiler
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local DehydratedFragment = ReactWorkTagsModule.DehydratedFragment
local IncompleteClassComponent = ReactWorkTagsModule.IncompleteClassComponent
local MemoComponent = ReactWorkTagsModule.MemoComponent
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local FundamentalComponent = ReactWorkTagsModule.FundamentalComponent
local ScopeComponent = ReactWorkTagsModule.ScopeComponent
local Block = ReactWorkTagsModule.Block
local OffscreenComponent = ReactWorkTagsModule.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTagsModule.LegacyHiddenComponent
local ReactErrorUtils = require(Parent.Shared).ReactErrorUtils
local InvokeGuardedCallbackFunction = ReactErrorUtils.invokeGuardedCallback
local HasCaughtErrorFunction = ReactErrorUtils.hasCaughtError
local ClearCaughtErrorFunction = ReactErrorUtils.clearCaughtError
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local NoFlags = ReactFiberFlagsModule.NoFlags
local ContentReset = ReactFiberFlagsModule.ContentReset
local Placement = ReactFiberFlagsModule.Placement
local Snapshot = ReactFiberFlagsModule.Snapshot
local Update = ReactFiberFlagsModule.Update
local Callback7 = ReactFiberFlagsModule.Callback
local LayoutMask = ReactFiberFlagsModule.LayoutMask
local PassiveMask = ReactFiberFlagsModule.PassiveMask
local Ref = ReactFiberFlagsModule.Ref
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local InvariantFunction = require(Parent.Shared).invariant
local DescribeError = require(Parent.Shared).describeError
local ReactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local Current = ReactCurrentFiberModule.current
local ResetCurrentFiberFunction = ReactCurrentFiberModule.resetCurrentFiber
local SetCurrentFiberFunction = ReactCurrentFiberModule.setCurrentFiber
local OnCommitUnmountFunction = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount
local ResolveDefaultPropsFunction = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local ReactProfilerTimerNewModule = require(script.Parent["ReactProfilerTimer.new"])
local StartLayoutEffectTimerFunction = ReactProfilerTimerNewModule.startLayoutEffectTimer
local RecordPassiveEffectDurationFunction = ReactProfilerTimerNewModule.recordPassiveEffectDuration
local RecordLayoutEffectDurationFunction = ReactProfilerTimerNewModule.recordLayoutEffectDuration
local StartPassiveEffectTimerFunction = ReactProfilerTimerNewModule.startPassiveEffectTimer
local GetCommitTimeFunction = ReactProfilerTimerNewModule.getCommitTime
local ProfileMode = require(script.Parent.ReactTypeOfMode).ProfileMode
local CommitUpdateQueueFunction = require(script.Parent["ReactUpdateQueue.new"]).commitUpdateQueue
local GetPublicInstanceFunction = ReactFiberHostConfigModule.getPublicInstance
local SupportsMutation = ReactFiberHostConfigModule.supportsMutation
local IsNotSupportsChildOrdering: boolean = ReactFeatureFlags.enableSkipHostSiblingLookup and ReactFiberHostConfigModule.supportsChildOrdering == false
local SupportsPersistence = ReactFiberHostConfigModule.supportsPersistence
local SupportsHydration = ReactFiberHostConfigModule.supportsHydration
local CommitMountFunction = ReactFiberHostConfigModule.commitMount
local CommitUpdateFunction = ReactFiberHostConfigModule.commitUpdate
local ResetTextContentFunction = ReactFiberHostConfigModule.resetTextContent
local CommitTextUpdateFunction = ReactFiberHostConfigModule.commitTextUpdate
local AppendChildFunction = ReactFiberHostConfigModule.appendChild
local AppendChildToContainerFunction = ReactFiberHostConfigModule.appendChildToContainer
local InsertBeforeFunction = ReactFiberHostConfigModule.insertBefore
local InsertInContainerBeforeFunction = ReactFiberHostConfigModule.insertInContainerBefore
local RemoveChildFunction = ReactFiberHostConfigModule.removeChild
local RemoveChildFromContainerFunction = ReactFiberHostConfigModule.removeChildFromContainer
local HideInstanceFunction = ReactFiberHostConfigModule.hideInstance
local HideTextInstanceFunction = ReactFiberHostConfigModule.hideTextInstance
local UnhideInstanceFunction = ReactFiberHostConfigModule.unhideInstance
local UnhideTextInstanceFunction = ReactFiberHostConfigModule.unhideTextInstance
local CommitHydratedSuspenseInstanceFunction = ReactFiberHostConfigModule.commitHydratedSuspenseInstance
local ClearContainerFunction = ReactFiberHostConfigModule.clearContainer
local ReactFiberWorkLoopNewModule = nil

local function resolveRetryWakeable(p1, Promise) --[[ Line: 199 ]]
	-- upvalues: ReactFiberWorkLoopNewModule (ref)
	if not ReactFiberWorkLoopNewModule then
		ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	ReactFiberWorkLoopNewModule.resolveRetryWakeable(p1, Promise)
end

local _ = function() --[[ Line: 206 | Named "markCommitTimeOfFallback" ]]
	-- upvalues: ReactFiberWorkLoopNewModule (ref)
	if not ReactFiberWorkLoopNewModule then
		ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	ReactFiberWorkLoopNewModule.markCommitTimeOfFallback()
end

local function schedulePassiveEffectCallback() --[[ Line: 214 ]]
	-- upvalues: Console (copy)
	Console.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end

local function captureCommitPhaseError(_, _, p1) --[[ Line: 222 ]]
	-- upvalues: Console (copy)
	Console.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
	error(p1)
end

local NoFlags1 = ReactHookEffectTagsModule.NoFlags
local HasEffect = ReactHookEffectTagsModule.HasEffect
local Layout = ReactHookEffectTagsModule.Layout
local Passive = ReactHookEffectTagsModule.Passive
local DidWarnAboutReassigningProps = nil

local function v74() --[[ Line: 240 ]]
	-- upvalues: DidWarnAboutReassigningProps (ref)
	if not DidWarnAboutReassigningProps then
		DidWarnAboutReassigningProps = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps
	end
	return DidWarnAboutReassigningProps
end

local Callback5 = nil
local getHostSibling = nil
local Callback = nil
local Callback6 = nil
local Callback1 = nil
local Callback3 = nil
local Callback2 = nil
local Callback4 = nil
local commitNestedUnmounts = nil
local commitUnmount = nil
local v1 = nil

local function callComponentWillUnmountWithTimer(p1, p2) --[[ Line: 265 ]]
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartLayoutEffectTimerFunction (copy), DescribeError (copy), RecordLayoutEffectDurationFunction (copy)
	p2.props = p1.memoizedProps
	p2.state = p1.memoizedState
	
	if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(p1.mode, ProfileMode) ~= 0 then
		local Success, Result = xpcall(function() --[[ Line: 274 ]]
			-- upvalues: StartLayoutEffectTimerFunction (upval), p2 (copy)
			StartLayoutEffectTimerFunction()
			p2:componentWillUnmount()
		end, DescribeError)
		RecordLayoutEffectDurationFunction(p1)
		
		if not Success then
			error(Result)
			
			return
		end
	else
		p2:componentWillUnmount()
	end
end

function safelyCallComponentWillUnmount(p1, p2, p3) --[[ Line: 292 ]]
	-- upvalues: callComponentWillUnmountWithTimer (copy), DescribeError (copy), captureCommitPhaseError (ref)
	local Success, Result = xpcall(callComponentWillUnmountWithTimer, DescribeError, p1, p2)
	
	if not Success then
		captureCommitPhaseError(p1, p3, Result)
	end
end

local _ = function(p1, p2) --[[ Line: 306 | Named "safelyDetachRef" ]]
	-- upvalues: DescribeError (copy), captureCommitPhaseError (ref)
	local Ref = p1.ref
	
	if Ref ~= nil then
		if typeof(Ref) == "function" then
			local Success, Result = xpcall(Ref, DescribeError)
			
			if not Success then
				captureCommitPhaseError(p1, p2, Result)
				
				return
			end
		else
			Ref.current = nil
		end
	end
end

local function safelyCallDestroy(p1, p2, p3) --[[ Line: 322 ]]
	-- upvalues: DescribeError (copy), captureCommitPhaseError (ref)
	local Success, Result = xpcall(p3, DescribeError)
	
	if not Success then
		captureCommitPhaseError(p1, p2, Result)
	end
end

local function commitBeforeMutationLifeCycles(p1, p2) --[[ Line: 334 ]]
	-- upvalues: FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), ClassComponent (copy), Snapshot (copy), DEV (copy), v74 (copy), Console (copy), GetComponentNameFunction (copy), ResolveDefaultPropsFunction (copy), HostRoot (copy), SupportsMutation (copy), ClearContainerFunction (copy), HostComponent (copy), HostText (copy), HostPortal (copy), IncompleteClassComponent (copy), InvariantFunction (copy)
	if p2.tag == FunctionComponent or p2.tag == ForwardRef or p2.tag == SimpleMemoComponent or p2.tag == Block then return end
	if p2.tag == ClassComponent then
		if bit32.band(p2.flags, Snapshot) ~= 0 and p1 ~= nil then
			local MemoizedProps = p1.memoizedProps
			local MemoizedState = p1.memoizedState
			local StateNode = p2.stateNode
			
			if DEV and p2.type == p2.elementType and not v74 then
				if StateNode.props ~= p2.memoizedProps then
					Console.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
				if StateNode.state ~= p2.memoizedState then
					Console.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
			end
			StateNode.__reactInternalSnapshotBeforeUpdate = StateNode:getSnapshotBeforeUpdate(p2.elementType == p2.type and MemoizedProps or ResolveDefaultPropsFunction(p2.type, MemoizedProps), MemoizedState)
		end
		return
	elseif p2.tag == HostRoot then
		if SupportsMutation and bit32.band(p2.flags, Snapshot) ~= 0 then
			ClearContainerFunction(p2.stateNode.containerInfo)
		end
		return
	elseif p2.tag ~= HostComponent and p2.tag ~= HostText and p2.tag ~= HostPortal and p2.tag ~= IncompleteClassComponent then
		InvariantFunction(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
		
		return
	else
	end
end

local function commitHookEffectListUnmount(Mask: number, Child, Return) --[[ Line: 427 ]]
	-- upvalues: ReactFeatureFlags (copy), DescribeError (copy), captureCommitPhaseError (ref)
	local UpdateQueue = Child.updateQueue
	local LastEffect = if UpdateQueue ~= nil then UpdateQueue.lastEffect else nil
	
	if LastEffect ~= nil then
		local Next = LastEffect.next
		local Next1 = Next
		repeat
			if bit32.band(Next1.tag, Mask) == Mask then
				local Destroy = Next1.destroy
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if Destroy ~= nil then
						Next1.destroy = nil
					end
				else
					Next1.destroy = nil
				end
				local NoDestroy = Destroy == nil
				local Result = nil
				
				if not NoDestroy then
					local Success
					Success, Result = xpcall(Destroy, DescribeError)
					NoDestroy = Success
				end
				if not NoDestroy then
					captureCommitPhaseError(Child, Return, Result)
				end
			end
			Next1 = Next1.next
		until Next1 == Next
	end
end

local function commitHookEffectListMount(Mask: number, p1) --[[ Line: 463 ]]
	-- upvalues: ReactFeatureFlags (copy), DEV (copy), Console (copy)
	local UpdateQueue = p1.updateQueue
	local LastEffect = if UpdateQueue == nil then nil else UpdateQueue.lastEffect
	
	if LastEffect ~= nil then
		local Next = LastEffect.next
		local Next1 = Next
		repeat
			if bit32.band(Next1.tag, Mask) == Mask then
				local CreateFunction = Next1.create
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					local CreateResult = CreateFunction()
					
					if CreateResult ~= nil or Next1.destroy ~= nil then
						Next1.destroy = CreateResult
					end
				else
					Next1.destroy = CreateFunction()
				end
				if DEV then
					local Destroy = Next1.destroy
					
					if Destroy ~= nil and typeof(Destroy) ~= "function" then
						Console.error("An effect function must not return anything besides a function, which is used for clean-up.%s", if Destroy == nil then " You returned nil. If your effect does not require clean up, return nil (or nothing)." elseif typeof(Destroy.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. Destroy)
					end
				end
			end
			Next1 = Next1.next
		until Next1 == Next
	end
end

function commitProfilerPassiveEffect(p1, p2) --[[ Line: 511 ]]
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), Profiler (copy), GetCommitTimeFunction (copy), EnableSchedulerTracing (copy)
	if EnableProfilerTimer and EnableProfilerCommitHooks and p2.tag == Profiler then
		local PassiveEffectDuration = p2.stateNode.passiveEffectDuration
		local Id = p2.memoizedProps.id
		local OnPostCommitFunction: (any, any, any, any, any) -> () = p2.memoizedProps.onPostCommit
		local CommitTime = GetCommitTimeFunction()
		
		if typeof(OnPostCommitFunction) == "function" then
			if EnableSchedulerTracing then
				OnPostCommitFunction(Id, if p2.alternate == nil then "mount" else "update", PassiveEffectDuration, CommitTime, p1.memoizedInteractions)
				
				return
			end
			OnPostCommitFunction(Id, if p2.alternate == nil then "mount" else "update", PassiveEffectDuration, CommitTime)
		end
	end
end

local function recursivelyCommitLayoutEffects(Child, p1, CaptureCommitPhaseError, SchedulePassiveEffectCallback) --[[ Line: 544 ]]
	-- upvalues: captureCommitPhaseError (ref), schedulePassiveEffectCallback (ref), Profiler (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), v1 (ref), ReactFeatureFlags (copy), LayoutMask (copy), NoFlags (copy), DEV (copy), Current (copy), SetCurrentFiberFunction (copy), InvokeGuardedCallbackFunction (copy), recursivelyCommitLayoutEffects (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), ResetCurrentFiberFunction (copy), DescribeError (copy), Update (copy), Callback7 (copy), ReactCurrentFiberModule (copy), Count (ref), YOLO (copy), FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), ProfileMode (copy), StartLayoutEffectTimerFunction (copy), commitHookEffectListMount (copy), Layout (copy), HasEffect (copy), RecordLayoutEffectDurationFunction (copy), PassiveMask (copy), ClassComponent (copy), Callback2 (ref), HostRoot (copy), Callback1 (ref), HostComponent (copy), Callback3 (ref), SuspenseComponent (copy), FundamentalComponent (copy), HostPortal (copy), HostText (copy), IncompleteClassComponent (copy), LegacyHiddenComponent (copy), OffscreenComponent (copy), ScopeComponent (copy), SuspenseListComponent (copy), InvariantFunction (copy), Ref (copy)
	if CaptureCommitPhaseError ~= nil then
		captureCommitPhaseError = CaptureCommitPhaseError
	end
	if SchedulePassiveEffectCallback ~= nil then
		schedulePassiveEffectCallback = SchedulePassiveEffectCallback
	end
	local Flags: number = Child.flags
	local Tag = Child.tag
	
	if Tag == Profiler then
		local v2 = nil
		
		if EnableProfilerTimer and EnableProfilerCommitHooks then
			v2 = v1
			v1 = Child
		end
		if ReactFeatureFlags.enableCommitTraversalTrims then
			local Child1 = if bit32.band(Child.subtreeFlags, LayoutMask) == NoFlags then nil else Child.child
			while Child1 ~= nil do
				if bit32.band(bit32.bor(Child1.flags, Child1.subtreeFlags), LayoutMask) ~= NoFlags or Child1.tag == Profiler then
					if DEV then
						SetCurrentFiberFunction(Child1)
						InvokeGuardedCallbackFunction(nil, recursivelyCommitLayoutEffects, nil, Child1, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if HasCaughtErrorFunction() then
							captureCommitPhaseError(Child1, Child, (ClearCaughtErrorFunction()))
						end
						if Current == nil then
							ResetCurrentFiberFunction()
						else
							SetCurrentFiberFunction(Current)
						end
					else
						local Success, Result = xpcall(recursivelyCommitLayoutEffects, DescribeError, Child1, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if not Success then
							captureCommitPhaseError(Child1, Child, Result)
						end
					end
				end
				Child1 = Child1.sibling
			end
		else
			local Child2 = Child.child
			while Child2 ~= nil do
				if bit32.band(Child.subtreeFlags, LayoutMask) ~= NoFlags then
					if DEV then
						SetCurrentFiberFunction(Child2)
						InvokeGuardedCallbackFunction(nil, recursivelyCommitLayoutEffects, nil, Child2, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if HasCaughtErrorFunction() then
							captureCommitPhaseError(Child2, Child, (ClearCaughtErrorFunction()))
						end
						if Current == nil then
							ResetCurrentFiberFunction()
						else
							SetCurrentFiberFunction(Current)
						end
					else
						local Success1, Result1 = xpcall(recursivelyCommitLayoutEffects, DescribeError, Child2, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if not Success1 then
							captureCommitPhaseError(Child2, Child, Result1)
						end
					end
				end
				Child2 = Child2.sibling
			end
		end
		if bit32.band(Flags, (bit32.bor(Update, Callback7))) ~= NoFlags and EnableProfilerTimer then
			if DEV then
				SetCurrentFiberFunction(Child)
				InvokeGuardedCallbackFunction(nil, commitLayoutEffectsForProfiler, nil, Child, p1)
				
				if HasCaughtErrorFunction() then
					captureCommitPhaseError(Child, Child.return_, (ClearCaughtErrorFunction()))
				end
				if Current == nil then
					ResetCurrentFiberFunction()
				else
					SetCurrentFiberFunction(Current)
				end
			else
				local Success2, Result2 = xpcall(commitLayoutEffectsForProfiler, DescribeError, Child, p1)
				
				if not Success2 then
					captureCommitPhaseError(Child, Child.return_, Result2)
				end
			end
		end
		if EnableProfilerTimer and EnableProfilerCommitHooks then
			if v2 ~= nil then
				local StateNode = v2.stateNode
				StateNode.effectDuration += Child.stateNode.effectDuration
			end
			v1 = v2
			
			return
		end
	else
		if ReactFeatureFlags.enableCommitTraversalTrims then
			local Child3 = if bit32.band(Child.subtreeFlags, LayoutMask) == NoFlags then nil else Child.child
			while Child3 ~= nil do
				if bit32.band(bit32.bor(Child3.flags, Child3.subtreeFlags), LayoutMask) ~= NoFlags or Child3.tag == Profiler then
					if DEV then
						local Current1 = ReactCurrentFiberModule.current
						SetCurrentFiberFunction(Child3)
						
						if Count < 20 then
							Count += 1
							InvokeGuardedCallbackFunction(nil, recursivelyCommitLayoutEffects, nil, Child3, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
							Count -= 1
							
							if HasCaughtErrorFunction() then
								captureCommitPhaseError(Child3, Child, (ClearCaughtErrorFunction()))
							end
						else
							recursivelyCommitLayoutEffects(Child3, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						end
						if Current1 == nil then
							ResetCurrentFiberFunction()
						else
							SetCurrentFiberFunction(Current1)
						end
					else
						local v3 = nil
						local v4 = nil
						
						if YOLO or Count >= 20 then
							v4 = true
							recursivelyCommitLayoutEffects(Child3, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						else
							Count += 1
							v4, v143 = xpcall(recursivelyCommitLayoutEffects, DescribeError, Child3, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
							Count -= 1
						end
						if not v4 then
							captureCommitPhaseError(Child3, Child, v3)
						end
					end
				end
				Child3 = Child3.sibling
			end
		else
			local Child4 = Child.child
			while Child4 ~= nil do
				if bit32.band(Child.subtreeFlags, LayoutMask) ~= NoFlags then
					if DEV then
						local Current2 = ReactCurrentFiberModule.current
						SetCurrentFiberFunction(Child4)
						
						if Count < 20 then
							Count += 1
							InvokeGuardedCallbackFunction(nil, recursivelyCommitLayoutEffects, nil, Child4, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
							Count -= 1
							
							if HasCaughtErrorFunction() then
								captureCommitPhaseError(Child4, Child, (ClearCaughtErrorFunction()))
							end
						else
							recursivelyCommitLayoutEffects(Child4, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						end
						if Current2 == nil then
							ResetCurrentFiberFunction()
						else
							SetCurrentFiberFunction(Current2)
						end
					else
						local v5 = nil
						local v6 = nil
						
						if YOLO or Count >= 20 then
							v6 = true
							recursivelyCommitLayoutEffects(Child4, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
						else
							Count += 1
							v6, v146 = xpcall(recursivelyCommitLayoutEffects, DescribeError, Child4, p1, captureCommitPhaseError, schedulePassiveEffectCallback)
							Count -= 1
						end
						if not v6 then
							captureCommitPhaseError(Child4, Child, v5)
						end
					end
				end
				Child4 = Child4.sibling
			end
		end
		if bit32.band(Flags, (bit32.bor(Update, Callback7))) ~= NoFlags then
			if Tag == FunctionComponent or (Tag == ForwardRef or Tag == SimpleMemoComponent or Tag == Block) then
				if EnableProfilerTimer and (EnableProfilerCommitHooks and bit32.band(Child.mode, ProfileMode) ~= 0) then
					local Success3, Result3 = xpcall(function() --[[ Line: 915 ]]
						-- upvalues: StartLayoutEffectTimerFunction (upval), commitHookEffectListMount (upval), Layout (upval), HasEffect (upval), Child (copy)
						StartLayoutEffectTimerFunction()
						commitHookEffectListMount(bit32.bor(Layout, HasEffect), Child)
					end, DescribeError)
					RecordLayoutEffectDurationFunction(Child)
					
					if not Success3 then
						error(Result3)
					end
				else
					commitHookEffectListMount(bit32.bor(Layout, HasEffect), Child)
				end
				if bit32.band(Child.subtreeFlags, PassiveMask) ~= NoFlags then
					schedulePassiveEffectCallback()
				end
			elseif Tag == ClassComponent then
				Callback2(Child)
			elseif Tag == HostRoot then
				Callback1(Child)
			elseif Tag == HostComponent then
				Callback3(Child)
			elseif Tag == SuspenseComponent then
				commitSuspenseHydrationCallbacks(p1, Child)
			elseif Tag ~= FundamentalComponent and Tag ~= HostPortal and Tag ~= HostText and Tag ~= IncompleteClassComponent and Tag ~= LegacyHiddenComponent and (Tag ~= OffscreenComponent and Tag ~= ScopeComponent and Tag ~= SuspenseListComponent) then
				InvariantFunction(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
			end
		end
		if bit32.band(Flags, Ref) ~= 0 then
			commitAttachRef(Child)
		end
	end
end

function commitLayoutEffectsForProfiler(p2, p3) --[[ Line: 980 ]]
	-- upvalues: EnableProfilerTimer (copy), GetCommitTimeFunction (copy), Update (copy), Callback7 (copy), NoFlags (copy), EnableSchedulerTracing (copy), EnableProfilerCommitHooks (copy)
	if EnableProfilerTimer then
		local Flags: number = p2.flags
		local Alternate = p2.alternate
		local OnCommitFunction: (any, any, any, any, any) -> () = p2.memoizedProps.onCommit
		local OnRenderFunction: (any, any, any, any, any, any, any) -> () = p2.memoizedProps.onRender
		local EffectDuration = p2.stateNode.effectDuration
		local CommitTime = GetCommitTimeFunction()
		local Flag = nil
		
		if bit32.band(Flags, Update) ~= NoFlags then
			repeat
				if typeof(OnRenderFunction) == "function" then
					Flag = true
					break
				end
				if typeof(OnRenderFunction) == "table" then
					local Meta = getmetatable(OnRenderFunction)
					
					if Meta and rawget(Meta, "__call") then
						Flag = true
						break
					end
					if OnRenderFunction._isMockFunction then
						Flag = true
						break
					end
				end
				Flag = false
			until true
			if Flag then
				if EnableSchedulerTracing then
					OnRenderFunction(p2.memoizedProps.id, if Alternate == nil then "mount" else "update", p2.actualDuration, p2.treeBaseDuration, p2.actualStartTime, CommitTime, p3.memoizedInteractions)
				else
					OnRenderFunction(p2.memoizedProps.id, if Alternate == nil then "mount" else "update", p2.actualDuration, p2.treeBaseDuration, p2.actualStartTime, CommitTime)
				end
			end
		end
		local Flag1 = nil
		if EnableProfilerCommitHooks and bit32.band(Flags, Callback7) ~= NoFlags then
			repeat
				if typeof(OnCommitFunction) == "function" then
					Flag1 = true
					break
				end
				if typeof(OnCommitFunction) == "table" then
					local Meta = getmetatable(OnCommitFunction)
					
					if Meta and rawget(Meta, "__call") then
						Flag1 = true
						break
					end
					if OnCommitFunction._isMockFunction then
						Flag1 = true
						break
					end
				end
				Flag1 = false
			until true
			if Flag1 then
				if EnableSchedulerTracing then
					OnCommitFunction(p2.memoizedProps.id, if Alternate == nil then "mount" else "update", EffectDuration, CommitTime, p3.memoizedInteractions)
					
					return
				end
				OnCommitFunction(p2.memoizedProps.id, if Alternate == nil then "mount" else "update", EffectDuration, CommitTime)
			end
		end
	end
end

Callback2 = function(p2) --[[ Line: 1048 | Named "commitLayoutEffectsForClassComponent" ]]
	-- upvalues: Update (copy), DEV (copy), v74 (copy), Console (copy), GetComponentNameFunction (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartLayoutEffectTimerFunction (copy), DescribeError (copy), RecordLayoutEffectDurationFunction (copy), ResolveDefaultPropsFunction (copy), CommitUpdateQueueFunction (copy)
	local StateNode = p2.stateNode
	local Alternate = p2.alternate
	
	if bit32.band(p2.flags, Update) ~= 0 then
		if Alternate == nil then
			if DEV and p2.type == p2.elementType and not v74 then
				if StateNode.props ~= p2.memoizedProps then
					Console.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
				if StateNode.state ~= p2.memoizedState then
					Console.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
			end
			if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(p2.mode, ProfileMode) ~= 0 then
				local Success, Result = xpcall(function() --[[ Line: 1088 ]]
					-- upvalues: StartLayoutEffectTimerFunction (upval), StateNode (copy)
					StartLayoutEffectTimerFunction()
					StateNode:componentDidMount()
				end, DescribeError)
				RecordLayoutEffectDurationFunction(p2)
				
				if not Success then
					error(Result)
				end
			else
				StateNode:componentDidMount()
			end
		else
			local MemoizedProps = p2.elementType == p2.type and Alternate.memoizedProps or ResolveDefaultPropsFunction(p2.type, Alternate.memoizedProps)
			local MemoizedState = Alternate.memoizedState
			
			if DEV and p2.type == p2.elementType and not v74 then
				if StateNode.props ~= p2.memoizedProps then
					Console.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
				if StateNode.state ~= p2.memoizedState then
					Console.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
				end
			end
			if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(p2.mode, ProfileMode) ~= 0 then
				local Success1, Result1 = xpcall(function() --[[ Line: 1142 ]]
					-- upvalues: StartLayoutEffectTimerFunction (upval), StateNode (copy), MemoizedProps (copy), MemoizedState (copy)
					StartLayoutEffectTimerFunction()
					StateNode:componentDidUpdate(MemoizedProps, MemoizedState, StateNode.__reactInternalSnapshotBeforeUpdate)
				end, DescribeError)
				RecordLayoutEffectDurationFunction(p2)
				
				if not Success1 then
					error(Result1)
				end
			else
				StateNode:componentDidUpdate(MemoizedProps, MemoizedState, StateNode.__reactInternalSnapshotBeforeUpdate)
			end
		end
	end
	local UpdateQueue = p2.updateQueue
	
	if UpdateQueue ~= nil then
		if DEV and p2.type == p2.elementType and not v74 then
			if StateNode.props ~= p2.memoizedProps then
				Console.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
			end
			if StateNode.state ~= p2.memoizedState then
				Console.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", GetComponentNameFunction(p2.type) or "instance")
			end
		end
		CommitUpdateQueueFunction(p2, UpdateQueue, StateNode)
	end
end

Callback1 = function(p2) --[[ Line: 1205 | Named "commitLayoutEffectsForHostRoot" ]]
	-- upvalues: HostComponent (copy), GetPublicInstanceFunction (copy), ClassComponent (copy), CommitUpdateQueueFunction (copy)
	local UpdateQueue = p2.updateQueue
	
	if UpdateQueue ~= nil then
		local StateNode = nil
		
		if p2.child ~= nil then
			local Child = p2.child
			
			if Child.tag == HostComponent then
				StateNode = GetPublicInstanceFunction(Child.stateNode)
			elseif Child.tag == ClassComponent then
				StateNode = Child.stateNode
			end
		end
		CommitUpdateQueueFunction(p2, UpdateQueue, StateNode)
	end
end

Callback3 = function(p2) --[[ Line: 1224 | Named "commitLayoutEffectsForHostComponent" ]]
	-- upvalues: Update (copy), CommitMountFunction (copy)
	local StateNode = p2.stateNode
	
	if p2.alternate == nil and bit32.band(p2.flags, Update) ~= 0 then
		CommitMountFunction(StateNode, p2.type, p2.memoizedProps, p2)
	end
end

local function hideOrUnhideAllChildren(Child, HasMemoizedState) --[[ Line: 1239 ]]
	-- upvalues: SupportsMutation (copy), HostComponent (copy), HideInstanceFunction (copy), UnhideInstanceFunction (copy), HostText (copy), HideTextInstanceFunction (copy), UnhideTextInstanceFunction (copy), OffscreenComponent (copy), LegacyHiddenComponent (copy)
	if SupportsMutation then
		local Child1 = Child
		while true do
			if Child1.tag == HostComponent then
				local StateNode = Child1.stateNode
				
				if HasMemoizedState then
					HideInstanceFunction(StateNode)
				else
					UnhideInstanceFunction(Child1.stateNode, Child1.memoizedProps)
				end
			elseif Child1.tag == HostText then
				local StateNode = Child1.stateNode
				
				if HasMemoizedState then
					HideTextInstanceFunction(StateNode)
				else
					UnhideTextInstanceFunction(StateNode, Child1.memoizedProps)
				end
			elseif (Child1.tag ~= OffscreenComponent and Child1.tag ~= LegacyHiddenComponent or (Child1.memoizedState == nil or Child1 == Child)) and Child1.child ~= nil then
				Child1.child.return_ = Child1
				Child1 = Child1.child
				continue
			end
			if Child1 == Child then break end
			while Child1.sibling == nil do
				if Child1.return_ == nil or Child1.return_ == Child then break end
				Child1 = Child1.return_
			end
			Child1.sibling.return_ = Child1.return_
			Child1 = Child1.sibling
		end
	end
end

function commitAttachRef(p2) --[[ Line: 1289 ]]
	-- upvalues: HostComponent (copy), GetPublicInstanceFunction (copy), DEV (copy), Console (copy), GetComponentNameFunction (copy)
	local RefFunction: (any) -> () = p2.ref
	
	if RefFunction ~= nil then
		local StateNode = p2.stateNode
		local PublicInstance = if p2.tag == HostComponent then GetPublicInstanceFunction(StateNode) else StateNode
		
		if typeof(RefFunction) == "function" then
			RefFunction(PublicInstance)
			
			return
		end
		if DEV and typeof(RefFunction) ~= "table" then
			Console.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", GetComponentNameFunction(p2.type) or "instance")
			
			return
		end
		RefFunction.current = PublicInstance
	end
end

function commitDetachRef(p2) --[[ Line: 1328 ]]
	local RefFunction: (any) -> () = p2.ref
	
	if RefFunction ~= nil then
		if typeof(RefFunction) == "function" then
			RefFunction(nil)
			
			return
		end
		RefFunction.current = nil
	end
end

commitUnmount = function(p2, Child, p3, p4) --[[ Line: 1342 | Named "commitUnmount" ]]
	-- upvalues: OnCommitUnmountFunction (copy), FunctionComponent (copy), ForwardRef (copy), MemoComponent (copy), SimpleMemoComponent (copy), Block (copy), Layout (copy), NoFlags1 (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartLayoutEffectTimerFunction (copy), DescribeError (copy), captureCommitPhaseError (ref), RecordLayoutEffectDurationFunction (copy), ClassComponent (copy), HostComponent (copy), HostPortal (copy), SupportsMutation (copy), Callback4 (ref), SupportsPersistence (copy), unimplemented (copy)
	OnCommitUnmountFunction(Child)
	
	if Child.tag == FunctionComponent or Child.tag == ForwardRef or Child.tag == MemoComponent or Child.tag == SimpleMemoComponent or Child.tag == Block then
		local UpdateQueue = Child.updateQueue
		
		if UpdateQueue ~= nil then
			local LastEffect = UpdateQueue.lastEffect
			
			if LastEffect ~= nil then
				local Next = LastEffect.next
				local Next1 = Next
				repeat
					if Next1.destroy ~= nil and bit32.band(Next1.tag, Layout) ~= NoFlags1 then
						if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(Child.mode, ProfileMode) ~= 0 then
							StartLayoutEffectTimerFunction()
							local Success1, Result1 = xpcall(Next1.destroy, DescribeError)
							
							if not Success1 then
								captureCommitPhaseError(Child, p3, Result1)
							end
							RecordLayoutEffectDurationFunction(Child)
						else
							local Success, Result = xpcall(Next1.destroy, DescribeError)
							
							if not Success then
								captureCommitPhaseError(Child, p3, Result)
							end
						end
					end
					Next1 = Next1.next
				until Next1 == Next
			end
		end
		return
	elseif Child.tag == ClassComponent then
		local Ref = Child.ref
		
		if Ref ~= nil then
			if typeof(Ref) == "function" then
				local Success2, Result2 = xpcall(Ref, DescribeError)
				
				if not Success2 then
					captureCommitPhaseError(Child, p3, Result2)
				end
			else
				Ref.current = nil
			end
		end
		local StateNode = Child.stateNode
		
		if typeof(StateNode.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(Child, StateNode, p3)
		end
		return
	elseif Child.tag == HostComponent then
		local Ref = Child.ref
		
		if Ref ~= nil then
			if typeof(Ref) == "function" then
				local Success3, Result3 = xpcall(Ref, DescribeError)
				
				if not Success3 then
					captureCommitPhaseError(Child, p3, Result3)
					
					return
				end
			else
				Ref.current = nil
			end
		end
		return
	elseif Child.tag ~= HostPortal then return end
	if SupportsMutation then
		Callback4(p2, Child, p3, p4)
		
		return
	end
	if SupportsPersistence then
		unimplemented("emptyPortalContainer")
	end
end

commitNestedUnmounts = function(p2, Child, p3, p4) --[[ Line: 1449 | Named "commitNestedUnmounts" ]]
	-- upvalues: commitUnmount (ref), SupportsMutation (copy), HostPortal (copy)
	local Child1 = Child
	while true do
		commitUnmount(p2, Child1, p3, p4)
		if Child1.child ~= nil and (not SupportsMutation or Child1.tag ~= HostPortal) then
			Child1.child.return_ = Child1
			Child1 = Child1.child
		elseif Child1 ~= Child then
			while Child1.sibling == nil do
				if Child1.return_ == nil or Child1.return_ == Child then return end
				Child1 = Child1.return_
			end
			Child1.sibling.return_ = Child1.return_
			Child1 = Child1.sibling
		else
			return
		end
	end
end

local _ = function(p5) --[[ Line: 1489 | Named "detachFiberMutation" ]]
	-- upvalues: EnableNewTreeCleanupPath (copy)
	local Alternate = p5.alternate
	
	if Alternate ~= nil then
		Alternate.return_ = nil
		
		if not EnableNewTreeCleanupPath then
			p5.alternate = nil
		end
	end
	p5.return_ = nil
end

local function getHostParentFiber(p5) --[[ Line: 1558 ]]
	-- upvalues: Callback5 (ref), Error1 (copy)
	local Return = p5.return_
	while Return ~= nil do
		if Callback5(Return) then
			return Return
		end
		Return = Return.return_
	end
	error(Error1.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end

Callback5 = function(Return): boolean --[[ Line: 1576 | Named "isHostParent" ]]
	-- upvalues: HostComponent (copy), HostRoot (copy), HostPortal (copy)
	return Return.tag == HostComponent or (Return.tag == HostRoot or Return.tag == HostPortal)
end

getHostSibling = function(Child) --[[ Line: 1580 | Named "getHostSibling" ]]
	-- upvalues: Callback5 (ref), HostComponent (copy), HostText (copy), DehydratedFragment (copy), Placement (copy), HostPortal (copy)
	local Child1 = Child
	local Flag = nil
	while true do
		Flag = false
		while Child1.sibling == nil do
			if Child1.return_ == nil or Callback5(Child1.return_) then
				return nil
			end
			Child1 = Child1.return_
		end
		Child1.sibling.return_ = Child1.return_
		Child1 = Child1.sibling
		while Child1.tag ~= HostComponent and (Child1.tag ~= HostText and Child1.tag ~= DehydratedFragment) do
			if bit32.band(Child1.flags, Placement) ~= 0 then
				Flag = true
				break
			end
			if Child1.child ~= nil and Child1.tag ~= HostPortal then
				Child1.child.return_ = Child1
				Child1 = Child1.child
				continue
			end
			Flag = true
			break
		end
		if not Flag and bit32.band(Child1.flags, Placement) == 0 then
			return Child1.stateNode
		end
	end
end

local function commitPlacement(p6) --[[ Line: 1634 ]]
	-- upvalues: SupportsMutation (copy), getHostParentFiber (copy), HostComponent (copy), HostRoot (copy), HostPortal (copy), InvariantFunction (copy), ContentReset (copy), ResetTextContentFunction (copy), IsNotSupportsChildOrdering (copy), getHostSibling (ref), Callback6 (ref), Callback (ref)
	if not SupportsMutation then return end
	local HostParentFiber = getHostParentFiber(p6)
	local ContainerInfo = nil
	local Flag: boolean? = nil
	local StateNode = HostParentFiber.stateNode
	
	if HostParentFiber.tag == HostComponent then
		ContainerInfo = StateNode
		Flag = false
	elseif HostParentFiber.tag == HostRoot then
		ContainerInfo = StateNode.containerInfo
		Flag = true
	elseif HostParentFiber.tag == HostPortal then
		ContainerInfo = StateNode.containerInfo
		Flag = true
	else
		InvariantFunction(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
	end
	if bit32.band(HostParentFiber.flags, ContentReset) ~= 0 then
		ResetTextContentFunction(ContainerInfo)
		HostParentFiber.flags = bit32.band(HostParentFiber.flags, (bit32.bnot(ContentReset)))
	end
	local HostSibling = if IsNotSupportsChildOrdering then nil else getHostSibling(p6)
	
	if Flag then
		Callback6(p6, HostSibling, ContainerInfo)
		
		return
	else
		Callback(p6, HostSibling, ContainerInfo)
	end
end

Callback6 = function(Child, p6, ContainerInfo) --[[ Line: 1691 | Named "insertOrAppendPlacementNodeIntoContainer" ]]
	-- upvalues: HostComponent (copy), HostText (copy), InsertInContainerBeforeFunction (copy), AppendChildToContainerFunction (copy), HostPortal (copy), Callback6 (ref)
	local Tag = Child.tag
	
	if Tag == HostComponent or Tag == HostText then
		local StateNode = Child.stateNode
		
		if p6 then
			InsertInContainerBeforeFunction(ContainerInfo, StateNode, p6)
			
			return
		else
			AppendChildToContainerFunction(ContainerInfo, StateNode)
			
			return
		end
	else
		if Tag == HostPortal then return end
		local Child1 = Child.child
		
		if Child1 ~= nil then
			Callback6(Child1, p6, ContainerInfo)
			local Sibling = Child1.sibling
			while Sibling ~= nil do
				Callback6(Sibling, p6, ContainerInfo)
				Sibling = Sibling.sibling
			end
		end
	end
end

Callback = function(Child, p7, ContainerInfo) --[[ Line: 1723 | Named "insertOrAppendPlacementNode" ]]
	-- upvalues: HostComponent (copy), HostText (copy), InsertBeforeFunction (copy), AppendChildFunction (copy), HostPortal (copy), Callback (ref)
	local Tag = Child.tag
	
	if Tag == HostComponent or Tag == HostText then
		local StateNode = Child.stateNode
		
		if p7 then
			InsertBeforeFunction(ContainerInfo, StateNode, p7)
			
			return
		else
			AppendChildFunction(ContainerInfo, StateNode)
			
			return
		end
	else
		if Tag == HostPortal then return end
		local Child1 = Child.child
		
		if Child1 ~= nil then
			Callback(Child1, p7, ContainerInfo)
			local Sibling = Child1.sibling
			while Sibling ~= nil do
				Callback(Sibling, p7, ContainerInfo)
				Sibling = Sibling.sibling
			end
		end
	end
end

Callback4 = function(p8, Child, p9, p10) --[[ Line: 1751 | Named "unmountHostComponents" ]]
	-- upvalues: Error1 (copy), HostComponent (copy), HostRoot (copy), HostPortal (copy), HostText (copy), commitNestedUnmounts (ref), RemoveChildFromContainerFunction (copy), RemoveChildFunction (copy), commitUnmount (ref)
	local Child1 = Child
	local Flag = false
	local ContainerInfo = nil
	local Flag1: boolean? = nil
	while true do
		if not Flag then
			local Return = Child1.return_
			local StateNode = nil
			while true do
				if Return == nil then
					error(Error1.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
				end
				StateNode = Return.stateNode
				
				if Return.tag == HostComponent then
					ContainerInfo = StateNode
					Flag1 = false
					break
				end
				if Return.tag == HostRoot then
					ContainerInfo = StateNode.containerInfo
					Flag1 = true
					break
				end
				if Return.tag ~= HostPortal then
					Return = Return.return_
					continue
				end
				ContainerInfo = StateNode.containerInfo
				Flag1 = true
				break
			end
			Flag = true
		end
		if Child1.tag == HostComponent or Child1.tag == HostText then
			commitNestedUnmounts(p8, Child1, p9, p10)
			
			if Flag1 then
				RemoveChildFromContainerFunction(ContainerInfo, Child1.stateNode)
			else
				RemoveChildFunction(ContainerInfo, Child1.stateNode)
			end
		elseif Child1.tag == HostPortal then
			if Child1.child ~= nil then
				ContainerInfo = Child1.stateNode.containerInfo
				Flag1 = true
				Child1.child.return_ = Child1
				Child1 = Child1.child
			end
		else
			commitUnmount(p8, Child1, p9, p10)
			
			if Child1.child ~= nil then
				Child1.child.return_ = Child1
				Child1 = Child1.child
			end
		end
		if Child1 == Child then return end
		while Child1.sibling == nil do
			if Child1.return_ == nil or Child1.return_ == Child then return end
			Child1 = Child1.return_
			
			if Child1.tag == HostPortal then
				Flag = false
			end
		end
		Child1.sibling.return_ = Child1.return_
		Child1 = Child1.sibling
	end
end

local function commitDeletion(p11, Child, p12, p13) --[[ Line: 1929 ]]
	-- upvalues: Callback4 (ref), EnableNewTreeCleanupPath (copy)
	Callback4(p11, Child, p12, p13)
	local Alternate = if EnableNewTreeCleanupPath then nil else Child.alternate
	local Alternate1 = Child.alternate
	
	if Alternate1 ~= nil then
		Alternate1.return_ = nil
		
		if not EnableNewTreeCleanupPath then
			Child.alternate = nil
		end
	end
	Child.return_ = nil
	
	if not EnableNewTreeCleanupPath and Alternate ~= nil then
		local Alternate2 = Alternate.alternate
		
		if Alternate2 ~= nil then
			Alternate2.return_ = nil
			
			if not EnableNewTreeCleanupPath then
				Alternate.alternate = nil
			end
		end
		Alternate.return_ = nil
	end
end

local function commitWork(p11, Child) --[[ Line: 1964 ]]
	-- upvalues: FunctionComponent (copy), ForwardRef (copy), MemoComponent (copy), SimpleMemoComponent (copy), Block (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartLayoutEffectTimerFunction (copy), commitHookEffectListUnmount (copy), Layout (copy), HasEffect (copy), DescribeError (copy), RecordLayoutEffectDurationFunction (copy), ClassComponent (copy), HostComponent (copy), CommitUpdateFunction (copy), HostText (copy), InvariantFunction (copy), CommitTextUpdateFunction (copy), HostRoot (copy), SupportsHydration (copy), unimplemented (copy), Profiler (copy), SuspenseComponent (copy), SuspenseListComponent (copy), IncompleteClassComponent (copy), OffscreenComponent (copy), LegacyHiddenComponent (copy), hideOrUnhideAllChildren (copy)
	if Child.tag ~= FunctionComponent and Child.tag ~= ForwardRef and Child.tag ~= MemoComponent and Child.tag ~= SimpleMemoComponent and Child.tag ~= Block then
		if Child.tag == ClassComponent then return end
		if Child.tag == HostComponent then
			local StateNode = Child.stateNode
			
			if StateNode ~= nil then
				local MemoizedProps = Child.memoizedProps
				local MemoizedProps1 = if p11 then p11.memoizedProps else MemoizedProps
				local Type = Child.type
				local UpdateQueue = Child.updateQueue
				Child.updateQueue = nil
				
				if UpdateQueue ~= nil then
					CommitUpdateFunction(StateNode, UpdateQueue, Type, MemoizedProps1, MemoizedProps, Child)
				end
			end
			return
		elseif Child.tag == HostText then
			InvariantFunction(Child.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
			local StateNode = Child.stateNode
			local MemoizedProps = Child.memoizedProps
			local v7 = nil
			
			if p11 ~= nil then
				local _ = p11.memoizedProps
				v7 = MemoizedProps
			end
			CommitTextUpdateFunction(StateNode, v7, MemoizedProps)
			
			return
		else
			if Child.tag ~= HostRoot then
				if Child.tag == Profiler then return end
				if Child.tag == SuspenseComponent then
					commitSuspenseComponent(Child)
					attachSuspenseRetryListeners(Child)
					
					return
				end
				if Child.tag == SuspenseListComponent then
					unimplemented("commitWork: SuspenseListComponent")
				else
					if Child.tag == IncompleteClassComponent then return end
					if Child.tag == OffscreenComponent or Child.tag == LegacyHiddenComponent then
						hideOrUnhideAllChildren(Child, Child.memoizedState ~= nil)
						
						return
					end
				end
				InvariantFunction(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
				
				return
			elseif SupportsHydration then
				local StateNode = Child.stateNode
				
				if StateNode.hydrate then
					StateNode.hydrate = false
					unimplemented("commitWork: HostRoot: commitHydratedContainer")
				end
			end
			return
		end
	elseif EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(Child.mode, ProfileMode) ~= 0 then
		local Success, Result = xpcall(function() --[[ Line: 2053 ]]
			-- upvalues: StartLayoutEffectTimerFunction (upval), commitHookEffectListUnmount (upval), Layout (upval), HasEffect (upval), Child (copy)
			StartLayoutEffectTimerFunction()
			commitHookEffectListUnmount(bit32.bor(Layout, HasEffect), Child, Child.return_)
		end, DescribeError)
		RecordLayoutEffectDurationFunction(Child)
		
		if not Success then
			error(Result)
			
			return
		end
	else
		commitHookEffectListUnmount(bit32.bor(Layout, HasEffect), Child, Child.return_)
	end
end

function commitSuspenseComponent(p11) --[[ Line: 2179 ]]
	-- upvalues: ReactFiberWorkLoopNewModule (ref), SupportsMutation (copy), hideOrUnhideAllChildren (copy), EnableSuspenseCallback (copy), DEV (copy), Console (copy)
	local MemoizedState = p11.memoizedState
	
	if MemoizedState ~= nil then
		if not ReactFiberWorkLoopNewModule then
			ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
		end
		ReactFiberWorkLoopNewModule.markCommitTimeOfFallback()
		
		if SupportsMutation then
			hideOrUnhideAllChildren(p11.child, true)
		end
	end
	if EnableSuspenseCallback and MemoizedState ~= nil then
		local SuspenseCallbackFunction: (any) -> () = p11.memoizedProps.suspenseCallback
		
		if typeof(SuspenseCallbackFunction) == "function" then
			local UpdateQueue = p11.updateQueue
			
			if UpdateQueue ~= nil then
				SuspenseCallbackFunction(table.clone(UpdateQueue))
				
				return
			end
		elseif DEV and SuspenseCallbackFunction ~= nil then
			Console.error("Unexpected type for suspenseCallback: %s", (tostring(SuspenseCallbackFunction)))
		end
	end
end

function commitSuspenseHydrationCallbacks(p11, p12) --[[ Line: 2218 ]]
	-- upvalues: SupportsHydration (copy), CommitHydratedSuspenseInstanceFunction (copy), EnableSuspenseCallback (copy)
	if not SupportsHydration then return end
	if p12.memoizedState == nil then
		local Alternate = p12.alternate
		
		if Alternate ~= nil then
			local MemoizedState = Alternate.memoizedState
			
			if MemoizedState ~= nil then
				local Dehydrated = MemoizedState.dehydrated
				
				if Dehydrated ~= nil then
					CommitHydratedSuspenseInstanceFunction(Dehydrated)
					
					if EnableSuspenseCallback then
						local HydrationCallbacks = p11.hydrationCallbacks
						
						if HydrationCallbacks ~= nil then
							local OnHydratedFunction: (any) -> () = HydrationCallbacks.onHydrated
							
							if OnHydratedFunction then
								OnHydratedFunction(Dehydrated)
							end
						end
					end
				end
			end
		end
	end
end

function attachSuspenseRetryListeners(p11) --[[ Line: 2246 ]]
	-- upvalues: Set (copy), resolveRetryWakeable (copy), EnableSchedulerTracing (copy), UnstableWrapFunction (copy)
	local UpdateQueue = p11.updateQueue
	
	if UpdateQueue ~= nil then
		p11.updateQueue = nil
		local StateNode = p11.stateNode
		
		if StateNode == nil then
			p11.stateNode = Set.new()
			StateNode = p11.stateNode
		end
		for Promise, _ in UpdateQueue do
			local function v238() --[[ Line: 2260 ]]
				-- upvalues: resolveRetryWakeable (upval), p11 (copy), Promise (copy)
				return resolveRetryWakeable(p11, Promise)
			end
			
			if not StateNode:has(Promise) then
				if EnableSchedulerTracing and Promise.__reactDoNotTraceInteractions ~= true then
					v238 = UnstableWrapFunction(v238)
				end
				StateNode:add(Promise)
				Promise:andThen(function() --[[ Line: 2271 ]]
					-- upvalues: v238 (ref)
					return v238()
				end, function() --[[ Line: 2273 ]]
					-- upvalues: v238 (ref)
					return v238()
				end)
			end
		end
	end
end

function isSuspenseBoundaryBeingHidden(p12, p13): boolean --[[ Line: 2284 ]]
	if p12 ~= nil then
		local MemoizedState = p12.memoizedState
		
		if MemoizedState == nil or MemoizedState.dehydrated ~= nil then
			local MemoizedState1 = p13.memoizedState
			
			return MemoizedState1 ~= nil and MemoizedState1.dehydrated == nil
		end
	end
	return false
end

function commitResetTextContent(p12) --[[ Line: 2296 ]]
	-- upvalues: SupportsMutation (copy), ResetTextContentFunction (copy)
	if SupportsMutation then
		ResetTextContentFunction(p12.stateNode)
		
		return
	end
end

local function commitPassiveUnmount(p12) --[[ Line: 2303 ]]
	-- upvalues: FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartPassiveEffectTimerFunction (copy), commitHookEffectListUnmount (copy), Passive (copy), HasEffect (copy), RecordPassiveEffectDurationFunction (copy)
	if p12.tag == FunctionComponent or p12.tag == ForwardRef or p12.tag == SimpleMemoComponent or p12.tag == Block then
		if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(p12.mode, ProfileMode) ~= 0 then
			StartPassiveEffectTimerFunction()
			commitHookEffectListUnmount(bit32.bor(Passive, HasEffect), p12, p12.return_)
			RecordPassiveEffectDurationFunction(p12)
			
			return
		else
			commitHookEffectListUnmount(bit32.bor(Passive, HasEffect), p12, p12.return_)
		end
	end
end

local function commitPassiveUnmountInsideDeletedTree(p12, p13) --[[ Line: 2332 ]]
	-- upvalues: FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartPassiveEffectTimerFunction (copy), commitHookEffectListUnmount (copy), Passive (copy), RecordPassiveEffectDurationFunction (copy)
	if p12.tag == FunctionComponent or p12.tag == ForwardRef or p12.tag == SimpleMemoComponent or p12.tag == Block then
		if EnableProfilerTimer and EnableProfilerCommitHooks and bit32.band(p12.mode, ProfileMode) ~= 0 then
			StartPassiveEffectTimerFunction()
			commitHookEffectListUnmount(Passive, p12, p13)
			RecordPassiveEffectDurationFunction(p12)
			
			return
		else
			commitHookEffectListUnmount(Passive, p12, p13)
		end
	end
end

local function commitPassiveMount(p12, p13) --[[ Line: 2356 ]]
	-- upvalues: FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), ProfileMode (copy), StartPassiveEffectTimerFunction (copy), commitHookEffectListMount (copy), DescribeError (copy), Passive (copy), HasEffect (copy), RecordPassiveEffectDurationFunction (copy), Profiler (copy)
	if p13.tag == FunctionComponent or p13.tag == ForwardRef or p13.tag == SimpleMemoComponent or p13.tag == Block then
		if not EnableProfilerTimer or not EnableProfilerCommitHooks or bit32.band(p13.mode, ProfileMode) == 0 then
			commitHookEffectListMount(bit32.bor(Passive, HasEffect), p13)
			
			return
		end
		StartPassiveEffectTimerFunction()
		local Success, Result = xpcall(commitHookEffectListMount, DescribeError, bit32.bor(Passive, HasEffect), p13)
		RecordPassiveEffectDurationFunction(p13)
		
		if not Success then
			error(Result)
			
			return
		end
	elseif p13.tag == Profiler then
		commitProfilerPassiveEffect(p12, p13)
	end
end

function invokeLayoutEffectMountInDEV(p12) --[[ Line: 2389 ]]
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), InvokeGuardedCallbackFunction (copy), commitHookEffectListMount (copy), Layout (copy), HasEffect (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), captureCommitPhaseError (ref), ClassComponent (copy)
	if DEV and EnableDoubleInvokingEffects then
		if p12.tag == FunctionComponent or p12.tag == ForwardRef or p12.tag == SimpleMemoComponent or p12.tag == Block then
			InvokeGuardedCallbackFunction(nil, commitHookEffectListMount, nil, bit32.bor(Layout, HasEffect), p12)
			
			if HasCaughtErrorFunction() then
				captureCommitPhaseError(p12, p12.return_, (ClearCaughtErrorFunction()))
			end
			return
		end
	elseif p12.tag == ClassComponent then
		local StateNode = p12.stateNode
		InvokeGuardedCallbackFunction(nil, StateNode.componentDidMount, StateNode)
		
		if HasCaughtErrorFunction() then
			captureCommitPhaseError(p12, p12.return_, (ClearCaughtErrorFunction()))
		end
		return
	end
end

function invokePassiveEffectMountInDEV(p12) --[[ Line: 2421 ]]
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), InvokeGuardedCallbackFunction (copy), commitHookEffectListMount (copy), Passive (copy), HasEffect (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), captureCommitPhaseError (ref)
	if not DEV or not EnableDoubleInvokingEffects or p12.tag ~= FunctionComponent and p12.tag ~= ForwardRef and p12.tag ~= SimpleMemoComponent and p12.tag ~= Block then return end
	InvokeGuardedCallbackFunction(nil, commitHookEffectListMount, nil, bit32.bor(Passive, HasEffect), p12)
	
	if HasCaughtErrorFunction() then
		captureCommitPhaseError(p12, p12.return_, (ClearCaughtErrorFunction()))
	end
end

function invokeLayoutEffectUnmountInDEV(p12) --[[ Line: 2445 ]]
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), InvokeGuardedCallbackFunction (copy), commitHookEffectListUnmount (copy), Layout (copy), HasEffect (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), captureCommitPhaseError (ref), ClassComponent (copy)
	if DEV and EnableDoubleInvokingEffects then
		if p12.tag == FunctionComponent or p12.tag == ForwardRef or p12.tag == SimpleMemoComponent or p12.tag == Block then
			InvokeGuardedCallbackFunction(nil, commitHookEffectListUnmount, nil, bit32.bor(Layout, HasEffect), p12, p12.return_)
			
			if HasCaughtErrorFunction() then
				captureCommitPhaseError(p12, p12.return_, (ClearCaughtErrorFunction()))
			end
			return
		end
	elseif p12.tag == ClassComponent then
		local StateNode = p12.stateNode
		
		if typeof(StateNode.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(p12, StateNode, p12.return_)
		end
		return
	end
end

function invokePassiveEffectUnmountInDEV(p12) --[[ Line: 2476 ]]
	-- upvalues: DEV (copy), EnableDoubleInvokingEffects (copy), FunctionComponent (copy), ForwardRef (copy), SimpleMemoComponent (copy), Block (copy), InvokeGuardedCallbackFunction (copy), commitHookEffectListUnmount (copy), Passive (copy), HasEffect (copy), HasCaughtErrorFunction (copy), ClearCaughtErrorFunction (copy), captureCommitPhaseError (ref)
	if not DEV or not EnableDoubleInvokingEffects or p12.tag ~= FunctionComponent and p12.tag ~= ForwardRef and p12.tag ~= SimpleMemoComponent and p12.tag ~= Block then return end
	InvokeGuardedCallbackFunction(nil, commitHookEffectListUnmount, nil, bit32.bor(Passive, HasEffect), p12, p12.return_)
	
	if HasCaughtErrorFunction() then
		captureCommitPhaseError(p12, p12.return_, (ClearCaughtErrorFunction()))
	end
end

return {
	safelyCallDestroy = safelyCallDestroy,
	commitBeforeMutationLifeCycles = commitBeforeMutationLifeCycles,
	commitResetTextContent = commitResetTextContent,
	commitPlacement = commitPlacement,
	commitDeletion = commitDeletion,
	commitWork = commitWork,
	commitAttachRef = commitAttachRef,
	commitDetachRef = commitDetachRef,
	commitPassiveUnmount = commitPassiveUnmount,
	commitPassiveUnmountInsideDeletedTree = commitPassiveUnmountInsideDeletedTree,
	commitPassiveMount = commitPassiveMount,
	invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV,
	invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV,
	invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV,
	invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV,
	isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden,
	recursivelyCommitLayoutEffects = recursivelyCommitLayoutEffects
}