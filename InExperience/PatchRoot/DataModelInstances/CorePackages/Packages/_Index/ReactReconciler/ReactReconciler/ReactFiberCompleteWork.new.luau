local function _(Text)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(Text))
	error("FIXME (roblox): " .. Text .. " is unimplemented", 2)
end

local Parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local OffscreenLane = ReactFiberLaneModule.OffscreenLane
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local ResetWorkInProgressVersionsFunction = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local IndeterminateComponent = ReactWorkTagsModule.IndeterminateComponent
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local HostComponent = ReactWorkTagsModule.HostComponent
local HostText = ReactWorkTagsModule.HostText
local HostPortal = ReactWorkTagsModule.HostPortal
local ContextProvider = ReactWorkTagsModule.ContextProvider
local ContextConsumer = ReactWorkTagsModule.ContextConsumer
local ForwardRef = ReactWorkTagsModule.ForwardRef
local Fragment = ReactWorkTagsModule.Fragment
local Mode = ReactWorkTagsModule.Mode
local Profiler = ReactWorkTagsModule.Profiler
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local MemoComponent = ReactWorkTagsModule.MemoComponent
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local LazyComponent = ReactWorkTagsModule.LazyComponent
local IncompleteClassComponent = ReactWorkTagsModule.IncompleteClassComponent
local FundamentalComponent = ReactWorkTagsModule.FundamentalComponent
local ScopeComponent = ReactWorkTagsModule.ScopeComponent
local Block = ReactWorkTagsModule.Block
local OffscreenComponent = ReactWorkTagsModule.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTagsModule.LegacyHiddenComponent
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local NoMode = ReactTypeOfModeModule.NoMode
local ConcurrentMode = ReactTypeOfModeModule.ConcurrentMode
local BlockingMode = ReactTypeOfModeModule.BlockingMode
local ProfileMode = ReactTypeOfModeModule.ProfileMode
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Ref = ReactFiberFlagsModule.Ref
local Update = ReactFiberFlagsModule.Update
local HostUpdate = ReactFiberFlagsModule.HostUpdate
local Callback3 = ReactFiberFlagsModule.Callback
local Passive = ReactFiberFlagsModule.Passive
local Deletion = ReactFiberFlagsModule.Deletion
local NoFlags = ReactFiberFlagsModule.NoFlags
local DidCapture = ReactFiberFlagsModule.DidCapture
local Snapshot = ReactFiberFlagsModule.Snapshot
local MutationMask = ReactFiberFlagsModule.MutationMask
local LayoutMask = ReactFiberFlagsModule.LayoutMask
local PassiveMask = ReactFiberFlagsModule.PassiveMask
local StaticMask = ReactFiberFlagsModule.StaticMask
local PerformedWork = ReactFiberFlagsModule.PerformedWork
local InvariantFunction = require(Parent.Shared).invariant
local CreateInstanceFunction = ReactFiberHostConfigModule.createInstance
local CreateTextInstanceFunction = ReactFiberHostConfigModule.createTextInstance
local AppendInitialChildFunction = ReactFiberHostConfigModule.appendInitialChild
local FinalizeInitialChildrenFunction = ReactFiberHostConfigModule.finalizeInitialChildren
local PrepareUpdateFunction = ReactFiberHostConfigModule.prepareUpdate
local SupportsMutation = ReactFiberHostConfigModule.supportsMutation
local SupportsPersistence = ReactFiberHostConfigModule.supportsPersistence
local CreateContainerChildSetFunction = ReactFiberHostConfigModule.createContainerChildSet
local FinalizeContainerChildrenFunction = ReactFiberHostConfigModule.finalizeContainerChildren
local PreparePortalMountFunction = ReactFiberHostConfigModule.preparePortalMount
local ReactFiberHostContextNewModule = require(script.Parent["ReactFiberHostContext.new"])
local GetRootHostContainerFunction = ReactFiberHostContextNewModule.getRootHostContainer
local PopHostContextFunction = ReactFiberHostContextNewModule.popHostContext
local GetHostContextFunction = ReactFiberHostContextNewModule.getHostContext
local PopHostContainerFunction = ReactFiberHostContextNewModule.popHostContainer
local ReactFiberSuspenseContextNewModule = require(script.Parent["ReactFiberSuspenseContext.new"])
local PopSuspenseContextFunction = ReactFiberSuspenseContextNewModule.popSuspenseContext
local SuspenseStackCursor = ReactFiberSuspenseContextNewModule.suspenseStackCursor
local InvisibleParentSuspenseContext = ReactFiberSuspenseContextNewModule.InvisibleParentSuspenseContext
local HasSuspenseContextFunction = ReactFiberSuspenseContextNewModule.hasSuspenseContext
local ReactFiberContextNewModule = require(script.Parent["ReactFiberContext.new"])
local IsContextProviderFunction = ReactFiberContextNewModule.isContextProvider
local PopContextFunction = ReactFiberContextNewModule.popContext
local PopTopLevelContextObjectFunction = ReactFiberContextNewModule.popTopLevelContextObject
local PopProviderFunction = require(script.Parent["ReactFiberNewContext.new"]).popProvider
local ReactFiberHydrationContextNewModule = require(script.Parent["ReactFiberHydrationContext.new"])
local PrepareToHydrateHostSuspenseInstanceFunction = ReactFiberHydrationContextNewModule.prepareToHydrateHostSuspenseInstance
local PopHydrationStateFunction = ReactFiberHydrationContextNewModule.popHydrationState
local ResetHydrationStateFunction = ReactFiberHydrationContextNewModule.resetHydrationState
local PrepareToHydrateHostInstanceFunction = ReactFiberHydrationContextNewModule.prepareToHydrateHostInstance
local PrepareToHydrateHostTextInstanceFunction = ReactFiberHydrationContextNewModule.prepareToHydrateHostTextInstance
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local EnableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local EnableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local EnableFundamentalAPI = ReactFeatureFlags.enableFundamentalAPI
local EnableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
local PopRenderLanesFunction = ReactFiberWorkLoopNewModule.popRenderLanes
local MarkSpawnedWorkFunction = ReactFiberWorkLoopNewModule.markSpawnedWork
local RenderDidSuspendFunction = ReactFiberWorkLoopNewModule.renderDidSuspend
local RenderDidSuspendDelayIfPossibleFunction = ReactFiberWorkLoopNewModule.renderDidSuspendDelayIfPossible
local NoLanes = ReactFiberLaneModule.NoLanes
local IncludesSomeLaneFunction = ReactFiberLaneModule.includesSomeLane
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local TransferActualDurationFunction = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration

