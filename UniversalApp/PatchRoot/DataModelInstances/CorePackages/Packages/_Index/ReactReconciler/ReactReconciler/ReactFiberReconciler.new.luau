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
local var1 = nil
local t_1 = nil

if dEV then
	var1 = false
	t_1 = {}
end
local function _(p1)
	-- upvalues: emptyContextObject (ref), get (ref), findCurrentUnmaskedContext (ref), classComponent (ref), isContextProvider (ref), processChildContext (ref)
	if not p1 then
		return emptyContextObject
	end
	local var2 = get(p1)
	local var3 = findCurrentUnmaskedContext(var2)
	
	if var2.tag == classComponent then
		local type = var2.type
		
		return if isContextProvider(type) then processChildContext(var2, type, var3) else var3
	end
end

local function findHostInstance(p1)
	-- upvalues: get (ref), invariant (ref), object (ref), findCurrentHostFiber (ref)
	local var2 = get(p1)
	
	if var2 == nil then
		if typeof(p1.render) == "function" then
			invariant(false, "Unable to find node on an unmounted component.")
		else
			invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(object.keys(p1)))
		end
	end
	local var3 = findCurrentHostFiber(var2)
	
	return if var3 == nil then nil else var3.stateNode
end

local function findHostInstanceWithWarning(p1, p2)
	-- upvalues: dEV (ref), get (ref), invariant (ref), object (ref), findCurrentHostFiber (ref), strictMode (ref), getComponentName (ref), t_1 (write), reactCurrentFiberModule (ref), setCurrentFiber (ref), console (ref), describeError (ref), resetCurrentFiber (ref), findHostInstance (ref)
	if not dEV then
		return findHostInstance(p1)
	end
	local var2 = get(p1)
	
	if var2 == nil then
		if typeof(p1.render) == "function" then
			invariant(false, "Unable to find node on an unmounted component.")
		else
			invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(object.keys(p1)))
		end
	end
	local var3 = findCurrentHostFiber(var2)
	
	if var3 == nil then
		return nil
	elseif bit32.band(var3.mode, strictMode) ~= 0 then
		local type = getComponentName(var2.type) or "Component"
		
		if not t_1[type] then
			t_1[type] = true
			local current = reactCurrentFiberModule.current
			local ok, status = xpcall(function()
				-- upvalues: setCurrentFiber (copy), var3 (ref), var2 (ref), strictMode (copy), console (copy), p2 (ref), type (ref)
				setCurrentFiber(var3)
				
				if bit32.band(var2.mode, strictMode) == 0 then
					console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, type)
					
					return
				end
				console.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", p2, p2, type)
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
	return var3.stateNode
end

function t.createContainer(p1, p2, p3, p4)
	-- upvalues: createFiberRoot (ref)
	return createFiberRoot(p1, p2, p3, p4)
end

function t.updateContainer(p1, p2, p3, p4)
	-- upvalues: dEV (ref), onScheduleRoot (ref), requestEventTime (ref), reactGlobalsModule (ref), warnIfUnmockedScheduler (ref), warnIfNotScopedWithMatchingAct (ref), requestUpdateLane (ref), enableSchedulingProfiler (ref), markRenderScheduled (ref), emptyContextObject (ref), get (ref), findCurrentUnmaskedContext (ref), classComponent (ref), isContextProvider (ref), processChildContext (ref), isRendering (ref), reactCurrentFiberModule (ref), var1 (write), console (ref), getComponentName (ref), createUpdate (ref), object (ref), enqueueUpdate (ref), scheduleUpdateOnFiber (ref)
	if dEV then
		onScheduleRoot(p2, p1)
	end
	local current = p2.current
	local var2 = requestEventTime()
	
	if dEV and reactGlobalsModule.__TESTEZ_RUNNING_TEST__ then
		warnIfUnmockedScheduler(current)
		warnIfNotScopedWithMatchingAct(current)
	end
	local var3, var4
	local var5 = requestUpdateLane(current)
	
	if enableSchedulingProfiler then
		markRenderScheduled(var5)
	end
	if p3 then
		var4 = get(p3)
		local var6 = findCurrentUnmaskedContext(var4)
		
		if var4.tag == classComponent then
			local type = var4.type
			var3 = if isContextProvider(type) then processChildContext(var4, type, var6) else var6
		end
	else
		var3 = emptyContextObject
	end
	if p2.context == nil then
		p2.context = var3
	else
		p2.pendingContext = var3
	end
	if dEV and isRendering and (reactCurrentFiberModule.current ~= nil and not var1) then
		var1 = true
		console.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", getComponentName(reactCurrentFiberModule.current.type) or "Unknown")
	end
	var4 = createUpdate(var2, var5)
	
	if p1 == nil then
		p1 = object.None
	end
	var4.payload = { element = p1 }
	
	if p4 ~= nil then
		if dEV and typeof(p4) ~= "function" then
			console.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", tostring(p4))
		end
		var4.callback = p4
	end
	enqueueUpdate(current, var4)
	scheduleUpdateOnFiber(current, var5, var2)
	
	return var5
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

