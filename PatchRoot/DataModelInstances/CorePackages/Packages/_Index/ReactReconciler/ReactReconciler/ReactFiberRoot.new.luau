-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:35 2026 Pacific Standard Time.

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

local function FiberRootNode(p0, p1, p2) --[[ line: 49 ]]
	-- upvalues: noTimeout (ref), noLanePriority (ref), createLaneMap (ref), noLanes (ref), noTimestamp (ref), supportsHydration (ref), enableSchedulerTracing (ref), unstableGetThreadID (ref), set (ref), map (ref), enableSuspenseCallback (ref), reactGlobalsModule (ref), blockingRoot (ref), concurrentRoot (ref), legacyRoot (ref)
	local t = {
		pendingChildren = nil,
		current = nil,
		pingCache = nil,
		finishedWork = nil,
		context = nil,
		pendingContext = nil,
		callbackNode = nil,
		tag = p1,
		containerInfo = p0,
		timeoutHandle = noTimeout,
		hydrate = p2,
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
		if p1 == blockingRoot then
			t._debugRootType = "createBlockingRoot()"
			
			return t
		elseif p1 == concurrentRoot then
			t._debugRootType = "createRoot()"
			
			return t
		elseif p1 == legacyRoot then
			t._debugRootType = "createLegacyRoot()"
		end
	end
	return t
end

function t.createFiberRoot(p3, p4, p5, p6) --[[ line: 105 ]]
	-- upvalues: FiberRootNode (ref), enableSuspenseCallback (ref), createHostRootFiber (ref), initializeUpdateQueue (ref)
	local var8 = FiberRootNode(p3, p4, p5)
	
	if enableSuspenseCallback then
		var8.hydrationCallbacks = p6
	end
	local var9 = createHostRootFiber(p4)
	var8.current = var9
	var9.stateNode = var8
	initializeUpdateQueue(var9)
	
	return var8
end

return t