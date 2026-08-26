local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local set = luauPolyfillModule.Set
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberHostConfig)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local syncLane = reactFiberLaneModule.SyncLane
local noTimestamp = reactFiberLaneModule.NoTimestamp
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local classComponent = reactWorkTagsModule.ClassComponent
local functionComponent = reactWorkTagsModule.FunctionComponent
local forwardRef = reactWorkTagsModule.ForwardRef
local hostComponent = reactWorkTagsModule.HostComponent
local hostPortal = reactWorkTagsModule.HostPortal
local hostRoot = reactWorkTagsModule.HostRoot
local memoComponent = reactWorkTagsModule.MemoComponent
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_FORWARD_REF_TYPE = reactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = reactSymbols.REACT_LAZY_TYPE
local dEV = reactGlobalsModule.__DEV__
local var1 = nil
local var2 = nil
local t = {
	setRefreshHandler = function(value)
		-- upvalues: dEV (ref), var1 (write)
		if dEV then
			var1 = value
		end
	end,
	resolveFunctionForHotReloading = function(p1)
		-- upvalues: dEV (ref), var1 (write)
		if not dEV then
			return p1
		elseif var1 == nil then
			return p1
		end
		local var3 = var1(p1)
		
		return if var3 == nil then p1 else var3.current
	end,
	resolveClassForHotReloading = function(p1)
		-- upvalues: dEV (ref), var1 (write)
		if not dEV then
			return p1
		elseif var1 == nil then
			return p1
		end
		local var3 = var1(p1)
		
		return if var3 == nil then p1 else var3.current
	end,
	resolveForwardRefForHotReloading = function(p1)
		-- upvalues: dEV (ref), var1 (write), REACT_FORWARD_REF_TYPE (ref)
		if not dEV then
			return p1
		elseif var1 == nil then
			return p1
		end
		local var3 = var1(p1)
		
		if var3 ~= nil then
			return var3.current
		elseif p1 ~= nil and typeof(p1.render) == "function" then
			local var4
			local render = p1.render
			
			if not dEV then
				var4 = render
			elseif var1 == nil then
				var4 = render
			else
				local var5 = var1(render)
				var4 = if var5 == nil then render else var5.current
			end
			if p1.render == var4 then
				return p1
			end
			local t = {
				["$$typeof"] = REACT_FORWARD_REF_TYPE,
				render = var4,
				displayName = nil
			}
			
			if p1.displayName ~= nil then
				t.displayName = p1.displayName
			end
			return t
		end
	end,
	isCompatibleFamilyForHotReloading = function(p1, p2)
		-- upvalues: dEV (ref), var1 (write), classComponent (ref), functionComponent (ref), REACT_LAZY_TYPE (ref), forwardRef (ref), REACT_FORWARD_REF_TYPE (ref), memoComponent (ref), simpleMemoComponent (ref), REACT_MEMO_TYPE (ref)
		if not dEV then
			return false
		elseif var1 == nil then
			return false
		end
		local elementType = p1.elementType
		local type = p2.type
		local var3 = false
		local var4 = if typeof(type) == "table" and type ~= nil then type["$$typeof"] else nil
		local tag = p1.tag
		
		if tag == classComponent then
			if typeof(type) == "function" then
				var3 = true
			end
		elseif tag == functionComponent then
			if typeof(type) == "function" then
				var3 = true
			elseif var4 == REACT_LAZY_TYPE then
				var3 = true
			end
		elseif tag ~= forwardRef then
			if tag ~= memoComponent and tag ~= simpleMemoComponent then
				return false
			elseif var4 == REACT_MEMO_TYPE then
				var3 = true
			elseif var4 == REACT_LAZY_TYPE then
				var3 = true
			end
		elseif var4 == REACT_FORWARD_REF_TYPE then
			var3 = true
		elseif var4 == REACT_LAZY_TYPE then
			var3 = true
		end
		if var3 then
			tag = var1(elementType)
			
			return tag == nil or tag ~= var1(type)
		end
	end,
	markFailedErrorBoundaryForHotReloading = function(p1)
		-- upvalues: dEV (ref), var1 (write), var2 (write), set (ref)
		if dEV then
			if var1 == nil then return end
			if var2 == nil then
				var2 = set.new()
			end
			var2:add(p1)
		end
	end
}
local findChildHostInstancesForFiberShallowly = nil
local findHostInstancesForFiberShallowly = nil
local findHostInstancesForMatchingFibersRecursively = nil
local scheduleFibersWithFamiliesRecursively = nil
local _ = nil

function t.scheduleRefresh(p1, p2)
	-- upvalues: dEV (ref), var1 (write), scheduleFibersWithFamiliesRecursively (write)
	if dEV then
		if var1 == nil then return end
		local staleFamilies = p2.staleFamilies
		local updatedFamilies = p2.updatedFamilies
		local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
		local flushSync = unknownModule.flushSync
		unknownModule.flushPassiveEffects()
		flushSync(function()
			-- upvalues: scheduleFibersWithFamiliesRecursively (copy), p1 (ref), updatedFamilies (ref), staleFamilies (ref)
			scheduleFibersWithFamiliesRecursively(p1.current, updatedFamilies, staleFamilies)
		end)
	end
end

local _ = nil

