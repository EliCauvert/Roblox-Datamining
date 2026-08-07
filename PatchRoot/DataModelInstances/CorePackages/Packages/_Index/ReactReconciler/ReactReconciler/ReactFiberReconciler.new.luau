-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:35 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local dEV = reactGlobalsModule.__DEV__
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local reactRootTagsModule = require(script.Parent.ReactRootTags)
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local _ = require(script.Parent.ReactFiberHostConfig)
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local fundamentalComponent = reactWorkTagsModule.FundamentalComponent
local _ = require(parent.Shared)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local reactFiberTreeReflectionModule = require(script.Parent.ReactFiberTreeReflection)
local findCurrentHostFiber = reactFiberTreeReflectionModule.findCurrentHostFiber
local findCurrentHostFiberWithNoPortals = reactFiberTreeReflectionModule.findCurrentHostFiberWithNoPortals
local get = require(parent.Shared).ReactInstanceMap.get
local hostComponent = reactWorkTagsModule.HostComponent
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local getComponentName = require(parent.Shared).getComponentName
local invariant = require(parent.Shared).invariant
local describeError = require(parent.Shared).describeError
local enableSchedulingProfiler = require(parent.Shared).ReactFeatureFlags.enableSchedulingProfiler
local reactSharedInternals = require(parent.Shared).ReactSharedInternals
local getPublicInstance = require(script.Parent.ReactFiberHostConfig).getPublicInstance
local unknownModule = require(script.Parent["ReactFiberContext.new"])
local findCurrentUnmaskedContext = unknownModule.findCurrentUnmaskedContext
local processChildContext = unknownModule.processChildContext
local emptyContextObject = unknownModule.emptyContextObject
local isContextProvider = unknownModule.isContextProvider
local createFiberRoot = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot
local unknownModule_1 = require(script.Parent["ReactFiberDevToolsHook.new"])
local injectInternals = unknownModule_1.injectInternals
local onScheduleRoot = unknownModule_1.onScheduleRoot
local unknownModule_2 = require(script.Parent["ReactFiberWorkLoop.new"])
local requestEventTime = unknownModule_2.requestEventTime
local requestUpdateLane = unknownModule_2.requestUpdateLane
local scheduleUpdateOnFiber = unknownModule_2.scheduleUpdateOnFiber
local flushRoot = unknownModule_2.flushRoot
local batchedEventUpdates = unknownModule_2.batchedEventUpdates
local batchedUpdates = unknownModule_2.batchedUpdates
local unbatchedUpdates = unknownModule_2.unbatchedUpdates
local flushSync = unknownModule_2.flushSync
local flushControlled = unknownModule_2.flushControlled
local deferredUpdates = unknownModule_2.deferredUpdates
local discreteUpdates = unknownModule_2.discreteUpdates
local flushDiscreteUpdates = unknownModule_2.flushDiscreteUpdates
local flushPassiveEffects = unknownModule_2.flushPassiveEffects
local warnIfNotScopedWithMatchingAct = unknownModule_2.warnIfNotScopedWithMatchingAct
local warnIfUnmockedScheduler = unknownModule_2.warnIfUnmockedScheduler
local isThisRendererActing = unknownModule_2.IsThisRendererActing
local act = unknownModule_2.act
local unknownModule_3 = require(script.Parent["ReactUpdateQueue.new"])
local createUpdate = unknownModule_3.createUpdate
local enqueueUpdate = unknownModule_3.enqueueUpdate
local reactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local isRendering = reactCurrentFiberModule.isRendering
local resetCurrentFiber = reactCurrentFiberModule.resetCurrentFiber
local setCurrentFiber = reactCurrentFiberModule.setCurrentFiber
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local strictMode = reactTypeOfModeModule.StrictMode
local syncLane = reactFiberLaneModule.SyncLane
local inputDiscreteHydrationLane = reactFiberLaneModule.InputDiscreteHydrationLane
local selectiveHydrationLane = reactFiberLaneModule.SelectiveHydrationLane
local noTimestamp = reactFiberLaneModule.NoTimestamp
local getHighestPriorityPendingLanes = reactFiberLaneModule.getHighestPriorityPendingLanes
local higherPriorityLane = reactFiberLaneModule.higherPriorityLane
local getCurrentUpdateLanePriority = reactFiberLaneModule.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = reactFiberLaneModule.setCurrentUpdateLanePriority
local unknownModule_4 = require(script.Parent["ReactFiberHotReloading.new"])
local scheduleRefresh = unknownModule_4.scheduleRefresh
local scheduleRoot = unknownModule_4.scheduleRoot
local setRefreshHandler = unknownModule_4.setRefreshHandler
local findHostInstancesForRefresh = unknownModule_4.findHostInstancesForRefresh
local schedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local markRenderScheduled = schedulingProfilerModule.markRenderScheduled
local t = {
	ReactRootTags = reactRootTagsModule,
	ReactWorkTags = reactWorkTagsModule,
	ReactTypeOfMode = reactTypeOfModeModule,
	ReactFiberFlags = reactFiberFlagsModule,
	getNearestMountedFiber = reactFiberTreeReflectionModule.getNearestMountedFiber,
	findCurrentFiberUsingSlowPath = reactFiberTreeReflectionModule.findCurrentFiberUsingSlowPath,
	createPortal = require(script.Parent.ReactPortal).createPortal
}
local var16 = nil
local t_1 = nil

