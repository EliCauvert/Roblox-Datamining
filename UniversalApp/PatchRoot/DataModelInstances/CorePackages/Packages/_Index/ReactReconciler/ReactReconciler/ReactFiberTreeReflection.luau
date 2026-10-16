local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local InvariantFunction = require(Parent.Shared).invariant
local GetFunction = require(Parent.Shared).ReactInstanceMap.get
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostComponent = ReactWorkTagsModule.HostComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local HostPortal = ReactWorkTagsModule.HostPortal
local HostText = ReactWorkTagsModule.HostText
local FundamentalComponent = ReactWorkTagsModule.FundamentalComponent
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local NoFlags = ReactFiberFlagsModule.NoFlags
local Placement = ReactFiberFlagsModule.Placement
local Hydrating = ReactFiberFlagsModule.Hydrating
local EnableFundamentalAPI = require(Parent.Shared).ReactFeatureFlags.enableFundamentalAPI
local ReactCurrentOwner = require(Parent.Shared).ReactSharedInternals.ReactCurrentOwner

local function getNearestMountedFiber(Return) --[[ Line: 50 ]]
	-- upvalues: Placement (copy), Hydrating (copy), NoFlags (copy), HostRoot (copy)
	local Return1 = Return
	local Return2 = Return
	
	if Return.alternate then
		while Return1.return_ do
			Return1 = Return1.return_
		end
	else
		local Return3 = Return1
		repeat
			Return1 = Return3
			if bit32.band(Return1.flags, (bit32.bor(Placement, Hydrating))) ~= NoFlags then
				Return2 = Return1.return_
			end
			Return3 = Return1.return_
		until not Return3
	end
	return if Return1.tag == HostRoot then Return2 else nil
end

local function _(Return) --[[ Line: 140 | Named "assertIsMounted" ]]
	-- upvalues: InvariantFunction (copy), getNearestMountedFiber (copy)
	InvariantFunction(getNearestMountedFiber(Return) == Return, "Unable to find node on an unmounted component.")
end