local _ = function(p1)
	-- upvalues: Update (copy)
	p1.flags = bit32.bor(p1.flags, Update)
end

local _ = function(p1)
	-- upvalues: Ref (copy)
	p1.flags = bit32.bor(p1.flags, Ref)
end

local function hadNoMutationsEffects(p1, p2): boolean
	-- upvalues: MutationMask (copy), NoFlags (copy)
	if p1 ~= nil and p1.child == p2.child then
		return true
	end
	local Child = p2.child
	while Child ~= nil do
		if bit32.band(Child.flags, MutationMask) ~= NoFlags then
			return false
		end
		if bit32.band(Child.subtreeFlags, MutationMask) ~= NoFlags then
			return false
		end
		Child = Child.sibling
	end
	return true
end

local Callback1: ((any, any, any, any) -> ())? = nil
local UpdateHostContainer = nil
local Callback: ((any, any, any, any, any) -> ())? = nil
local Callback2: ((any, any, any, any) -> ())? = nil

if SupportsMutation then
	Callback1 = function(StateNode, Return, _, _)
		-- upvalues: HostComponent (copy), HostText (copy), AppendInitialChildFunction (copy), EnableFundamentalAPI (copy), FundamentalComponent (copy), HostPortal (copy)
		local Child = Return.child
		while Child ~= nil do
			if Child.tag == HostComponent or Child.tag == HostText then
				AppendInitialChildFunction(StateNode, Child.stateNode)
			elseif EnableFundamentalAPI and Child.tag == FundamentalComponent then
				AppendInitialChildFunction(StateNode, Child.stateNode.instance)
			elseif Child.tag ~= HostPortal and Child.child ~= nil then
				Child.child.return_ = Child
				Child = Child.child
				continue
			end
			if Child == Return then break end
			while Child.sibling == nil do
				if Child.return_ == nil or Child.return_ == Return then break end
				Child = Child.return_
			end
			Child.sibling.return_ = Child.return_
			Child = Child.sibling
		end
	end
	
	UpdateHostContainer = function(_, _) end
	
	Callback = function(p3, Return, Type, PendingProps, p4)
		-- upvalues: GetHostContextFunction (copy), PrepareUpdateFunction (copy), ReactFeatureFlags (copy), HostUpdate (copy), Update (copy)
		local MemoizedProps = p3.memoizedProps
		
		if MemoizedProps == PendingProps then return end
		local PrepareUpdateResult = PrepareUpdateFunction(Return.stateNode, Type, MemoizedProps, PendingProps, p4, (GetHostContextFunction()))
		
		if ReactFeatureFlags.enableWorkLoopTrims then
			if PrepareUpdateResult ~= nil or Return.updateQueue ~= nil then
				Return.updateQueue = PrepareUpdateResult
			end
		else
			Return.updateQueue = PrepareUpdateResult
		end
		if PrepareUpdateResult then
			if ReactFeatureFlags.enableCommitTraversalTrims then
				Return.flags = bit32.bor(Return.flags, HostUpdate)
				
				return
			end
			Return.flags = bit32.bor(Return.flags, Update)
		end
	end
	
	Callback2 = function(_, Return, MemoizedProps, PendingProps)
		-- upvalues: Update (copy)
		if MemoizedProps ~= PendingProps then
			Return.flags = bit32.bor(Return.flags, Update)
		end
	end