if dEV then
	var16 = false
	t_1 = {}
end
local function _(p0) --[[ line: 181 | named "getContextForSubtree" ]]
	-- upvalues: emptyContextObject (ref), get (ref), findCurrentUnmaskedContext (ref), classComponent (ref), isContextProvider (ref), processChildContext (ref)
	if not p0 then
		return emptyContextObject
	end
	local var34 = get(p0)
	local var35 = findCurrentUnmaskedContext(var34)
	
	if var34.tag == classComponent then
		local type = var34.type
		
		return if isContextProvider(type) then processChildContext(var34, type, var35) else var35
	end
end

local function findHostInstance(p1) --[[ line: 199 ]]
	-- upvalues: get (ref), invariant (ref), object (ref), findCurrentHostFiber (ref)
	local var36 = get(p1)
	
	if var36 == nil then
		if typeof(p1.render) == "function" then
			invariant(false, "Unable to find node on an unmounted component.")
		else
			invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(object.keys(p1)))
		end
	end
	local var37 = findCurrentHostFiber(var36)
	
	return if var37 == nil then nil else var37.stateNode
end

local function findHostInstanceWithWarning(p2, p3) --[[ line: 220 ]]
	-- upvalues: dEV (ref), get (ref), invariant (ref), object (ref), findCurrentHostFiber (ref), strictMode (ref), getComponentName (ref), t_1 (write), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), describeError (ref), resetCurrentFiber (ref), findHostInstance (ref)
	if not dEV then
		return findHostInstance(p2)
	end
	local var38 = get(p2)
	
	if var38 == nil then
		if typeof(p2.render) == "function" then
			invariant(false, "Unable to find node on an unmounted component.")
		else
			invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(object.keys(p2)))
		end
	end
	local var39 = findCurrentHostFiber(var38)
	
	if var39 == nil then
		return nil
	elseif bit32.band(var39.mode, strictMode) ~= 0 then
		local type = getComponentName(var38.type) or "Component"
		
		if not t_1[type] then
			t_1[type] = true
			local current = reactCurrentFiberModule.current
			local ok, status = xpcall(function() --[[ line: 248 ]]
				-- upvalues: setCurrentFiber (copy), var39 (ref), var38 (ref), strictMode (copy), console (copy), p3 (ref), type (ref)
				setCurrentFiber(var39)
				
				if bit32.band(var38.mode, strictMode) == 0 then
					console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p3, p3, type)
					
					return
				end
				console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p3, p3, type)
			end, describeError)
			
			if current then
				setCurrentFiber(current)
			else
				resetCurrentFiber()
			end
			if not ok then
				error(status)
			end
		end
	end
	return var39.stateNode
end

function t.createContainer(p4, p5, p6, p7) --[[ line: 293 ]]
	-- upvalues: createFiberRoot (ref)
	return createFiberRoot(p4, p5, p6, p7)
