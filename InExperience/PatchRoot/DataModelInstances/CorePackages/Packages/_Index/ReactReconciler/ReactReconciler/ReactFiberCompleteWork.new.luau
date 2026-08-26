local function _(p1)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p1))
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

local _ = function(p1)
	-- upvalues: update (ref)
	p1.flags = bit32.bor(p1.flags, update)
end

local _ = function(p1)
	-- upvalues: ref (ref)
	p1.flags = bit32.bor(p1.flags, ref)
end

local function hadNoMutationsEffects(p1, p2)
	-- upvalues: mutationMask (ref), noFlags (ref)
	if p1 ~= nil and p1.child == p2.child then
		return true
	end
	local child = p2.child
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

local var1 = nil
local _ = nil
local updateHostComponent = nil
local updateHostText = nil

if supportsMutation then
	var1 = function(p3, p4, _, _)
		-- upvalues: hostComponent (ref), hostText (ref), appendInitialChild (ref), enableFundamentalAPI (ref), fundamentalComponent (ref), hostPortal (ref)
		local child = p4.child
		while child ~= nil do
			if child.tag == hostComponent or child.tag == hostText then
				appendInitialChild(p3, child.stateNode)
			elseif enableFundamentalAPI and child.tag == fundamentalComponent then
				appendInitialChild(p3, child.stateNode.instance)
			elseif child.tag == hostPortal or child.child == nil then
				if child ~= p4 then
					while child.sibling == nil do
						if child.return_ ~= nil and child.return_ ~= p4 then
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
	
	local var2 = function(_, _) end
	
	updateHostComponent = function(p5, p6, p7, p8, p9)
		-- upvalues: getHostContext (ref), prepareUpdate (ref), update (ref)
		local memoizedProps = p5.memoizedProps
		
		if memoizedProps == p8 then return end
		local var3 = prepareUpdate(p6.stateNode, p7, memoizedProps, p8, p9, getHostContext())
		p6.updateQueue = var3
		
		if var3 then
			p6.flags = bit32.bor(p6.flags, update)
		end
	end
	
	updateHostText = function(_, p5, p6, p7)
		-- upvalues: update (ref)
		if p6 ~= p7 then
			p5.flags = bit32.bor(p5.flags, update)
		end
	end
elseif supportsPersistence then
	var1 = function(_, _, _, _)
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
		error("FIXME (roblox): appendAllChildren is unimplemented", 2)
	end
	
	local _ = function(_, _, _, _)
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
		error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
	end
	
	local function var14(p5, p6)
		-- upvalues: hadNoMutationsEffects (ref), createContainerChildSet (ref), update (ref), finalizeContainerChildren (ref)
		local stateNode = p6.stateNode
		
		if hadNoMutationsEffects(p5, p6) then
			return
		end
		local containerInfo = stateNode.containerInfo
		local var3 = createContainerChildSet(containerInfo)
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
		error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
		stateNode.pendingChildren = var3
		p6.flags = bit32.bor(p6.flags, update)
		finalizeContainerChildren(containerInfo, var3)
	end
else
	local var2 = function(_, _) end