elseif SupportsPersistence then
	Callback1 = function(_, _, _, _)
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
	
	UpdateHostContainer = function(p3, p4)
		-- upvalues: hadNoMutationsEffects (copy), CreateContainerChildSetFunction (copy), Update (copy), FinalizeContainerChildrenFunction (copy)
		local StateNode = p4.stateNode
		
		if not hadNoMutationsEffects(p3, p4) then
			local ContainerInfo = StateNode.containerInfo
			local ContainerChildSet = CreateContainerChildSetFunction(ContainerInfo)
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
			error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
			StateNode.pendingChildren = ContainerChildSet
			p4.flags = bit32.bor(p4.flags, Update)
			FinalizeContainerChildrenFunction(ContainerInfo, ContainerChildSet)
			
			return
		end
	end
else
	UpdateHostContainer = function(_, _) end
end
local function bubbleProperties(Return): boolean
	-- upvalues: NoLanes (copy), NoFlags (copy), EnableProfilerTimer (copy), ProfileMode (copy), NoMode (copy), MergeLanesFunction (copy), StaticMask (copy)
	local IsChildMatch: boolean = Return.alternate ~= nil and Return.alternate.child == Return.child
	local Value = NoLanes
	local Value1: number = NoFlags
	
	if IsChildMatch then
		if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode then
			local SelfBaseDuration = Return.selfBaseDuration
			local Child2 = Return.child
			while Child2 ~= nil do
				Value = MergeLanesFunction(Value, MergeLanesFunction(Child2.lanes, Child2.childLanes))
				Value1 = bit32.bor(bit32.bor(Value1, (bit32.band(Child2.subtreeFlags, StaticMask))), (bit32.band(Child2.flags, StaticMask)))
				SelfBaseDuration += Child2.treeBaseDuration
				Child2 = Child2.sibling
			end
			Return.treeBaseDuration = SelfBaseDuration
		else
			local Child = Return.child
			while Child ~= nil do
				Value = bit32.bor(Value, (bit32.bor(Child.lanes, Child.childLanes)))
				Value1 = bit32.bor(bit32.bor(Value1, (bit32.band(Child.subtreeFlags, StaticMask))), (bit32.band(Child.flags, StaticMask)))
				Child.return_ = Return
				Child = Child.sibling
			end
		end
		Return.subtreeFlags = bit32.bor(Return.subtreeFlags, Value1)
	else
		if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode then
			local ActualDuration = Return.actualDuration
			local SelfBaseDuration = Return.selfBaseDuration
			local Child1 = Return.child
			while Child1 ~= nil do
				Value = MergeLanesFunction(Value, MergeLanesFunction(Child1.lanes, Child1.childLanes))
				Value1 = bit32.bor(bit32.bor(Value1, Child1.subtreeFlags), Child1.flags)
				ActualDuration += Child1.actualDuration
				SelfBaseDuration += Child1.treeBaseDuration
				Child1 = Child1.sibling
			end
			Return.actualDuration = ActualDuration
			Return.treeBaseDuration = SelfBaseDuration
		else
			local Child = Return.child
			while Child ~= nil do
				Value = bit32.bor(Value, (bit32.bor(Child.lanes, Child.childLanes)))
				Value1 = bit32.bor(bit32.bor(Value1, Child.subtreeFlags), Child.flags)
				Child.return_ = Return
				Child = Child.sibling
			end
		end
		Return.subtreeFlags = bit32.bor(Return.subtreeFlags, Value1)
	end
	Return.childLanes = Value
	
	return IsChildMatch
