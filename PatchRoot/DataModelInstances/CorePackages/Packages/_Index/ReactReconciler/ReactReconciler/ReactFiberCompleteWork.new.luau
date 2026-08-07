-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:34 2026 Pacific Standard Time.

local function _(p0) --[[ line: 11 | named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p0))
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local offscreenLane = reactFiberLaneModule.OffscreenLane
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local resetWorkInProgressVersions = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local indeterminateComponent = reactWorkTagsModule.IndeterminateComponent
local functionComponent = reactWorkTagsModule.FunctionComponent
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local hostComponent = reactWorkTagsModule.HostComponent
local hostText = reactWorkTagsModule.HostText
local hostPortal = reactWorkTagsModule.HostPortal
local contextProvider = reactWorkTagsModule.ContextProvider
local contextConsumer = reactWorkTagsModule.ContextConsumer
local forwardRef = reactWorkTagsModule.ForwardRef
local fragment = reactWorkTagsModule.Fragment
local mode = reactWorkTagsModule.Mode
local profiler = reactWorkTagsModule.Profiler
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local memoComponent = reactWorkTagsModule.MemoComponent
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local lazyComponent = reactWorkTagsModule.LazyComponent
local incompleteClassComponent = reactWorkTagsModule.IncompleteClassComponent
local fundamentalComponent = reactWorkTagsModule.FundamentalComponent
local scopeComponent = reactWorkTagsModule.ScopeComponent
local block = reactWorkTagsModule.Block
local offscreenComponent = reactWorkTagsModule.OffscreenComponent
local legacyHiddenComponent = reactWorkTagsModule.LegacyHiddenComponent
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local noMode = reactTypeOfModeModule.NoMode
local concurrentMode = reactTypeOfModeModule.ConcurrentMode
local blockingMode = reactTypeOfModeModule.BlockingMode
local profileMode = reactTypeOfModeModule.ProfileMode
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local ref = reactFiberFlagsModule.Ref
local update = reactFiberFlagsModule.Update
local callback = reactFiberFlagsModule.Callback
local passive = reactFiberFlagsModule.Passive
local deletion = reactFiberFlagsModule.Deletion
local noFlags = reactFiberFlagsModule.NoFlags
local didCapture = reactFiberFlagsModule.DidCapture
local snapshot = reactFiberFlagsModule.Snapshot
local mutationMask = reactFiberFlagsModule.MutationMask
local layoutMask = reactFiberFlagsModule.LayoutMask
local passiveMask = reactFiberFlagsModule.PassiveMask
local staticMask = reactFiberFlagsModule.StaticMask
local performedWork = reactFiberFlagsModule.PerformedWork
local invariant = require(parent.Shared).invariant
local createInstance = reactFiberHostConfigModule.createInstance
local createTextInstance = reactFiberHostConfigModule.createTextInstance
local appendInitialChild = reactFiberHostConfigModule.appendInitialChild
local finalizeInitialChildren = reactFiberHostConfigModule.finalizeInitialChildren
local prepareUpdate = reactFiberHostConfigModule.prepareUpdate
local supportsMutation = reactFiberHostConfigModule.supportsMutation
local supportsPersistence = reactFiberHostConfigModule.supportsPersistence
local createContainerChildSet = reactFiberHostConfigModule.createContainerChildSet
local finalizeContainerChildren = reactFiberHostConfigModule.finalizeContainerChildren
local preparePortalMount = reactFiberHostConfigModule.preparePortalMount
local unknownModule = require(script.Parent["ReactFiberHostContext.new"])
local getRootHostContainer = unknownModule.getRootHostContainer
local popHostContext = unknownModule.popHostContext
local getHostContext = unknownModule.getHostContext
local popHostContainer = unknownModule.popHostContainer
local unknownModule_1 = require(script.Parent["ReactFiberSuspenseContext.new"])
local popSuspenseContext = unknownModule_1.popSuspenseContext
local suspenseStackCursor = unknownModule_1.suspenseStackCursor
local invisibleParentSuspenseContext = unknownModule_1.InvisibleParentSuspenseContext
local hasSuspenseContext = unknownModule_1.hasSuspenseContext
local unknownModule_2 = require(script.Parent["ReactFiberContext.new"])
local isContextProvider = unknownModule_2.isContextProvider
local popContext = unknownModule_2.popContext
local popTopLevelContextObject = unknownModule_2.popTopLevelContextObject
local popProvider = require(script.Parent["ReactFiberNewContext.new"]).popProvider
local unknownModule_3 = require(script.Parent["ReactFiberHydrationContext.new"])
local prepareToHydrateHostSuspenseInstance = unknownModule_3.prepareToHydrateHostSuspenseInstance
local popHydrationState = unknownModule_3.popHydrationState
local resetHydrationState = unknownModule_3.resetHydrationState
local prepareToHydrateHostInstance = unknownModule_3.prepareToHydrateHostInstance
local prepareToHydrateHostTextInstance = unknownModule_3.prepareToHydrateHostTextInstance
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableSchedulerTracing = reactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = reactFeatureFlags.enableSuspenseCallback
local enableSuspenseServerRenderer = reactFeatureFlags.enableSuspenseServerRenderer
local enableFundamentalAPI = reactFeatureFlags.enableFundamentalAPI
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local unknownModule_4 = require(script.Parent["ReactFiberWorkLoop.new"])
local popRenderLanes = unknownModule_4.popRenderLanes
local markSpawnedWork = unknownModule_4.markSpawnedWork
local renderDidSuspend = unknownModule_4.renderDidSuspend
local renderDidSuspendDelayIfPossible = unknownModule_4.renderDidSuspendDelayIfPossible
local noLanes = reactFiberLaneModule.NoLanes
local includesSomeLane = reactFiberLaneModule.includesSomeLane
local mergeLanes = reactFiberLaneModule.mergeLanes
local transferActualDuration = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration

local _ = function(p1) --[[ line: 189 | named "markUpdate" ]]
	-- upvalues: update (ref)
	p1.flags = bit32.bor(p1.flags, update)
end

local _ = function(p2) --[[ line: 195 | named "markRef" ]]
	-- upvalues: ref (ref)
	p2.flags = bit32.bor(p2.flags, ref)
end

local function hadNoMutationsEffects(p3, p4) --[[ line: 201 ]]
	-- upvalues: mutationMask (ref), noFlags (ref)
	if p3 ~= nil and p3.child == p4.child then
		return true
	end
	local child = p4.child
	while child ~= nil do
		if bit32.band(child.flags, mutationMask) == noFlags then
			if bit32.band(child.subtreeFlags, mutationMask) == noFlags then
				child = child.sibling
				continue
			end
			return false
		end
		return false
	end
	return true
end

local var11 = nil
local _ = nil
local updateHostComponent = nil
local updateHostText = nil

if supportsMutation then
	var11 = function(p5, p6, _, _) --[[ line: 227 ]]
		-- upvalues: hostComponent (ref), hostText (ref), appendInitialChild (ref), enableFundamentalAPI (ref), fundamentalComponent (ref), hostPortal (ref)
		local child = p6.child
		while child ~= nil do
			if child.tag == hostComponent or child.tag == hostText then
				appendInitialChild(p5, child.stateNode)
			elseif enableFundamentalAPI and child.tag == fundamentalComponent then
				appendInitialChild(p5, child.stateNode.instance)
			elseif child.tag == hostPortal or child.child == nil then
				if child ~= p6 then
					while child.sibling == nil do
						if child.return_ ~= nil and child.return_ ~= p6 then
							child = child.return_
							continue
						end
						return
					end
					child.sibling.return_ = child.return_
					child = child.sibling
				end
				return
			else
				child.child.return_ = child
				child = child.child
			end
		end
	end
	
	local var14 = function(_, _) --[[ line: 265 ]] end
	
	updateHostComponent = function(p7, p8, p9, p10, p11) --[[ line: 268 | named "updateHostComponent" ]]
		-- upvalues: getHostContext (ref), prepareUpdate (ref), update (ref)
		local memoizedProps = p7.memoizedProps
		
		if memoizedProps == p10 then return end
		local var16 = prepareUpdate(p8.stateNode, p9, memoizedProps, p10, p11, getHostContext())
		p8.updateQueue = var16
		
		if var16 then
			p8.flags = bit32.bor(p8.flags, update)
		end
	end
	
	updateHostText = function(_, p12, p13, p14) --[[ line: 309 | named "updateHostText" ]]
		-- upvalues: update (ref)
		if p13 ~= p14 then
			p12.flags = bit32.bor(p12.flags, update)
		end
	end
