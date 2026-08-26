local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local invariant = require(parent.Shared).invariant
local get = require(parent.Shared).ReactInstanceMap.get
local reactSharedInternals = require(parent.Shared).ReactSharedInternals
local getComponentName = require(parent.Shared).getComponentName
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local classComponent = reactWorkTagsModule.ClassComponent
local hostComponent = reactWorkTagsModule.HostComponent
local hostRoot = reactWorkTagsModule.HostRoot
local hostPortal = reactWorkTagsModule.HostPortal
local hostText = reactWorkTagsModule.HostText
local fundamentalComponent = reactWorkTagsModule.FundamentalComponent
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local noFlags = reactFiberFlagsModule.NoFlags
local placement = reactFiberFlagsModule.Placement
local hydrating = reactFiberFlagsModule.Hydrating
local enableFundamentalAPI = require(parent.Shared).ReactFeatureFlags.enableFundamentalAPI
local reactCurrentOwner = reactSharedInternals.ReactCurrentOwner
local t = {}

local function getNearestMountedFiber(p1)
	-- upvalues: placement (ref), hydrating (ref), noFlags (ref), hostRoot (ref)
	local var1 = p1
	local var2 = p1
	
	if not p1.alternate then
		local var3 = var1
		repeat
			var1 = var3
			if bit32.band(var1.flags, bit32.bor(placement, hydrating)) ~= noFlags then
				var2 = var1.return_
			end
			var3 = var1.return_
		until not var3
	while var1.return_ do
		var1 = var1.return_
	end
	return if var1.tag == hostRoot then var2 else nil
end

t.getNearestMountedFiber = getNearestMountedFiber

function t.getSuspenseInstanceFromFiber(p2)
	-- upvalues: suspenseComponent (ref)
	if p2.tag == suspenseComponent then
		local memoizedState = p2.memoizedState
		
		if memoizedState == nil then
			local alternate = p2.alternate
			
			if alternate ~= nil then
				memoizedState = alternate.memoizedState
			end
		end
		return if memoizedState then memoizedState.dehydrated else nil
	end
end

function t.getContainerFromFiber(p2)
	-- upvalues: hostRoot (ref)
	return if p2.tag == hostRoot then p2.stateNode.containerInfo else nil
end

function t.isFiberMounted(p2)
	-- upvalues: getNearestMountedFiber (ref)
	return getNearestMountedFiber(p2) == p2
end

function t.isMounted(p2)
	-- upvalues: reactGlobalsModule (ref), reactCurrentOwner (ref), classComponent (ref), console (ref), getComponentName (ref), get (ref), getNearestMountedFiber (ref)
	if reactGlobalsModule.__DEV__ then
		local current = reactCurrentOwner.current
		
		if current ~= nil and current.tag == classComponent then
			local stateNode = current.stateNode
			
			if not stateNode._warnedAboutRefsInRender then
				console.error("%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.", getComponentName(current.type) or "A component")
			end
			stateNode._warnedAboutRefsInRender = true
		end
	end
	local var4 = get(p2)
	
	return if var4 then getNearestMountedFiber(var4) == var4 else false
end

local function _(p2)
	-- upvalues: invariant (ref), getNearestMountedFiber (ref)
	invariant(getNearestMountedFiber(p2) == p2, "Unable to find node on an unmounted component.")
end

