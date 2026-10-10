local function unimplemented(p1)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p1))
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local var1 = 0

local function _(p1)
	if typeof(p1) == "function" then
		return true
	elseif typeof(p1) == "table" then
		local var2 = getmetatable(p1)
		
		return if var2 and rawget(var2, "__call") then true else p1._isMockFunction
	end
end

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local luauPolyfillModule = require(parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local set = luauPolyfillModule.Set
local dEV = reactGlobalsModule.__DEV__
local yOLO = reactGlobalsModule.__YOLO__
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local unknownModule = require(script.Parent["ReactUpdateQueue.new"])
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local reactHookEffectTagsModule = require(script.Parent.ReactHookEffectTags)
local unstableWrap = require(parent.Scheduler).tracing.unstable_wrap
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableSchedulerTracing = reactFeatureFlags.enableSchedulerTracing
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = reactFeatureFlags.enableProfilerCommitHooks
local enableSuspenseCallback = reactFeatureFlags.enableSuspenseCallback
local enableDoubleInvokingEffects = reactFeatureFlags.enableDoubleInvokingEffects
local enableNewTreeCleanupPath = reactFeatureFlags.enableNewTreeCleanupPath
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local functionComponent = reactWorkTagsModule.FunctionComponent
local forwardRef = reactWorkTagsModule.ForwardRef
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local hostComponent = reactWorkTagsModule.HostComponent
local hostText = reactWorkTagsModule.HostText
local hostPortal = reactWorkTagsModule.HostPortal
local profiler = reactWorkTagsModule.Profiler
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local dehydratedFragment = reactWorkTagsModule.DehydratedFragment
local incompleteClassComponent = reactWorkTagsModule.IncompleteClassComponent
local memoComponent = reactWorkTagsModule.MemoComponent
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local fundamentalComponent = reactWorkTagsModule.FundamentalComponent
local scopeComponent = reactWorkTagsModule.ScopeComponent
local block = reactWorkTagsModule.Block
local offscreenComponent = reactWorkTagsModule.OffscreenComponent
local legacyHiddenComponent = reactWorkTagsModule.LegacyHiddenComponent
local reactErrorUtils = require(parent.Shared).ReactErrorUtils
local invokeGuardedCallback = reactErrorUtils.invokeGuardedCallback
local hasCaughtError = reactErrorUtils.hasCaughtError
local clearCaughtError = reactErrorUtils.clearCaughtError
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local noFlags = reactFiberFlagsModule.NoFlags
local contentReset = reactFiberFlagsModule.ContentReset
local placement = reactFiberFlagsModule.Placement
local snapshot = reactFiberFlagsModule.Snapshot
local update = reactFiberFlagsModule.Update
local callback = reactFiberFlagsModule.Callback
local layoutMask = reactFiberFlagsModule.LayoutMask
local passiveMask = reactFiberFlagsModule.PassiveMask
local ref = reactFiberFlagsModule.Ref
local getComponentName = require(parent.Shared).getComponentName
local invariant = require(parent.Shared).invariant
local describeError = require(parent.Shared).describeError
local reactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local current = reactCurrentFiberModule.current
local resetCurrentFiber = reactCurrentFiberModule.resetCurrentFiber
local setCurrentFiber = reactCurrentFiberModule.setCurrentFiber
local onCommitUnmount = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount
local resolveDefaultProps = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local unknownModule_1 = require(script.Parent["ReactProfilerTimer.new"])
local startLayoutEffectTimer = unknownModule_1.startLayoutEffectTimer
local recordPassiveEffectDuration = unknownModule_1.recordPassiveEffectDuration
local recordLayoutEffectDuration = unknownModule_1.recordLayoutEffectDuration
local startPassiveEffectTimer = unknownModule_1.startPassiveEffectTimer
local getCommitTime = unknownModule_1.getCommitTime
local profileMode = require(script.Parent.ReactTypeOfMode).ProfileMode
local commitUpdateQueue = unknownModule.commitUpdateQueue
local getPublicInstance = reactFiberHostConfigModule.getPublicInstance
local supportsMutation = reactFiberHostConfigModule.supportsMutation
local var2 = reactFeatureFlags.enableSkipHostSiblingLookup and reactFiberHostConfigModule.supportsChildOrdering == false
local supportsPersistence = reactFiberHostConfigModule.supportsPersistence
local supportsHydration = reactFiberHostConfigModule.supportsHydration
local commitMount = reactFiberHostConfigModule.commitMount
local commitUpdate = reactFiberHostConfigModule.commitUpdate
local resetTextContent = reactFiberHostConfigModule.resetTextContent
local commitTextUpdate = reactFiberHostConfigModule.commitTextUpdate
local appendChild = reactFiberHostConfigModule.appendChild
local appendChildToContainer = reactFiberHostConfigModule.appendChildToContainer
local insertBefore = reactFiberHostConfigModule.insertBefore
local insertInContainerBefore = reactFiberHostConfigModule.insertInContainerBefore
local removeChild = reactFiberHostConfigModule.removeChild
local removeChildFromContainer = reactFiberHostConfigModule.removeChildFromContainer
local hideInstance = reactFiberHostConfigModule.hideInstance
local hideTextInstance = reactFiberHostConfigModule.hideTextInstance
local unhideInstance = reactFiberHostConfigModule.unhideInstance
local unhideTextInstance = reactFiberHostConfigModule.unhideTextInstance
local commitHydratedSuspenseInstance = reactFiberHostConfigModule.commitHydratedSuspenseInstance
local clearContainer = reactFiberHostConfigModule.clearContainer
local var3 = nil

local function resolveRetryWakeable(p1, p2)
	-- upvalues: var3 (write)
	if not var3 then
		var3 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var3.resolveRetryWakeable(p1, p2)
end

local _ = function()
	-- upvalues: var3 (write)
	if not var3 then
		var3 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var3.markCommitTimeOfFallback()
end

local function schedulePassiveEffectCallback()
	-- upvalues: console (ref)
	console.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end

local function captureCommitPhaseError(_, _, p1)
	-- upvalues: console (ref)
	console.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
	error(p1)
end

local noFlags_1 = reactHookEffectTagsModule.NoFlags
local hasEffect = reactHookEffectTagsModule.HasEffect
local layout = reactHookEffectTagsModule.Layout
local passive = reactHookEffectTagsModule.Passive
local var4 = nil

local var5 = function()
	-- upvalues: var4 (write)
	if not var4 then
		var4 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps
	end
	return var4
end

local isHostParent = nil
local _ = nil
local insertOrAppendPlacementNode = nil
local insertOrAppendPlacementNodeIntoContainer = nil
local commitLayoutEffectsForHostRoot = nil
local commitLayoutEffectsForHostComponent = nil
local commitLayoutEffectsForClassComponent = nil
local unmountHostComponents = nil
local _ = nil
local _ = nil
local var6 = nil

local function callComponentWillUnmountWithTimer(p1, p2)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), recordLayoutEffectDuration (ref)
	p2.props = p1.memoizedProps
	p2.state = p1.memoizedState
	
	if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p1.mode, profileMode) ~= 0 then
		local ok, status = xpcall(function()
			-- upvalues: startLayoutEffectTimer (copy), p2 (ref)
			startLayoutEffectTimer()
			p2:componentWillUnmount()
		end, describeError)
		recordLayoutEffectDuration(p1)
		
		if ok then
			return
		else
			error(status)
			
			return
		end
	else
		p2:componentWillUnmount()
	end