end

function t.updateContainer(p8, p9, p10, p11) --[[ line: 302 ]]
	-- upvalues: dEV (ref), onScheduleRoot (ref), requestEventTime (ref), reactGlobalsModule (ref), warnIfUnmockedScheduler (ref), warnIfNotScopedWithMatchingAct (ref), requestUpdateLane (ref), enableSchedulingProfiler (ref), markRenderScheduled (ref), emptyContextObject (ref), get (ref), findCurrentUnmaskedContext (ref), classComponent (ref), isContextProvider (ref), processChildContext (ref), isRendering (ref), reactCurrentFiberModule (ref), var16 (write), console (ref), getComponentName (ref), createUpdate (ref), object (ref), enqueueUpdate (ref), scheduleUpdateOnFiber (ref)
	if dEV then
		onScheduleRoot(p9, p8)
	end
	local current = p9.current
	local var41 = requestEventTime()
	
	if dEV and reactGlobalsModule.__TESTEZ_RUNNING_TEST__ then
		warnIfUnmockedScheduler(current)
		warnIfNotScopedWithMatchingAct(current)
	end
	local var43, var44
	local var42 = requestUpdateLane(current)
	
	if enableSchedulingProfiler then
		markRenderScheduled(var42)
	end
	if p10 then
		var44 = get(p10)
		local var45 = findCurrentUnmaskedContext(var44)
		
		if var44.tag == classComponent then
			local type = var44.type
			var43 = if isContextProvider(type) then processChildContext(var44, type, var45) else var45
		end
	else
		var43 = emptyContextObject
	end
	if p9.context == nil then
		p9.context = var43
	else
		p9.pendingContext = var43
	end
	if dEV and isRendering and (reactCurrentFiberModule.current ~= nil and not var16) then
		var16 = true
		console.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", getComponentName(reactCurrentFiberModule.current.type) or "Unknown")
	end
	var44 = createUpdate(var41, var42)
	
	if p8 == nil then
		p8 = object.None
	end
	var44.payload = { element = p8 }
	
	if p11 ~= nil then
		if dEV and typeof(p11) ~= "function" then
			console.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", tostring(p11))
		end
		var44.callback = p11
	end
	enqueueUpdate(current, var44)
	scheduleUpdateOnFiber(current, var42, var41)
	
	return var42
end

t.batchedEventUpdates = batchedEventUpdates
t.batchedUpdates = batchedUpdates
t.unbatchedUpdates = unbatchedUpdates
t.deferredUpdates = deferredUpdates
t.discreteUpdates = discreteUpdates
t.flushDiscreteUpdates = flushDiscreteUpdates
t.flushControlled = flushControlled
t.flushSync = flushSync
t.flushPassiveEffects = flushPassiveEffects
t.IsThisRendererActing = isThisRendererActing
t.act = act

function t.getPublicRootInstance(p12) --[[ line: 397 ]]
	-- upvalues: hostComponent (ref), getPublicInstance (ref)
	local current = p12.current
	
	return if current.child then if current.child.tag == hostComponent then getPublicInstance(current.child.stateNode) else current.child.stateNode else nil
end

local var20 = nil

function t.attemptSynchronousHydration(p13) --[[ line: 414 ]]
	-- upvalues: hostRoot (ref), getHighestPriorityPendingLanes (ref), flushRoot (ref), suspenseComponent (ref), requestEventTime (ref), flushSync (ref), scheduleUpdateOnFiber (ref), syncLane (ref), inputDiscreteHydrationLane (ref), var20 (write)
	if p13.tag == hostRoot then
		local stateNode = p13.stateNode
		
		if stateNode.hydrate then
			flushRoot(stateNode, getHighestPriorityPendingLanes(stateNode))
			
			return
		end
	elseif p13.tag == suspenseComponent then
		local var46 = requestEventTime()
		flushSync(function() --[[ line: 424 ]]
			-- upvalues: scheduleUpdateOnFiber (copy), p13 (ref), syncLane (copy), var46 (ref)
			return scheduleUpdateOnFiber(p13, syncLane, var46)
		end)
		var20(p13, inputDiscreteHydrationLane)
	end