local function findCurrentFiberUsingSlowPath(Return) --[[ Line: 147 ]]
	-- upvalues: getNearestMountedFiber (copy), InvariantFunction (copy), HostRoot (copy)
	local Alternate = Return.alternate
	
	if not Alternate then
		local NearestMountedFiber = getNearestMountedFiber(Return)
		InvariantFunction(NearestMountedFiber ~= nil, "Unable to find node on an unmounted component.")
		
		return if NearestMountedFiber == Return then Return else nil
	end
	local Child = Return
	local Child1 = Alternate
	local Return2 = nil
	local Alternate1 = nil
	local Flag = nil
	while true do
		Return2 = Child.return_
		if Return2 == nil then break end
		Alternate1 = Return2.alternate
		
		if Alternate1 == nil then
			local Return1 = Return2.return_
			
			if Return1 == nil then break end
			Child = Return1
			Child1 = Return1
		else
			if Return2.child == Alternate1.child then
				local Child2 = Return2.child
				while Child2 do
					if Child2 == Child then
						InvariantFunction(getNearestMountedFiber(Return2) == Return2, "Unable to find node on an unmounted component.")
						
						return Return
					elseif Child2 == Child1 then
						InvariantFunction(getNearestMountedFiber(Return2) == Return2, "Unable to find node on an unmounted component.")
						
						return Alternate
					else
						Child2 = Child2.sibling
					end
				end
				InvariantFunction(false, "Unable to find node on an unmounted component.")
			end
			if Child.return_ == Child1.return_ then
				Flag = false
				local Child3 = Return2.child
				while Child3 do
					if Child3 == Child then
						Flag = true
						Child = Return2
						Child1 = Alternate1
						break
					end
					if Child3 ~= Child1 then
						Child3 = Child3.sibling
						continue
					end
					Flag = true
					Child1 = Return2
					Child = Alternate1
					break
				end
				if not Flag then
					local Child4 = Alternate1.child
					while Child4 do
						if Child4 == Child then
							Flag = true
							Child = Alternate1
							Child1 = Return2
							break
						end
						if Child4 ~= Child1 then
							Child4 = Child4.sibling
							continue
						end
						Flag = true
						Child1 = Alternate1
						Child = Return2
						break
					end
					InvariantFunction(Flag, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.")
				end
			else
				Child = Return2
				Child1 = Alternate1
			end
			InvariantFunction(Child.alternate == Child1, "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.")
		end
	end
	InvariantFunction(Child.tag == HostRoot, "Unable to find node on an unmounted component.")
	
	return if Child.stateNode.current == Child then Return else Alternate
end

return {
	getNearestMountedFiber = getNearestMountedFiber,
	getSuspenseInstanceFromFiber = function(p1) --[[ Line: 84 ]]
		-- upvalues: SuspenseComponent (copy)
		if p1.tag == SuspenseComponent then
			local MemoizedState = p1.memoizedState
			
			if MemoizedState == nil then
				local Alternate = p1.alternate
				
				if Alternate ~= nil then
					MemoizedState = Alternate.memoizedState
				end
			end
			if MemoizedState then
				return MemoizedState.dehydrated
			end
		end
		return nil
	end,
	getContainerFromFiber = function(p1) --[[ Line: 100 ]]
		-- upvalues: HostRoot (copy)
		return if p1.tag == HostRoot then p1.stateNode.containerInfo else nil
	end,
	isFiberMounted = function(Return): boolean --[[ Line: 104 ]]
		-- upvalues: getNearestMountedFiber (copy)
		return getNearestMountedFiber(Return) == Return
	end,
	isMounted = function(p1): boolean --[[ Line: 110 ]]
		-- upvalues: ReactGlobalsModule (copy), ReactCurrentOwner (copy), ClassComponent (copy), Console (copy), GetComponentNameFunction (copy), GetFunction (copy), getNearestMountedFiber (copy)
		if ReactGlobalsModule.__DEV__ then
			local Current = ReactCurrentOwner.current
			
			if Current ~= nil and Current.tag == ClassComponent then
				local StateNode = Current.stateNode
				
				if not StateNode._warnedAboutRefsInRender then
					Console.error("%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.", GetComponentNameFunction(Current.type) or "A component")
				end
				StateNode._warnedAboutRefsInRender = true
			end
		end
		local GetResult = GetFunction(p1)
		
		return if GetResult then getNearestMountedFiber(GetResult) == GetResult else false
	end,
	findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath,
	findCurrentHostFiber = function(p1) --[[ Line: 282 ]]
		-- upvalues: findCurrentFiberUsingSlowPath (copy), HostComponent (copy), HostText (copy)
		local CurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath(p1)
		
		if not CurrentFiberUsingSlowPath then
			return nil
		end
		local Return_ = CurrentFiberUsingSlowPath
		while true do
			local Child = Return_.child
			if Return_.tag == HostComponent or Return_.tag == HostText then
				return Return_
			elseif Child then
				Child.return_ = Return_
				Return_ = Child
			else
				if Return_ == CurrentFiberUsingSlowPath then
					return nil
				end
				local Return = Return_.return_
				local Sibling = Return_.sibling
				while not Sibling do
					if not Return or Return == CurrentFiberUsingSlowPath then
						return nil
					end
				end
				Sibling.return_ = Return
				Return_ = Sibling
			end
		end
	end,
	findCurrentHostFiberWithNoPortals = function(p2) --[[ Line: 321 ]]
		-- upvalues: findCurrentFiberUsingSlowPath (copy), HostComponent (copy), HostText (copy), EnableFundamentalAPI (copy), FundamentalComponent (copy), HostPortal (copy)
		local CurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath(p2)
		
		if not CurrentFiberUsingSlowPath then
			return nil
		end
		local Return_ = CurrentFiberUsingSlowPath
		while true do
			local Child = Return_.child
			if Return_.tag == HostComponent or (Return_.tag == HostText or EnableFundamentalAPI and Return_.tag == FundamentalComponent) then
				return Return_
			elseif Child and Return_.tag ~= HostPortal then
				Child.return_ = Return_
				Return_ = Child
			else
				if Return_ == CurrentFiberUsingSlowPath then
					return nil
				end
				local Return = Return_.return_
				local Sibling = Return_.sibling
				while not Sibling do
					if not Return or Return == CurrentFiberUsingSlowPath then
						return nil
					end
				end
				Sibling.return_ = Return
				Return_ = Sibling
			end
		end
	end,
	isFiberSuspenseAndTimedOut = function(p3): boolean --[[ Line: 363 ]]
		-- upvalues: SuspenseComponent (copy)
		local MemoizedState = p3.memoizedState
		
		return p3.tag == SuspenseComponent and (MemoizedState ~= nil and MemoizedState.dehydrated == nil)
	end,
	doesFiberContain = function(Return, Return1): boolean --[[ Line: 370 ]]
		local Return2 = Return1
		local Alternate = Return.alternate
		while Return2 ~= nil do
			if Return2 == Return or Return2 == Alternate then
				return true
			end
			Return2 = Return2.return_
		end
		return false
	end
}