local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local object = require(parent.LuauPolyfill).Object
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent.ReactCapturedValue)
local unknownModule = require(script.Parent["ReactUpdateQueue.new"])
local _ = require(parent.Shared)
local unknownModule_1 = require(script.Parent["ReactFiberSuspenseContext.new"])
local getComponentName = require(parent.Shared).getComponentName
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local incompleteClassComponent = reactWorkTagsModule.IncompleteClassComponent
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local didCapture = reactFiberFlagsModule.DidCapture
local incomplete = reactFiberFlagsModule.Incomplete
local noFlags = reactFiberFlagsModule.NoFlags
local shouldCapture = reactFiberFlagsModule.ShouldCapture
local lifecycleEffectMask = reactFiberFlagsModule.LifecycleEffectMask
local forceUpdateForLegacySuspense = reactFiberFlagsModule.ForceUpdateForLegacySuspense
local shouldCaptureSuspense = require(script.Parent["ReactFiberSuspenseComponent.new"]).shouldCaptureSuspense
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local noMode = reactTypeOfModeModule.NoMode
local blockingMode = reactTypeOfModeModule.BlockingMode
local debugTracingMode = reactTypeOfModeModule.DebugTracingMode
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableDebugTracing = reactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = reactFeatureFlags.enableSchedulingProfiler
local createCapturedValue = require(script.Parent.ReactCapturedValue).createCapturedValue
local enqueueCapturedUpdate = unknownModule.enqueueCapturedUpdate
local createUpdate = unknownModule.createUpdate
local captureUpdate = unknownModule.CaptureUpdate
local forceUpdate = unknownModule.ForceUpdate
local enqueueUpdate = unknownModule.enqueueUpdate
local markFailedErrorBoundaryForHotReloading = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading
local hasSuspenseContext = unknownModule_1.hasSuspenseContext
local invisibleParentSuspenseContext = unknownModule_1.InvisibleParentSuspenseContext
local suspenseStackCursor = unknownModule_1.suspenseStackCursor
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil

local var5 = function(...)
	-- upvalues: var2 (write), var1 (write)
	if not var2 then
		var1 = require(script.Parent["ReactFiberWorkLoop.new"])
		var2 = var1.markLegacyErrorBoundaryAsFailed
	end
	return var2(...)
end

local var6 = function(...)
	-- upvalues: var1 (write), var4 (write)
	if var1 == nil then
		var1 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var4 = var1.pingSuspendedRoot
	
	return var4(...)
end

local var7 = function(...)
	-- upvalues: var1 (write), var3 (write)
	if var1 == nil then
		var1 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var3 = var1.isAlreadyFailedLegacyErrorBoundary
	
	return var3(...)
end

local logCapturedError = require(script.Parent.ReactFiberErrorLogger).logCapturedError
local logComponentSuspended = require(script.Parent.DebugTracing).logComponentSuspended
local markComponentSuspended = require(script.Parent.SchedulingProfiler).markComponentSuspended
local syncLane = reactFiberLaneModule.SyncLane
local noTimestamp = reactFiberLaneModule.NoTimestamp
local includesSomeLane = reactFiberLaneModule.includesSomeLane
local mergeLanes = reactFiberLaneModule.mergeLanes
local pickArbitraryLane = reactFiberLaneModule.pickArbitraryLane

function createRootErrorUpdate(p1, p2, p3, p4)
	-- upvalues: createUpdate (ref), noTimestamp (ref), captureUpdate (ref), object (ref), logCapturedError (ref)
	local var8 = createUpdate(noTimestamp, p3)
	var8.tag = captureUpdate
	var8.payload = { element = object.None }
	local value = p2.value
	
	function var15.callback()
		-- upvalues: p4 (ref), value (ref), logCapturedError (copy), p1 (ref), p2 (ref)
		if p4 ~= nil then
			p4(value)
		end
		logCapturedError(p1, p2)
	end
	
	return var8
end

function createClassErrorUpdate(p1, p2, p3)
	-- upvalues: createUpdate (ref), noTimestamp (ref), captureUpdate (ref), logCapturedError (ref), reactGlobalsModule (ref), markFailedErrorBoundaryForHotReloading (ref), var5 (ref), includesSomeLane (ref), syncLane (ref), console (ref), getComponentName (ref)
	local var8 = createUpdate(noTimestamp, p3)
	var8.tag = captureUpdate
	local getDerivedStateFromError = p1.type.getDerivedStateFromError
	
	if typeof(getDerivedStateFromError) == "function" then
		local value = p2.value
		
		function var16.payload()
			-- upvalues: logCapturedError (copy), p1 (ref), p2 (ref), getDerivedStateFromError (ref), value (ref)
			logCapturedError(p1, p2)
			
			return getDerivedStateFromError(value)
		end
	end
	local stateNode = p1.stateNode
	
	if stateNode ~= nil and typeof(stateNode.componentDidCatch) == "function" then
		function var16.callback()
			-- upvalues: reactGlobalsModule (copy), markFailedErrorBoundaryForHotReloading (copy), p1 (ref), getDerivedStateFromError (ref), var5 (copy), stateNode (ref), logCapturedError (copy), p2 (ref), includesSomeLane (copy), syncLane (copy), console (copy), getComponentName (copy)
			if reactGlobalsModule.__DEV__ then
				markFailedErrorBoundaryForHotReloading(p1)
			end
			if typeof(getDerivedStateFromError) ~= "function" then
				var5(stateNode)
				logCapturedError(p1, p2)
			end
			stateNode:componentDidCatch(p2.value, { componentStack = p2.stack or "" })
			
			if reactGlobalsModule.__DEV__ and typeof(getDerivedStateFromError) ~= "function" and not includesSomeLane(p1.lanes, syncLane) then
				console.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", getComponentName(p1.type) or "Unknown")
			end
		end
		
		return var8
	elseif reactGlobalsModule.__DEV__ then
		function var16.callback()
			-- upvalues: markFailedErrorBoundaryForHotReloading (copy), p1 (ref)
			markFailedErrorBoundaryForHotReloading(p1)
		end
	end
	return var8