end
local function bubbleProperties(p5)
	-- upvalues: noLanes (ref), noFlags (ref), enableProfilerTimer (ref), profileMode (ref), noMode (ref), mergeLanes (ref), staticMask (ref)
	local var3 = p5.alternate ~= nil and p5.alternate.child == p5.child
	local var4 = noLanes
	local var5 = noFlags
	
	if var3 then
		if enableProfilerTimer and bit32.band(p5.mode, profileMode) ~= noMode then
			local selfBaseDuration = p5.selfBaseDuration
			local child = p5.child
			while child ~= nil do
				var4 = mergeLanes(var4, mergeLanes(child.lanes, child.childLanes))
				var5 = bit32.bor(bit32.bor(var5, bit32.band(child.subtreeFlags, staticMask)), bit32.band(child.flags, staticMask))
				selfBaseDuration += child.treeBaseDuration
				child = child.sibling
			end
			p5.treeBaseDuration = selfBaseDuration
		else
			local child = p5.child
			while child ~= nil do
				var4 = bit32.bor(var4, bit32.bor(child.lanes, child.childLanes))
				var5 = bit32.bor(bit32.bor(var5, bit32.band(child.subtreeFlags, staticMask)), bit32.band(child.flags, staticMask))
				child.return_ = p5
				child = child.sibling
			end
		end
		p5.subtreeFlags = bit32.bor(p5.subtreeFlags, var5)
	elseif enableProfilerTimer and bit32.band(p5.mode, profileMode) ~= noMode then
		local actualDuration = p5.actualDuration
		local selfBaseDuration = p5.selfBaseDuration
		local child = p5.child
		while child ~= nil do
			var4 = mergeLanes(var4, mergeLanes(child.lanes, child.childLanes))
			var5 = bit32.bor(bit32.bor(var5, child.subtreeFlags), child.flags)
			actualDuration += child.actualDuration
			selfBaseDuration += child.treeBaseDuration
			child = child.sibling
		end
		p5.actualDuration = actualDuration
		p5.treeBaseDuration = selfBaseDuration
	else
		local child = p5.child
		while child ~= nil do
			var4 = bit32.bor(var4, bit32.bor(child.lanes, child.childLanes))
			var5 = bit32.bor(bit32.bor(var5, child.subtreeFlags), child.flags)
			child.return_ = p5
			child = child.sibling
		end
	end
	p5.subtreeFlags = bit32.bor(p5.subtreeFlags, var5)
	p5.childLanes = var4
	
	return var3
end