end

function safelyCallComponentWillUnmount(p1, p2, p3)
	-- upvalues: callComponentWillUnmountWithTimer (ref), describeError (ref), captureCommitPhaseError (write)
	local ok, status = xpcall(callComponentWillUnmountWithTimer, describeError, p1, p2)
	
	if not ok then
		captureCommitPhaseError(p1, p3, status)
	end
end

local _ = function(p1, p2)
	-- upvalues: describeError (ref), captureCommitPhaseError (write)
	local ref = p1.ref
	
	if ref ~= nil then
		if typeof(ref) == "function" then
			local ok, status = xpcall(ref, describeError)
			
			if ok then
				return
			else
				captureCommitPhaseError(p1, p2, status)
				
				return
			end
		else
			ref.current = nil
		end
	end
end

local function safelyCallDestroy(p1, p2, p3)
	-- upvalues: describeError (ref), captureCommitPhaseError (write)
	local ok, status = xpcall(p3, describeError)
	
	if not ok then
		captureCommitPhaseError(p1, p2, status)
	end
end

local function commitBeforeMutationLifeCycles(p1, p2)
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), classComponent (ref), snapshot (ref), dEV (ref), var5 (ref), console (ref), getComponentName (ref), resolveDefaultProps (ref), hostRoot (ref), supportsMutation (ref), clearContainer (ref), hostComponent (ref), hostText (ref), hostPortal (ref), incompleteClassComponent (ref), invariant (ref)
	if p2.tag == functionComponent or p2.tag == forwardRef or (p2.tag == simpleMemoComponent or p2.tag == block) then return end
	if p2.tag == classComponent then
		if bit32.band(p2.flags, snapshot) ~= 0 and p1 ~= nil then
			local memoizedProps = p1.memoizedProps
			local memoizedState = p1.memoizedState
			local stateNode = p2.stateNode
			
			if dEV and p2.type == p2.elementType and not var5 then
				if stateNode.props ~= p2.memoizedProps then
					console.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p2.type) or "instance")
				end
				if stateNode.state ~= p2.memoizedState then
					console.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p2.type) or "instance")
				end
			end
			stateNode.__reactInternalSnapshotBeforeUpdate = stateNode:getSnapshotBeforeUpdate(if p2.elementType == p2.type then memoizedProps else resolveDefaultProps(p2.type, memoizedProps), memoizedState)
		end
		return
	elseif p2.tag == hostRoot then
		if supportsMutation and bit32.band(p2.flags, snapshot) ~= 0 then
			clearContainer(p2.stateNode.containerInfo)
		end
		return
	elseif p2.tag == hostComponent or p2.tag == hostText or (p2.tag == hostPortal or p2.tag == incompleteClassComponent) then
		return
	end
	invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
end

local function commitHookEffectListUnmount(p1, p2, p3)
	-- upvalues: reactFeatureFlags (ref), describeError (ref), captureCommitPhaseError (write)
	local updateQueue = p2.updateQueue
	local var7 = if updateQueue ~= nil then updateQueue.lastEffect else nil
	
	if var7 ~= nil then
		local next = var7.next
		local var8 = next
		repeat
			if bit32.band(var8.tag, p1) ~= p1 then
				var8 = var8.next
				continue
			end
			local destroy = var8.destroy
			
			if not reactFeatureFlags.enableWorkLoopTrims then
				var8.destroy = nil
			elseif destroy ~= nil then
				var8.destroy = nil
			end
			if destroy ~= nil then
				local ok, status = xpcall(destroy, describeError)
				
				if not ok then
					captureCommitPhaseError(p2, p3, status)
				end
			end
		until var8 == next
	end
end