end

return {
	completeWork = function(p3, Return, Lanes)
		-- upvalues: IndeterminateComponent (copy), LazyComponent (copy), SimpleMemoComponent (copy), FunctionComponent (copy), ForwardRef (copy), Fragment (copy), Mode (copy), ContextConsumer (copy), MemoComponent (copy), bubbleProperties (copy), ClassComponent (copy), IsContextProviderFunction (copy), PopContextFunction (copy), HostRoot (copy), PopHostContainerFunction (copy), PopTopLevelContextObjectFunction (copy), ResetWorkInProgressVersionsFunction (copy), PopHydrationStateFunction (copy), Update (copy), Snapshot (copy), UpdateHostContainer (ref), HostComponent (copy), PopHostContextFunction (copy), GetRootHostContainerFunction (copy), Callback (ref), Ref (copy), InvariantFunction (copy), GetHostContextFunction (copy), PrepareToHydrateHostInstanceFunction (copy), CreateInstanceFunction (copy), Callback1 (ref), FinalizeInitialChildrenFunction (copy), HostText (copy), Callback2 (ref), PrepareToHydrateHostTextInstanceFunction (copy), CreateTextInstanceFunction (copy), Profiler (copy), Callback3 (copy), Passive (copy), PerformedWork (copy), NoFlags (copy), ReactFeatureFlags (copy), LayoutMask (copy), Deletion (copy), HostUpdate (copy), PassiveMask (copy), SuspenseComponent (copy), PopSuspenseContextFunction (copy), EnableSuspenseServerRenderer (copy), PrepareToHydrateHostSuspenseInstanceFunction (copy), EnableSchedulerTracing (copy), MarkSpawnedWorkFunction (copy), OffscreenLane (copy), EnableProfilerTimer (copy), ProfileMode (copy), NoMode (copy), ResetHydrationStateFunction (copy), DidCapture (copy), TransferActualDurationFunction (copy), BlockingMode (copy), HasSuspenseContextFunction (copy), SuspenseStackCursor (copy), InvisibleParentSuspenseContext (copy), RenderDidSuspendFunction (copy), RenderDidSuspendDelayIfPossibleFunction (copy), SupportsPersistence (copy), SupportsMutation (copy), EnableSuspenseCallback (copy), HostPortal (copy), PreparePortalMountFunction (copy), ContextProvider (copy), PopProviderFunction (copy), IncompleteClassComponent (copy), SuspenseListComponent (copy), FundamentalComponent (copy), ScopeComponent (copy), Block (copy), OffscreenComponent (copy), LegacyHiddenComponent (copy), PopRenderLanesFunction (copy), IncludesSomeLaneFunction (copy), ReactFiberWorkLoopNewModule (copy), ConcurrentMode (copy)
		local PendingProps = Return.pendingProps
		
		if Return.tag == IndeterminateComponent or Return.tag == LazyComponent or Return.tag == SimpleMemoComponent or Return.tag == FunctionComponent or Return.tag == ForwardRef or Return.tag == Fragment or Return.tag == Mode or Return.tag == ContextConsumer or Return.tag == MemoComponent then
			bubbleProperties(Return)
			
			return nil
		end
		if Return.tag == ClassComponent then
			if IsContextProviderFunction(Return.type) then
				PopContextFunction(Return)
			end
			bubbleProperties(Return)
			
			return nil
		elseif Return.tag == HostRoot then
			PopHostContainerFunction(Return)
			PopTopLevelContextObjectFunction(Return)
			ResetWorkInProgressVersionsFunction()
			local StateNode = Return.stateNode
			
			if StateNode.pendingContext then
				StateNode.context = StateNode.pendingContext
				StateNode.pendingContext = nil
			end
			if p3 == nil or p3.child == nil then
				if PopHydrationStateFunction(Return) then
					Return.flags = bit32.bor(Return.flags, Update)
				elseif not StateNode.hydrate then
					Return.flags = bit32.bor(Return.flags, Snapshot)
				end
			end
			UpdateHostContainer(p3, Return)
			bubbleProperties(Return)
			
			return nil
		elseif Return.tag == HostComponent then
			PopHostContextFunction(Return)
			local RootHostContainer = GetRootHostContainerFunction()
			local Type = Return.type
			
			if p3 == nil or Return.stateNode == nil then
				if not PendingProps then
					InvariantFunction(Return.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
					bubbleProperties(Return)
					
					return nil
				end
				local HostContext = GetHostContextFunction()
				
				if PopHydrationStateFunction(Return) then
					if PrepareToHydrateHostInstanceFunction(Return, RootHostContainer, HostContext) then
						Return.flags = bit32.bor(Return.flags, Update)
					end
				else
					local CreateInstanceResult = CreateInstanceFunction(Type, PendingProps, RootHostContainer, HostContext, Return)
					Callback1(CreateInstanceResult, Return, false, false)
					Return.stateNode = CreateInstanceResult
					
					if FinalizeInitialChildrenFunction(CreateInstanceResult, Type, PendingProps, RootHostContainer, HostContext) then
						Return.flags = bit32.bor(Return.flags, Update)
					end
				end
				if Return.ref ~= nil then
					Return.flags = bit32.bor(Return.flags, Ref)
				end
			else
				Callback(p3, Return, Type, PendingProps, RootHostContainer)
				
				if p3.ref ~= Return.ref then
					Return.flags = bit32.bor(Return.flags, Ref)
				end
			end
			bubbleProperties(Return)
			
			return nil
		elseif Return.tag == HostText then
			if p3 and Return.stateNode ~= nil then
				Callback2(p3, Return, p3.memoizedProps, PendingProps)
			else
				if typeof(PendingProps) ~= "string" then
					InvariantFunction(Return.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.")
				end
				local RootHostContainer = GetRootHostContainerFunction()
				local HostContext = GetHostContextFunction()
				
				if PopHydrationStateFunction(Return) then
					if PrepareToHydrateHostTextInstanceFunction(Return) then
						Return.flags = bit32.bor(Return.flags, Update)
					end
				else
					Return.stateNode = CreateTextInstanceFunction(PendingProps, RootHostContainer, HostContext, Return)
				end
			end
			bubbleProperties(Return)
			
			return nil
		elseif Return.tag == Profiler then
			if not bubbleProperties(Return) then
				local SubtreeFlags: number = Return.subtreeFlags
				local Flags: number = Return.flags
				local Value: number = Flags
				
				if bit32.band(Flags, PerformedWork) ~= NoFlags or bit32.band(SubtreeFlags, PerformedWork) ~= NoFlags then
					Value = bit32.bor(Value, Update)
				end
				if ReactFeatureFlags.enableCommitTraversalTrims then
					if bit32.band(Flags, (bit32.bor(LayoutMask, Deletion, HostUpdate))) ~= NoFlags or bit32.band(SubtreeFlags, (bit32.bor(LayoutMask, Deletion, HostUpdate))) ~= NoFlags then
						Value = bit32.bor(Value, Callback3)
					end
				elseif bit32.band(Flags, (bit32.bor(LayoutMask, Deletion))) ~= NoFlags or bit32.band(SubtreeFlags, (bit32.bor(LayoutMask, Deletion))) ~= NoFlags then
					Value = bit32.bor(Value, Callback3)
				end
				if bit32.band(Flags, PassiveMask) ~= NoFlags or bit32.band(SubtreeFlags, PassiveMask) ~= NoFlags then
					Value = bit32.bor(Value, Passive)
				end
				Return.flags = Value
			end
			return nil
		elseif Return.tag == SuspenseComponent then
			PopSuspenseContextFunction(Return)
			local MemoizedState = Return.memoizedState
			
			if EnableSuspenseServerRenderer and MemoizedState ~= nil and MemoizedState.dehydrated ~= nil then
				if p3 == nil then
					InvariantFunction(PopHydrationStateFunction(Return), "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.")
					PrepareToHydrateHostSuspenseInstanceFunction(Return)
					
					if EnableSchedulerTracing then
						MarkSpawnedWorkFunction(OffscreenLane)
					end
					bubbleProperties(Return)
					
					if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode and MemoizedState ~= nil then
						local Child1 = Return.child
						
						if Child1 ~= nil then
							Return.treeBaseDuration = Child1.treeBaseDuration
						end
					end
					return nil
				else
					ResetHydrationStateFunction()
					
					if bit32.band(Return.flags, DidCapture) == NoFlags then
						Return.memoizedState = nil
					end
					Return.flags = bit32.bor(Return.flags, Update)
					bubbleProperties(Return)
					
					if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode and MemoizedState ~= nil then
						local Child = Return.child
						
						if Child ~= nil then
							Return.treeBaseDuration -= Child.treeBaseDuration
						end
					end
					return nil
				end
			elseif bit32.band(Return.flags, DidCapture) == NoFlags then
				local v1 = MemoizedState ~= nil
				local HasMemoizedState = false
				
				if p3 == nil then
					if Return.memoizedProps.fallback ~= nil then
						PopHydrationStateFunction(Return)
					end
				else
					HasMemoizedState = p3.memoizedState ~= nil
				end
				if v1 and not HasMemoizedState and bit32.band(Return.mode, BlockingMode) ~= NoMode then
					if p3 == nil and Return.memoizedProps.unstable_avoidThisFallback ~= true or HasSuspenseContextFunction(SuspenseStackCursor.current, InvisibleParentSuspenseContext) then
						RenderDidSuspendFunction()
					else
						RenderDidSuspendDelayIfPossibleFunction()
					end
				end
				if SupportsPersistence and v1 then
					Return.flags = bit32.bor(Return.flags, Update)
				end
				if SupportsMutation and (v1 or HasMemoizedState) then
					Return.flags = bit32.bor(Return.flags, Update)
				end
				if EnableSuspenseCallback and Return.updateQueue ~= nil and Return.memoizedProps.suspenseCallback ~= nil then
					Return.flags = bit32.bor(Return.flags, Update)
				end
				bubbleProperties(Return)
				
				if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode and v1 then
					local Child = Return.child
					
					if Child ~= nil then
						Return.treeBaseDuration -= Child.treeBaseDuration
					end
				end
				return nil
			else
				Return.lanes = Lanes
				
				if EnableProfilerTimer and bit32.band(Return.mode, ProfileMode) ~= NoMode then
					TransferActualDurationFunction(Return)
				end
				return Return
			end
		elseif Return.tag == HostPortal then
			PopHostContainerFunction(Return)
			UpdateHostContainer(p3, Return)
			
			if p3 == nil then
				PreparePortalMountFunction(Return.stateNode.containerInfo)
			end
			bubbleProperties(Return)
			
			return nil
		else
			if Return.tag == ContextProvider then
				PopProviderFunction(Return)
				bubbleProperties(Return)
				
				return nil
			end
			if Return.tag == IncompleteClassComponent then
				if IsContextProviderFunction(Return.type) then
					PopContextFunction(Return)
				end
				bubbleProperties(Return)
				
				return nil
			else
				if Return.tag == SuspenseListComponent then
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
					error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
				elseif Return.tag == FundamentalComponent then
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
					error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
				elseif Return.tag == ScopeComponent then
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
					error("FIXME (roblox): ScopeComponent is unimplemented", 2)
				elseif Return.tag == Block then
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
					print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
					error("FIXME (roblox): Block is unimplemented", 2)
				elseif Return.tag == OffscreenComponent or Return.tag == LegacyHiddenComponent then
					PopRenderLanesFunction(Return)
					local HasMemoizedState = Return.memoizedState ~= nil
					
					if p3 ~= nil and (p3.memoizedState ~= nil ~= HasMemoizedState and PendingProps.mode ~= "unstable-defer-without-hiding") then
						Return.flags = bit32.bor(Return.flags, Update)
					end
					if not HasMemoizedState or (IncludesSomeLaneFunction(ReactFiberWorkLoopNewModule.subtreeRenderLanes, OffscreenLane) or bit32.band(Return.mode, ConcurrentMode) == NoMode) then
						bubbleProperties(Return)
					end
					return nil
				end
				InvariantFunction(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(Return.tag)))
				
				return nil
			end
		end
	end
}