function t.getPublicRootInstance(p1)
	-- upvalues: hostComponent (ref), getPublicInstance (ref)
	local current = p1.current
	
	return if current.child then if current.child.tag == hostComponent then getPublicInstance(current.child.stateNode) else current.child.stateNode else nil
end

local var2 = nil

function t.attemptSynchronousHydration(p1)
	-- upvalues: hostRoot (ref), getHighestPriorityPendingLanes (ref), flushRoot (ref), suspenseComponent (ref), requestEventTime (ref), flushSync (ref), scheduleUpdateOnFiber (ref), syncLane (ref), inputDiscreteHydrationLane (ref), var2 (write)
	if p1.tag == hostRoot then
		local stateNode = p1.stateNode
		
		if stateNode.hydrate then
			flushRoot(stateNode, getHighestPriorityPendingLanes(stateNode))
			
			return
		end
	elseif p1.tag == suspenseComponent then
		local var3 = requestEventTime()
		flushSync(function()
			-- upvalues: scheduleUpdateOnFiber (copy), p1 (ref), syncLane (copy), var3 (ref)
			return scheduleUpdateOnFiber(p1, syncLane, var3)
		end)
		var2(p1, inputDiscreteHydrationLane)
	end
end

local _ = function(p1, p2)
	-- upvalues: higherPriorityLane (ref)
	local memoizedState = p1.memoizedState
	
	if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
		memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p2)
	end
end

var2 = function(p1, p2)
	-- upvalues: higherPriorityLane (ref)
	local memoizedState = p1.memoizedState
	
	if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
		memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, p2)
	end
	local alternate = p1.alternate
	
	if alternate then
		local memoizedState_1 = alternate.memoizedState
		
		if memoizedState_1 and memoizedState_1 ~= nil and memoizedState_1.dehydrated ~= nil then
			memoizedState_1.retryLane = higherPriorityLane(memoizedState_1.retryLane, p2)
		end
	end
end

function t.attemptUserBlockingHydration(p1)
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), inputDiscreteHydrationLane (ref), scheduleUpdateOnFiber (ref), var2 (write)
	if p1.tag == suspenseComponent then
		scheduleUpdateOnFiber(p1, inputDiscreteHydrationLane, requestEventTime())
		var2(p1, inputDiscreteHydrationLane)
		
		return
	end
end

function t.attemptContinuousHydration(p1)
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), selectiveHydrationLane (ref), scheduleUpdateOnFiber (ref), var2 (write)
	if p1.tag == suspenseComponent then
		scheduleUpdateOnFiber(p1, selectiveHydrationLane, requestEventTime())
		var2(p1, selectiveHydrationLane)
		
		return
	end
end

function t.attemptHydrationAtCurrentPriority(p1)
	-- upvalues: suspenseComponent (ref), requestEventTime (ref), requestUpdateLane (ref), scheduleUpdateOnFiber (ref), var2 (write)
	if p1.tag == suspenseComponent then
		local var3 = requestUpdateLane(p1)
		scheduleUpdateOnFiber(p1, var3, requestEventTime())
		var2(p1, var3)
		
		return
	end
end

function t.runWithPriority(p1, p2)
	-- upvalues: getCurrentUpdateLanePriority (ref), setCurrentUpdateLanePriority (ref), describeError (ref)
	local var3 = getCurrentUpdateLanePriority()
	setCurrentUpdateLanePriority(p1)
	local ok, status = xpcall(p2, describeError)
	setCurrentUpdateLanePriority(var3)
	
	if not ok then
		error(status)
	end
	return status