local function commitHookEffectListMount(p1, p2)
	-- upvalues: reactFeatureFlags (ref), dEV (ref), console (ref)
	local updateQueue = p2.updateQueue
	local var7 = if updateQueue ~= nil then nil else updateQueue.lastEffect
	
	if var7 ~= nil then
		local next = var7.next
		local var8 = next
		repeat
			if bit32.band(var8.tag, p1) ~= p1 then
				var8 = var8.next
				continue
			end
			local var9
			local create = var8.create
			
			if reactFeatureFlags.enableWorkLoopTrims then
				var9 = create()
				
				if var9 ~= nil or var8.destroy ~= nil then
					var8.destroy = var9
				end
			else
				var8.destroy = create()
			end
			if dEV then
				var9 = var8.destroy
				
				if var9 ~= nil and typeof(var9) ~= "function" then
					console.error("An effect function must not return anything besides a function, which is used for clean-up.%s", if var9 == nil then " You returned nil. If your effect does not require clean up, return nil (or nothing)." elseif typeof(var9.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. var48)
				end
			end
		until var8 == next
	end
end

function commitProfilerPassiveEffect(startValue, endValue)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profiler (ref), getCommitTime (ref), enableSchedulerTracing (ref)
	if enableProfilerTimer and enableProfilerCommitHooks and endValue.tag == profiler then
		local passiveEffectDuration = endValue.stateNode.passiveEffectDuration
		local id = endValue.memoizedProps.id
		local onPostCommit = endValue.memoizedProps.onPostCommit
		local var7 = getCommitTime()
		
		if typeof(onPostCommit) == "function" then
			if enableSchedulerTracing then
				onPostCommit(id, if endValue.alternate == nil then "mount" else "update", passiveEffectDuration, var7, startValue.memoizedInteractions)
				
				return
			end
			onPostCommit(id, if endValue.alternate == nil then "mount" else "update", passiveEffectDuration, var7)
		end
	end
end

local function recursivelyCommitLayoutEffects(p1, p2, p3, p4)
	-- upvalues: captureCommitPhaseError (write), schedulePassiveEffectCallback (write), profiler (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var6 (write), reactFeatureFlags (ref), layoutMask (ref), noFlags (ref), dEV (ref), current (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), recursivelyCommitLayoutEffects (ref), hasCaughtError (ref), clearCaughtError (ref), resetCurrentFiber (ref), describeError (ref), update (ref), callback (ref), reactCurrentFiberModule (ref), var1 (write), yOLO (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), profileMode (ref), startLayoutEffectTimer (ref), commitHookEffectListMount (ref), layout (ref), hasEffect (ref), recordLayoutEffectDuration (ref), passiveMask (ref), classComponent (ref), commitLayoutEffectsForClassComponent (write), hostRoot (ref), commitLayoutEffectsForHostRoot (write), hostComponent (ref), commitLayoutEffectsForHostComponent (write), suspenseComponent (ref), fundamentalComponent (ref), hostPortal (ref), hostText (ref), incompleteClassComponent (ref), legacyHiddenComponent (ref), offscreenComponent (ref), scopeComponent (ref), suspenseListComponent (ref), invariant (ref), ref (ref)
	if p3 ~= nil then
		captureCommitPhaseError = p3
	end
	if p4 ~= nil then
		schedulePassiveEffectCallback = p4
	end
	local ok, var7
	local flags = p1.flags
	local tag = p1.tag
	
	if tag == profiler then
		local var8 = nil
		
		if enableProfilerTimer and enableProfilerCommitHooks then
			var8 = var6
			var6 = p1
		end
		if reactFeatureFlags.enableCommitTraversalTrims then
			ok = if bit32.band(p1.subtreeFlags, layoutMask) ~= noFlags then nil else p1.child
			while ok ~= nil do
				if bit32.band(bit32.bor(ok.flags, ok.subtreeFlags), layoutMask) ~= noFlags or ok.tag == profiler then
					if dEV then
						local var9 = current
						setCurrentFiber(ok)
						invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, ok, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if hasCaughtError() then
							captureCommitPhaseError(ok, p1, clearCaughtError())
						end
						if var9 == nil then
							resetCurrentFiber()
						else
							setCurrentFiber(var9)
						end
					else
						local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, ok, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if not ok then
							captureCommitPhaseError(ok, p1, status)
						end
					end
				end
				ok = ok.sibling
			end
		else
			ok = p1.child
			while ok ~= nil do
				if bit32.band(p1.subtreeFlags, layoutMask) ~= noFlags then
					if dEV then
						local var10 = current
						setCurrentFiber(ok)
						invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, ok, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if hasCaughtError() then
							captureCommitPhaseError(ok, p1, clearCaughtError())
						end
						if var10 == nil then
							resetCurrentFiber()
						else
							setCurrentFiber(var10)
						end
					else
						local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, ok, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
						
						if not ok then
							captureCommitPhaseError(ok, p1, status)
						end
					end
				end
				ok = ok.sibling
			end
		end
		if bit32.band(flags, bit32.bor(update, callback)) ~= noFlags and enableProfilerTimer then
			if dEV then
				local var11 = current
				setCurrentFiber(p1)
				invokeGuardedCallback(nil, commitLayoutEffectsForProfiler, nil, p1, p2)
				
				if hasCaughtError() then
					captureCommitPhaseError(p1, p1.return_, clearCaughtError())
				end
				if var11 == nil then
					resetCurrentFiber()
				else
					setCurrentFiber(var11)
				end
			else
				local ok, status = xpcall(commitLayoutEffectsForProfiler, describeError, p1, p2)
				
				if not ok then
					captureCommitPhaseError(p1, p1.return_, status)
				end
			end
		end
		if not enableProfilerTimer or not enableProfilerCommitHooks then return end
		if var8 ~= nil then
			var8.stateNode.effectDuration += p1.stateNode.effectDuration
		end
		var6 = var8
		
		return
	elseif reactFeatureFlags.enableCommitTraversalTrims then
		var7 = if bit32.band(p1.subtreeFlags, layoutMask) ~= noFlags then nil else p1.child
		while var7 ~= nil do
			if bit32.band(bit32.bor(var7.flags, var7.subtreeFlags), layoutMask) == noFlags and var7.tag ~= profiler then
				var7 = var7.sibling
				continue
			end
			if dEV then
				ok = reactCurrentFiberModule.current
				setCurrentFiber(var7)
				
				if var1 < 20 then
					var1 += 1
					invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
					var1 -= 1
					
					if hasCaughtError() then
						captureCommitPhaseError(var7, p1, clearCaughtError())
					end
				else
					recursivelyCommitLayoutEffects(var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
				end
				if ok == nil then
					resetCurrentFiber()
				else
					setCurrentFiber(ok)
				end
			else
				ok = nil
				local var12 = nil
				
				if yOLO or var1 >= 20 then
					ok = true
					recursivelyCommitLayoutEffects(var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
				else
					var1 += 1
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
					ok = ok
					var12 = status
					var1 -= 1
				end
				if not ok then
					captureCommitPhaseError(var7, p1, var12)
				end
			end
		end
	else
		var7 = p1.child
		while var7 ~= nil do
			if bit32.band(p1.subtreeFlags, layoutMask) == noFlags then
				var7 = var7.sibling
				continue
			end
			if dEV then
				local current_1 = reactCurrentFiberModule.current
				setCurrentFiber(var7)
				
				if var1 < 20 then
					var1 += 1
					invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
					var1 -= 1
					
					if hasCaughtError() then
						captureCommitPhaseError(var7, p1, clearCaughtError())
					end
				else
					recursivelyCommitLayoutEffects(var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
				end
				if current_1 == nil then
					resetCurrentFiber()
				else
					setCurrentFiber(current_1)
				end
			else
				local var13
				local _ = nil
				local var14 = nil
				
				if yOLO or var1 >= 20 then
					var13 = true
					recursivelyCommitLayoutEffects(var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
				else
					var1 += 1
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, var7, p2, captureCommitPhaseError, schedulePassiveEffectCallback)
					var13 = ok
					var14 = status
					var1 -= 1
				end
				if not var13 then
					captureCommitPhaseError(var7, p1, var14)
				end
			end
		end
	end
	if bit32.band(flags, bit32.bor(update, callback)) ~= noFlags then
		if tag == functionComponent or tag == forwardRef or (tag == simpleMemoComponent or tag == block) then
			if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p1.mode, profileMode) ~= 0 then
				ok, status = xpcall(function()
					-- upvalues: startLayoutEffectTimer (copy), commitHookEffectListMount (copy), layout (copy), hasEffect (copy), p1 (ref)
					startLayoutEffectTimer()
					commitHookEffectListMount(bit32.bor(layout, hasEffect), p1)
				end, describeError)
				recordLayoutEffectDuration(p1)
				
				if not ok then
					error(status)
				end
			else
				commitHookEffectListMount(bit32.bor(layout, hasEffect), p1)
			end
			if bit32.band(p1.subtreeFlags, passiveMask) ~= noFlags then
				schedulePassiveEffectCallback()
			end
		elseif tag == classComponent then
			commitLayoutEffectsForClassComponent(p1)
		elseif tag == hostRoot then
			commitLayoutEffectsForHostRoot(p1)
		elseif tag == hostComponent then
			commitLayoutEffectsForHostComponent(p1)
		elseif tag == suspenseComponent then
			commitSuspenseHydrationCallbacks(p2, p1)
		elseif tag ~= fundamentalComponent and tag ~= hostPortal and (tag ~= hostText and tag ~= incompleteClassComponent) and (tag ~= legacyHiddenComponent and tag ~= offscreenComponent and (tag ~= scopeComponent and tag ~= suspenseListComponent)) then
			invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
		end
	end
	if bit32.band(flags, ref) ~= 0 then
		commitAttachRef(p1)
	end
end

function commitLayoutEffectsForProfiler(p5, p6)
	-- upvalues: enableProfilerTimer (ref), getCommitTime (ref), update (ref), callback (ref), noFlags (ref), enableSchedulerTracing (ref), enableProfilerCommitHooks (ref)
	if enableProfilerTimer then
		local var15
		local flags = p5.flags
		local alternate = p5.alternate
		local onCommit = p5.memoizedProps.onCommit
		local onRender = p5.memoizedProps.onRender
		local effectDuration = p5.stateNode.effectDuration
		local var16 = getCommitTime()
		local var17 = callback
		
		if bit32.band(flags, update) ~= noFlags then
			local var18
			if typeof(onRender) == "function" then
				var18 = true
			elseif typeof(onRender) == "table" then
				var15 = getmetatable(onRender)
				var18 = if var15 and rawget(var15, "__call") then true elseif onRender._isMockFunction then true else false
			end
			if var18 then
				if enableSchedulerTracing then
					onRender(p5.memoizedProps.id, if alternate == nil then "mount" else "update", p5.actualDuration, p5.treeBaseDuration, p5.actualStartTime, var16, p6.memoizedInteractions)
				else
					onRender(p5.memoizedProps.id, if alternate == nil then "mount" else "update", p5.actualDuration, p5.treeBaseDuration, p5.actualStartTime, var16)
				end
			end
		end
		if enableProfilerCommitHooks and bit32.band(flags, var17) ~= noFlags then
			local var19
			if typeof(onCommit) == "function" then
				var19 = true
			elseif typeof(onCommit) == "table" then
				var15 = getmetatable(onCommit)
				var19 = if var15 and rawget(var15, "__call") then true elseif onCommit._isMockFunction then true else false
			end
			if var19 then
				if enableSchedulerTracing then
					onCommit(p5.memoizedProps.id, if alternate == nil then "mount" else "update", effectDuration, var16, p6.memoizedInteractions)
					
					return
				end
				onCommit(p5.memoizedProps.id, if alternate == nil then "mount" else "update", effectDuration, var16)
			end
		end
	end
end

commitLayoutEffectsForClassComponent = function(p5)
	-- upvalues: update (ref), dEV (ref), var5 (ref), console (ref), getComponentName (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), recordLayoutEffectDuration (ref), resolveDefaultProps (ref), commitUpdateQueue (ref)
	local stateNode = p5.stateNode
	local alternate = p5.alternate
	
	if bit32.band(p5.flags, update) ~= 0 then
		if alternate == nil then
			if dEV and p5.type == p5.elementType and not var5 then
				if stateNode.props ~= p5.memoizedProps then
					console.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p5.type) or "instance")
				end
				if stateNode.state ~= p5.memoizedState then
					console.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p5.type) or "instance")
				end
			end
			if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p5.mode, profileMode) ~= 0 then
				local ok, status = xpcall(function()
					-- upvalues: startLayoutEffectTimer (copy), stateNode (ref)
					startLayoutEffectTimer()
					stateNode:componentDidMount()
				end, describeError)
				recordLayoutEffectDuration(p5)
				
				if not ok then
					error(status)
				end
			else
				stateNode:componentDidMount()
			end
		else
			local var15 = if p5.elementType == p5.type then alternate.memoizedProps else resolveDefaultProps(p5.type, alternate.memoizedProps)
			local memoizedState = alternate.memoizedState
			
			if dEV and p5.type == p5.elementType and not var5 then
				if stateNode.props ~= p5.memoizedProps then
					console.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p5.type) or "instance")
				end
				if stateNode.state ~= p5.memoizedState then
					console.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p5.type) or "instance")
				end
			end
			if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p5.mode, profileMode) ~= 0 then
				local ok, status = xpcall(function()
					-- upvalues: startLayoutEffectTimer (copy), stateNode (ref), var15 (ref), memoizedState (ref)
					startLayoutEffectTimer()
					stateNode:componentDidUpdate(var15, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
				end, describeError)
				recordLayoutEffectDuration(p5)
				
				if not ok then
					error(status)
				end
			else
				stateNode:componentDidUpdate(var15, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
			end
		end
	end
	local updateQueue = p5.updateQueue
	
	if updateQueue ~= nil then
		if dEV and p5.type == p5.elementType and not var5 then
			if stateNode.props ~= p5.memoizedProps then
				console.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p5.type) or "instance")
			end
			if stateNode.state ~= p5.memoizedState then
				console.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p5.type) or "instance")
			end
		end
		commitUpdateQueue(p5, updateQueue, stateNode)
	end