local function findCurrentFiberUsingSlowPath(p2)
	-- upvalues: getNearestMountedFiber (ref), invariant (ref), hostRoot (ref)
	local alternate = p2.alternate
	
	if alternate then
		local alternate_1, _return_1, _return
		local var4 = p2
		local var5 = alternate
		while true do
			_return = var4.return_
			if _return == nil then break end
			alternate_1 = _return.alternate
			
			if alternate_1 == nil then
				_return_1 = _return.return_
				
				if _return_1 == nil then break end
				var4 = _return_1
				var5 = _return_1
			end
			if _return.child == alternate_1.child then
				_return_1 = _return.child
				while _return_1 do
					if _return_1 ~= var4 then
						if _return_1 ~= var5 then
							_return_1 = _return_1.sibling
							continue
						end
						invariant(getNearestMountedFiber(_return) == _return, "Unable to find node on an unmounted component.")
						
						return alternate
					end
					invariant(getNearestMountedFiber(_return) == _return, "Unable to find node on an unmounted component.")
					
					return p2
				end
				invariant(false, "Unable to find node on an unmounted component.")
			end
			if var4.return_ == var5.return_ then
				_return_1 = false
				local child = _return.child
				while child do
					if child == var4 then
						_return_1 = true
						var4 = _return
						var5 = alternate_1
						break
					elseif child ~= var5 then
						child = child.sibling
						continue
					else
						_return_1 = true
						var5 = _return
						var4 = alternate_1
						break
					end
					elseif not _return_1 then
						local child_1 = alternate_1.child
						while child_1 do
							if child_1 == var4 then
								_return_1 = true
								var4 = alternate_1
								var5 = _return
								break
							elseif child_1 ~= var5 then
								child_1 = child_1.sibling
								continue
							else
								_return_1 = true
								var5 = alternate_1
								var4 = _return
								break
							end
						end
						invariant(_return_1, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.")
					end
				end
				-- [0.001s] <RUNTIME-ERROR> : Error block 49 analysis at pc 0 (list.remove(x): x not in list)
			else
				var4 = _return
				var5 = alternate_1
			end
			invariant(var4.alternate == var5, "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.")
		end
	else
		local var6 = getNearestMountedFiber(p2)
		invariant(var6 ~= nil, "Unable to find node on an unmounted component.")
		
		return if var6 == p2 then p2 else nil
	end
end

t.findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath

function t.findCurrentHostFiber(p3)
	-- upvalues: findCurrentFiberUsingSlowPath (ref), hostComponent (ref), hostText (ref)
	local var7 = findCurrentFiberUsingSlowPath(p3)
	
	if not var7 then
		return nil
	end
	local child
	local var8 = var7
	while true do
		child = var8.child
		if var8.tag ~= hostComponent and var8.tag ~= hostText then
			if child then
				child.return_ = var8
				var8 = child
				continue
			end
			if var8 ~= var7 then
				local _return = var8.return_
				local sibling = var8.sibling
				while not sibling do
					if _return and _return ~= var7 then
						var8 = _return
						continue
					end
					return nil
				end
				sibling.return_ = _return
				var8 = sibling
			end
			return nil
		end
		return var8
	end
	return nil
end

function t.findCurrentHostFiberWithNoPortals(p4)
	-- upvalues: findCurrentFiberUsingSlowPath (ref), hostComponent (ref), hostText (ref), enableFundamentalAPI (ref), fundamentalComponent (ref), hostPortal (ref)
	local var9 = findCurrentFiberUsingSlowPath(p4)
	
	if not var9 then
		return nil
	end
	local child
	local var10 = var9
	while true do
		child = var10.child
		if var10.tag ~= hostComponent and var10.tag ~= hostText and (not enableFundamentalAPI or var10.tag ~= fundamentalComponent) then
			if child and var10.tag ~= hostPortal then
				child.return_ = var10
				var10 = child
				continue
			end
			if var10 ~= var9 then
				local _return = var10.return_
				local sibling = var10.sibling
				while not sibling do
					if _return and _return ~= var9 then
						var10 = _return
						continue
					end
					return nil
				end
				sibling.return_ = _return
				var10 = sibling
			end
			return nil
		end
		return var10
	end
	return nil
end

function t.isFiberSuspenseAndTimedOut(p5)
	-- upvalues: suspenseComponent (ref)
	local memoizedState = p5.memoizedState
	
	return p5.tag == suspenseComponent and (memoizedState ~= nil and memoizedState.dehydrated == nil)
end

function t.doesFiberContain(p5, p6)
	local var11 = p6
	local alternate = p5.alternate
	while var11 ~= nil do
		if var11 ~= p5 and var11 ~= alternate then
			var11 = var11.return_
			continue
		end
		return true
	end
	return false
end

return t