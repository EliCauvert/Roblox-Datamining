local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Set = LuauPolyfillModule.Set
local Map = LuauPolyfillModule.Map
local _ = require(script.Parent.ReactInternalTypes)
local ReactRootTagsModule = require(script.Parent.ReactRootTags)
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local NoTimeout = ReactFiberHostConfigModule.noTimeout
local SupportsHydration = ReactFiberHostConfigModule.supportsHydration
local CreateHostRootFiberFunction = require(script.Parent["ReactFiber.new"]).createHostRootFiber
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local NoLanes = ReactFiberLaneModule.NoLanes
local NoLanePriority = ReactFiberLaneModule.NoLanePriority
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local CreateLaneMapFunction = ReactFiberLaneModule.createLaneMap
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local EnableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local UnstableGetThreadIDFunction = require(Parent.Scheduler).tracing.unstable_getThreadID
local InitializeUpdateQueueFunction = require(script.Parent["ReactUpdateQueue.new"]).initializeUpdateQueue
local LegacyRoot = ReactRootTagsModule.LegacyRoot
local BlockingRoot = ReactRootTagsModule.BlockingRoot
local ConcurrentRoot = ReactRootTagsModule.ConcurrentRoot

local function FiberRootNode(ContainerInfo, Tag, Hydrate)
	-- upvalues: NoTimeout (copy), NoLanePriority (copy), CreateLaneMapFunction (copy), NoLanes (copy), NoTimestamp (copy), SupportsHydration (copy), EnableSchedulerTracing (copy), UnstableGetThreadIDFunction (copy), Set (copy), Map (copy), EnableSuspenseCallback (copy), ReactGlobalsModule (copy), BlockingRoot (copy), ConcurrentRoot (copy), LegacyRoot (copy)
	local config = {
		pendingChildren = nil,
		current = nil,
		pingCache = nil,
		finishedWork = nil,
		context = nil,
		pendingContext = nil,
		callbackNode = nil,
		tag = Tag,
		containerInfo = ContainerInfo,
		timeoutHandle = NoTimeout,
		hydrate = Hydrate,
		callbackPriority = NoLanePriority,
		eventTimes = CreateLaneMapFunction(NoLanes),
		expirationTimes = CreateLaneMapFunction(NoTimestamp),
		pendingLanes = NoLanes,
		suspendedLanes = NoLanes,
		pingedLanes = NoLanes,
		expiredLanes = NoLanes,
		mutableReadLanes = NoLanes,
		finishedLanes = NoLanes,
		entangledLanes = NoLanes,
		entanglements = CreateLaneMapFunction(NoLanes)
	}
	
	if SupportsHydration then
		config.mutableSourceEagerHydrationData = nil
	end
	if EnableSchedulerTracing then
		config.interactionThreadID = UnstableGetThreadIDFunction()
		config.memoizedInteractions = Set.new()
		config.pendingInteractionMap = Map.new()
	end
	if EnableSuspenseCallback then
		config.hydrationCallbacks = nil
	end
	if ReactGlobalsModule.__DEV__ then
		if Tag == BlockingRoot then
			config._debugRootType = "createBlockingRoot()"
			
			return config
		end
		if Tag == ConcurrentRoot then
			config._debugRootType = "createRoot()"
			
			return config
		end
		if Tag == LegacyRoot then
			config._debugRootType = "createLegacyRoot()"
		end
	end
	return config
end

return {
	createFiberRoot = function(ContainerInfo, Tag, Hydrate, HydrationCallbacks)
		-- upvalues: FiberRootNode (copy), EnableSuspenseCallback (copy), CreateHostRootFiberFunction (copy), InitializeUpdateQueueFunction (copy)
		local FiberRootNodeResult = FiberRootNode(ContainerInfo, Tag, Hydrate)
		
		if EnableSuspenseCallback then
			FiberRootNodeResult.hydrationCallbacks = HydrationCallbacks
		end
		local HostRootFiber = CreateHostRootFiberFunction(Tag)
		FiberRootNodeResult.current = HostRootFiber
		HostRootFiber.stateNode = FiberRootNodeResult
		InitializeUpdateQueueFunction(HostRootFiber)
		
		return FiberRootNodeResult
	end
}