return {
	completeWork = function(p6, p7, p8)
		-- upvalues: indeterminateComponent (ref), lazyComponent (ref), simpleMemoComponent (ref), functionComponent (ref), forwardRef (ref), fragment (ref), mode (ref), contextConsumer (ref), memoComponent (ref), bubbleProperties (ref), classComponent (ref), isContextProvider (ref), popContext (ref), hostRoot (ref), popHostContainer (ref), popTopLevelContextObject (ref), resetWorkInProgressVersions (ref), popHydrationState (ref), update (ref), snapshot (ref), var2 (write), hostComponent (ref), popHostContext (ref), getRootHostContainer (ref), updateHostComponent (write), ref (ref), invariant (ref), getHostContext (ref), prepareToHydrateHostInstance (ref), createInstance (ref), var1 (write), finalizeInitialChildren (ref), hostText (ref), updateHostText (write), prepareToHydrateHostTextInstance (ref), createTextInstance (ref), profiler (ref), callback (ref), passive (ref), performedWork (ref), noFlags (ref), layoutMask (ref), deletion (ref), passiveMask (ref), suspenseComponent (ref), popSuspenseContext (ref), enableSuspenseServerRenderer (ref), prepareToHydrateHostSuspenseInstance (ref), enableSchedulerTracing (ref), markSpawnedWork (ref), offscreenLane (ref), enableProfilerTimer (ref), profileMode (ref), noMode (ref), resetHydrationState (ref), didCapture (ref), transferActualDuration (ref), blockingMode (ref), hasSuspenseContext (ref), suspenseStackCursor (ref), invisibleParentSuspenseContext (ref), renderDidSuspend (ref), renderDidSuspendDelayIfPossible (ref), supportsPersistence (ref), supportsMutation (ref), enableSuspenseCallback (ref), hostPortal (ref), preparePortalMount (ref), contextProvider (ref), popProvider (ref), incompleteClassComponent (ref), suspenseListComponent (ref), fundamentalComponent (ref), scopeComponent (ref), block (ref), offscreenComponent (ref), legacyHiddenComponent (ref), popRenderLanes (ref), includesSomeLane (ref), unknownModule_4 (ref), concurrentMode (ref)
		local var6
		local pendingProps = p7.pendingProps
		
		if p7.tag == indeterminateComponent or p7.tag == lazyComponent or (p7.tag == simpleMemoComponent or p7.tag == functionComponent) or (p7.tag == forwardRef or p7.tag == fragment or (p7.tag == mode or p7.tag == contextConsumer)) or p7.tag == memoComponent then
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == classComponent then
			if isContextProvider(p7.type) then
				popContext(p7)
			end
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == hostRoot then
			popHostContainer(p7)
			popTopLevelContextObject(p7)
			resetWorkInProgressVersions()
			local stateNode = p7.stateNode
			
			if stateNode.pendingContext then
				stateNode.context = stateNode.pendingContext
				stateNode.pendingContext = nil
			end
			if p6 == nil or p6.child == nil then
				if popHydrationState(p7) then
					p7.flags = bit32.bor(p7.flags, update)
				elseif not stateNode.hydrate then
					p7.flags = bit32.bor(p7.flags, snapshot)
				end
			end
			var2(p6, p7)
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == hostComponent then
			popHostContext(p7)
			local var7 = getRootHostContainer()
			local type = p7.type
			
			if p6 == nil or p7.stateNode == nil then
				if not pendingProps then
					invariant(p7.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
					bubbleProperties(p7)
					
					return nil
				end
				local var8 = getHostContext()
				
				if not popHydrationState(p7) then
					local var9 = createInstance(type, pendingProps, var7, var8, p7)
					var1(var9, p7, false, false)
					p7.stateNode = var9
					
					if finalizeInitialChildren(var9, type, pendingProps, var7, var8) then
						p7.flags = bit32.bor(p7.flags, update)
					end
				elseif prepareToHydrateHostInstance(p7, var7, var8) then
					p7.flags = bit32.bor(p7.flags, update)
				end
				if p7.ref ~= nil then
					p7.flags = bit32.bor(p7.flags, ref)
				end
			else
				updateHostComponent(p6, p7, type, pendingProps, var7)
				
				if p6.ref ~= p7.ref then
					p7.flags = bit32.bor(p7.flags, ref)
				end
			end
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == hostText then
			if p6 and p7.stateNode ~= nil then
				updateHostText(p6, p7, p6.memoizedProps, pendingProps)
			elseif typeof(pendingProps) ~= "string" then
				invariant(p7.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
			end
			local var10 = getRootHostContainer()
			local var11 = getHostContext()
			
			if not popHydrationState(p7) then
				p7.stateNode = createTextInstance(pendingProps, var10, var11, p7)
			elseif prepareToHydrateHostTextInstance(p7) then
				p7.flags = bit32.bor(p7.flags, update)
			end
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == profiler then
			if not bubbleProperties(p7) then
				local var12 = update
				local var13 = callback
				local var14 = passive
				local subtreeFlags = p7.subtreeFlags
				local flags = p7.flags
				local var15 = flags
				
				if bit32.band(flags, performedWork) ~= noFlags or bit32.band(subtreeFlags, performedWork) ~= noFlags then
					var15 = bit32.bor(var15, var12)
				end
				if bit32.band(flags, bit32.bor(layoutMask, deletion)) ~= noFlags or bit32.band(subtreeFlags, bit32.bor(layoutMask, deletion)) ~= noFlags then
					var15 = bit32.bor(var15, var13)
				end
				if bit32.band(flags, passiveMask) ~= noFlags or bit32.band(subtreeFlags, passiveMask) ~= noFlags then
					var15 = bit32.bor(var15, var14)
				end
				p7.flags = var15
			end
			return nil
		elseif p7.tag == suspenseComponent then
			popSuspenseContext(p7)
			local memoizedState = p7.memoizedState
			
			if enableSuspenseServerRenderer and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
				if p6 == nil then
					invariant(popHydrationState(p7), "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
					prepareToHydrateHostSuspenseInstance(p7)
					
					if enableSchedulerTracing then
						markSpawnedWork(offscreenLane)
					end
					bubbleProperties(p7)
					
					if enableProfilerTimer and bit32.band(p7.mode, profileMode) ~= noMode and memoizedState ~= nil then
						local child = p7.child
						
						if child ~= nil then
							p7.treeBaseDuration = child.treeBaseDuration
						end
					end
					return nil
				else
					resetHydrationState()
					
					if bit32.band(p7.flags, didCapture) == noFlags then
						p7.memoizedState = nil
					end
					p7.flags = bit32.bor(p7.flags, update)
					bubbleProperties(p7)
					
					if enableProfilerTimer and bit32.band(p7.mode, profileMode) ~= noMode and memoizedState ~= nil then
						local child = p7.child
						
						if child ~= nil then
							p7.treeBaseDuration -= child.treeBaseDuration
						end
					end
					return nil
				end
			elseif bit32.band(p7.flags, didCapture) == noFlags then
				var6 = memoizedState ~= nil
				local var16 = false
				
				if p6 ~= nil then
					var16 = p6.memoizedState ~= nil
				elseif p7.memoizedProps.fallback ~= nil then
					popHydrationState(p7)
				end
				if var6 and not var16 and bit32.band(p7.mode, blockingMode) ~= noMode then
					if (p6 == nil and p7.memoizedProps.unstable_avoidThisFallback ~= true) or hasSuspenseContext(suspenseStackCursor.current, invisibleParentSuspenseContext) then
						renderDidSuspend()
					else
						renderDidSuspendDelayIfPossible()
					end
				end
				if supportsPersistence and var6 then
					p7.flags = bit32.bor(p7.flags, update)
				end
				if supportsMutation and (var6 or var16) then
					p7.flags = bit32.bor(p7.flags, update)
				end
				if enableSuspenseCallback and p7.updateQueue ~= nil and p7.memoizedProps.suspenseCallback ~= nil then
					p7.flags = bit32.bor(p7.flags, update)
				end
				bubbleProperties(p7)
				
				if enableProfilerTimer and bit32.band(p7.mode, profileMode) ~= noMode and var6 then
					local child = p7.child
					
					if child ~= nil then
						p7.treeBaseDuration -= child.treeBaseDuration
					end
				end
				return nil
			else
				p7.lanes = p8
				
				if enableProfilerTimer and bit32.band(p7.mode, profileMode) ~= noMode then
					transferActualDuration(p7)
				end
				return p7
			end
		elseif p7.tag == hostPortal then
			popHostContainer(p7)
			var2(p6, p7)
			
			if p6 == nil then
				preparePortalMount(p7.stateNode.containerInfo)
			end
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == contextProvider then
			popProvider(p7)
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == incompleteClassComponent then
			if isContextProvider(p7.type) then
				popContext(p7)
			end
			bubbleProperties(p7)
			
			return nil
		elseif p7.tag == suspenseListComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
			error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
		elseif p7.tag == fundamentalComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
			error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
		elseif p7.tag == scopeComponent then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
			error("FIXME (roblox): ScopeComponent is unimplemented", 2)
		elseif p7.tag == block then
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
			error("FIXME (roblox): Block is unimplemented", 2)
		elseif p7.tag ~= offscreenComponent and p7.tag ~= legacyHiddenComponent then
			invariant(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", tostring(p7.tag))
			
			return nil
		end
		popRenderLanes(p7)
		var6 = p7.memoizedState ~= nil
		
		if p6 ~= nil and p6.memoizedState ~= nil ~= var6 and pendingProps.mode ~= "unstable-defer-without-hiding" then
			p7.flags = bit32.bor(p7.flags, update)
		end
		if not var6 or includesSomeLane(unknownModule_4.subtreeRenderLanes, offscreenLane) or bit32.band(p7.mode, concurrentMode) == noMode then
			bubbleProperties(p7)
		end
		return nil
	end
}