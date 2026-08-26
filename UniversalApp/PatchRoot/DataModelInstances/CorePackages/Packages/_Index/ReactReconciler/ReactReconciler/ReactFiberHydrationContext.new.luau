local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console

local function _(p1)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. p0)
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local _ = require(script.Parent.ReactInternalTypes)
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local hostComponent = reactWorkTagsModule.HostComponent
local hostText = reactWorkTagsModule.HostText
local hostRoot = reactWorkTagsModule.HostRoot
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local placement = reactFiberFlagsModule.Placement
local hydrating = reactFiberFlagsModule.Hydrating
local invariant = require(parent.Shared).invariant
local createFiberFromDehydratedFragment = require(script.Parent["ReactFiber.new"]).createFiberFromDehydratedFragment
local supportsHydration = reactFiberHostConfigModule.supportsHydration
local getNextHydratableSibling = reactFiberHostConfigModule.getNextHydratableSibling
local getFirstHydratableChild = reactFiberHostConfigModule.getFirstHydratableChild
local canHydrateInstance = reactFiberHostConfigModule.canHydrateInstance
local canHydrateTextInstance = reactFiberHostConfigModule.canHydrateTextInstance
local canHydrateSuspenseInstance = reactFiberHostConfigModule.canHydrateSuspenseInstance
local hydrateInstance = reactFiberHostConfigModule.hydrateInstance
local hydrateTextInstance = reactFiberHostConfigModule.hydrateTextInstance
local hydrateSuspenseInstance = reactFiberHostConfigModule.hydrateSuspenseInstance
local getNextHydratableInstanceAfterSuspenseInstance = reactFiberHostConfigModule.getNextHydratableInstanceAfterSuspenseInstance
local didNotMatchHydratedContainerTextInstance = reactFiberHostConfigModule.didNotMatchHydratedContainerTextInstance
local didNotMatchHydratedTextInstance = reactFiberHostConfigModule.didNotMatchHydratedTextInstance
local shouldSetTextContent = reactFiberHostConfigModule.shouldSetTextContent
local enableSuspenseServerRenderer = require(parent.Shared).ReactFeatureFlags.enableSuspenseServerRenderer
local offscreenLane = require(script.Parent.ReactFiberLane).OffscreenLane
local var1 = nil
local var2 = nil
local var3 = false

function warnIfHydrating()
	-- upvalues: reactGlobalsModule (ref), var3 (write), console (ref)
	if reactGlobalsModule.__DEV__ and var3 then
		console.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
	end
end

function enterHydrationState(p1)
	-- upvalues: supportsHydration (ref), var2 (write), getFirstHydratableChild (ref), var1 (write), var3 (write)
	if supportsHydration then
		var2 = getFirstHydratableChild(p1.stateNode.containerInfo)
		var1 = p1
		var3 = true
		
		return true
	end
	return false
end

function reenterHydrationStateFromDehydratedSuspenseInstance(p1, p2)
	-- upvalues: supportsHydration (ref), var2 (write), getNextHydratableSibling (ref), var3 (write)
	if supportsHydration then
		var2 = getNextHydratableSibling(p2)
		popToNextHostParent(p1)
		var3 = true
		
		return true
	end
	return false
end