end

commitLayoutEffectsForHostRoot = function(p5)
	-- upvalues: hostComponent (ref), getPublicInstance (ref), classComponent (ref), commitUpdateQueue (ref)
	local updateQueue = p5.updateQueue
	
	if updateQueue ~= nil then
		local stateNode = nil
		
		if p5.child ~= nil then
			local child = p5.child
			
			if child.tag == hostComponent then
				stateNode = getPublicInstance(child.stateNode)
			elseif child.tag == classComponent then
				stateNode = child.stateNode
			end
		end
		commitUpdateQueue(p5, updateQueue, stateNode)
	end
end

commitLayoutEffectsForHostComponent = function(p5)
	-- upvalues: update (ref), commitMount (ref)
	local stateNode = p5.stateNode
	
	if p5.alternate == nil and bit32.band(p5.flags, update) ~= 0 then
		commitMount(stateNode, p5.type, p5.memoizedProps, p5)
	end
end

local function hideOrUnhideAllChildren(p5, p6)
	-- upvalues: supportsMutation (ref), hostComponent (ref), hideInstance (ref), unhideInstance (ref), hostText (ref), hideTextInstance (ref), unhideTextInstance (ref), offscreenComponent (ref), legacyHiddenComponent (ref)
	if supportsMutation then
		local var15 = p5
		while true do
			if var15.tag == hostComponent then
				local stateNode = var15.stateNode
				
				if p6 then
					hideInstance(stateNode)
				else
					unhideInstance(var15.stateNode, var15.memoizedProps)
				end
			elseif var15.tag == hostText then
				local stateNode = var15.stateNode
				
				if p6 then
					hideTextInstance(stateNode)
				else
					unhideTextInstance(stateNode, var15.memoizedProps)
				end
			elseif (var15.tag == offscreenComponent or var15.tag == legacyHiddenComponent) and (var15.memoizedState ~= nil and var15 ~= p5) or var15.child == nil then
				if var15 ~= p5 then
					while var15.sibling == nil do
						if var15.return_ ~= nil and var15.return_ ~= p5 then
							var15 = var15.return_
							continue
						end
						return
					end
					var15.sibling.return_ = var15.return_
					var15 = var15.sibling
				end
				return
			else
				var15.child.return_ = var15
				var15 = var15.child
			end
		end
	end
