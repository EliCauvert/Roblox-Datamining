-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:36 2026 Pacific Standard Time.

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
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil

local var11 = function(...) --[[ line: 89 ]]
	-- upvalues: var8 (write), var7 (write)
	if not var8 then
		var7 = require(script.Parent["ReactFiberWorkLoop.new"])
		var8 = var7.markLegacyErrorBoundaryAsFailed
	end
	return var8(...)
end

local var12 = function(...) --[[ line: 104 ]]
	-- upvalues: var7 (write), var10 (write)
	if var7 == nil then
		var7 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var10 = var7.pingSuspendedRoot
	
	return var10(...)
end

local var13 = function(...) --[[ line: 111 ]]
	-- upvalues: var7 (write), var9 (write)
	if var7 == nil then
		var7 = require(script.Parent["ReactFiberWorkLoop.new"])
	end
	var9 = var7.isAlreadyFailedLegacyErrorBoundary
	
	return var9(...)
end

local logCapturedError = require(script.Parent.ReactFiberErrorLogger).logCapturedError
local logComponentSuspended = require(script.Parent.DebugTracing).logComponentSuspended
local markComponentSuspended = require(script.Parent.SchedulingProfiler).markComponentSuspended
local syncLane = reactFiberLaneModule.SyncLane
local noTimestamp = reactFiberLaneModule.NoTimestamp
local includesSomeLane = reactFiberLaneModule.includesSomeLane
local mergeLanes = reactFiberLaneModule.mergeLanes
local pickArbitraryLane = reactFiberLaneModule.pickArbitraryLane

function createRootErrorUpdate(p0, p1, p2, p3) --[[ line: 133 ]]
	-- upvalues: createUpdate (ref), noTimestamp (ref), captureUpdate (ref), object (ref), logCapturedError (ref)
	local var15 = createUpdate(noTimestamp, p2)
	var15.tag = captureUpdate
	var15.payload = { element = object.None }
	local value = p1.value
	
	function var15.callback() --[[ line: 147 ]]
		-- upvalues: p3 (ref), value (ref), logCapturedError (copy), p0 (ref), p1 (ref)
		if p3 ~= nil then
			p3(value)
		end
		logCapturedError(p0, p1)
	end
	
	return var15
end

function createClassErrorUpdate(p4, p5, p6) --[[ line: 156 ]]
	-- upvalues: createUpdate (ref), noTimestamp (ref), captureUpdate (ref), logCapturedError (ref), reactGlobalsModule (ref), markFailedErrorBoundaryForHotReloading (ref), var11 (ref), includesSomeLane (ref), syncLane (ref), console (ref), getComponentName (ref)
	local var16 = createUpdate(noTimestamp, p6)
	var16.tag = captureUpdate
	local getDerivedStateFromError = p4.type.getDerivedStateFromError
	
	if typeof(getDerivedStateFromError) == "function" then
		local value = p5.value
		
		function var16.payload() --[[ line: 166 ]]
			-- upvalues: logCapturedError (copy), p4 (ref), p5 (ref), getDerivedStateFromError (ref), value (ref)
			logCapturedError(p4, p5)
			
			return getDerivedStateFromError(value)
		end
	end
	local stateNode = p4.stateNode
	
	if stateNode ~= nil and typeof(stateNode.componentDidCatch) == "function" then
		function var16.callback() --[[ line: 174 ]]
			-- upvalues: reactGlobalsModule (copy), markFailedErrorBoundaryForHotReloading (copy), p4 (ref), getDerivedStateFromError (ref), var11 (copy), stateNode (ref), logCapturedError (copy), p5 (ref), includesSomeLane (copy), syncLane (copy), console (copy), getComponentName (copy)
			if reactGlobalsModule.__DEV__ then
				markFailedErrorBoundaryForHotReloading(p4)
			end
			if typeof(getDerivedStateFromError) ~= "function" then
				var11(stateNode)
				logCapturedError(p4, p5)
			end
			stateNode:componentDidCatch(p5.value, { componentStack = p5.stack or "" })
			
			if reactGlobalsModule.__DEV__ and typeof(getDerivedStateFromError) ~= "function" and not includesSomeLane(p4.lanes, syncLane) then
				console.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", getComponentName(p4.type) or "Unknown")
			end
		end
		
		return var16
	elseif reactGlobalsModule.__DEV__ then
		function var16.callback() --[[ line: 212 ]]
			-- upvalues: markFailedErrorBoundaryForHotReloading (copy), p4 (ref)
			markFailedErrorBoundaryForHotReloading(p4)
		end
	end
	return var16
end

local function attachPingListener(p7, p8, p9) --[[ line: 219 ]]
	-- upvalues: var12 (ref)
	local t
	local pingCache = p7.pingCache
	local _ = nil
	
	if pingCache == nil then
		t = {}
		p7.pingCache = { [p8] = t }
		pingCache = p7.pingCache
	else
		t = pingCache[p8]
		
		if t == nil then
			t = {}
			pingCache[p8] = t
		end
	end
	if not t[p9] then
		t[p9] = true
		
		local var18 = function() --[[ line: 247 ]]
			-- upvalues: var12 (copy), p7 (ref), p8 (ref), p9 (ref)
			return var12(p7, p8, p9)
		end
		
		p8:andThen(var18, var18)
	end