end

t.getCurrentUpdateLanePriority = getCurrentUpdateLanePriority
t.findHostInstance = findHostInstance
t.findHostInstanceWithWarning = findHostInstanceWithWarning

function t.findHostInstanceWithNoPortals(p1)
	-- upvalues: findCurrentHostFiberWithNoPortals (ref), fundamentalComponent (ref)
	local var3 = findCurrentHostFiberWithNoPortals(p1)
	
	return if var3 == nil then nil elseif var3.tag == fundamentalComponent then var3.stateNode.instance else var3.stateNode
end

local function shouldSuspendImpl(_)
	return false
end

function t.shouldSuspend(p1)
	-- upvalues: shouldSuspendImpl (write)
	return shouldSuspendImpl(p1)
end

local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil

if dEV then
	local function copyWithDeleteImpl(p1, p2, p3)
		-- upvalues: array (ref), copyWithDeleteImpl (ref)
		local var11 = p2[p3]
		local var12 = if array.isArray(p1) then array.slice(p1) else table.clone(p1)
		
		if p3 + 1 ~= #p2 then
			var12[var11] = copyWithDeleteImpl(p1[var11], p2, p3 + 1)
			
			return var12
		elseif array.isArray(var12) then
			array.splice(var12, var11, 1)
			
			return var12
		end
		var12[var11] = nil
		
		return var12
	end
	
	local _ = function(p1, p2)
		-- upvalues: copyWithDeleteImpl (ref)
		return copyWithDeleteImpl(p1, p2, 0)
	end
	
	local function copyWithRenameImpl(p1, p2, p3, p4)
		-- upvalues: array (ref), copyWithRenameImpl (ref)
		local var11 = p2[p4]
		local var12 = if array.isArray(p1) then array.slice(p1) else table.clone(p1)
		
		if p4 + 1 ~= #p2 then
			var12[var11] = copyWithRenameImpl(p1[var11], p2, p3, p4 + 1)
			
			return var12
		end
		var12[p3[p4]] = var12[var11]
		
		if array.isArray(var12) then
			array.splice(var12, var11, 1)
			
			return var12
		end
		var12[var11] = nil
		
		return var12
	end
	
	local function copyWithRename(p1, p2, p3)
		-- upvalues: console (ref), copyWithRenameImpl (ref)
		if #p2 ~= #p3 then
			console.warn("copyWithRename() expects paths of the same length")
			
			return nil
		end
		for i = 1, #p3 do
			if p2[i] == p3[i] then
				continue
			end
			console.warn("copyWithRename() expects paths to be the same except for the deepest key")
			
			return nil
		end
		return copyWithRenameImpl(p1, p2, p3, 0)
	end
	
	local function copyWithSetImpl(value, p4, p5, p6)
		-- upvalues: array (ref), copyWithSetImpl (ref)
		if #p4 + 1 <= p5 then
			return p6
		end
		local var11 = p4[p5]
		local var12 = if array.isArray(value) then array.slice(value) else table.clone(value)
		var12[var11] = copyWithSetImpl(value[var11], p4, p5 + 2, p6)
		
		return var12
	end
	
	local _ = function(value, p4, p5)
		-- upvalues: copyWithSetImpl (ref)
		return copyWithSetImpl(value, p4, 1, p5)
	end
	
	local _ = function(p4, p5)
		local memoizedState = p4.memoizedState
		while memoizedState ~= nil and p5 > 1 do
			memoizedState = memoizedState.next
			p5 -= 1
		end
		return memoizedState
	end
	
	var3 = function(p6, p7, p8, p9)
		-- upvalues: copyWithSetImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var11 = p7
		local memoizedState = p6.memoizedState
		while memoizedState ~= nil and var11 > 1 do
			memoizedState = memoizedState.next
			var11 -= 1
		end
		if memoizedState ~= nil then
			local var12 = copyWithSetImpl(memoizedState.memoizedState, p8, 1, p9)
			memoizedState.memoizedState = var12
			memoizedState.baseState = var12
			p6.memoizedProps = table.clone(p6.memoizedProps)
			scheduleUpdateOnFiber(p6, syncLane, noTimestamp)
		end
	end
	
	var4 = function(p10, p11, p12)
		-- upvalues: copyWithDeleteImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var13 = p11
		local memoizedState = p10.memoizedState
		while memoizedState ~= nil and var13 > 1 do
			memoizedState = memoizedState.next
			var13 -= 1
		end
		if memoizedState ~= nil then
			local var14 = copyWithDeleteImpl(memoizedState.memoizedState, p12, 0)
			memoizedState.memoizedState = var14
			memoizedState.baseState = var14
			p10.memoizedProps = table.clone(p10.memoizedProps)
			scheduleUpdateOnFiber(p10, syncLane, noTimestamp)
		end
	end
	
	var5 = function(p13, p14, p15, p16)
		-- upvalues: copyWithRename (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		local var15 = p14
		local memoizedState = p13.memoizedState
		while memoizedState ~= nil and var15 > 1 do
			memoizedState = memoizedState.next
			var15 -= 1
		end
		if memoizedState ~= nil then
			local var16 = copyWithRename(memoizedState.memoizedState, p15, p16)
			memoizedState.memoizedState = var16
			memoizedState.baseState = var16
			p13.memoizedProps = table.clone(p13.memoizedProps)
			scheduleUpdateOnFiber(p13, syncLane, noTimestamp)
		end
	end
	
	var6 = function(p17, p18, p19)
		-- upvalues: copyWithSetImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p17.pendingProps = copyWithSetImpl(p17.memoizedProps, p18, 1, p19)
		local alternate = p17.alternate
		
		if alternate then
			alternate.pendingProps = p17.pendingProps
		end
		scheduleUpdateOnFiber(p17, syncLane, noTimestamp)
	end
	
	var7 = function(p17, p18)
		-- upvalues: copyWithDeleteImpl (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p17.pendingProps = copyWithDeleteImpl(p17.memoizedProps, p18, 0)
		local alternate = p17.alternate
		
		if alternate then
			alternate.pendingProps = p17.pendingProps
		end
		scheduleUpdateOnFiber(p17, syncLane, noTimestamp)
	end
	
	var8 = function(p17, p18, p19)
		-- upvalues: copyWithRename (ref), scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		p17.pendingProps = copyWithRename(p17.memoizedProps, p18, p19)
		local alternate = p17.alternate
		
		if alternate then
			alternate.pendingProps = p17.pendingProps
		end
		scheduleUpdateOnFiber(p17, syncLane, noTimestamp)
	end
	
	var9 = function(p17)
		-- upvalues: scheduleUpdateOnFiber (ref), syncLane (ref), noTimestamp (ref)
		scheduleUpdateOnFiber(p17, syncLane, noTimestamp)
	end
	
	var10 = function(p17)
		-- upvalues: shouldSuspendImpl (write)
		shouldSuspendImpl = p17
	end
end
function findHostInstanceByFiber(p13)
	-- upvalues: findCurrentHostFiber (ref)
	local var15 = findCurrentHostFiber(p13)
	
	return if var15 == nil then nil else var15.stateNode
end

function emptyFindFiberByHostInstance(_)
	return nil
end

function getCurrentFiberForDevTools()
	-- upvalues: reactCurrentFiberModule (ref)
	return reactCurrentFiberModule.current
end

function t.injectIntoDevTools(p13)
	-- upvalues: reactSharedInternals (ref), dEV (ref), injectInternals (ref), var3 (write), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write), var10 (write), var9 (write), findHostInstancesForRefresh (ref), scheduleRefresh (ref), scheduleRoot (ref), setRefreshHandler (ref)
	return injectInternals({
		bundleType = p13.bundleType,
		version = p13.version,
		rendererPackageName = p13.rendererPackageName,
		rendererConfig = p13.rendererConfig,
		overrideHookState = var3,
		overrideHookStateDeletePath = var4,
		overrideHookStateRenamePath = var5,
		overrideProps = var6,
		overridePropsDeletePath = var7,
		overridePropsRenamePath = var8,
		setSuspenseHandler = var10,
		scheduleUpdate = var9,
		currentDispatcherRef = reactSharedInternals.ReactCurrentDispatcher,
		findHostInstanceByFiber = findHostInstanceByFiber,
		findFiberByHostInstance = p13.findFiberByHostInstance or emptyFindFiberByHostInstance,
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