end

local _ = function(p14, p15) --[[ line: 435 | named "markRetryLaneImpl" ]]
	-- upvalues: higherPriorityLane (ref)
	local memoizedState = p14.memoizedState
	
	if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
		memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p15)
	end
end

var20 = function(p16, p17) --[[ line: 446 ]]
	-- upvalues: higherPriorityLane (ref)
	local memoizedState = p16.memoizedState
	
	if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
		memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p17)
	end
	local alternate = p16.alternate
	
	if alternate then
		local memoizedState_1 = alternate.memoizedState
		
		if memoizedState_1 and memoizedState_1 ~= nil and memoizedState_1.dehydrated ~= nil then
			memoizedState_1.retryLane = higherPriorityLane(memoizedState_1.retryLane, p17)
		end
	end
end

function t.attemptUserBlockingHydration(p18) --[[ line: 455 ]]
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), inputDiscreteHydrationLane (ref), scheduleUpdateOnFiber (ref), var20 (write)
	if p18.tag == suspenseComponent then
		scheduleUpdateOnFiber(p18, inputDiscreteHydrationLane, requestEventTime())
		var20(p18, inputDiscreteHydrationLane)
		
		return
	end
end

function t.attemptContinuousHydration(p19) --[[ line: 469 ]]
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), selectiveHydrationLane (ref), scheduleUpdateOnFiber (ref), var20 (write)
	if p19.tag == suspenseComponent then
		scheduleUpdateOnFiber(p19, selectiveHydrationLane, requestEventTime())
		var20(p19, selectiveHydrationLane)
		
		return
	end
end

function t.attemptHydrationAtCurrentPriority(p20) --[[ line: 483 ]]
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), requestUpdateLane (ref), scheduleUpdateOnFiber (ref), var20 (write)
	if p20.tag == suspenseComponent then
		local var47 = requestUpdateLane(p20)
		scheduleUpdateOnFiber(p20, var47, requestEventTime())
		var20(p20, var47)
		
		return
	end
end

function t.runWithPriority(p21, p22) --[[ line: 495 ]]
	-- upvalues: getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), describeError (ref)
	local var48 = getCurrentUpdateLanePriority()
	setCurrentUpdateLanePriority(p21)
	local ok, status = xpcall(p22, describeError)
	setCurrentUpdateLanePriority(var48)
	
	if not ok then
		error(status)
	end
	return status
end

t.getCurrentUpdateLanePriority = getCurrentUpdateLanePriority
t.findHostInstance = findHostInstance
t.findHostInstanceWithWarning = findHostInstanceWithWarning

function t.findHostInstanceWithNoPortals(p23) --[[ line: 513 ]]
	-- upvalues: findCurrentHostFiberWithNoPortals (ref), fundamentalComponent (ref)
	local var49 = findCurrentHostFiberWithNoPortals(p23)
	
	return if var49 == nil then nil elseif var49.tag == fundamentalComponent then var49.stateNode.instance else var49.stateNode
end

local function shouldSuspendImpl(_) --[[ line: 524 ]]
	return false
end

function t.shouldSuspend(p24) --[[ line: 528 ]]
	-- upvalues: shouldSuspendImpl (write)
	return shouldSuspendImpl(p24)
end

local var22 = nil
local var23 = nil
local var24 = nil
local var25 = nil
local var26 = nil
local var27 = nil
local var28 = nil
local var29 = nil