end

function commitAttachRef(p7)
	-- upvalues: hostComponent (ref), getPublicInstance (ref), dEV (ref), console (ref), getComponentName (ref)
	local ref = p7.ref
	
	if ref ~= nil then
		local stateNode = p7.stateNode
		local var16 = if p7.tag == hostComponent then getPublicInstance(stateNode) else stateNode
		
		if typeof(ref) == "function" then
			ref(var16)
			
			return
		elseif dEV and typeof(ref) ~= "table" then
			console.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", getComponentName(p7.type) or "instance")
			
			return
		end
		ref.current = var16
	end
end

function commitDetachRef(p7)
	local ref = p7.ref
	
	if ref ~= nil then
		if typeof(ref) == "function" then
			ref(nil)
			
			return
		end
		ref.current = nil
	end
end

local function commitUnmount(p7, p8, p9, p10)
	-- upvalues: onCommitUnmount (ref), functionComponent (ref), forwardRef (ref), memoComponent (ref), simpleMemoComponent (ref), block (ref), layout (ref), noFlags_1 (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), captureCommitPhaseError (write), recordLayoutEffectDuration (ref), classComponent (ref), hostComponent (ref), hostPortal (ref), supportsMutation (ref), unmountHostComponents (write), supportsPersistence (ref), unimplemented (ref)
	onCommitUnmount(p8)
	
	if p8.tag == functionComponent or p8.tag == forwardRef or (p8.tag == memoComponent or p8.tag == simpleMemoComponent) or p8.tag == block then
		local updateQueue = p8.updateQueue
		
		if updateQueue ~= nil then
			local lastEffect = updateQueue.lastEffect
			
			if lastEffect ~= nil then
				local next = lastEffect.next
				local var16 = next
				repeat
					if var16.destroy ~= nil and bit32.band(var16.tag, layout) ~= noFlags_1 then
						if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p8.mode, profileMode) ~= 0 then
							startLayoutEffectTimer()
							local ok, status = xpcall(var16.destroy, describeError)
							
							if not ok then
								captureCommitPhaseError(p8, p9, status)
							end
							recordLayoutEffectDuration(p8)
						else
							local ok, status = xpcall(var16.destroy, describeError)
							
							if not ok then
								captureCommitPhaseError(p8, p9, status)
							end
						end
					end
					var16 = var16.next
				until var16 == next
			end
		end
		return
	elseif p8.tag == classComponent then
		local ref = p8.ref
		
		if ref ~= nil then
			if typeof(ref) == "function" then
				local ok, status = xpcall(ref, describeError)
				
				if not ok then
					captureCommitPhaseError(p8, p9, status)
				end
			else
				ref.current = nil
			end
		end
		local stateNode = p8.stateNode
		
		if typeof(stateNode.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(p8, stateNode, p9)
		end
		return
	elseif p8.tag == hostComponent then
		local ref = p8.ref
		
		if ref ~= nil then
			if typeof(ref) == "function" then
				local ok, status = xpcall(ref, describeError)
				
				if ok then
					return
				else
					captureCommitPhaseError(p8, p9, status)
					
					return
				end
			else
				ref.current = nil
			end
		end
	elseif p8.tag ~= hostPortal then return end
	if supportsMutation then
		unmountHostComponents(p7, p8, p9, p10)
		
		return
	elseif supportsPersistence then
		unimplemented("emptyPortalContainer")
	end
end

local function commitNestedUnmounts(p7, p8, p9, p10)
	-- upvalues: commitUnmount (write), supportsMutation (ref), hostPortal (ref)
	local var16 = p8
	while true do
		commitUnmount(p7, var16, p9, p10)
		if var16.child ~= nil and (not supportsMutation or var16.tag ~= hostPortal) then
			var16.child.return_ = var16
			var16 = var16.child
			continue
		end
		if var16 ~= p8 then
			while var16.sibling == nil do
				if var16.return_ ~= nil and var16.return_ ~= p8 then
					var16 = var16.return_
					continue
				end
				return
			end
			var16.sibling.return_ = var16.return_
			var16 = var16.sibling
		end
	end
end

local _ = function(p11)
	-- upvalues: enableNewTreeCleanupPath (ref)
	local alternate = p11.alternate
	
	if alternate ~= nil then
		alternate.return_ = nil
		
		if not enableNewTreeCleanupPath then
			p11.alternate = nil
		end
	end
	p11.return_ = nil
end

local function getHostParentFiber(p11)
	-- upvalues: isHostParent (write), error (ref)
	local _return = p11.return_
	while _return ~= nil do
		if not isHostParent(_return) then
			_return = _return.return_
			continue
		end
		return _return
	end
	error(error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end

isHostParent = function(p12)
	-- upvalues: hostComponent (ref), hostRoot (ref), hostPortal (ref)
	return if p12.tag ~= hostComponent then if p12.tag ~= hostRoot then p12.tag == hostPortal else true else true
end

local function getHostSibling(p12)
	-- upvalues: isHostParent (write), hostComponent (ref), hostText (ref), dehydratedFragment (ref), placement (ref), hostPortal (ref)
	local var17
	local var18 = p12
	while true do
		var17 = false
		while var18.sibling == nil do
			if var18.return_ ~= nil and not isHostParent(var18.return_) then
				var18 = var18.return_
				continue
			end
			return nil
		end
		var18.sibling.return_ = var18.return_
		var18 = var18.sibling
		while var18.tag ~= hostComponent and (var18.tag ~= hostText and var18.tag ~= dehydratedFragment) do
			if bit32.band(var18.flags, placement) ~= 0 then
				var17 = true
				break
			elseif var18.child ~= nil and var18.tag ~= hostPortal then
				var18.child.return_ = var18
				var18 = var18.child
				continue
			else
				var17 = true
				break
			end
			elseif not var17 and bit32.band(var18.flags, placement) == 0 then
				return var18.stateNode
			end
		end
		-- [0.000s] <RUNTIME-ERROR> : Error block 26 analysis at pc 0 (list.remove(x): x not in list)
	end
end

local function commitPlacement(p13)
	-- upvalues: supportsMutation (ref), getHostParentFiber (ref), hostComponent (ref), hostRoot (ref), hostPortal (ref), invariant (ref), contentReset (ref), resetTextContent (ref), var2 (ref), getHostSibling (write), insertOrAppendPlacementNodeIntoContainer (write), insertOrAppendPlacementNode (write)
	if not supportsMutation then return end
	local var19 = getHostParentFiber(p13)
	local containerInfo = nil
	local var20 = nil
	local stateNode = var19.stateNode
	
	if var19.tag == hostComponent then
		containerInfo = stateNode
		var20 = false
	elseif var19.tag == hostRoot then
		containerInfo = stateNode.containerInfo
		var20 = true
	elseif var19.tag == hostPortal then
		containerInfo = stateNode.containerInfo
		var20 = true
	else
		invariant(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
	end
	if bit32.band(var19.flags, contentReset) ~= 0 then
		resetTextContent(containerInfo)
		var19.flags = bit32.band(var19.flags, bit32.bnot(contentReset))
	end
	local var21 = if var2 then nil else getHostSibling(p13)
	
	if var20 then
		insertOrAppendPlacementNodeIntoContainer(p13, var21, containerInfo)
		
		return
	end
	insertOrAppendPlacementNode(p13, var21, containerInfo)
end

insertOrAppendPlacementNodeIntoContainer = function(p13, p14, p15)
	-- upvalues: hostComponent (ref), hostText (ref), insertInContainerBefore (ref), appendChildToContainer (ref), hostPortal (ref), insertOrAppendPlacementNodeIntoContainer (write)
	local tag = p13.tag
	
	if if tag ~= hostComponent then tag == hostText else true then
		local stateNode = p13.stateNode
		
		if p14 then
			insertInContainerBefore(p15, stateNode, p14)
			
			return
		end
		appendChildToContainer(p15, stateNode)
		
		return
	elseif tag == hostPortal then return end
	local child = p13.child
	
	if child ~= nil then
		insertOrAppendPlacementNodeIntoContainer(child, p14, p15)
		local sibling = child.sibling
		while sibling ~= nil do
			insertOrAppendPlacementNodeIntoContainer(sibling, p14, p15)
			sibling = sibling.sibling
		end
	end
end

insertOrAppendPlacementNode = function(p16, p17, p18)
	-- upvalues: hostComponent (ref), hostText (ref), insertBefore (ref), appendChild (ref), hostPortal (ref), insertOrAppendPlacementNode (write)
	local tag = p16.tag
	
	if if tag ~= hostComponent then tag == hostText else true then
		local stateNode = p16.stateNode
		
		if p17 then
			insertBefore(p18, stateNode, p17)
			
			return
		end
		appendChild(p18, stateNode)
		
		return
	elseif tag == hostPortal then return end
	local child = p16.child
	
	if child ~= nil then
		insertOrAppendPlacementNode(child, p17, p18)
		local sibling = child.sibling
		while sibling ~= nil do
			insertOrAppendPlacementNode(sibling, p17, p18)
			sibling = sibling.sibling
		end
	end
end

unmountHostComponents = function(p19, p20, p21, p22)
	-- upvalues: error (ref), hostComponent (ref), hostRoot (ref), hostPortal (ref), hostText (ref), commitNestedUnmounts (write), removeChildFromContainer (ref), removeChild (ref), commitUnmount (write)
	local stateNode
	local var19 = p20
	local var20 = false
	local containerInfo = nil
	local var21 = nil
	while true do
		if not var20 then
			local _return = var19.return_
			while true do
				if _return == nil then
					error(error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
				end
				stateNode = _return.stateNode
				
				if _return.tag == hostComponent then
					containerInfo = stateNode
					var21 = false
					break
				elseif _return.tag == hostRoot then
					containerInfo = stateNode.containerInfo
					var21 = true
					break
				elseif _return.tag ~= hostPortal then
					_return = _return.return_
					continue
				else
					containerInfo = stateNode.containerInfo
					var21 = true
					break
				end
				var20 = true
			end
		end
		if var19.tag == hostComponent or var19.tag == hostText then
			commitNestedUnmounts(p19, var19, p21, p22)
			
			if var21 then
				removeChildFromContainer(containerInfo, var19.stateNode)
			else
				removeChild(containerInfo, var19.stateNode)
			end
		elseif var19.tag == hostPortal then
			if var19.child == nil then
				if var19 ~= p20 then
					while var19.sibling == nil do
						if var19.return_ ~= nil and var19.return_ ~= p20 then
							var19 = var19.return_
							
							if var19.tag == hostPortal then
								var20 = false
							end
						end
						return
					end
					var19.sibling.return_ = var19.return_
					var19 = var19.sibling
					continue
				end
				return
			else
				containerInfo = var19.stateNode.containerInfo
				var21 = true
				var19.child.return_ = var19
				var19 = var19.child
			end
		else
			commitUnmount(p19, var19, p21, p22)
			
			if var19.child == nil then
			else
				var19.child.return_ = var19
				var19 = var19.child
			end
		end
	end
end

local function commitDeletion(p23, p24, p25, p26)
	-- upvalues: unmountHostComponents (write), enableNewTreeCleanupPath (ref)
	unmountHostComponents(p23, p24, p25, p26)
	local var22 = if not enableNewTreeCleanupPath then p24.alternate else nil
	local alternate = p24.alternate
	
	if alternate ~= nil then
		alternate.return_ = nil
		
		if not enableNewTreeCleanupPath then
			p24.alternate = nil
		end
	end
	p24.return_ = nil
	
	if not enableNewTreeCleanupPath and var22 ~= nil then
		local var23 = var22
		local alternate_1 = var23.alternate
		
		if alternate_1 ~= nil then
			alternate_1.return_ = nil
			
			if not enableNewTreeCleanupPath then
				var23.alternate = nil
			end
		end
		var23.return_ = nil
	end
end

local function commitWork(p23, p24)
	-- upvalues: functionComponent (ref), forwardRef (ref), memoComponent (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), commitHookEffectListUnmount (ref), layout (ref), hasEffect (ref), describeError (ref), recordLayoutEffectDuration (ref), classComponent (ref), hostComponent (ref), commitUpdate (ref), hostText (ref), invariant (ref), commitTextUpdate (ref), hostRoot (ref), supportsHydration (ref), unimplemented (ref), profiler (ref), suspenseComponent (ref), suspenseListComponent (ref), incompleteClassComponent (ref), offscreenComponent (ref), legacyHiddenComponent (ref), hideOrUnhideAllChildren (ref)
	if p24.tag == functionComponent or p24.tag == forwardRef or (p24.tag == memoComponent or p24.tag == simpleMemoComponent) or p24.tag == block then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p24.mode, profileMode) ~= 0 then
			local ok, status = xpcall(function()
				-- upvalues: startLayoutEffectTimer (copy), commitHookEffectListUnmount (copy), layout (copy), hasEffect (copy), p24 (ref)
				startLayoutEffectTimer()
				commitHookEffectListUnmount(bit32.bor(layout, hasEffect), p24, p24.return_)
			end, describeError)
			recordLayoutEffectDuration(p24)
			
			if ok then
				return
			else
				error(status)
				
				return
			end
		else
			commitHookEffectListUnmount(bit32.bor(layout, hasEffect), p24, p24.return_)
		end
	elseif p24.tag == classComponent then return end
	if p24.tag == hostComponent then
		local stateNode = p24.stateNode
		
		if stateNode ~= nil then
			local memoizedProps = p24.memoizedProps
			local var22 = if p23 then p23.memoizedProps else memoizedProps
			local type = p24.type
			local updateQueue = p24.updateQueue
			p24.updateQueue = nil
			
			if updateQueue ~= nil then
				commitUpdate(stateNode, updateQueue, type, var22, memoizedProps, p24)
			end
		end
		return
	elseif p24.tag == hostText then
		invariant(p24.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
		local stateNode = p24.stateNode
		local memoizedProps = p24.memoizedProps
		local var23 = nil
		
		if p23 ~= nil then
			local _ = p23.memoizedProps
			var23 = memoizedProps
		end
		commitTextUpdate(stateNode, var23, memoizedProps)
		
		return
	elseif p24.tag == hostRoot then
		if supportsHydration then
			local stateNode = p24.stateNode
			
			if stateNode.hydrate then
				stateNode.hydrate = false
				unimplemented("commitWork: HostRoot: commitHydratedContainer")
			end
		end
		return
	elseif p24.tag == profiler then return end
	if p24.tag == suspenseComponent then
		commitSuspenseComponent(p24)
		attachSuspenseRetryListeners(p24)
		
		return
	elseif p24.tag == suspenseListComponent then
		unimplemented("commitWork: SuspenseListComponent")
	elseif p24.tag == incompleteClassComponent then return end
	if p24.tag == offscreenComponent or p24.tag == legacyHiddenComponent then
		hideOrUnhideAllChildren(p24, p24.memoizedState ~= nil)
		
		return
	end
	invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
end

function commitSuspenseComponent(p23)
	-- upvalues: var3 (write), supportsMutation (ref), hideOrUnhideAllChildren (ref), enableSuspenseCallback (ref), dEV (ref), console (ref)
	local memoizedState = p23.memoizedState
	
	if memoizedState ~= nil then
		if not var3 then
			var3 = require(script.Parent["ReactFiberWorkLoop.new"])
		end
		var3.markCommitTimeOfFallback()
		
		if supportsMutation then
			hideOrUnhideAllChildren(p23.child, true)
		end
	end
	if enableSuspenseCallback and memoizedState ~= nil then
		local suspenseCallback = p23.memoizedProps.suspenseCallback
		
		if typeof(suspenseCallback) == "function" then
			local updateQueue = p23.updateQueue
			
			if updateQueue == nil then
				return
			else
				suspenseCallback(table.clone(updateQueue))
				
				return
			end
		elseif dEV and suspenseCallback ~= nil then
			console.error("Unexpected type for suspenseCallback: %s", tostring(suspenseCallback))
		end
	end
end

function commitSuspenseHydrationCallbacks(p23, p24)
	-- upvalues: supportsHydration (ref), commitHydratedSuspenseInstance (ref), enableSuspenseCallback (ref)
	if not supportsHydration then return end
	if p24.memoizedState == nil then
		local alternate = p24.alternate
		
		if alternate ~= nil then
			local memoizedState = alternate.memoizedState
			
			if memoizedState ~= nil then
				local dehydrated = memoizedState.dehydrated
				
				if dehydrated ~= nil then
					commitHydratedSuspenseInstance(dehydrated)
					
					if enableSuspenseCallback then
						local hydrationCallbacks = p23.hydrationCallbacks
						
						if hydrationCallbacks ~= nil then
							local onHydrated = hydrationCallbacks.onHydrated
							
							if onHydrated then
								onHydrated(dehydrated)
							end
						end
					end
				end
			end
		end
	end
end

function attachSuspenseRetryListeners(p23)
	-- upvalues: set (ref), resolveRetryWakeable (ref), enableSchedulerTracing (ref), unstableWrap (ref)
	local updateQueue = p23.updateQueue
	
	if updateQueue ~= nil then
		p23.updateQueue = nil
		local stateNode = p23.stateNode
		
		if stateNode == nil then
			p23.stateNode = set.new()
			stateNode = p23.stateNode
		end
		for i, v in updateQueue do
			local var22 = function()
				-- upvalues: resolveRetryWakeable (copy), p23 (ref), i (ref)
				return resolveRetryWakeable(p23, i)
			end
			
			if not stateNode:has(i) then
				if enableSchedulerTracing and i.__reactDoNotTraceInteractions ~= true then
					var22 = unstableWrap(var22)
				end
				stateNode:add(i)
				i:andThen(function()
					-- upvalues: var22 (write)
					return var22()
				end, function()
					-- upvalues: var22 (write)
					return var22()
				end)
			end
		end
	end
end

function isSuspenseBoundaryBeingHidden(p24, p25)
	if p24 ~= nil then
		local memoizedState = p24.memoizedState
		
		if memoizedState ~= nil and memoizedState.dehydrated == nil then
			return false
		end
		local memoizedState_1 = p25.memoizedState
		
		return memoizedState_1 ~= nil and memoizedState_1.dehydrated == nil
	end
end

function commitResetTextContent(value)
	-- upvalues: supportsMutation (ref), resetTextContent (ref)
	if supportsMutation then
		resetTextContent(value.stateNode)
		
		return
	end
end

local function commitPassiveUnmount(p24)
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListUnmount (ref), passive (ref), hasEffect (ref), recordPassiveEffectDuration (ref)
	if p24.tag == functionComponent or p24.tag == forwardRef or (p24.tag == simpleMemoComponent or p24.tag == block) then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p24.mode, profileMode) ~= 0 then
			startPassiveEffectTimer()
			commitHookEffectListUnmount(bit32.bor(passive, hasEffect), p24, p24.return_)
			recordPassiveEffectDuration(p24)
			
			return
		end
		commitHookEffectListUnmount(bit32.bor(passive, hasEffect), p24, p24.return_)
	end
end

local function commitPassiveUnmountInsideDeletedTree(p24, p25)
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListUnmount (ref), passive (ref), recordPassiveEffectDuration (ref)
	if p24.tag == functionComponent or p24.tag == forwardRef or (p24.tag == simpleMemoComponent or p24.tag == block) then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p24.mode, profileMode) ~= 0 then
			startPassiveEffectTimer()
			commitHookEffectListUnmount(passive, p24, p25)
			recordPassiveEffectDuration(p24)
			
			return
		end
		commitHookEffectListUnmount(passive, p24, p25)
	end
end

local function commitPassiveMount(p24, p25)
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListMount (ref), describeError (ref), passive (ref), hasEffect (ref), recordPassiveEffectDuration (ref), profiler (ref)
	if p25.tag == functionComponent or p25.tag == forwardRef or (p25.tag == simpleMemoComponent or p25.tag == block) then
		if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p25.mode, profileMode) == 0 then
			commitHookEffectListMount(bit32.bor(passive, hasEffect), p25)
			
			return
		end
		startPassiveEffectTimer()
		local ok, status = xpcall(commitHookEffectListMount, describeError, bit32.bor(passive, hasEffect), p25)
		recordPassiveEffectDuration(p25)
		
		if ok then
			return
		else
			error(status)
			
			return
		end
	elseif p25.tag == profiler then
		commitProfilerPassiveEffect(p24, p25)
	end
end

function invokeLayoutEffectMountInDEV(p24)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListMount (ref), layout (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write), classComponent (ref)
	if dEV and enableDoubleInvokingEffects then
		if p24.tag ~= functionComponent and p24.tag ~= forwardRef and (p24.tag ~= simpleMemoComponent and p24.tag ~= block) then return end
		invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(layout, hasEffect), p24)
		
		if hasCaughtError() then
			captureCommitPhaseError(p24, p24.return_, clearCaughtError())
		end
		return
	elseif p24.tag ~= classComponent then return end
	local stateNode = p24.stateNode
	invokeGuardedCallback(nil, stateNode.componentDidMount, stateNode)
	
	if hasCaughtError() then
		captureCommitPhaseError(p24, p24.return_, clearCaughtError())
	end
	return
