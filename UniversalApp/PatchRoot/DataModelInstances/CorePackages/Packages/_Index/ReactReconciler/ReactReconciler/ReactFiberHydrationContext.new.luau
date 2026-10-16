local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console

local function _(Text) --[[ Line: 18 | Named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. Text)
	error("FIXME (roblox): " .. Text .. " is unimplemented", 2)
end

local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local HostComponent = ReactWorkTagsModule.HostComponent
local HostText = ReactWorkTagsModule.HostText
local HostRoot = ReactWorkTagsModule.HostRoot
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Placement = ReactFiberFlagsModule.Placement
local Hydrating = ReactFiberFlagsModule.Hydrating
local InvariantFunction = require(Parent.Shared).invariant
local CreateFiberFromDehydratedFragmentFunction = require(script.Parent["ReactFiber.new"]).createFiberFromDehydratedFragment
local SupportsHydration = ReactFiberHostConfigModule.supportsHydration
local GetNextHydratableSiblingFunction = ReactFiberHostConfigModule.getNextHydratableSibling
local GetFirstHydratableChildFunction = ReactFiberHostConfigModule.getFirstHydratableChild
local CanHydrateInstanceFunction = ReactFiberHostConfigModule.canHydrateInstance
local CanHydrateTextInstanceFunction = ReactFiberHostConfigModule.canHydrateTextInstance
local CanHydrateSuspenseInstanceFunction = ReactFiberHostConfigModule.canHydrateSuspenseInstance
local HydrateInstanceFunction = ReactFiberHostConfigModule.hydrateInstance
local HydrateTextInstanceFunction = ReactFiberHostConfigModule.hydrateTextInstance
local HydrateSuspenseInstanceFunction = ReactFiberHostConfigModule.hydrateSuspenseInstance
local GetNextHydratableInstanceAfterSuspenseInstanceFunction = ReactFiberHostConfigModule.getNextHydratableInstanceAfterSuspenseInstance
local DidNotMatchHydratedContainerTextInstanceFunction = ReactFiberHostConfigModule.didNotMatchHydratedContainerTextInstance
local DidNotMatchHydratedTextInstanceFunction = ReactFiberHostConfigModule.didNotMatchHydratedTextInstance
local ShouldSetTextContentFunction = ReactFiberHostConfigModule.shouldSetTextContent
local EnableSuspenseServerRenderer = require(Parent.Shared).ReactFeatureFlags.enableSuspenseServerRenderer
local OffscreenLane = require(script.Parent.ReactFiberLane).OffscreenLane
local v1 = nil
local SkipPastDehydratedSuspenseInstanceResult = nil
local Flag = false

function warnIfHydrating() --[[ Line: 92 ]]
	-- upvalues: ReactGlobalsModule (copy), Flag (ref), Console (copy)
	if ReactGlobalsModule.__DEV__ and Flag then
		Console.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
	end
end

function enterHydrationState(p1): boolean --[[ Line: 102 ]]
	-- upvalues: SupportsHydration (copy), SkipPastDehydratedSuspenseInstanceResult (ref), GetFirstHydratableChildFunction (copy), v1 (ref), Flag (ref)
	if SupportsHydration then
		SkipPastDehydratedSuspenseInstanceResult = GetFirstHydratableChildFunction(p1.stateNode.containerInfo)
		v1 = p1
		Flag = true
		
		return true
	else
		return false
	end
end

function reenterHydrationStateFromDehydratedSuspenseInstance(p1, p2): boolean --[[ Line: 114 ]]
	-- upvalues: SupportsHydration (copy), SkipPastDehydratedSuspenseInstanceResult (ref), GetNextHydratableSiblingFunction (copy), Flag (ref)
	if SupportsHydration then
		SkipPastDehydratedSuspenseInstanceResult = GetNextHydratableSiblingFunction(p2)
		popToNextHostParent(p1)
		Flag = true
		
		return true
	else
		return false
	end
end

function deleteHydratableInstance(_, _) --[[ Line: 128 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
	error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end

function insertNonHydratedInstance(_, p1) --[[ Line: 163 ]]
	-- upvalues: Hydrating (copy), Placement (copy), ReactGlobalsModule (copy)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
	error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
	p1.flags = bit32.bor(bit32.band(p1.flags, (bit32.bnot(Hydrating))), Placement)
	local _ = ReactGlobalsModule.__DEV__
end

function tryHydrate(Return_, p1): boolean --[[ Line: 227 ]]
	-- upvalues: HostComponent (copy), CanHydrateInstanceFunction (copy), HostText (copy), CanHydrateTextInstanceFunction (copy), SuspenseComponent (copy), EnableSuspenseServerRenderer (copy), CanHydrateSuspenseInstanceFunction (copy), OffscreenLane (copy), CreateFiberFromDehydratedFragmentFunction (copy)
	if Return_.tag == HostComponent then
		local CanHydrateInstance = CanHydrateInstanceFunction(p1, Return_.type, Return_.pendingProps)
		
		if CanHydrateInstance == nil then
			return false
		else
			Return_.stateNode = CanHydrateInstance
			
			return true
		end
	elseif Return_.tag == HostText then
		local CanHydrateTextInstance = CanHydrateTextInstanceFunction(p1, Return_.pendingProps)
		
		if CanHydrateTextInstance == nil then
			return false
		else
			Return_.stateNode = CanHydrateTextInstance
			
			return true
		end
	else
		if Return_.tag ~= SuspenseComponent then
			return false
		end
		if EnableSuspenseServerRenderer then
			local CanHydrateSuspenseInstance = CanHydrateSuspenseInstanceFunction(p1)
			
			if CanHydrateSuspenseInstance ~= nil then
				Return_.memoizedState = {
					dehydrated = CanHydrateSuspenseInstance,
					retryLane = OffscreenLane
				}
				local FiberFromDehydratedFragment = CreateFiberFromDehydratedFragmentFunction(CanHydrateSuspenseInstance)
				FiberFromDehydratedFragment.return_ = Return_
				Return_.child = FiberFromDehydratedFragment
				
				return true
			end
		end
		return false
	end
end

function tryToClaimNextHydratableInstance(p1) --[[ Line: 272 ]]
	-- upvalues: Flag (ref), SkipPastDehydratedSuspenseInstanceResult (ref), v1 (ref), GetNextHydratableSiblingFunction (copy), GetFirstHydratableChildFunction (copy)
	if not Flag then return end
	local SkipPastDehydratedSuspenseInstanceResult1 = SkipPastDehydratedSuspenseInstanceResult
	
	if not SkipPastDehydratedSuspenseInstanceResult1 then
		insertNonHydratedInstance(v1, p1)
		Flag = false
		v1 = p1
		
		return
	end
	local SkipPastDehydratedSuspenseInstanceResult2 = SkipPastDehydratedSuspenseInstanceResult1
	
	if not tryHydrate(p1, SkipPastDehydratedSuspenseInstanceResult1) then
		SkipPastDehydratedSuspenseInstanceResult1 = GetNextHydratableSiblingFunction(SkipPastDehydratedSuspenseInstanceResult2)
		
		if not SkipPastDehydratedSuspenseInstanceResult1 or not tryHydrate(p1, SkipPastDehydratedSuspenseInstanceResult1) then
			insertNonHydratedInstance(v1, p1)
			Flag = false
			v1 = p1
			
			return
		end
		deleteHydratableInstance(v1, SkipPastDehydratedSuspenseInstanceResult2)
	end
	v1 = p1
	SkipPastDehydratedSuspenseInstanceResult = GetFirstHydratableChildFunction(SkipPastDehydratedSuspenseInstanceResult1)
end

function prepareToHydrateHostInstance(p1, p2, p3): boolean --[[ Line: 308 ]]
	-- upvalues: SupportsHydration (copy), InvariantFunction (copy), HydrateInstanceFunction (copy)
	if not SupportsHydration then
		InvariantFunction(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local HydrateInstanceResult = HydrateInstanceFunction(p1.stateNode, p1.type, p1.memoizedProps, p2, p3, p1)
	p1.updateQueue = HydrateInstanceResult
	
	return HydrateInstanceResult ~= nil
end

function prepareToHydrateHostTextInstance(p1) --[[ Line: 340 ]]
	-- upvalues: SupportsHydration (copy), InvariantFunction (copy), HydrateTextInstanceFunction (copy), ReactGlobalsModule (copy), v1 (ref), HostRoot (copy), DidNotMatchHydratedContainerTextInstanceFunction (copy), HostComponent (copy), DidNotMatchHydratedTextInstanceFunction (copy)
	if not SupportsHydration then
		InvariantFunction(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local StateNode = p1.stateNode
	local MemoizedProps = p1.memoizedProps
	local HydrateTextInstanceResult = HydrateTextInstanceFunction(StateNode, MemoizedProps, p1)
	
	if ReactGlobalsModule.__DEV__ and HydrateTextInstanceResult then
		local v2 = v1
		
		if v2 ~= nil then
			if v2.tag == HostRoot then
				DidNotMatchHydratedContainerTextInstanceFunction(v2.stateNode.containerInfo, StateNode, MemoizedProps)
				
				return HydrateTextInstanceResult
			end
			if v2.tag == HostComponent then
				DidNotMatchHydratedTextInstanceFunction(v2.type, v2.memoizedProps, v2.stateNode, StateNode, MemoizedProps)
			end
		end
	end
	return HydrateTextInstanceResult
end

function prepareToHydrateHostSuspenseInstance(p1) --[[ Line: 383 ]]
	-- upvalues: SupportsHydration (copy), InvariantFunction (copy), HydrateSuspenseInstanceFunction (copy)
	if not SupportsHydration then
		InvariantFunction(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local MemoizedState = p1.memoizedState
	local Dehydrated = if MemoizedState == nil then nil else MemoizedState.dehydrated
	InvariantFunction(Dehydrated, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	HydrateSuspenseInstanceFunction(Dehydrated, p1)
end

function skipPastDehydratedSuspenseInstance(p1) --[[ Line: 408 ]]
	-- upvalues: SupportsHydration (copy), InvariantFunction (copy), GetNextHydratableInstanceAfterSuspenseInstanceFunction (copy)
	if not SupportsHydration then
		InvariantFunction(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local MemoizedState = p1.memoizedState
	local Dehydrated = if MemoizedState == nil then nil else MemoizedState.dehydrated
	InvariantFunction(Dehydrated, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	
	return GetNextHydratableInstanceAfterSuspenseInstanceFunction(Dehydrated)
end

function popToNextHostParent(p1) --[[ Line: 431 ]]
	-- upvalues: HostComponent (copy), HostRoot (copy), SuspenseComponent (copy), v1 (ref)
	local Return = p1.return_
	while Return ~= nil and (Return.tag ~= HostComponent and Return.tag ~= HostRoot and Return.tag ~= SuspenseComponent) do
		Return = Return.return_
	end
	v1 = Return
end

function popHydrationState(p2): boolean --[[ Line: 444 ]]
	-- upvalues: SupportsHydration (copy), v1 (ref), Flag (ref), HostComponent (copy), ShouldSetTextContentFunction (copy), SkipPastDehydratedSuspenseInstanceResult (ref), GetNextHydratableSiblingFunction (copy), SuspenseComponent (copy)
	if not SupportsHydration then
		return false
	end
	if p2 ~= v1 then
		return false
	end
	if not Flag then
		popToNextHostParent(p2)
		Flag = true
		
		return false
	end
	local Type = p2.type
	
	if p2.tag ~= HostComponent or Type ~= "head" and Type ~= "body" and not ShouldSetTextContentFunction(Type, p2.memoizedProps) then
		local SkipPastDehydratedSuspenseInstanceResult1 = SkipPastDehydratedSuspenseInstanceResult
		while SkipPastDehydratedSuspenseInstanceResult1 do
			deleteHydratableInstance(p2, SkipPastDehydratedSuspenseInstanceResult1)
			SkipPastDehydratedSuspenseInstanceResult1 = GetNextHydratableSiblingFunction(SkipPastDehydratedSuspenseInstanceResult1)
		end
	end
	popToNextHostParent(p2)
	SkipPastDehydratedSuspenseInstanceResult = if p2.tag == SuspenseComponent then skipPastDehydratedSuspenseInstance(p2) elseif v1 then GetNextHydratableSiblingFunction(p2.stateNode) else nil
	
	return true
end

function resetHydrationState() --[[ Line: 497 ]]
	-- upvalues: SupportsHydration (copy), v1 (ref), SkipPastDehydratedSuspenseInstanceResult (ref), Flag (ref)
	if SupportsHydration then
		v1 = nil
		SkipPastDehydratedSuspenseInstanceResult = nil
		Flag = false
		
		return
	end
end

function getIsHydrating() --[[ Line: 507 ]]
	-- upvalues: Flag (ref)
	return Flag
end

return {
	warnIfHydrating = warnIfHydrating,
	enterHydrationState = enterHydrationState,
	getIsHydrating = getIsHydrating,
	reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance,
	resetHydrationState = resetHydrationState,
	tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance,
	prepareToHydrateHostInstance = prepareToHydrateHostInstance,
	prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance,
	prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance,
	popHydrationState = popHydrationState
}