elseif supportsPersistence then
	var11 = function(_, _, _, _) --[[ line: 322 ]]
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
		error("FIXME (roblox): appendAllChildren is unimplemented", 2)
	end
	
	local _ = function(_, _, _, _) --[[ line: 417 | named "appendAllChildrenToContainer" ]]
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
		error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
	end
	
	local function var14(p15, p16) --[[ line: 511 | named "updateHostContainer" ]]
		-- upvalues: hadNoMutationsEffects (ref), createContainerChildSet (ref), update (ref), finalizeContainerChildren (ref)
		local stateNode = p16.stateNode
		
		if hadNoMutationsEffects(p15, p16) then
			return
		end
		local containerInfo = stateNode.containerInfo
		local var17 = createContainerChildSet(containerInfo)
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
		error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
		stateNode.pendingChildren = var17
		p16.flags = bit32.bor(p16.flags, update)
		finalizeContainerChildren(containerInfo, var17)
	end
else
	local var14 = function(_, _) --[[ line: 627 ]] end
end
local function bubbleProperties(p17) --[[ line: 720 ]]
	-- upvalues: noLanes (ref), noFlags (ref), enableProfilerTimer (ref), profileMode (ref), noMode (ref), mergeLanes (ref), staticMask (ref)
	local var18 = p17.alternate ~= nil and p17.alternate.child == p17.child
	local var19 = noLanes
	local var20 = noFlags
	
	if var18 then
		if enableProfilerTimer and bit32.band(p17.mode, profileMode) ~= noMode then
			local selfBaseDuration = p17.selfBaseDuration
			local child = p17.child
			while child ~= nil do
				var19 = mergeLanes(var19, mergeLanes(child.lanes, child.childLanes))
				var20 = bit32.bor(bit32.bor(var20, bit32.band(child.subtreeFlags, staticMask)), bit32.band(child.flags, staticMask))
				selfBaseDuration += child.treeBaseDuration
				child = child.sibling
			end
			p17.treeBaseDuration = selfBaseDuration
		else
			local child = p17.child
			while child ~= nil do
				var19 = bit32.bor(var19, bit32.bor(child.lanes, child.childLanes))
				var20 = bit32.bor(bit32.bor(var20, bit32.band(child.subtreeFlags, staticMask)), bit32.band(child.flags, staticMask))
				child.return_ = p17
				child = child.sibling
			end
		end
		p17.subtreeFlags = bit32.bor(p17.subtreeFlags, var20)
	elseif enableProfilerTimer and bit32.band(p17.mode, profileMode) ~= noMode then
		local actualDuration = p17.actualDuration
		local selfBaseDuration = p17.selfBaseDuration
		local child = p17.child
		while child ~= nil do
			var19 = mergeLanes(var19, mergeLanes(child.lanes, child.childLanes))
			var20 = bit32.bor(bit32.bor(var20, child.subtreeFlags), child.flags)
			actualDuration += child.actualDuration
			selfBaseDuration += child.treeBaseDuration
			child = child.sibling
		end
		p17.actualDuration = actualDuration
		p17.treeBaseDuration = selfBaseDuration
	else
		local child = p17.child
		while child ~= nil do
			var19 = bit32.bor(var19, bit32.bor(child.lanes, child.childLanes))
			var20 = bit32.bor(bit32.bor(var20, child.subtreeFlags), child.flags)
			child.return_ = p17
			child = child.sibling
		end
	end
	p17.subtreeFlags = bit32.bor(p17.subtreeFlags, var20)
	p17.childLanes = var19
	
	return var18
end

