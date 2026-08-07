-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:35 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console

local function _(p0) --[[ line: 18 | named "unimplemented" ]]
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
local var4 = nil
local var5 = nil
local var6 = false

function warnIfHydrating() --[[ line: 92 ]]
	-- upvalues: reactGlobalsModule (ref), var6 (write), console (ref)
	if reactGlobalsModule.__DEV__ and var6 then
		console.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
	end
end

function enterHydrationState(p1) --[[ line: 102 ]]
	-- upvalues: supportsHydration (ref), var5 (write), getFirstHydratableChild (ref), var4 (write), var6 (write)
	if supportsHydration then
		var5 = getFirstHydratableChild(p1.stateNode.containerInfo)
		var4 = p1
		var6 = true
		
		return true
	end
	return false
end

function reenterHydrationStateFromDehydratedSuspenseInstance(p2, p3) --[[ line: 114 ]]
	-- upvalues: supportsHydration (ref), var5 (write), getNextHydratableSibling (ref), var6 (write)
	if supportsHydration then
		var5 = getNextHydratableSibling(p3)
		popToNextHostParent(p2)
		var6 = true
		
		return true
	end
	return false
end

function deleteHydratableInstance(_, _) --[[ line: 128 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
	error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end

function insertNonHydratedInstance(_, p4) --[[ line: 163 ]]
	-- upvalues: hydrating (ref), placement (ref), reactGlobalsModule (ref)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
	error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
	p4.flags = bit32.bor(bit32.band(p4.flags, bit32.bnot(hydrating)), placement)
end

function tryHydrate(p5, p6) --[[ line: 227 ]]
	-- upvalues: hostComponent (ref), canHydrateInstance (ref), hostText (ref), canHydrateTextInstance (ref), suspenseComponent (ref), enableSuspenseServerRenderer (ref), canHydrateSuspenseInstance (ref), offscreenLane (ref), createFiberFromDehydratedFragment (ref)
	if p5.tag == hostComponent then
		local var7 = canHydrateInstance(p6, p5.type, p5.pendingProps)
		
		if var7 == nil then
			return false
		end
		p5.stateNode = var7
		
		return true
	elseif p5.tag == hostText then
		local var8 = canHydrateTextInstance(p6, p5.pendingProps)
		
		if var8 == nil then
			return false
		end
		p5.stateNode = var8
		
		return true
	elseif p5.tag ~= suspenseComponent then
		return false
	elseif enableSuspenseServerRenderer then
		local var9 = canHydrateSuspenseInstance(p6)
		
		if var9 == nil then
			return false
		else
			p5.memoizedState = { dehydrated = var9, retryLane = offscreenLane }
			local var10 = createFiberFromDehydratedFragment(var9)
			var10.return_ = p5
			p5.child = var10
			
			return true
		end
	end
end

function tryToClaimNextHydratableInstance(p7) --[[ line: 272 ]]
	-- upvalues: var6 (write), var5 (write), var4 (write), getNextHydratableSibling (ref), getFirstHydratableChild (ref)
	if not var6 then return end
	local var11 = var5
	
	if not var11 then
		insertNonHydratedInstance(var4, p7)
		var6 = false
		var4 = p7
		
		return
	elseif not tryHydrate(p7, var11) then
		var11 = getNextHydratableSibling(var11)
		
		if not var11 or not tryHydrate(p7, var11) then
			insertNonHydratedInstance(var4, p7)
			var6 = false
			var4 = p7
			
			return
		end
		deleteHydratableInstance(var4, var11)
	end
	var4 = p7
	var5 = getFirstHydratableChild(var11)
end

function prepareToHydrateHostInstance(p8, p9, p10) --[[ line: 308 ]]
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local var12 = hydrateInstance(p8.stateNode, p8.type, p8.memoizedProps, p9, p10, p8)
	p8.updateQueue = var12
	
	return var12 ~= nil
end

function prepareToHydrateHostTextInstance(p11) --[[ line: 340 ]]
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateTextInstance (ref), reactGlobalsModule (ref), var4 (write), hostRoot (ref), didNotMatchHydratedContainerTextInstance (ref), hostComponent (ref), didNotMatchHydratedTextInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local stateNode = p11.stateNode
	local memoizedProps = p11.memoizedProps
	local var13 = hydrateTextInstance(stateNode, memoizedProps, p11)
	
	if reactGlobalsModule.__DEV__ and var13 then
		local var14 = var4
		
		if var14 ~= nil then
			if var14.tag == hostRoot then
				didNotMatchHydratedContainerTextInstance(var14.stateNode.containerInfo, stateNode, memoizedProps)
				
				return var13
			elseif var14.tag == hostComponent then
				didNotMatchHydratedTextInstance(var14.type, var14.memoizedProps, var14.stateNode, stateNode, memoizedProps)
			end
		end
	end
	return var13
end

function prepareToHydrateHostSuspenseInstance(p12) --[[ line: 383 ]]
	-- upvalues: supportsHydration (ref), invariant (ref), hydrateSuspenseInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local memoizedState = p12.memoizedState
	local var15 = if memoizedState ~= nil then nil else memoizedState.dehydrated
	invariant(var15, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	hydrateSuspenseInstance(var15, p12)
end

function skipPastDehydratedSuspenseInstance(p13) --[[ line: 408 ]]
	-- upvalues: supportsHydration (ref), invariant (ref), getNextHydratableInstanceAfterSuspenseInstance (ref)
	if not supportsHydration then
		invariant(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.")
	end
	local memoizedState = p13.memoizedState
	local var16 = if memoizedState ~= nil then nil else memoizedState.dehydrated
	invariant(var16, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.")
	
	return getNextHydratableInstanceAfterSuspenseInstance(var16)
end

function popToNextHostParent(p14) --[[ line: 431 ]]
	-- upvalues: hostComponent (ref), hostRoot (ref), suspenseComponent (ref), var4 (write)
	local _return = p14.return_
	while _return ~= nil and (_return.tag ~= hostComponent and _return.tag ~= hostRoot) and _return.tag ~= suspenseComponent do
		_return = _return.return_
	end
	var4 = _return
end

function popHydrationState(p15) --[[ line: 444 ]]
	-- upvalues: supportsHydration (ref), var4 (write), var6 (write), hostComponent (ref), shouldSetTextContent (ref), var5 (write), getNextHydratableSibling (ref), suspenseComponent (ref)
	if not supportsHydration then
		return false
	elseif p15 ~= var4 then
		return false
	elseif not var6 then
		popToNextHostParent(p15)
		var6 = true
		
		return false
	end
	local type = p15.type
	
	if p15.tag ~= hostComponent or type ~= "head" and type ~= "body" and not shouldSetTextContent(type, p15.memoizedProps) then
		local var17 = var5
		while var17 do
			deleteHydratableInstance(p15, var17)
			var17 = getNextHydratableSibling(var17)
		end
	end
	popToNextHostParent(p15)
	var5 = if p15.tag == suspenseComponent then skipPastDehydratedSuspenseInstance(p15) elseif var4 then getNextHydratableSibling(p15.stateNode) else nil
	
	return true
end

function resetHydrationState() --[[ line: 497 ]]
	-- upvalues: supportsHydration (ref), var4 (write), var5 (write), var6 (write)
	if supportsHydration then
		var4 = nil
		var5 = nil
		var6 = false
		
		return
	end
end

function getIsHydrating() --[[ line: 507 ]]
	-- upvalues: var6 (write)
	return var6
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