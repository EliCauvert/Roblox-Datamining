local function unimplemented(p0) --[[ line: 11 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p0))
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local var1 = 0

local function _(p1) --[[ line: 25 | named "isCallable" ]]
	if typeof(p1) == "function" then
		return true
	elseif typeof(p1) == "table" then
		local var42 = getmetatable(p1)
		
		return if var42 and rawget(var42, "__call") then true else p1._isMockFunction
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
local var11 = nil

local function resolveRetryWakeable(p2, p3) --[[ line: 196 ]]
	-- upvalues: var11 (write)
	if not var11 then
		var11 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var11.resolveRetryWakeable(p2, p3)
end

local _ = function() --[[ line: 203 | named "markCommitTimeOfFallback" ]]
	-- upvalues: var11 (write)
	if not var11 then
		var11 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var11.markCommitTimeOfFallback()
end

local function schedulePassiveEffectCallback() --[[ line: 211 ]]
	-- upvalues: console (ref)
	console.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end

local function captureCommitPhaseError(_, _, p4) --[[ line: 219 ]]
	-- upvalues: console (ref)
	console.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
	error(p4)
end

local noFlags_1 = reactHookEffectTagsModule.NoFlags
local hasEffect = reactHookEffectTagsModule.HasEffect
local layout = reactHookEffectTagsModule.Layout
local passive = reactHookEffectTagsModule.Passive
local var15 = nil

local var16 = function() --[[ line: 237 ]]
	-- upvalues: var15 (write)
	if not var15 then
		var15 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps
	end
	return var15
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
local var24 = nil

local function callComponentWillUnmountWithTimer(p5, p6) --[[ line: 262 ]]
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), recordLayoutEffectDuration (ref)
	p6.props = p5.memoizedProps
	p6.state = p5.memoizedState
	
	if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p5.mode, profileMode) ~= 0 then
		local ok, status = xpcall(function() --[[ line: 271 ]]
			-- upvalues: startLayoutEffectTimer (copy), p6 (ref)
			startLayoutEffectTimer()
			p6:componentWillUnmount()
		end, describeError)
		recordLayoutEffectDuration(p5)
		
		if ok then
			return
		else
			error(status)
			
			return
		end
	else
		p6:componentWillUnmount()
	end
end

function safelyCallComponentWillUnmount(p7, p8, p9) --[[ line: 289 ]]
	-- upvalues: callComponentWillUnmountWithTimer (ref), describeError (ref), captureCommitPhaseError (write)
	local ok, status = xpcall(callComponentWillUnmountWithTimer, describeError, p7, p8)
	
	if not ok then
		captureCommitPhaseError(p7, p9, status)
	end
end

local _ = function(p10, p11) --[[ line: 303 | named "safelyDetachRef" ]]
	-- upvalues: describeError (ref), captureCommitPhaseError (write)
	local ref = p10.ref
	
	if ref ~= nil then
		if typeof(ref) == "function" then
			local ok, status = xpcall(ref, describeError)
			
			if ok then
				return
			else
				captureCommitPhaseError(p10, p11, status)
				
				return
			end
		else
			ref.current = nil
		end
	end
end

local function safelyCallDestroy(p12, p13, p14) --[[ line: 319 ]]
	-- upvalues: describeError (ref), captureCommitPhaseError (write)
	local ok, status = xpcall(p14, describeError)
	
	if not ok then
		captureCommitPhaseError(p12, p13, status)
	end
end

local function commitBeforeMutationLifeCycles(p15, p16) --[[ line: 331 ]]
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), classComponent (ref), snapshot (ref), dEV (ref), var16 (ref), console (ref), getComponentName (ref), resolveDefaultProps (ref), hostRoot (ref), supportsMutation (ref), clearContainer (ref), hostComponent (ref), hostText (ref), hostPortal (ref), incompleteClassComponent (ref), invariant (ref)
	if p16.tag == functionComponent or p16.tag == forwardRef or (p16.tag == simpleMemoComponent or p16.tag == block) then return end
	if p16.tag == classComponent then
		if bit32.band(p16.flags, snapshot) ~= 0 and p15 ~= nil then
			local memoizedProps = p15.memoizedProps
			local memoizedState = p15.memoizedState
			local stateNode = p16.stateNode
			
			if dEV and p16.type == p16.elementType and not var16 then
				if stateNode.props ~= p16.memoizedProps then
					console.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p16.type) or "instance")
				end
				if stateNode.state ~= p16.memoizedState then
					console.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p16.type) or "instance")
				end
			end
			stateNode.__reactInternalSnapshotBeforeUpdate = stateNode:getSnapshotBeforeUpdate(if p16.elementType == p16.type then memoizedProps else resolveDefaultProps(p16.type, memoizedProps), memoizedState)
		end
		return
	elseif p16.tag == hostRoot then
		if supportsMutation and bit32.band(p16.flags, snapshot) ~= 0 then
			clearContainer(p16.stateNode.containerInfo)
		end
		return
	elseif p16.tag == hostComponent or p16.tag == hostText or (p16.tag == hostPortal or p16.tag == incompleteClassComponent) then
		return
	end
	invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
end

local function commitHookEffectListUnmount(p17, p18, p19) --[[ line: 424 ]]
	-- upvalues: describeError (ref), captureCommitPhaseError (write)
	local updateQueue = p18.updateQueue
	local var43 = if updateQueue ~= nil then updateQueue.lastEffect else nil
	
	if var43 ~= nil then
		local next = var43.next
		local var44 = next
		repeat
			if bit32.band(var44.tag, p17) == p17 then
				local destroy = var44.destroy
				var44.destroy = nil
				
				if destroy ~= nil then
					local ok, status = xpcall(destroy, describeError)
					
					if not ok then
						captureCommitPhaseError(p18, p19, status)
					end
				end
			end
			var44 = var44.next
		until var44 == next
	end
