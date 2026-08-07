-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:35 2026 Pacific Standard Time.

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
local var4 = nil
local var5 = nil
local t = {
	setRefreshHandler = function(value) --[[ line: 92 ]]
		-- upvalues: dEV (ref), var4 (write)
		if dEV then
			var4 = value
		end
	end,
	resolveFunctionForHotReloading = function(p0) --[[ line: 99 ]]
		-- upvalues: dEV (ref), var4 (write)
		if not dEV then
			return p0
		elseif var4 == nil then
			return p0
		end
		local var11 = var4(p0)
		
		return if var11 == nil then p0 else var11.current
	end,
	resolveClassForHotReloading = function(p1) --[[ line: 117 ]]
		-- upvalues: dEV (ref), var4 (write)
		if not dEV then
			return p1
		elseif var4 == nil then
			return p1
		end
		local var12 = var4(p1)
		
		return if var12 == nil then p1 else var12.current
	end,
	resolveForwardRefForHotReloading = function(p2) --[[ line: 123 ]]
		-- upvalues: dEV (ref), var4 (write), REACT_FORWARD_REF_TYPE (ref)
		if not dEV then
			return p2
		elseif var4 == nil then
			return p2
		end
		local var13 = var4(p2)
		
		if var13 ~= nil then
			return var13.current
		elseif p2 ~= nil and typeof(p2.render) == "function" then
			local var14
			local render = p2.render
			
			if not dEV then
				var14 = render
			elseif var4 == nil then
				var14 = render
			else
				local var15 = var4(render)
				var14 = if var15 == nil then render else var15.current
			end
			if p2.render == var14 then
				return p2
			end
			local t = {
				["$$typeof"] = REACT_FORWARD_REF_TYPE,
				render = var14,
				displayName = nil
			}
			
			if p2.displayName ~= nil then
				t.displayName = p2.displayName
			end
			return t
		end
	end,
	isCompatibleFamilyForHotReloading = function(p3, p4) --[[ line: 160 ]]
		-- upvalues: dEV (ref), var4 (write), classComponent (ref), functionComponent (ref), REACT_LAZY_TYPE (ref), forwardRef (ref), REACT_FORWARD_REF_TYPE (ref), memoComponent (ref), simpleMemoComponent (ref), REACT_MEMO_TYPE (ref)
		if not dEV then
			return false
		elseif var4 == nil then
			return false
		end
		local elementType = p3.elementType
		local type = p4.type
		local var17 = false
		local var18 = if typeof(type) == "table" and type ~= nil then type["$$typeof"] else nil
		local tag = p3.tag
		
		if tag == classComponent then
			if typeof(type) == "function" then
				var17 = true
			end
		elseif tag == functionComponent then
			if typeof(type) == "function" then
				var17 = true
			elseif var18 == REACT_LAZY_TYPE then
				var17 = true
			end
		elseif tag ~= forwardRef then
			if tag ~= memoComponent and tag ~= simpleMemoComponent then
				return false
			elseif var18 == REACT_MEMO_TYPE then
				var17 = true
			elseif var18 == REACT_LAZY_TYPE then
				var17 = true
			end
		elseif var18 == REACT_FORWARD_REF_TYPE then
			var17 = true
		elseif var18 == REACT_LAZY_TYPE then
			var17 = true
		end
		if var17 then
			tag = var4(elementType)
			
			return tag == nil or tag ~= var4(type)
		end
	end,
	markFailedErrorBoundaryForHotReloading = function(p5) --[[ line: 247 ]]
		-- upvalues: dEV (ref), var4 (write), var5 (write), set (ref)
		if dEV then
			if var4 == nil then return end
			if var5 == nil then
				var5 = set.new()
			end
			var5:add(p5)
		end
	end
}
local findChildHostInstancesForFiberShallowly = nil
local findHostInstancesForFiberShallowly = nil
local findHostInstancesForMatchingFibersRecursively = nil
local scheduleFibersWithFamiliesRecursively = nil
local _ = nil

function t.scheduleRefresh(p6, p7) --[[ line: 267 ]]
	-- upvalues: dEV (ref), var4 (write), scheduleFibersWithFamiliesRecursively (write)
	if dEV then
		if var4 == nil then return end
		local staleFamilies = p7.staleFamilies
		local updatedFamilies = p7.updatedFamilies
		local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
		local flushSync = unknownModule.flushSync
		unknownModule.flushPassiveEffects()
		flushSync(function() --[[ line: 279 ]]
			-- upvalues: scheduleFibersWithFamiliesRecursively (copy), p6 (ref), updatedFamilies (ref), staleFamilies (ref)
			scheduleFibersWithFamiliesRecursively(p6.current, updatedFamilies, staleFamilies)
		end)
	end
end

local _ = nil

function t.scheduleRoot(p8, p9) --[[ line: 291 ]]
	-- upvalues: dEV (ref)
	if dEV then
		if p8.context ~= require(script.Parent["ReactFiberContext.new"]).emptyContextObject then return end
		local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
		local flushSync = unknownModule.flushSync
		unknownModule.flushPassiveEffects()
		flushSync(function() --[[ line: 306 ]]
			-- upvalues: p9 (ref), p8 (ref)
			require(script.Parent["ReactFiberReconciler.new"]).updateContainer(p9, p8, nil, nil)
		end)
	end