end

function throwException(p10, p11, p12, p13, p14, p15, p16) --[[ line: 254 ]]
	-- upvalues: incomplete (ref), reactGlobalsModule (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logComponentSuspended (ref), enableSchedulingProfiler (ref), markComponentSuspended (ref), blockingMode (ref), noMode (ref), hasSuspenseContext (ref), suspenseStackCursor (ref), invisibleParentSuspenseContext (ref), suspenseComponent (ref), shouldCaptureSuspense (ref), didCapture (ref), forceUpdateForLegacySuspense (ref), lifecycleEffectMask (ref), classComponent (ref), incompleteClassComponent (ref), createUpdate (ref), noTimestamp (ref), syncLane (ref), forceUpdate (ref), enqueueUpdate (ref), mergeLanes (ref), attachPingListener (ref), shouldCapture (ref), createCapturedValue (ref), hostRoot (ref), pickArbitraryLane (ref), enqueueCapturedUpdate (ref), noFlags (ref), var13 (ref)
	local var20, var21
	p12.flags = bit32.bor(p12.flags, incomplete)
	
	if p13 ~= nil and typeof(p13) == "table" and typeof(p13.andThen) == "function" then
		local var19 = p13
		
		if reactGlobalsModule.__DEV__ and enableDebugTracing and bit32.band(p12.mode, debugTracingMode) ~= 0 then
			logComponentSuspended(getComponentName(p12.type) or "Unknown", var19)
		end
		if enableSchedulingProfiler then
			markComponentSuspended(p12, var19)
		end
		if bit32.band(p12.mode, blockingMode) == noMode then
			local alternate = p12.alternate
			
			if alternate then
				p12.updateQueue = alternate.updateQueue
				p12.memoizedState = alternate.memoizedState
				p12.lanes = alternate.lanes
			else
				p12.updateQueue = nil
				p12.memoizedState = nil
			end
		end
		var20 = hasSuspenseContext(suspenseStackCursor.current, invisibleParentSuspenseContext)
		var21 = p11
		repeat
			if var21.tag ~= suspenseComponent or not shouldCaptureSuspense(var21, var20) then
				var21 = var21.return_
				continue
			end
			local updateQueue = var21.updateQueue
			
			if updateQueue == nil then
				var21.updateQueue = { [var19] = true }
			else
				updateQueue[var19] = true
			end
			if bit32.band(var21.mode, blockingMode) == noMode then
				var21.flags = bit32.bor(var21.flags, didCapture)
				p12.flags = bit32.bor(p12.flags, forceUpdateForLegacySuspense)
				p12.flags = bit32.band(p12.flags, bit32.bnot(bit32.bor(lifecycleEffectMask, incomplete)))
				
				if p12.tag == classComponent then
					if p12.alternate == nil then
						p12.tag = incompleteClassComponent
					else
						local var22 = createUpdate(noTimestamp, syncLane)
						var22.tag = forceUpdate
						enqueueUpdate(p12, var22)
					end
				end
				p12.lanes = mergeLanes(p12.lanes, syncLane)
				
				return
			else
				attachPingListener(p10, var19, p14)
				var21.flags = bit32.bor(var21.flags, shouldCapture)
				var21.lanes = p14
				
				return
			end
		until var21 == nil
		p13 = (getComponentName(p12.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n" .. "\n" .. "Add a <Suspense fallback=...> component higher in the tree to " .. "provide a loading indicator or placeholder to display."
	end
	p16()
	local var23 = createCapturedValue(p13, p12)
	local var24 = p11
	repeat
		if var24.tag ~= hostRoot then
			if var24.tag == classComponent then
				var20 = var23
				var21 = var24.type
				local stateNode = var24.stateNode
				
				if bit32.band(var24.flags, didCapture) ~= noFlags or typeof(var21.getDerivedStateFromError) ~= "function" and (stateNode == nil or typeof(stateNode.componentDidCatch) ~= "function" or var13(stateNode)) then
					var24 = var24.return_
					continue
				end
				var24.flags = bit32.bor(var24.flags, shouldCapture)
				local var25 = pickArbitraryLane(p14)
				var24.lanes = mergeLanes(var24.lanes, var25)
				enqueueCapturedUpdate(var24, createClassErrorUpdate(var24, var20, var25))
				
				return
			end
		end
		var20 = var23
		var24.flags = bit32.bor(var24.flags, shouldCapture)
		var21 = pickArbitraryLane(p14)
		var24.lanes = mergeLanes(var24.lanes, var21)
		enqueueCapturedUpdate(var24, createRootErrorUpdate(var24, var20, var21, p15))
		
		return
	until var24 == nil
end

return {
	throwException = throwException,
	createRootErrorUpdate = createRootErrorUpdate,
	createClassErrorUpdate = createClassErrorUpdate
}