return {
	completeWork = function(p18, p19, p20) --[[ line: 859 ]]
		-- upvalues: indeterminateComponent (ref), lazyComponent (ref), simpleMemoComponent (ref), functionComponent (ref), forwardRef (ref), fragment (ref), mode (ref), contextConsumer (ref), memoComponent (ref), bubbleProperties (ref), classComponent (ref), isContextProvider (ref), popContext (ref), hostRoot (ref), popHostContainer (ref), popTopLevelContextObject (ref), resetWorkInProgressVersions (ref), popHydrationState (ref), update (ref), snapshot (ref), var14 (write), hostComponent (ref), popHostContext (ref), getRootHostContainer (ref), updateHostComponent (write), ref (ref), invariant (ref), getHostContext (ref), prepareToHydrateHostInstance (ref), createInstance (ref), var11 (write), finalizeInitialChildren (ref), hostText (ref), updateHostText (write), prepareToHydrateHostTextInstance (ref), createTextInstance (ref), profiler (ref), callback (ref), passive (ref), performedWork (ref), noFlags (ref), layoutMask (ref), deletion (ref), passiveMask (ref), suspenseComponent (ref), popSuspenseContext (ref), enableSuspenseServerRenderer (ref), prepareToHydrateHostSuspenseInstance (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), offscreenLane (ref), enableProfilerTimer (ref), profileMode (ref), noMode (ref), resetHydrationState (ref), didCapture (ref), transferActualDuration (ref), blockingMode (ref), hasSuspenseContext (ref), suspenseStackCursor (ref), invisibleParentSuspenseContext (ref), renderDidSuspend (ref), renderDidSuspendDelayIfPossible (ref), supportsPersistence (ref), supportsMutation (ref), enableSuspenseCallback (ref), hostPortal (ref), preparePortalMount (ref), contextProvider (ref), popProvider (ref), incompleteClassComponent (ref), suspenseListComponent (ref), fundamentalComponent (ref), scopeComponent (ref), block (ref), offscreenComponent (ref), legacyHiddenComponent (ref), popRenderLanes (ref), includesSomeLane (ref), unknownModule_4 (ref), concurrentMode (ref)
		local var30
		local pendingProps = p19.pendingProps
		
		if p19.tag == indeterminateComponent or p19.tag == lazyComponent or (p19.tag == simpleMemoComponent or p19.tag == functionComponent) or (p19.tag == forwardRef or p19.tag == fragment or (p19.tag == mode or p19.tag == contextConsumer)) or p19.tag == memoComponent then
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == classComponent then
			if isContextProvider(p19.type) then
				popContext(p19)
			end
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == hostRoot then
			popHostContainer(p19)
			popTopLevelContextObject(p19)
			resetWorkInProgressVersions()
			local stateNode = p19.stateNode
			
			if stateNode.pendingContext then
				stateNode.context = stateNode.pendingContext
				stateNode.pendingContext = nil
			end
			if p18 == nil or p18.child == nil then
				if popHydrationState(p19) then
					p19.flags = bit32.bor(p19.flags, update)
				elseif not stateNode.hydrate then
					p19.flags = bit32.bor(p19.flags, snapshot)
				end
			end
			var14(p18, p19)
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == hostComponent then
			popHostContext(p19)
			local var21 = getRootHostContainer()
			local type = p19.type
			
			if p18 == nil or p19.stateNode == nil then
				if not pendingProps then
					invariant(p19.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
					bubbleProperties(p19)
					
					return nil
				end
				local var22 = getHostContext()
				
				if not popHydrationState(p19) then
					local var23 = createInstance(type, pendingProps, var21, var22, p19)
					var11(var23, p19, false, false)
					p19.stateNode = var23
					
					if finalizeInitialChildren(var23, type, pendingProps, var21, var22) then
						p19.flags = bit32.bor(p19.flags, update)
					end
				elseif prepareToHydrateHostInstance(p19, var21, var22) then
					p19.flags = bit32.bor(p19.flags, update)
				end
				if p19.ref ~= nil then
					p19.flags = bit32.bor(p19.flags, ref)
				end
			else
				updateHostComponent(p18, p19, type, pendingProps, var21)
				
				if p18.ref ~= p19.ref then
					p19.flags = bit32.bor(p19.flags, ref)
				end
			end
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == hostText then
			if p18 and p19.stateNode ~= nil then
				updateHostText(p18, p19, p18.memoizedProps, pendingProps)
			elseif typeof(pendingProps) ~= "string" then
				invariant(p19.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
			end
			local var24 = getRootHostContainer()
			local var25 = getHostContext()
			
			if not popHydrationState(p19) then
				p19.stateNode = createTextInstance(pendingProps, var24, var25, p19)
			elseif prepareToHydrateHostTextInstance(p19) then
				p19.flags = bit32.bor(p19.flags, update)
			end
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == profiler then
			if not bubbleProperties(p19) then
				local var26 = update
				local var27 = callback
				local var28 = passive
				local subtreeFlags = p19.subtreeFlags
				local flags = p19.flags
				local var29 = flags
				
				if bit32.band(flags, performedWork) ~= noFlags or bit32.band(subtreeFlags, performedWork) ~= noFlags then
					var29 = bit32.bor(var29, var26)
				end
				if bit32.band(flags, bit32.bor(layoutMask, deletion)) ~= noFlags or bit32.band(subtreeFlags, bit32.bor(layoutMask, deletion)) ~= noFlags then
					var29 = bit32.bor(var29, var27)
				end
				if bit32.band(flags, passiveMask) ~= noFlags or bit32.band(subtreeFlags, passiveMask) ~= noFlags then
					var29 = bit32.bor(var29, var28)
				end
				p19.flags = var29
			end
			return nil
		elseif p19.tag == suspenseComponent then
			popSuspenseContext(p19)
			local memoizedState = p19.memoizedState
			
			if enableSuspenseServerRenderer and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
				if p18 == nil then
					invariant(popHydrationState(p19), "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
					prepareToHydrateHostSuspenseInstance(p19)
					
					if enableSchedulerTracing then
						markSpawnedWork(offscreenLane)
					end
					bubbleProperties(p19)
					
					if enableProfilerTimer and bit32.band(p19.mode, profileMode) ~= noMode and memoizedState ~= nil then
						local child = p19.child
						
						if child ~= nil then
							p19.treeBaseDuration = child.treeBaseDuration
						end
					end
					return nil
				else
					resetHydrationState()
					
					if bit32.band(p19.flags, didCapture) == noFlags then
						p19.memoizedState = nil
					end
					p19.flags = bit32.bor(p19.flags, update)
					bubbleProperties(p19)
					
					if enableProfilerTimer and bit32.band(p19.mode, profileMode) ~= noMode and memoizedState ~= nil then
						local child = p19.child
						
						if child ~= nil then
							p19.treeBaseDuration -= child.treeBaseDuration
						end
					end
					return nil
				end
			elseif bit32.band(p19.flags, didCapture) == noFlags then
				var30 = memoizedState ~= nil
				local var31 = false
				
				if p18 ~= nil then
					var31 = p18.memoizedState ~= nil
				elseif p19.memoizedProps.fallback ~= nil then
					popHydrationState(p19)
				end
				if var30 and not var31 and bit32.band(p19.mode, blockingMode) ~= noMode then
					if (p18 == nil and p19.memoizedProps.unstable_avoidThisFallback ~= true) or hasSuspenseContext(suspenseStackCursor.current, invisibleParentSuspenseContext) then
						renderDidSuspend()
					else
						renderDidSuspendDelayIfPossible()
					end
				end
				if supportsPersistence and var30 then
					p19.flags = bit32.bor(p19.flags, update)
				end
				if supportsMutation and (var30 or var31) then
					p19.flags = bit32.bor(p19.flags, update)
				end
				if enableSuspenseCallback and p19.updateQueue ~= nil and p19.memoizedProps.suspenseCallback ~= nil then
					p19.flags = bit32.bor(p19.flags, update)
				end
				bubbleProperties(p19)
				
				if enableProfilerTimer and bit32.band(p19.mode, profileMode) ~= noMode and var30 then
					local child = p19.child
					
					if child ~= nil then
						p19.treeBaseDuration -= child.treeBaseDuration
					end
				end
				return nil
			else
				p19.lanes = p20
				
				if enableProfilerTimer and bit32.band(p19.mode, profileMode) ~= noMode then
					transferActualDuration(p19)
				end
				return p19
			end
		elseif p19.tag == hostPortal then
			popHostContainer(p19)
			var14(p18, p19)
			
			if p18 == nil then
				preparePortalMount(p19.stateNode.containerInfo)
			end
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == contextProvider then
			popProvider(p19)
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == incompleteClassComponent then
			if isContextProvider(p19.type) then
				popContext(p19)
			end
			bubbleProperties(p19)
			
			return nil
		elseif p19.tag == suspenseListComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
			error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
		elseif p19.tag == fundamentalComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
			error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
		elseif p19.tag == scopeComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
			error("FIXME (roblox): ScopeComponent is unimplemented", 2)
		elseif p19.tag == block then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
			error("FIXME (roblox): Block is unimplemented", 2)
		elseif p19.tag ~= offscreenComponent and p19.tag ~= legacyHiddenComponent then
			invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", tostring(p19.tag))
			
			return nil
		end
		popRenderLanes(p19)
		var30 = p19.memoizedState ~= nil
		
		if p18 ~= nil and p18.memoizedState ~= nil ~= var30 and pendingProps.mode ~= "unstable-defer-without-hiding" then
			p19.flags = bit32.bor(p19.flags, update)
		end
		if not var30 or includesSomeLane(unknownModule_4.subtreeRenderLanes, offscreenLane) or bit32.band(p19.mode, concurrentMode) == noMode then
			bubbleProperties(p19)
		end
		return nil
	end
}