end

local function commitHookEffectListMount(p20, p21) --[[ line: 452 ]]
	-- upvalues: dEV (ref), console (ref)
	local updateQueue = p21.updateQueue
	local var45 = if updateQueue ~= nil then nil else updateQueue.lastEffect
	
	if var45 ~= nil then
		local next = var45.next
		local var46 = next
		repeat
			if bit32.band(var46.tag, p20) == p20 then
				var46.destroy = var46.create()
				
				if dEV then
					local destroy = var46.destroy
					
					if destroy ~= nil and typeof(destroy) ~= "function" then
						console.error("An effect function must not return anything besides a function, which is used for clean-up.%s", if destroy == nil then " You returned nil. If your effect does not require clean up, return nil (or nothing)." elseif typeof(destroy.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. destroy)
					end
				end
			end
			var46 = var46.next
		until var46 == next
	end
end

function commitProfilerPassiveEffect(startValue, endValue) --[[ line: 492 ]]
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profiler (ref), getCommitTime (ref), enableSchedulerTracing (ref)
	if enableProfilerTimer and enableProfilerCommitHooks and endValue.tag == profiler then
		local passiveEffectDuration = endValue.stateNode.passiveEffectDuration
		local id = endValue.memoizedProps.id
		local onPostCommit = endValue.memoizedProps.onPostCommit
		local var47 = getCommitTime()
		
		if typeof(onPostCommit) == "function" then
			if enableSchedulerTracing then
				onPostCommit(id, if endValue.alternate == nil then "mount" else "update", passiveEffectDuration, var47, startValue.memoizedInteractions)
				
				return
			end
			onPostCommit(id, if endValue.alternate == nil then "mount" else "update", passiveEffectDuration, var47)
		end
	end
end

local function recursivelyCommitLayoutEffects(p22, p23, p24, p25) --[[ line: 525 ]]
	-- upvalues: captureCommitPhaseError (write), schedulePassiveEffectCallback (write), profiler (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var24 (write), layoutMask (ref), noFlags (ref), dEV (ref), current (ref), setCurrentFiber (ref), invokeGuardedCallback (ref), recursivelyCommitLayoutEffects (ref), hasCaughtError (ref), clearCaughtError (ref), resetCurrentFiber (ref), describeError (ref), update (ref), callback (ref), reactCurrentFiberModule (ref), var1 (write), yOLO (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), profileMode (ref), startLayoutEffectTimer (ref), commitHookEffectListMount (ref), layout (ref), hasEffect (ref), recordLayoutEffectDuration (ref), passiveMask (ref), classComponent (ref), commitLayoutEffectsForClassComponent (write), hostRoot (ref), commitLayoutEffectsForHostRoot (write), hostComponent (ref), commitLayoutEffectsForHostComponent (write), suspenseComponent (ref), fundamentalComponent (ref), hostPortal (ref), hostText (ref), incompleteClassComponent (ref), legacyHiddenComponent (ref), offscreenComponent (ref), scopeComponent (ref), suspenseListComponent (ref), invariant (ref), ref (ref)
	if p24 ~= nil then
		captureCommitPhaseError = p24
	end
	if p25 ~= nil then
		schedulePassiveEffectCallback = p25
	end
	local flags = p22.flags
	local tag = p22.tag
	
	if tag == profiler then
		local var48 = nil
		
		if enableProfilerTimer and enableProfilerCommitHooks then
			var48 = var24
			var24 = p22
		end
		local child = p22.child
		while child ~= nil do
			if bit32.band(p22.subtreeFlags, layoutMask) ~= noFlags then
				if dEV then
					local var49 = current
					setCurrentFiber(child)
					invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
					
					if hasCaughtError() then
						captureCommitPhaseError(child, p22, clearCaughtError())
					end
					if var49 == nil then
						resetCurrentFiber()
					else
						setCurrentFiber(var49)
					end
				else
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
					
					if not ok then
						captureCommitPhaseError(child, p22, status)
					end
				end
			end
			child = child.sibling
		end
		if bit32.band(flags, bit32.bor(update, callback)) ~= noFlags and enableProfilerTimer then
			if dEV then
				local var50 = current
				setCurrentFiber(p22)
				invokeGuardedCallback(nil, commitLayoutEffectsForProfiler, nil, p22, p23)
				
				if hasCaughtError() then
					captureCommitPhaseError(p22, p22.return_, clearCaughtError())
				end
				if var50 == nil then
					resetCurrentFiber()
				else
					setCurrentFiber(var50)
				end
			else
				local ok, status = xpcall(commitLayoutEffectsForProfiler, describeError, p22, p23)
				
				if not ok then
					captureCommitPhaseError(p22, p22.return_, status)
				end
			end
		end
		if not enableProfilerTimer or not enableProfilerCommitHooks then return end
		if var48 ~= nil then
			var48.stateNode.effectDuration += p22.stateNode.effectDuration
		end
		var24 = var48
		
		return
	else
		local child = p22.child
		while child ~= nil do
			if bit32.band(p22.subtreeFlags, layoutMask) == noFlags then
				child = child.sibling
				continue
			end
			if dEV then
				local current_1 = reactCurrentFiberModule.current
				setCurrentFiber(child)
				
				if var1 < 20 then
					var1 += 1
					invokeGuardedCallback(nil, recursivelyCommitLayoutEffects, nil, child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
					var1 -= 1
					
					if hasCaughtError() then
						captureCommitPhaseError(child, p22, clearCaughtError())
					end
				else
					recursivelyCommitLayoutEffects(child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
				end
				if current_1 == nil then
					resetCurrentFiber()
				else
					setCurrentFiber(current_1)
				end
			else
				local var52
				local _ = nil
				local var51 = nil
				
				if yOLO or var1 >= 20 then
					var52 = true
					recursivelyCommitLayoutEffects(child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
				else
					var1 += 1
					local ok, status = xpcall(recursivelyCommitLayoutEffects, describeError, child, p23, captureCommitPhaseError, schedulePassiveEffectCallback)
					var52 = ok
					var51 = status
					var1 -= 1
				end
				if not var52 then
					captureCommitPhaseError(child, p22, var51)
				end
			end
		end
		if bit32.band(flags, bit32.bor(update, callback)) ~= noFlags then
			if tag == functionComponent or tag == forwardRef or (tag == simpleMemoComponent or tag == block) then
				if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p22.mode, profileMode) ~= 0 then
					local ok, status = xpcall(function() --[[ line: 747 ]]
						-- upvalues: startLayoutEffectTimer (copy), commitHookEffectListMount (copy), layout (copy), hasEffect (copy), p22 (ref)
						startLayoutEffectTimer()
						commitHookEffectListMount(bit32.bor(layout, hasEffect), p22)
					end, describeError)
					recordLayoutEffectDuration(p22)
					
					if not ok then
						error(status)
					end
				else
					commitHookEffectListMount(bit32.bor(layout, hasEffect), p22)
				end
				if bit32.band(p22.subtreeFlags, passiveMask) ~= noFlags then
					schedulePassiveEffectCallback()
				end
			elseif tag == classComponent then
				commitLayoutEffectsForClassComponent(p22)
			elseif tag == hostRoot then
				commitLayoutEffectsForHostRoot(p22)
			elseif tag == hostComponent then
				commitLayoutEffectsForHostComponent(p22)
			elseif tag == suspenseComponent then
				commitSuspenseHydrationCallbacks(p23, p22)
			elseif tag ~= fundamentalComponent and tag ~= hostPortal and (tag ~= hostText and tag ~= incompleteClassComponent) and (tag ~= legacyHiddenComponent and tag ~= offscreenComponent and (tag ~= scopeComponent and tag ~= suspenseListComponent)) then
				invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
			end
		end
		if bit32.band(flags, ref) ~= 0 then
			commitAttachRef(p22)
		end
	end
end

function commitLayoutEffectsForProfiler(p26, p27) --[[ line: 812 ]]
	-- upvalues: enableProfilerTimer (ref), getCommitTime (ref), update (ref), callback (ref), noFlags (ref), enableSchedulerTracing (ref), enableProfilerCommitHooks (ref)
	if enableProfilerTimer then
		local var56
		local flags = p26.flags
		local alternate = p26.alternate
		local onCommit = p26.memoizedProps.onCommit
		local onRender = p26.memoizedProps.onRender
		local effectDuration = p26.stateNode.effectDuration
		local var53 = getCommitTime()
		local var54 = callback
		
		if bit32.band(flags, update) ~= noFlags then
			local var55
			if typeof(onRender) == "function" then
				var55 = true
			elseif typeof(onRender) == "table" then
				var56 = getmetatable(onRender)
				var55 = if var56 and rawget(var56, "__call") then true elseif onRender._isMockFunction then true else false
			end
			if var55 then
				if enableSchedulerTracing then
					onRender(p26.memoizedProps.id, if alternate == nil then "mount" else "update", p26.actualDuration, p26.treeBaseDuration, p26.actualStartTime, var53, p27.memoizedInteractions)
				else
					onRender(p26.memoizedProps.id, if alternate == nil then "mount" else "update", p26.actualDuration, p26.treeBaseDuration, p26.actualStartTime, var53)
				end
			end
		end
		if enableProfilerCommitHooks and bit32.band(flags, var54) ~= noFlags then
			local var57
			if typeof(onCommit) == "function" then
				var57 = true
			elseif typeof(onCommit) == "table" then
				var56 = getmetatable(onCommit)
				var57 = if var56 and rawget(var56, "__call") then true elseif onCommit._isMockFunction then true else false
			end
			if var57 then
				if enableSchedulerTracing then
					onCommit(p26.memoizedProps.id, if alternate == nil then "mount" else "update", effectDuration, var53, p27.memoizedInteractions)
					
					return
				end
				onCommit(p26.memoizedProps.id, if alternate == nil then "mount" else "update", effectDuration, var53)
			end
		end
	end
end

commitLayoutEffectsForClassComponent = function(p28) --[[ line: 880 | named "commitLayoutEffectsForClassComponent" ]]
	-- upvalues: update (ref), dEV (ref), var16 (ref), console (ref), getComponentName (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), recordLayoutEffectDuration (ref), resolveDefaultProps (ref), commitUpdateQueue (ref)
	local stateNode = p28.stateNode
	local alternate = p28.alternate
	
	if bit32.band(p28.flags, update) ~= 0 then
		if alternate == nil then
			if dEV and p28.type == p28.elementType and not var16 then
				if stateNode.props ~= p28.memoizedProps then
					console.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p28.type) or "instance")
				end
				if stateNode.state ~= p28.memoizedState then
					console.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p28.type) or "instance")
				end
			end
			if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p28.mode, profileMode) ~= 0 then
				local ok, status = xpcall(function() --[[ line: 920 ]]
					-- upvalues: startLayoutEffectTimer (copy), stateNode (ref)
					startLayoutEffectTimer()
					stateNode:componentDidMount()
				end, describeError)
				recordLayoutEffectDuration(p28)
				
				if not ok then
					error(status)
				end
			else
				stateNode:componentDidMount()
			end
		else
			local var58 = if p28.elementType == p28.type then alternate.memoizedProps else resolveDefaultProps(p28.type, alternate.memoizedProps)
			local memoizedState = alternate.memoizedState
			
			if dEV and p28.type == p28.elementType and not var16 then
				if stateNode.props ~= p28.memoizedProps then
					console.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p28.type) or "instance")
				end
				if stateNode.state ~= p28.memoizedState then
					console.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p28.type) or "instance")
				end
			end
			if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p28.mode, profileMode) ~= 0 then
				local ok, status = xpcall(function() --[[ line: 974 ]]
					-- upvalues: startLayoutEffectTimer (copy), stateNode (ref), var58 (ref), memoizedState (ref)
					startLayoutEffectTimer()
					stateNode:componentDidUpdate(var58, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
				end, describeError)
				recordLayoutEffectDuration(p28)
				
				if not ok then
					error(status)
				end
			else
				stateNode:componentDidUpdate(var58, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
			end
		end
	end
	local updateQueue = p28.updateQueue
	
	if updateQueue ~= nil then
		if dEV and p28.type == p28.elementType and not var16 then
			if stateNode.props ~= p28.memoizedProps then
				console.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", getComponentName(p28.type) or "instance")
			end
			if stateNode.state ~= p28.memoizedState then
				console.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", getComponentName(p28.type) or "instance")
			end
		end
		commitUpdateQueue(p28, updateQueue, stateNode)
	end
end

commitLayoutEffectsForHostRoot = function(p29) --[[ line: 1037 | named "commitLayoutEffectsForHostRoot" ]]
	-- upvalues: hostComponent (ref), getPublicInstance (ref), classComponent (ref), commitUpdateQueue (ref)
	local updateQueue = p29.updateQueue
	
	if updateQueue ~= nil then
		local stateNode = nil
		
		if p29.child ~= nil then
			local child = p29.child
			
			if child.tag == hostComponent then
				stateNode = getPublicInstance(child.stateNode)
			elseif child.tag == classComponent then
				stateNode = child.stateNode
			end
		end
		commitUpdateQueue(p29, updateQueue, stateNode)
	end
end

commitLayoutEffectsForHostComponent = function(p30) --[[ line: 1056 | named "commitLayoutEffectsForHostComponent" ]]
	-- upvalues: update (ref), commitMount (ref)
	local stateNode = p30.stateNode
	
	if p30.alternate == nil and bit32.band(p30.flags, update) ~= 0 then
		commitMount(stateNode, p30.type, p30.memoizedProps, p30)
	end
end

local function hideOrUnhideAllChildren(p31, p32) --[[ line: 1071 ]]
	-- upvalues: supportsMutation (ref), hostComponent (ref), hideInstance (ref), unhideInstance (ref), hostText (ref), hideTextInstance (ref), unhideTextInstance (ref), offscreenComponent (ref), legacyHiddenComponent (ref)
	if supportsMutation then
		local var59 = p31
		while true do
			if var59.tag == hostComponent then
				local stateNode = var59.stateNode
				
				if p32 then
					hideInstance(stateNode)
				else
					unhideInstance(var59.stateNode, var59.memoizedProps)
				end
			elseif var59.tag == hostText then
				local stateNode = var59.stateNode
				
				if p32 then
					hideTextInstance(stateNode)
				else
					unhideTextInstance(stateNode, var59.memoizedProps)
				end
			elseif (var59.tag == offscreenComponent or var59.tag == legacyHiddenComponent) and (var59.memoizedState ~= nil and var59 ~= p31) or var59.child == nil then
				if var59 ~= p31 then
					while var59.sibling == nil do
						if var59.return_ ~= nil and var59.return_ ~= p31 then
							var59 = var59.return_
							continue
						end
						return
					end
					var59.sibling.return_ = var59.return_
					var59 = var59.sibling
				end
				return
			else
				var59.child.return_ = var59
				var59 = var59.child
			end
		end
	end
end

function commitAttachRef(p33) --[[ line: 1121 ]]
	-- upvalues: hostComponent (ref), getPublicInstance (ref), dEV (ref), console (ref), getComponentName (ref)
	local ref = p33.ref
	
	if ref ~= nil then
		local stateNode = p33.stateNode
		local var60 = if p33.tag == hostComponent then getPublicInstance(stateNode) else stateNode
		
		if typeof(ref) == "function" then
			ref(var60)
			
			return
		elseif dEV and typeof(ref) ~= "table" then
			console.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", getComponentName(p33.type) or "instance")
			
			return
		end
		ref.current = var60
	end
end

function commitDetachRef(p34) --[[ line: 1160 ]]
	local ref = p34.ref
	
	if ref ~= nil then
		if typeof(ref) == "function" then
			ref(nil)
			
			return
		end
		ref.current = nil
	end
end

local function commitUnmount(p35, p36, p37, p38) --[[ line: 1174 ]]
	-- upvalues: onCommitUnmount (ref), functionComponent (ref), forwardRef (ref), memoComponent (ref), simpleMemoComponent (ref), block (ref), layout (ref), noFlags_1 (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), describeError (ref), captureCommitPhaseError (write), recordLayoutEffectDuration (ref), classComponent (ref), hostComponent (ref), hostPortal (ref), supportsMutation (ref), unmountHostComponents (write), supportsPersistence (ref), unimplemented (ref)
	onCommitUnmount(p36)
	
	if p36.tag == functionComponent or p36.tag == forwardRef or (p36.tag == memoComponent or p36.tag == simpleMemoComponent) or p36.tag == block then
		local updateQueue = p36.updateQueue
		
		if updateQueue ~= nil then
			local lastEffect = updateQueue.lastEffect
			
			if lastEffect ~= nil then
				local next = lastEffect.next
				local var61 = next
				repeat
					if var61.destroy ~= nil and bit32.band(var61.tag, layout) ~= noFlags_1 then
						if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p36.mode, profileMode) ~= 0 then
							startLayoutEffectTimer()
							local ok, status = xpcall(var61.destroy, describeError)
							
							if not ok then
								captureCommitPhaseError(p36, p37, status)
							end
							recordLayoutEffectDuration(p36)
						else
							local ok, status = xpcall(var61.destroy, describeError)
							
							if not ok then
								captureCommitPhaseError(p36, p37, status)
							end
						end
					end
					var61 = var61.next
				until var61 == next
			end
		end
		return
	elseif p36.tag == classComponent then
		local ref = p36.ref
		
		if ref ~= nil then
			if typeof(ref) == "function" then
				local ok, status = xpcall(ref, describeError)
				
				if not ok then
					captureCommitPhaseError(p36, p37, status)
				end
			else
				ref.current = nil
			end
		end
		local stateNode = p36.stateNode
		
		if typeof(stateNode.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(p36, stateNode, p37)
		end
		return
	elseif p36.tag == hostComponent then
		local ref = p36.ref
		
		if ref ~= nil then
			if typeof(ref) == "function" then
				local ok, status = xpcall(ref, describeError)
				
				if ok then
					return
				else
					captureCommitPhaseError(p36, p37, status)
					
					return
				end
			else
				ref.current = nil
			end
		end
	elseif p36.tag ~= hostPortal then return end
	if supportsMutation then
		unmountHostComponents(p35, p36, p37, p38)
		
		return
	elseif supportsPersistence then
		unimplemented("emptyPortalContainer")
	end
end

local function commitNestedUnmounts(p39, p40, p41, p42) --[[ line: 1281 ]]
	-- upvalues: commitUnmount (write), supportsMutation (ref), hostPortal (ref)
	local var62 = p40
	while true do
		commitUnmount(p39, var62, p41, p42)
		if var62.child ~= nil and (not supportsMutation or var62.tag ~= hostPortal) then
			var62.child.return_ = var62
			var62 = var62.child
			continue
		end
		if var62 ~= p40 then
			while var62.sibling == nil do
				if var62.return_ ~= nil and var62.return_ ~= p40 then
					var62 = var62.return_
					continue
				end
				return
			end
			var62.sibling.return_ = var62.return_
			var62 = var62.sibling
		end
	end
end

local _ = function(p43) --[[ line: 1321 | named "detachFiberMutation" ]]
	-- upvalues: enableNewTreeCleanupPath (ref)
	local alternate = p43.alternate
	
	if alternate ~= nil then
		alternate.return_ = nil
		
		if not enableNewTreeCleanupPath then
			p43.alternate = nil
		end
	end
	p43.return_ = nil
end

local function getHostParentFiber(p44) --[[ line: 1390 ]]
	-- upvalues: isHostParent (write), error (ref)
	local _return = p44.return_
	while _return ~= nil do
		if not isHostParent(_return) then
			_return = _return.return_
			continue
		end
		return _return
	end
	error(error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end

isHostParent = function(p45) --[[ line: 1408 | named "isHostParent" ]]
	-- upvalues: hostComponent (ref), hostRoot (ref), hostPortal (ref)
	return if p45.tag ~= hostComponent then if p45.tag ~= hostRoot then p45.tag == hostPortal else true else true
end

local function getHostSibling(p46) --[[ line: 1412 ]]
	-- upvalues: isHostParent (write), hostComponent (ref), hostText (ref), dehydratedFragment (ref), placement (ref), hostPortal (ref)
	local var64
	local var63 = p46
	while true do
		var64 = false
		while var63.sibling == nil do
			if var63.return_ ~= nil and not isHostParent(var63.return_) then
				var63 = var63.return_
				continue
			end
			return nil
		end
		var63.sibling.return_ = var63.return_
		var63 = var63.sibling
		while var63.tag ~= hostComponent and (var63.tag ~= hostText and var63.tag ~= dehydratedFragment) do
			if bit32.band(var63.flags, placement) ~= 0 then
				var64 = true
				break
			elseif var63.child ~= nil and var63.tag ~= hostPortal then
				var63.child.return_ = var63
				var63 = var63.child
				continue
			else
				var64 = true
				break
			end
			elseif not var64 and bit32.band(var63.flags, placement) == 0 then
				return var63.stateNode
			end
		end
		-- [0.001s] <RUNTIME-ERROR> : Error block 26 analysis at pc 0 (list.remove(x): x not in list)
	end
end

local function commitPlacement(p47) --[[ line: 1466 ]]
	-- upvalues: supportsMutation (ref), getHostParentFiber (ref), hostComponent (ref), hostRoot (ref), hostPortal (ref), invariant (ref), contentReset (ref), resetTextContent (ref), getHostSibling (write), insertOrAppendPlacementNodeIntoContainer (write), insertOrAppendPlacementNode (write)
	if not supportsMutation then return end
	local var65 = getHostParentFiber(p47)
	local containerInfo = nil
	local var66 = nil
	local stateNode = var65.stateNode
	
	if var65.tag == hostComponent then
		containerInfo = stateNode
		var66 = false
	elseif var65.tag == hostRoot then
		containerInfo = stateNode.containerInfo
		var66 = true
	elseif var65.tag == hostPortal then
		containerInfo = stateNode.containerInfo
		var66 = true
	else
		invariant(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
	end
	if bit32.band(var65.flags, contentReset) ~= 0 then
		resetTextContent(containerInfo)
		var65.flags = bit32.band(var65.flags, bit32.bnot(contentReset))
	end
	local var67 = getHostSibling(p47)
	
	if var66 then
		insertOrAppendPlacementNodeIntoContainer(p47, var67, containerInfo)
		
		return
	end
	insertOrAppendPlacementNode(p47, var67, containerInfo)
end

insertOrAppendPlacementNodeIntoContainer = function(p48, p49, p50) --[[ line: 1517 | named "insertOrAppendPlacementNodeIntoContainer" ]]
	-- upvalues: hostComponent (ref), hostText (ref), insertInContainerBefore (ref), appendChildToContainer (ref), hostPortal (ref), insertOrAppendPlacementNodeIntoContainer (write)
	local tag = p48.tag
	
	if if tag ~= hostComponent then tag == hostText else true then
		local stateNode = p48.stateNode
		
		if p49 then
			insertInContainerBefore(p50, stateNode, p49)
			
			return
		end
		appendChildToContainer(p50, stateNode)
		
		return
	elseif tag == hostPortal then return end
	local child = p48.child
	
	if child ~= nil then
		insertOrAppendPlacementNodeIntoContainer(child, p49, p50)
		local sibling = child.sibling
		while sibling ~= nil do
			insertOrAppendPlacementNodeIntoContainer(sibling, p49, p50)
			sibling = sibling.sibling
		end
	end
end

insertOrAppendPlacementNode = function(p51, p52, p53) --[[ line: 1549 | named "insertOrAppendPlacementNode" ]]
	-- upvalues: hostComponent (ref), hostText (ref), insertBefore (ref), appendChild (ref), hostPortal (ref), insertOrAppendPlacementNode (write)
	local tag = p51.tag
	
	if if tag ~= hostComponent then tag == hostText else true then
		local stateNode = p51.stateNode
		
		if p52 then
			insertBefore(p53, stateNode, p52)
			
			return
		end
		appendChild(p53, stateNode)
		
		return
	elseif tag == hostPortal then return end
	local child = p51.child
	
	if child ~= nil then
		insertOrAppendPlacementNode(child, p52, p53)
		local sibling = child.sibling
		while sibling ~= nil do
			insertOrAppendPlacementNode(sibling, p52, p53)
			sibling = sibling.sibling
		end
	end
end

unmountHostComponents = function(p54, p55, p56, p57) --[[ line: 1577 | named "unmountHostComponents" ]]
	-- upvalues: error (ref), hostComponent (ref), hostRoot (ref), hostPortal (ref), hostText (ref), commitNestedUnmounts (write), removeChildFromContainer (ref), removeChild (ref), commitUnmount (write)
	local stateNode
	local var68 = p55
	local var69 = false
	local containerInfo = nil
	local var70 = nil
	while true do
		if not var69 then
			local _return = var68.return_
			while true do
				if _return == nil then
					error(error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
				end
				stateNode = _return.stateNode
				
				if _return.tag == hostComponent then
					containerInfo = stateNode
					var70 = false
					break
				elseif _return.tag == hostRoot then
					containerInfo = stateNode.containerInfo
					var70 = true
					break
				elseif _return.tag ~= hostPortal then
					_return = _return.return_
					continue
				else
					containerInfo = stateNode.containerInfo
					var70 = true
					break
				end
				var69 = true
			end
		end
		if var68.tag == hostComponent or var68.tag == hostText then
			commitNestedUnmounts(p54, var68, p56, p57)
			
			if var70 then
				removeChildFromContainer(containerInfo, var68.stateNode)
			else
				removeChild(containerInfo, var68.stateNode)
			end
		elseif var68.tag == hostPortal then
			if var68.child == nil then
				if var68 ~= p55 then
					while var68.sibling == nil do
						if var68.return_ ~= nil and var68.return_ ~= p55 then
							var68 = var68.return_
							
							if var68.tag == hostPortal then
								var69 = false
							end
						end
						return
					end
					var68.sibling.return_ = var68.return_
					var68 = var68.sibling
					continue
				end
				return
			else
				containerInfo = var68.stateNode.containerInfo
				var70 = true
				var68.child.return_ = var68
				var68 = var68.child
			end
		else
			commitUnmount(p54, var68, p56, p57)
			
			if var68.child == nil then
			else
				var68.child.return_ = var68
				var68 = var68.child
			end
		end
	end
end

local function commitDeletion(p58, p59, p60, p61) --[[ line: 1755 ]]
	-- upvalues: unmountHostComponents (write), enableNewTreeCleanupPath (ref)
	unmountHostComponents(p58, p59, p60, p61)
	local var71 = if not enableNewTreeCleanupPath then p59.alternate else nil
	local alternate = p59.alternate
	
	if alternate ~= nil then
		alternate.return_ = nil
		
		if not enableNewTreeCleanupPath then
			p59.alternate = nil
		end
	end
	p59.return_ = nil
	
	if not enableNewTreeCleanupPath and var71 ~= nil then
		local var72 = var71
		local alternate_1 = var72.alternate
		
		if alternate_1 ~= nil then
			alternate_1.return_ = nil
			
			if not enableNewTreeCleanupPath then
				var72.alternate = nil
			end
		end
		var72.return_ = nil
	end
end

local function commitWork(p62, p63) --[[ line: 1790 ]]
	-- upvalues: functionComponent (ref), forwardRef (ref), memoComponent (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startLayoutEffectTimer (ref), commitHookEffectListUnmount (ref), layout (ref), hasEffect (ref), describeError (ref), recordLayoutEffectDuration (ref), classComponent (ref), hostComponent (ref), commitUpdate (ref), hostText (ref), invariant (ref), commitTextUpdate (ref), hostRoot (ref), supportsHydration (ref), unimplemented (ref), profiler (ref), suspenseComponent (ref), suspenseListComponent (ref), incompleteClassComponent (ref), offscreenComponent (ref), legacyHiddenComponent (ref), hideOrUnhideAllChildren (ref)
	if p63.tag == functionComponent or p63.tag == forwardRef or (p63.tag == memoComponent or p63.tag == simpleMemoComponent) or p63.tag == block then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p63.mode, profileMode) ~= 0 then
			local ok, status = xpcall(function() --[[ line: 1879 ]]
				-- upvalues: startLayoutEffectTimer (copy), commitHookEffectListUnmount (copy), layout (copy), hasEffect (copy), p63 (ref)
				startLayoutEffectTimer()
				commitHookEffectListUnmount(bit32.bor(layout, hasEffect), p63, p63.return_)
			end, describeError)
			recordLayoutEffectDuration(p63)
			
			if ok then
				return
			else
				error(status)
				
				return
			end
		else
			commitHookEffectListUnmount(bit32.bor(layout, hasEffect), p63, p63.return_)
		end
	elseif p63.tag == classComponent then return end
	if p63.tag == hostComponent then
		local stateNode = p63.stateNode
		
		if stateNode ~= nil then
			local memoizedProps = p63.memoizedProps
			local var73 = if p62 then p62.memoizedProps else memoizedProps
			local type = p63.type
			local updateQueue = p63.updateQueue
			p63.updateQueue = nil
			
			if updateQueue ~= nil then
				commitUpdate(stateNode, updateQueue, type, var73, memoizedProps, p63)
			end
		end
		return
	elseif p63.tag == hostText then
		invariant(p63.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.")
		local stateNode = p63.stateNode
		local memoizedProps = p63.memoizedProps
		local var74 = nil
		
		if p62 ~= nil then
			local _ = p62.memoizedProps
			var74 = memoizedProps
		end
		commitTextUpdate(stateNode, var74, memoizedProps)
		
		return
	elseif p63.tag == hostRoot then
		if supportsHydration then
			local stateNode = p63.stateNode
			
			if stateNode.hydrate then
				stateNode.hydrate = false
				unimplemented("commitWork: HostRoot: commitHydratedContainer")
			end
		end
		return
	elseif p63.tag == profiler then return end
	if p63.tag == suspenseComponent then
		commitSuspenseComponent(p63)
		attachSuspenseRetryListeners(p63)
		
		return
	elseif p63.tag == suspenseListComponent then
		unimplemented("commitWork: SuspenseListComponent")
	elseif p63.tag == incompleteClassComponent then return end
	if p63.tag == offscreenComponent or p63.tag == legacyHiddenComponent then
		hideOrUnhideAllChildren(p63, p63.memoizedState ~= nil)
		
		return
	end
	invariant(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.")
end

function commitSuspenseComponent(p64) --[[ line: 2005 ]]
	-- upvalues: var11 (write), supportsMutation (ref), hideOrUnhideAllChildren (ref), enableSuspenseCallback (ref), dEV (ref), console (ref)
	local memoizedState = p64.memoizedState
	
	if memoizedState ~= nil then
		if not var11 then
			var11 = require(script.Parent["ReactFiberWorkLoop.new"])
		end
		var11.markCommitTimeOfFallback()
		
		if supportsMutation then
			hideOrUnhideAllChildren(p64.child, true)
		end
	end
	if enableSuspenseCallback and memoizedState ~= nil then
		local suspenseCallback = p64.memoizedProps.suspenseCallback
		
		if typeof(suspenseCallback) == "function" then
			local updateQueue = p64.updateQueue
			
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

function commitSuspenseHydrationCallbacks(p65, p66) --[[ line: 2044 ]]
	-- upvalues: supportsHydration (ref), commitHydratedSuspenseInstance (ref), enableSuspenseCallback (ref)
	if not supportsHydration then return end
	if p66.memoizedState == nil then
		local alternate = p66.alternate
		
		if alternate ~= nil then
			local memoizedState = alternate.memoizedState
			
			if memoizedState ~= nil then
				local dehydrated = memoizedState.dehydrated
				
				if dehydrated ~= nil then
					commitHydratedSuspenseInstance(dehydrated)
					
					if enableSuspenseCallback then
						local hydrationCallbacks = p65.hydrationCallbacks
						
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

function attachSuspenseRetryListeners(p67) --[[ line: 2072 ]]
	-- upvalues: set (ref), resolveRetryWakeable (ref), enableSchedulerTracing (ref), unstableWrap (ref)
	local updateQueue = p67.updateQueue
	
	if updateQueue ~= nil then
		p67.updateQueue = nil
		local stateNode = p67.stateNode
		
		if stateNode == nil then
			p67.stateNode = set.new()
			stateNode = p67.stateNode
		end
		for i, v in updateQueue do
			local var75 = function() --[[ line: 2086 ]]
				-- upvalues: resolveRetryWakeable (copy), p67 (ref), i (ref)
				return resolveRetryWakeable(p67, i)
			end
			
			if not stateNode:has(i) then
				if enableSchedulerTracing and i.__reactDoNotTraceInteractions ~= true then
					var75 = unstableWrap(var75)
				end
				stateNode:add(i)
				i:andThen(function() --[[ line: 2097 ]]
					-- upvalues: var75 (write)
					return var75()
				end, function() --[[ line: 2099 ]]
					-- upvalues: var75 (write)
					return var75()
				end)
			end
		end
	end
end

function isSuspenseBoundaryBeingHidden(p68, p69) --[[ line: 2110 ]]
	if p68 ~= nil then
		local memoizedState = p68.memoizedState
		
		if memoizedState ~= nil and memoizedState.dehydrated == nil then
			return false
		end
		local memoizedState_1 = p69.memoizedState
		
		return memoizedState_1 ~= nil and memoizedState_1.dehydrated == nil
	end
end

function commitResetTextContent(value) --[[ line: 2122 ]]
	-- upvalues: supportsMutation (ref), resetTextContent (ref)
	if supportsMutation then
		resetTextContent(value.stateNode)
		
		return
	end
end

local function commitPassiveUnmount(p70) --[[ line: 2129 ]]
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListUnmount (ref), passive (ref), hasEffect (ref), recordPassiveEffectDuration (ref)
	if p70.tag == functionComponent or p70.tag == forwardRef or (p70.tag == simpleMemoComponent or p70.tag == block) then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p70.mode, profileMode) ~= 0 then
			startPassiveEffectTimer()
			commitHookEffectListUnmount(bit32.bor(passive, hasEffect), p70, p70.return_)
			recordPassiveEffectDuration(p70)
			
			return
		end
		commitHookEffectListUnmount(bit32.bor(passive, hasEffect), p70, p70.return_)
	end
end

local function commitPassiveUnmountInsideDeletedTree(p71, p72) --[[ line: 2158 ]]
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListUnmount (ref), passive (ref), recordPassiveEffectDuration (ref)
	if p71.tag == functionComponent or p71.tag == forwardRef or (p71.tag == simpleMemoComponent or p71.tag == block) then
		if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(p71.mode, profileMode) ~= 0 then
			startPassiveEffectTimer()
			commitHookEffectListUnmount(passive, p71, p72)
			recordPassiveEffectDuration(p71)
			
			return
		end
		commitHookEffectListUnmount(passive, p71, p72)
	end
end

local function commitPassiveMount(p73, p74) --[[ line: 2182 ]]
	-- upvalues: functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), enableProfilerTimer (ref), enableProfilerCommitHooks (ref), profileMode (ref), startPassiveEffectTimer (ref), commitHookEffectListMount (ref), describeError (ref), passive (ref), hasEffect (ref), recordPassiveEffectDuration (ref), profiler (ref)
	if p74.tag == functionComponent or p74.tag == forwardRef or (p74.tag == simpleMemoComponent or p74.tag == block) then
		if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(p74.mode, profileMode) == 0 then
			commitHookEffectListMount(bit32.bor(passive, hasEffect), p74)
			
			return
		end
		startPassiveEffectTimer()
		local ok, status = xpcall(commitHookEffectListMount, describeError, bit32.bor(passive, hasEffect), p74)
		recordPassiveEffectDuration(p74)
		
		if ok then
			return
		else
			error(status)
			
			return
		end
	elseif p74.tag == profiler then
		commitProfilerPassiveEffect(p73, p74)
	end
end

function invokeLayoutEffectMountInDEV(p75) --[[ line: 2215 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListMount (ref), layout (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write), classComponent (ref)
	if dEV and enableDoubleInvokingEffects then
		if p75.tag ~= functionComponent and p75.tag ~= forwardRef and (p75.tag ~= simpleMemoComponent and p75.tag ~= block) then return end
		invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(layout, hasEffect), p75)
		
		if hasCaughtError() then
			captureCommitPhaseError(p75, p75.return_, clearCaughtError())
		end
		return
	elseif p75.tag ~= classComponent then return end
	local stateNode = p75.stateNode
	invokeGuardedCallback(nil, stateNode.componentDidMount, stateNode)
	
	if hasCaughtError() then
		captureCommitPhaseError(p75, p75.return_, clearCaughtError())
	end
	return
end

function invokePassiveEffectMountInDEV(p76) --[[ line: 2247 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListMount (ref), passive (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write)
	if not dEV or not enableDoubleInvokingEffects or p76.tag ~= functionComponent and p76.tag ~= forwardRef and (p76.tag ~= simpleMemoComponent and p76.tag ~= block) then return end
	invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(passive, hasEffect), p76)
	
	if hasCaughtError() then
		captureCommitPhaseError(p76, p76.return_, clearCaughtError())
	end
end

function invokeLayoutEffectUnmountInDEV(p77) --[[ line: 2271 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListUnmount (ref), layout (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write), classComponent (ref)
	if dEV and enableDoubleInvokingEffects then
		if p77.tag ~= functionComponent and p77.tag ~= forwardRef and (p77.tag ~= simpleMemoComponent and p77.tag ~= block) then return end
		invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(layout, hasEffect), p77, p77.return_)
		
		if hasCaughtError() then
			captureCommitPhaseError(p77, p77.return_, clearCaughtError())
		end
		return
	elseif p77.tag ~= classComponent then return end
	local stateNode = p77.stateNode
	
	if typeof(stateNode.componentWillUnmount) == "function" then
		safelyCallComponentWillUnmount(p77, stateNode, p77.return_)
	end
	return
end

function invokePassiveEffectUnmountInDEV(p78) --[[ line: 2302 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), functionComponent (ref), forwardRef (ref), simpleMemoComponent (ref), block (ref), invokeGuardedCallback (ref), commitHookEffectListUnmount (ref), passive (ref), hasEffect (ref), hasCaughtError (ref), clearCaughtError (ref), captureCommitPhaseError (write)
	if not dEV or not enableDoubleInvokingEffects or p78.tag ~= functionComponent and p78.tag ~= forwardRef and (p78.tag ~= simpleMemoComponent and p78.tag ~= block) then return end
	invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(passive, hasEffect), p78, p78.return_)
	
	if hasCaughtError() then
		captureCommitPhaseError(p78, p78.return_, clearCaughtError())
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