function deleteHydratableInstance(_, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
	error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end

function insertNonHydratedInstance(_, p1)
	-- upvalues: hydrating (ref), placement (ref), reactGlobalsModule (ref)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
	error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
	p1.flags = bit32.bor(bit32.band(p1.flags, bit32.bnot(hydrating)), placement)
end

function tryHydrate(p1, p2)
	-- upvalues: hostComponent (ref), canHydrateInstance (ref), hostText (ref), canHydrateTextInstance (ref), suspenseComponent (ref), enableSuspenseServerRenderer (ref), canHydrateSuspenseInstance (ref), offscreenLane (ref), createFiberFromDehydratedFragment (ref)
	if p1.tag == hostComponent then
		local var4 = canHydrateInstance(p2, p1.type, p1.pendingProps)
		
		if var4 == nil then
			return false
		end
		p1.stateNode = var4
		
		return true
	elseif p1.tag == hostText then
		local var5 = canHydrateTextInstance(p2, p1.pendingProps)
		
		if var5 == nil then
			return false
		end
		p1.stateNode = var5
		
		return true
	elseif p1.tag ~= suspenseComponent then
		return false
	elseif enableSuspenseServerRenderer then
		local var6 = canHydrateSuspenseInstance(p2)
		
		if var6 == nil then
			return false
		else
			p1.memoizedState = { dehydrated = var6, retryLane = offscreenLane }
			local var7 = createFiberFromDehydratedFragment(var6)
			var7.return_ = p1
			p1.child = var7
			
			return true
		end
	end
end

function tryToClaimNextHydratableInstance(p1)
	-- upvalues: var3 (write), var2 (write), var1 (write), getNextHydratableSibling (ref), getFirstHydratableChild (ref)
	if not var3 then return end
	local var4 = var2
	
	if not var4 then
		insertNonHydratedInstance(var1, p1)
		var3 = false
		var1 = p1
		
		return
	elseif not tryHydrate(p1, var4) then
		var4 = getNextHydratableSibling(var4)
		
		if not var4 or not tryHydrate(p1, var4) then
			insertNonHydratedInstance(var1, p1)
			var3 = false
			var1 = p1
			
			return
		end
		deleteHydratableInstance(var1, var4)
	end
	var1 = p1
	var2 = getFirstHydratableChild(var4)
end

function prepareToHydrateHostInstance(p1, p2, p3)
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local var4 = hydrateInstance(p1.stateNode, p1.type, p1.memoizedProps, p2, p3, p1)
	p1.updateQueue = var4
	
	return var4 ~= nil
end

function prepareToHydrateHostTextInstance(p1)
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateTextInstance (ref), reactGlobalsModule (ref), var1 (write), hostRoot (ref), didNotMatchHydratedContainerTextInstance (ref), hostComponent (ref), didNotMatchHydratedTextInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local stateNode = p1.stateNode
	local memoizedProps = p1.memoizedProps
	local var4 = hydrateTextInstance(stateNode, memoizedProps, p1)
	
	if reactGlobalsModule.__DEV__ and var4 then
		local var5 = var1
		
		if var5 ~= nil then
			if var5.tag == hostRoot then
				didNotMatchHydratedContainerTextInstance(var5.stateNode.containerInfo, stateNode, memoizedProps)
				
				return var4
			elseif var5.tag == hostComponent then
				didNotMatchHydratedTextInstance(var5.type, var5.memoizedProps, var5.stateNode, stateNode, memoizedProps)
			end
		end
	end
	return var4
end

function prepareToHydrateHostSuspenseInstance(p1)
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateSuspenseInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local memoizedState = p1.memoizedState
	local var4 = if memoizedState ~= nil then nil else memoizedState.dehydrated
	invariant(var4, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	hydrateSuspenseInstance(var4, p1)
end

function skipPastDehydratedSuspenseInstance(p1)
	-- upvalues: supportsHydration (ref), invariant (ref), getNextHydratableInstanceAfterSuspenseInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local memoizedState = p1.memoizedState
	local var4 = if memoizedState ~= nil then nil else memoizedState.dehydrated
	invariant(var4, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	
	return getNextHydratableInstanceAfterSuspenseInstance(var4)
end

function popToNextHostParent(p1)
	-- upvalues: hostComponent (ref), hostRoot (ref), suspenseComponent (ref), var1 (write)
	local _return = p1.return_
	while _return ~= nil and (_return.tag ~= hostComponent and _return.tag ~= hostRoot) and _return.tag ~= suspenseComponent do
		_return = _return.return_
	end
	var1 = _return
end

function popHydrationState(p2)
	-- upvalues: supportsHydration (ref), var1 (write), var3 (write), hostComponent (ref), shouldSetTextContent (ref), var2 (write), getNextHydratableSibling (ref), suspenseComponent (ref)
	if not supportsHydration then
		return false
	elseif p2 ~= var1 then
		return false
	elseif not var3 then
		popToNextHostParent(p2)
		var3 = true
		
		return false
	end
	local type = p2.type
	
	if p2.tag ~= hostComponent or type ~= "head" and type ~= "body" and not shouldSetTextContent(type, p2.memoizedProps) then
		local var4 = var2
		while var4 do
			deleteHydratableInstance(p2, var4)
			var4 = getNextHydratableSibling(var4)
		end
	end
	popToNextHostParent(p2)
	var2 = if p2.tag == suspenseComponent then skipPastDehydratedSuspenseInstance(p2) elseif var1 then getNextHydratableSibling(p2.stateNode) else nil
	
	return true
end

function resetHydrationState()
	-- upvalues: supportsHydration (ref), var1 (write), var2 (write), var3 (write)
	if supportsHydration then
		var1 = nil
		var2 = nil
		var3 = false
		
		return
	end
end

function getIsHydrating()
	-- upvalues: var3 (write)
	return var3
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