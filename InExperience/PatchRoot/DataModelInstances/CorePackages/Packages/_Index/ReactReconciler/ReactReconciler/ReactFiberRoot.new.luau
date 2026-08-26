local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local set = luauPolyfillModule.Set
local map = luauPolyfillModule.Map
local _ = require(script.Parent.ReactInternalTypes)
local reactRootTagsModule = require(script.Parent.ReactRootTags)
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local noTimeout = reactFiberHostConfigModule.noTimeout
local supportsHydration = reactFiberHostConfigModule.supportsHydration
local createHostRootFiber = require(script.Parent["ReactFiber.new"]).createHostRootFiber
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local noLanes = reactFiberLaneModule.NoLanes
local noLanePriority = reactFiberLaneModule.NoLanePriority
local noTimestamp = reactFiberLaneModule.NoTimestamp
local createLaneMap = reactFiberLaneModule.createLaneMap
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableSchedulerTracing = reactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = reactFeatureFlags.enableSuspenseCallback
local unstableGetThreadID = require(parent.Scheduler).tracing.unstable_getThreadID
local initializeUpdateQueue = require(script.Parent["ReactUpdateQueue.new"]).initializeUpdateQueue
local legacyRoot = reactRootTagsModule.LegacyRoot
local blockingRoot = reactRootTagsModule.BlockingRoot
local concurrentRoot = reactRootTagsModule.ConcurrentRoot
local t = {}

local function FiberRootNode(p1, p2, p3)
	-- upvalues: noTimeout (ref), noLanePriority (ref), createLaneMap (ref), noLanes (ref), noTimestamp (ref), supportsHydration (ref), enableSchedulerTracing (ref), unstableGetThreadID (ref), set (ref), map (ref), enableSuspenseCallback (ref), reactGlobalsModule (ref), blockingRoot (ref), concurrentRoot (ref), legacyRoot (ref)
	local t = {
		pendingChildren = nil,
		current = nil,
		pingCache = nil,
		finishedWork = nil,
		context = nil,
		pendingContext = nil,
		callbackNode = nil,
		tag = p2,
		containerInfo = p1,
		timeoutHandle = noTimeout,
		hydrate = p3,
		callbackPriority = noLanePriority,
		eventTimes = createLaneMap(noLanes),
		expirationTimes = createLaneMap(noTimestamp),
		pendingLanes = noLanes,
		suspendedLanes = noLanes,
		pingedLanes = noLanes,
		expiredLanes = noLanes,
		mutableReadLanes = noLanes,
		finishedLanes = noLanes,
		entangledLanes = noLanes,
		entanglements = createLaneMap(noLanes)
	}
	
	if supportsHydration then
		t.mutableSourceEagerHydrationData = nil
	end
	if enableSchedulerTracing then
		t.interactionThreadID = unstableGetThreadID()
		t.memoizedInteractions = set.new()
		t.pendingInteractionMap = map.new()
	end
	if enableSuspenseCallback then
		t.hydrationCallbacks = nil
	end
	if reactGlobalsModule.__DEV__ then
		if p2 == blockingRoot then
			t._debugRootType = "createBlockingRoot()"
			
			return t
		elseif p2 == concurrentRoot then
			t._debugRootType = "createRoot()"
			
			return t
		elseif p2 == legacyRoot then
			t._debugRootType = "createLegacyRoot()"
		end
	end
	return t
end

function t.createFiberRoot(p1, p2, p3, p4)
	-- upvalues: FiberRootNode (ref), enableSuspenseCallback (ref), createHostRootFiber (ref), initializeUpdateQueue (ref)
	local var1 = FiberRootNode(p1, p2, p3)
	
	if enableSuspenseCallback then
		var1.hydrationCallbacks = p4
	end
	local var2 = createHostRootFiber(p2)
	var1.current = var2
	var2.stateNode = var1
	initializeUpdateQueue(var2)
	
	return var1
end

return t