function t.scheduleRoot(p1, p2)
	-- upvalues: dEV (ref)
	if dEV then
		if p1.context ~= require(script.Parent["ReactFiberContext.new"]).emptyContextObject then return end
		local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
		local flushSync = unknownModule.flushSync
		unknownModule.flushPassiveEffects()
		flushSync(function()
			-- upvalues: p2 (ref), p1 (ref)
			require(script.Parent["ReactFiberReconciler.new"]).updateContainer(p2, p1, nil, nil)
		end)
	end
end

scheduleFibersWithFamiliesRecursively = function(p1, p2, p3)
	-- upvalues: dEV (ref), functionComponent (ref), simpleMemoComponent (ref), classComponent (ref), forwardRef (ref), var1 (write), error (ref), var2 (write), syncLane (ref), noTimestamp (ref), scheduleFibersWithFamiliesRecursively (write)
	if dEV then
		local alternate = p1.alternate
		local child = p1.child
		local sibling = p1.sibling
		local tag = p1.tag
		local type = p1.type
		local render = nil
		
		if tag == functionComponent or tag == simpleMemoComponent or tag == classComponent then
			render = type
		elseif tag == forwardRef then
			render = type.render
		end
		if var1 == nil then
			error(error.new("Expected resolveFamily to be set during hot reload."))
		end
		local var3 = false
		local var4 = false
		
		if render ~= nil then
			local var5 = var1(render)
			
			if var5 ~= nil then
				if p3:has(var5) then
					var4 = true
				elseif p2:has(var5) then
					if tag == classComponent then
						var4 = true
					else
						var3 = true
					end
				end
			end
		end
		if var2 ~= nil and (var2:has(p1) or alternate ~= nil and var2:has(alternate)) then
			var4 = true
		end
		if var4 then
			p1._debugNeedsRemount = true
		end
		if var4 or var3 then
			require(script.Parent["ReactFiberWorkLoop.new"]).scheduleUpdateOnFiber(p1, syncLane, noTimestamp)
		end
		if child ~= nil and not var4 then
			scheduleFibersWithFamiliesRecursively(child, p2, p3)
		end
		if sibling ~= nil then
			scheduleFibersWithFamiliesRecursively(sibling, p2, p3)
		end
	end
end

local _ = nil

function t.findHostInstancesForRefresh(p1, p2)
	-- upvalues: dEV (ref), set (ref), array (ref), findHostInstancesForMatchingFibersRecursively (write), error (ref)
	if dEV then
		local var3 = set.new()
		findHostInstancesForMatchingFibersRecursively(p1.current, set.new(array.map(p2, function(p3)
			return p3.current
		end)), var3)
		
		return var3
	end
	error(error.new("Did not expect findHostInstancesForRefresh to be called in production."))
end

findHostInstancesForMatchingFibersRecursively = function(p1, p2, p3)
	-- upvalues: dEV (ref), functionComponent (ref), simpleMemoComponent (ref), classComponent (ref), forwardRef (ref), findHostInstancesForFiberShallowly (write), findHostInstancesForMatchingFibersRecursively (write)
	if dEV then
		local child = p1.child
		local sibling = p1.sibling
		local tag = p1.tag
		local type = p1.type
		local render = nil
		
		if tag == functionComponent or tag == simpleMemoComponent or tag == classComponent then
			render = type
		elseif tag == forwardRef then
			render = type.render
		end
		if not (render == nil or not p2:has(render)) and true then
			findHostInstancesForFiberShallowly(p1, p3)
		elseif child ~= nil then
			findHostInstancesForMatchingFibersRecursively(child, p2, p3)
		end
		if sibling ~= nil then
			findHostInstancesForMatchingFibersRecursively(sibling, p2, p3)
		end
	end
end

findHostInstancesForFiberShallowly = function(p1, p2)
	-- upvalues: dEV (ref), findChildHostInstancesForFiberShallowly (write), hostComponent (ref), hostPortal (ref), hostRoot (ref), error (ref)
	if dEV then
		if findChildHostInstancesForFiberShallowly(p1, p2) then return end
		local var3 = p1
		while true do
			local tag = var3.tag
			if tag ~= hostComponent then
				if tag ~= hostPortal then
					if tag ~= hostRoot then
						if var3.return_ == nil then
							error(error.new("Expected to reach root first."))
						end
						var3 = var3.return_
					end
					p2:add(var3.stateNode.containerInfo)
					
					return
				end
				p2:add(var3.stateNode.containerInfo)
				
				return
			end
			p2:add(var3.stateNode)
			
			return
		end
	end
end

findChildHostInstancesForFiberShallowly = function(p3, p4)
	-- upvalues: dEV (ref), hostComponent (ref)
	if dEV then
		local var4 = p3
		local var5 = false
		while true do
			if var4.tag == hostComponent then
				var5 = true
				p4:add(var4.stateNode)
			elseif var4.child ~= nil then
				var4.child.return_ = var4
				var4 = var4.child
				continue
			end
			if var4 ~= p3 then
				while var4.sibling == nil do
					if var4.return_ ~= nil and var4.return_ ~= p3 then
						var4 = var4.return_
						continue
					end
					return var5
				end
				assert(var4.sibling ~= nil, "should be non-nil")
				var4.sibling.return_ = var4.return_
				var4 = var4.sibling
			end
			return var5
		end
	end
	return false
end

return t