if dEV then
	local function copyWithDeleteImpl(p25, p26, p27) --[[ line: 543 ]]
		-- upvalues: array (ref), copyWithDeleteImpl (ref)
		local var50 = p26[p27]
		local var51 = if array.isArray(p25) then array.slice(p25) else table.clone(p25)
		
		if p27 + 1 ~= #p26 then
			var51[var50] = copyWithDeleteImpl(p25[var50], p26, p27 + 1)
			
			return var51
		elseif array.isArray(var51) then
			array.splice(var51, var50, 1)
			
			return var51
		end
		var51[var50] = nil
		
		return var51
	end
	
	local _ = function(p28, p29) --[[ line: 571 | named "copyWithDelete" ]]
		-- upvalues: copyWithDeleteImpl (ref)
		return copyWithDeleteImpl(p28, p29, 0)
	end
	
	local function copyWithRenameImpl(p30, p31, p32, p33) --[[ line: 579 ]]
		-- upvalues: array (ref), copyWithRenameImpl (ref)
		local var52 = p31[p33]
		local var53 = if array.isArray(p30) then array.slice(p30) else table.clone(p30)
		
		if p33 + 1 ~= #p31 then
			var53[var52] = copyWithRenameImpl(p30[var52], p31, p32, p33 + 1)
			
			return var53
		end
		var53[p32[p33]] = var53[var52]
		
		if array.isArray(var53) then
			array.splice(var53, var52, 1)
			
			return var53
		end
		var53[var52] = nil
		
		return var53
	end
	
	local function copyWithRename(p34, p35, p36) --[[ line: 615 ]]
		-- upvalues: console (ref), copyWithRenameImpl (ref)
		if #p35 ~= #p36 then
			console.warn("copyWithRename() expects paths of the same length")
			
			return nil
		end
		for i = 1, #p36 do
			if p35[i] == p36[i] then
				continue
			end
			console.warn("copyWithRename() expects paths to be the same except for the deepest key")
			
			return nil
		end
		return copyWithRenameImpl(p34, p35, p36, 0)
	end
	
	local function copyWithSetImpl(value, p37, p38, p39) --[[ line: 637 ]]
		-- upvalues: array (ref), copyWithSetImpl (ref)
		if #p37 + 1 <= p38 then
			return p39
		end
		local var54 = p37[p38]
		local var55 = if array.isArray(value) then array.slice(value) else table.clone(value)
		var55[var54] = copyWithSetImpl(value[var54], p37, p38 + 2, p39)
		
		return var55
	end
	
	local _ = function(value, p40, p41) --[[ line: 659 | named "copyWithSet" ]]
		-- upvalues: copyWithSetImpl (ref)
		return copyWithSetImpl(value, p40, 1, p41)
	end
	
	local _ = function(p42, p43) --[[ line: 667 | named "findHook" ]]
		local memoizedState = p42.memoizedState
		while memoizedState ~= nil and p43 > 1 do
			memoizedState = memoizedState.next
			p43 -= 1
		end
		return memoizedState
	end
	
	var22 = function(p44, p45, p46, p47) --[[ line: 679 ]]
		-- upvalues: copyWithSetImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var56 = p45
		local memoizedState = p44.memoizedState
		while memoizedState ~= nil and var56 > 1 do
			memoizedState = memoizedState.next
			var56 -= 1
		end
		if memoizedState ~= nil then
			local var57 = copyWithSetImpl(memoizedState.memoizedState, p46, 1, p47)
			memoizedState.memoizedState = var57
			memoizedState.baseState = var57
			p44.memoizedProps = table.clone(p44.memoizedProps)
			scheduleUpdateOnFiber(p44, syncLane, noTimestamp)
		end
	end
	
	var23 = function(p48, p49, p50) --[[ line: 701 ]]
		-- upvalues: copyWithDeleteImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var58 = p49
		local memoizedState = p48.memoizedState
		while memoizedState ~= nil and var58 > 1 do
			memoizedState = memoizedState.next
			var58 -= 1
		end
		if memoizedState ~= nil then
			local var59 = copyWithDeleteImpl(memoizedState.memoizedState, p50, 0)
			memoizedState.memoizedState = var59
			memoizedState.baseState = var59
			p48.memoizedProps = table.clone(p48.memoizedProps)
			scheduleUpdateOnFiber(p48, syncLane, noTimestamp)
		end
	end
	
	var24 = function(p51, p52, p53, p54) --[[ line: 722 ]]
		-- upvalues: copyWithRename (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var60 = p52
		local memoizedState = p51.memoizedState
		while memoizedState ~= nil and var60 > 1 do
			memoizedState = memoizedState.next
			var60 -= 1
		end
		if memoizedState ~= nil then
			local var61 = copyWithRename(memoizedState.memoizedState, p53, p54)
			memoizedState.memoizedState = var61
			memoizedState.baseState = var61
			p51.memoizedProps = table.clone(p51.memoizedProps)
			scheduleUpdateOnFiber(p51, syncLane, noTimestamp)
		end
	end
	
	var25 = function(p55, p56, p57) --[[ line: 746 ]]
		-- upvalues: copyWithSetImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p55.pendingProps = copyWithSetImpl(p55.memoizedProps, p56, 1, p57)
		local alternate = p55.alternate
		
		if alternate then
			alternate.pendingProps = p55.pendingProps
		end
		scheduleUpdateOnFiber(p55, syncLane, noTimestamp)
	end
	
	var26 = function(p58, p59) --[[ line: 755 ]]
		-- upvalues: copyWithDeleteImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p58.pendingProps = copyWithDeleteImpl(p58.memoizedProps, p59, 0)
		local alternate = p58.alternate
		
		if alternate then
			alternate.pendingProps = p58.pendingProps
		end
		scheduleUpdateOnFiber(p58, syncLane, noTimestamp)
	end
	
	var27 = function(p60, p61, p62) --[[ line: 764 ]]
		-- upvalues: copyWithRename (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p60.pendingProps = copyWithRename(p60.memoizedProps, p61, p62)
		local alternate = p60.alternate
		
		if alternate then
			alternate.pendingProps = p60.pendingProps
		end
		scheduleUpdateOnFiber(p60, syncLane, noTimestamp)
	end
	
	var28 = function(p63) --[[ line: 778 ]]
		-- upvalues: scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		scheduleUpdateOnFiber(p63, syncLane, noTimestamp)
	end
	
	var29 = function(p64) --[[ line: 782 ]]
		-- upvalues: shouldSuspendImpl (write)
		shouldSuspendImpl = p64
	end
end
function findHostInstanceByFiber(p65) --[[ line: 787 ]]
	-- upvalues: findCurrentHostFiber (ref)
	local var62 = findCurrentHostFiber(p65)
	
	return if var62 == nil then nil else var62.stateNode
end

function emptyFindFiberByHostInstance(_) --[[ line: 795 ]]
	return nil
end

function getCurrentFiberForDevTools() --[[ line: 799 ]]
	-- upvalues: reactCurrentFiberModule (ref)
	return reactCurrentFiberModule.current
end

function t.injectIntoDevTools(p66) --[[ line: 803 ]]
	-- upvalues: reactSharedInternals (ref), dEV (ref), injectInternals (ref), var22 (write), var23 (write), var24 (write), var25 (write), var26 (write), var27 (write), var29 (write), var28 (write), findHostInstancesForRefresh (ref), scheduleRefresh (ref), scheduleRoot (ref), setRefreshHandler (ref)
	return injectInternals({
		bundleType = p66.bundleType,
		version = p66.version,
		rendererPackageName = p66.rendererPackageName,
		rendererConfig = p66.rendererConfig,
		overrideHookState = var22,
		overrideHookStateDeletePath = var23,
		overrideHookStateRenamePath = var24,
		overrideProps = var25,
		overridePropsDeletePath = var26,
		overridePropsRenamePath = var27,
		setSuspenseHandler = var29,
		scheduleUpdate = var28,
		currentDispatcherRef = reactSharedInternals.ReactCurrentDispatcher,
		findHostInstanceByFiber = findHostInstanceByFiber,
		findFiberByHostInstance = p66.findFiberByHostInstance or emptyFindFiberByHostInstance,
		findHostInstancesForRefresh = if dEV then findHostInstancesForRefresh else nil,
		scheduleRefresh = if dEV then scheduleRefresh else nil,
		scheduleRoot = if dEV then scheduleRoot else nil,
		setRefreshHandler = if dEV then setRefreshHandler else nil,
		getCurrentFiber = if dEV then getCurrentFiberForDevTools else nil
	})
end

t.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)
t.schedulingProfiler = {
	profilerEventTypes = schedulingProfilerModule.profilerEventTypes,
	registerProfilerEventCallback = schedulingProfilerModule.registerProfilerEventCallback
}

return t