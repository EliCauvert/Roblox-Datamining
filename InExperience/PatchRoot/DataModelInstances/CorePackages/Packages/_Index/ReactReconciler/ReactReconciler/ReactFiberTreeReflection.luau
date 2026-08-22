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

local function getNearestMountedFiber(p0) --[[ line: 50 ]]
	-- upvalues: placement (ref), hydrating (ref), noFlags (ref), hostRoot (ref)
	local var6 = p0
	local var7 = p0
	
	if not p0.alternate then
		local var8 = var6
		repeat
			var6 = var8
			if bit32.band(var6.flags, bit32.bor(placement, hydrating)) ~= noFlags then
				var7 = var6.return_
			end
			var8 = var6.return_
		until not var8
	while var6.return_ do
		var6 = var6.return_
	end
	return if var6.tag == hostRoot then var7 else nil
end

t.getNearestMountedFiber = getNearestMountedFiber

function t.getSuspenseInstanceFromFiber(p1) --[[ line: 84 ]]
	-- upvalues: suspenseComponent (ref)
	if p1.tag == suspenseComponent then
		local memoizedState = p1.memoizedState
		
		if memoizedState == nil then
			local alternate = p1.alternate
			
			if alternate ~= nil then
				memoizedState = alternate.memoizedState
			end
		end
		return if memoizedState then memoizedState.dehydrated else nil
	end
end

function t.getContainerFromFiber(p2) --[[ line: 100 ]]
	-- upvalues: hostRoot (ref)
	return if p2.tag == hostRoot then p2.stateNode.containerInfo else nil
end

function t.isFiberMounted(p3) --[[ line: 104 ]]
	-- upvalues: getNearestMountedFiber (ref)
	return getNearestMountedFiber(p3) == p3
end

function t.isMounted(p4) --[[ line: 110 ]]
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
	local var9 = get(p4)
	
	return if var9 then getNearestMountedFiber(var9) == var9 else false
end

local function _(p5) --[[ line: 140 | named "assertIsMounted" ]]
	-- upvalues: invariant (ref), getNearestMountedFiber (ref)
	invariant(getNearestMountedFiber(p5) == p5, "Unable to find node on an unmounted component.")
end

local function findCurrentFiberUsingSlowPath(p6) --[[ line: 147 ]]
	-- upvalues: getNearestMountedFiber (ref), invariant (ref), hostRoot (ref)
	local alternate = p6.alternate
	
	if alternate then
		local alternate_1, _return_1, _return
		local var11 = p6
		local var12 = alternate
		while true do
			_return = var11.return_
			if _return == nil then break end
			alternate_1 = _return.alternate
			
			if alternate_1 == nil then
				_return_1 = _return.return_
				
				if _return_1 == nil then break end
				var11 = _return_1
				var12 = _return_1
			end
			if _return.child == alternate_1.child then
				_return_1 = _return.child
				while _return_1 do
					if _return_1 ~= var11 then
						if _return_1 ~= var12 then
							_return_1 = _return_1.sibling
							continue
						end
						invariant(getNearestMountedFiber(_return) == _return, "Unable to find node on an unmounted component.")
						
						return alternate
					end
					invariant(getNearestMountedFiber(_return) == _return, "Unable to find node on an unmounted component.")
					
					return p6
				end
				invariant(false, "Unable to find node on an unmounted component.")
			end
			if var11.return_ == var12.return_ then
				_return_1 = false
				local child = _return.child
				while child do
					if child == var11 then
						_return_1 = true
						var11 = _return
						var12 = alternate_1
						break
					elseif child ~= var12 then
						child = child.sibling
						continue
					else
						_return_1 = true
						var12 = _return
						var11 = alternate_1
						break
					end
					elseif not _return_1 then
						local child_1 = alternate_1.child
						while child_1 do
							if child_1 == var11 then
								_return_1 = true
								var11 = alternate_1
								var12 = _return
								break
							elseif child_1 ~= var12 then
								child_1 = child_1.sibling
								continue
							else
								_return_1 = true
								var12 = alternate_1
								var11 = _return
								break
							end
						end
						invariant(_return_1, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.")
					end
				end
				-- [0.000s] <RUNTIME-ERROR> : Error block 49 analysis at pc 0 (list.remove(x): x not in list)
			else
				var11 = _return
				var12 = alternate_1
			end
			invariant(var11.alternate == var12, "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.")
		end
	else
		local var10 = getNearestMountedFiber(p6)
		invariant(var10 ~= nil, "Unable to find node on an unmounted component.")
		
		return if var10 == p6 then p6 else nil
	end
end

t.findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath

function t.findCurrentHostFiber(p7) --[[ line: 282 ]]
	-- upvalues: findCurrentFiberUsingSlowPath (ref), hostComponent (ref), hostText (ref)
	local var13 = findCurrentFiberUsingSlowPath(p7)
	
	if not var13 then
		return nil
	end
	local child
	local var14 = var13
	while true do
		child = var14.child
		if var14.tag ~= hostComponent and var14.tag ~= hostText then
			if child then
				child.return_ = var14
				var14 = child
				continue
			end
			if var14 ~= var13 then
				local _return = var14.return_
				local sibling = var14.sibling
				while not sibling do
					if _return and _return ~= var13 then
						var14 = _return
						continue
					end
					return nil
				end
				sibling.return_ = _return
				var14 = sibling
			end
			return nil
		end
		return var14
	end
	return nil
end

function t.findCurrentHostFiberWithNoPortals(p8) --[[ line: 321 ]]
	-- upvalues: findCurrentFiberUsingSlowPath (ref), hostComponent (ref), hostText (ref), enableFundamentalAPI (ref), fundamentalComponent (ref), hostPortal (ref)
	local var15 = findCurrentFiberUsingSlowPath(p8)
	
	if not var15 then
		return nil
	end
	local child
	local var16 = var15
	while true do
		child = var16.child
		if var16.tag ~= hostComponent and var16.tag ~= hostText and (not enableFundamentalAPI or var16.tag ~= fundamentalComponent) then
			if child and var16.tag ~= hostPortal then
				child.return_ = var16
				var16 = child
				continue
			end
			if var16 ~= var15 then
				local _return = var16.return_
				local sibling = var16.sibling
				while not sibling do
					if _return and _return ~= var15 then
						var16 = _return
						continue
					end
					return nil
				end
				sibling.return_ = _return
				var16 = sibling
			end
			return nil
		end
		return var16
	end
	return nil
end

function t.isFiberSuspenseAndTimedOut(p9) --[[ line: 363 ]]
	-- upvalues: suspenseComponent (ref)
	local memoizedState = p9.memoizedState
	
	return p9.tag == suspenseComponent and (memoizedState ~= nil and memoizedState.dehydrated == nil)
end

function t.doesFiberContain(p10, p11) --[[ line: 370 ]]
	local var17 = p11
	local alternate = p10.alternate
	while var17 ~= nil do
		if var17 ~= p10 and var17 ~= alternate then
			var17 = var17.return_
			continue
		end
		return true
	end
	return false
end

return t