end

local function attachPingListener(p1, p2, p3)
	-- upvalues: var6 (ref)
	local t
	local pingCache = p1.pingCache
	local _ = nil
	
	if pingCache == nil then
		t = {}
		p1.pingCache = { [p2] = t }
		pingCache = p1.pingCache
	else
		t = pingCache[p2]
		
		if t == nil then
			t = {}
			pingCache[p2] = t
		end
	end
	if not t[p3] then
		t[p3] = true
		
		local var8 = function()
			-- upvalues: var6 (copy), p1 (ref), p2 (ref), p3 (ref)
			return var6(p1, p2, p3)
		end
		
		p2:andThen(var8, var8)
	end
end

function throwException(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: incomplete (ref), reactGlobalsModule (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logComponentSuspended (ref), enableSchedulingProfiler (ref), markComponentSuspended (ref), blockingMode (ref), noMode (ref), hasSuspenseContext (ref), suspenseStackCursor (ref), invisibleParentSuspenseContext (ref), suspenseComponent (ref), shouldCaptureSuspense (ref), didCapture (ref), forceUpdateForLegacySuspense (ref), lifecycleEffectMask (ref), classComponent (ref), incompleteClassComponent (ref), createUpdate (ref), noTimestamp (ref), syncLane (ref), forceUpdate (ref), enqueueUpdate (ref), mergeLanes (ref), attachPingListener (ref), shouldCapture (ref), createCapturedValue (ref), hostRoot (ref), pickArbitraryLane (ref), enqueueCapturedUpdate (ref), noFlags (ref), var7 (ref)
	local var8, var9
	p3.flags = bit32.bor(p3.flags, incomplete)
	
	if p4 ~= nil and typeof(p4) == "table" and typeof(p4.andThen) == "function" then
		local var10 = p4
		
		if reactGlobalsModule.__DEV__ and enableDebugTracing and bit32.band(p3.mode, debugTracingMode) ~= 0 then
			logComponentSuspended(getComponentName(p3.type) or "Unknown", var10)
		end
		if enableSchedulingProfiler then
			markComponentSuspended(p3, var10)
		end
		if bit32.band(p3.mode, blockingMode) == noMode then
			local alternate = p3.alternate
			
			if alternate then
				p3.updateQueue = alternate.updateQueue
				p3.memoizedState = alternate.memoizedState
				p3.lanes = alternate.lanes
			else
				p3.updateQueue = nil
				p3.memoizedState = nil
			end
		end
		var8 = hasSuspenseContext(suspenseStackCursor.current, invisibleParentSuspenseContext)
		var9 = p2
		repeat
			if var9.tag ~= suspenseComponent or not shouldCaptureSuspense(var9, var8) then
				var9 = var9.return_
				continue
			end
			local updateQueue = var9.updateQueue
			
			if updateQueue == nil then
				var9.updateQueue = { [var10] = true }
			else
				updateQueue[var10] = true
			end
			if bit32.band(var9.mode, blockingMode) == noMode then
				var9.flags = bit32.bor(var9.flags, didCapture)
				p3.flags = bit32.bor(p3.flags, forceUpdateForLegacySuspense)
				p3.flags = bit32.band(p3.flags, bit32.bnot(bit32.bor(lifecycleEffectMask, incomplete)))
				
				if p3.tag == classComponent then
					if p3.alternate == nil then
						p3.tag = incompleteClassComponent
					else
						local var11 = createUpdate(noTimestamp, syncLane)
						var11.tag = forceUpdate
						enqueueUpdate(p3, var11)
					end
				end
				p3.lanes = mergeLanes(p3.lanes, syncLane)
				
				return
			else
				attachPingListener(p1, var10, p5)
				var9.flags = bit32.bor(var9.flags, shouldCapture)
				var9.lanes = p5
				
				return
			end
		until var9 == nil
		p4 = (getComponentName(p3.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n" .. "\n" .. "Add a <Suspense fallback=...> component higher in the tree to " .. "provide a loading indicator or placeholder to display."
	end
	p7()
	local var12 = createCapturedValue(p4, p3)
	local var13 = p2
	repeat
		if var13.tag ~= hostRoot then
			if var13.tag == classComponent then
				var8 = var12
				var9 = var13.type
				local stateNode = var13.stateNode
				
				if bit32.band(var13.flags, didCapture) ~= noFlags or typeof(var9.getDerivedStateFromError) ~= "function" and (stateNode == nil or typeof(stateNode.componentDidCatch) ~= "function" or var7(stateNode)) then
					var13 = var13.return_
					continue
				end
				var13.flags = bit32.bor(var13.flags, shouldCapture)
				local var14 = pickArbitraryLane(p5)
				var13.lanes = mergeLanes(var13.lanes, var14)
				enqueueCapturedUpdate(var13, createClassErrorUpdate(var13, var8, var14))
				
				return
			end
		end
		var8 = var12
		var13.flags = bit32.bor(var13.flags, shouldCapture)
		var9 = pickArbitraryLane(p5)
		var13.lanes = mergeLanes(var13.lanes, var9)
		enqueueCapturedUpdate(var13, createRootErrorUpdate(var13, var8, var9, p6))
		
		return
	until var13 == nil
end

return {
	throwException = throwException,
	createRootErrorUpdate = createRootErrorUpdate,
	createClassErrorUpdate = createClassErrorUpdate
}