end

function invokePassiveEffectMountInDEV(p24)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListMount (ref), passive (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write)
	if not dEV or not enableDoubleInvokingEffects or p24.tag ~= functionComponent and p24.tag ~= forwardRef and (p24.tag ~= simpleMemoComponent and p24.tag ~= block) then return end
	invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(passive, hasEffect), p24)
	
	if hasCaughtError() then
		captureCommitPhaseError(p24, p24.return_, clearCaughtError())
	end
end

function invokeLayoutEffectUnmountInDEV(p24)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListUnmount (ref), layout (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write), classComponent (ref)
	if dEV and enableDoubleInvokingEffects then
		if p24.tag ~= functionComponent and p24.tag ~= forwardRef and (p24.tag ~= simpleMemoComponent and p24.tag ~= block) then return end
		invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(layout, hasEffect), p24, p24.return_)
		
		if hasCaughtError() then
			captureCommitPhaseError(p24, p24.return_, clearCaughtError())
		end
		return
	elseif p24.tag ~= classComponent then return end
	local stateNode = p24.stateNode
	
	if typeof(stateNode.componentWillUnmount) == "function" then
		safelyCallComponentWillUnmount(p24, stateNode, p24.return_)
	end
	return
end

function invokePassiveEffectUnmountInDEV(p24)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListUnmount (ref), passive (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write)
	if not dEV or not enableDoubleInvokingEffects or p24.tag ~= functionComponent and p24.tag ~= forwardRef and (p24.tag ~= simpleMemoComponent and p24.tag ~= block) then return end
	invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(passive, hasEffect), p24, p24.return_)
	
	if hasCaughtError() then
		captureCommitPhaseError(p24, p24.return_, clearCaughtError())
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