end

scheduleFibersWithFamiliesRecursively = function(p10, p11, p12) --[[ line: 316 | named "scheduleFibersWithFamiliesRecursively" ]]
	-- upvalues: dEV (ref), functionComponent (ref), simpleMemoComponent (ref), classComponent (ref), forwardRef (ref), var4 (write), error (ref), var5 (write), syncLane (ref), noTimestamp (ref), scheduleFibersWithFamiliesRecursively (write)
	if dEV then
		local alternate = p10.alternate
		local child = p10.child
		local sibling = p10.sibling
		local tag = p10.tag
		local type = p10.type
		local render = nil
		
		if tag == functionComponent or tag == simpleMemoComponent or tag == classComponent then
			render = type
		elseif tag == forwardRef then
			render = type.render
		end
		if var4 == nil then
			error(error.new("Expected resolveFamily to be set during hot reload."))
		end
		local var21 = false
		local var22 = false
		
		if render ~= nil then
			local var23 = var4(render)
			
			if var23 ~= nil then
				if p12:has(var23) then
					var22 = true
				elseif p11:has(var23) then
					if tag == classComponent then
						var22 = true
					else
						var21 = true
					end
				end
			end
		end
		if var5 ~= nil and (var5:has(p10) or alternate ~= nil and var5:has(alternate)) then
			var22 = true
		end
		if var22 then
			p10._debugNeedsRemount = true
		end
		if var22 or var21 then
			require(script.Parent["ReactFiberWorkLoop.new"]).scheduleUpdateOnFiber(p10, syncLane, noTimestamp)
		end
		if child ~= nil and not var22 then
			scheduleFibersWithFamiliesRecursively(child, p11, p12)
		end
		if sibling ~= nil then
			scheduleFibersWithFamiliesRecursively(sibling, p11, p12)
		end
	end
end

local _ = nil

function t.findHostInstancesForRefresh(p13, p14) --[[ line: 383 ]]
	-- upvalues: dEV (ref), set (ref), array (ref), findHostInstancesForMatchingFibersRecursively (write), error (ref)
	if dEV then
		local var24 = set.new()
		findHostInstancesForMatchingFibersRecursively(p13.current, set.new(array.map(p14, function(p15) --[[ line: 389 ]]
			return p15.current
		end)), var24)
		
		return var24
	end
	error(error.new("Did not expect findHostInstancesForRefresh to be called in production."))
end

findHostInstancesForMatchingFibersRecursively = function(p16, p17, p18) --[[ line: 404 | named "findHostInstancesForMatchingFibersRecursively" ]]
	-- upvalues: dEV (ref), functionComponent (ref), simpleMemoComponent (ref), classComponent (ref), forwardRef (ref), findHostInstancesForFiberShallowly (write), findHostInstancesForMatchingFibersRecursively (write)
	if dEV then
		local child = p16.child
		local sibling = p16.sibling
		local tag = p16.tag
		local type = p16.type
		local render = nil
		
		if tag == functionComponent or tag == simpleMemoComponent or tag == classComponent then
			render = type
		elseif tag == forwardRef then
			render = type.render
		end
		if not (render == nil or not p17:has(render)) and true then
			findHostInstancesForFiberShallowly(p16, p18)
		elseif child ~= nil then
			findHostInstancesForMatchingFibersRecursively(child, p17, p18)
		end
		if sibling ~= nil then
			findHostInstancesForMatchingFibersRecursively(sibling, p17, p18)
		end
	end
end

findHostInstancesForFiberShallowly = function(p19, p20) --[[ line: 448 | named "findHostInstancesForFiberShallowly" ]]
	-- upvalues: dEV (ref), findChildHostInstancesForFiberShallowly (write), hostComponent (ref), hostPortal (ref), hostRoot (ref), error (ref)
	if dEV then
		if findChildHostInstancesForFiberShallowly(p19, p20) then return end
		local var25 = p19
		while true do
			local tag = var25.tag
			if tag ~= hostComponent then
				if tag ~= hostPortal then
					if tag ~= hostRoot then
						if var25.return_ == nil then
							error(error.new("Expected to reach root first."))
						end
						var25 = var25.return_
					end
					p20:add(var25.stateNode.containerInfo)
					
					return
				end
				p20:add(var25.stateNode.containerInfo)
				
				return
			end
			p20:add(var25.stateNode)
			
			return
		end
	end
end

findChildHostInstancesForFiberShallowly = function(p21, p22) --[[ line: 480 | named "findChildHostInstancesForFiberShallowly" ]]
	-- upvalues: dEV (ref), hostComponent (ref)
	if dEV then
		local var26 = p21
		local var27 = false
		while true do
			if var26.tag == hostComponent then
				var27 = true
				p22:add(var26.stateNode)
			elseif var26.child ~= nil then
				var26.child.return_ = var26
				var26 = var26.child
				continue
			end
			if var26 ~= p21 then
				while var26.sibling == nil do
					if var26.return_ ~= nil and var26.return_ ~= p21 then
						var26 = var26.return_
						continue
					end
					return var27
				end
				assert(var26.sibling ~= nil, "should be non-nil")
				var26.sibling.return_ = var26.return_
				var26 = var26.sibling
			end
			return var27
		end
	end
	return false
end

return t