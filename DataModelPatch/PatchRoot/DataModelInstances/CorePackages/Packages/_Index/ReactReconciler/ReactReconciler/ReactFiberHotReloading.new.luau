local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Set = LuauPolyfillModule.Set
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberHostConfig)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local SyncLane = ReactFiberLaneModule.SyncLane
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ClassComponent = ReactWorkTagsModule.ClassComponent
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local ForwardRef = ReactWorkTagsModule.ForwardRef
local HostComponent = ReactWorkTagsModule.HostComponent
local HostPortal = ReactWorkTagsModule.HostPortal
local HostRoot = ReactWorkTagsModule.HostRoot
local MemoComponent = ReactWorkTagsModule.MemoComponent
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTFORWARDREFTYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACTMEMOTYPE = ReactSymbols.REACT_MEMO_TYPE
local REACTLAZYTYPE = ReactSymbols.REACT_LAZY_TYPE
local DEV = require(Parent.ReactGlobals).__DEV__
local Callback = nil
local NewResult = nil
local Callback4 = nil
local Callback3 = nil
local Callback2 = nil
local Callback1 = nil

local function scheduleRefresh(p1, p2)
	-- upvalues: DEV (copy), Callback (ref), Callback1 (ref)
	if DEV then
		if Callback == nil then return end
		local StaleFamilies = p2.staleFamilies
		local UpdatedFamilies = p2.updatedFamilies
		local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
		local FlushSyncFunction: (any) -> () = ReactFiberWorkLoopNewModule.flushSync
		ReactFiberWorkLoopNewModule.flushPassiveEffects()
		FlushSyncFunction(function()
			-- upvalues: Callback1 (upval), p1 (copy), UpdatedFamilies (copy), StaleFamilies (copy)
			Callback1(p1.current, UpdatedFamilies, StaleFamilies)
		end)
	end
end

Callback1 = function(Child, UpdatedFamilies, StaleFamilies)
	-- upvalues: DEV (copy), FunctionComponent (copy), SimpleMemoComponent (copy), ClassComponent (copy), ForwardRef (copy), Callback (ref), Error1 (copy), NewResult (ref), SyncLane (copy), NoTimestamp (copy), Callback1 (ref)
	if DEV then
		local Alternate = Child.alternate
		local Child1 = Child.child
		local Sibling = Child.sibling
		local Tag = Child.tag
		local Type = Child.type
		local Render = nil
		
		if Tag == FunctionComponent or Tag == SimpleMemoComponent or Tag == ClassComponent then
			Render = Type
		elseif Tag == ForwardRef then
			Render = Type.render
		end
		if Callback == nil then
			error(Error1.new("Expected resolveFamily to be set during hot reload."))
		end
		local Flag = false
		local Flag1 = false
		
		if Render ~= nil then
			local CallbackResult = Callback(Render)
			
			if CallbackResult ~= nil then
				if StaleFamilies:has(CallbackResult) then
					Flag1 = true
				elseif UpdatedFamilies:has(CallbackResult) then
					if Tag == ClassComponent then
						Flag1 = true
					else
						Flag = true
					end
				end
			end
		end
		if NewResult ~= nil and (NewResult:has(Child) or Alternate ~= nil and NewResult:has(Alternate)) then
			Flag1 = true
		end
		if Flag1 then
			Child._debugNeedsRemount = true
		end
		if Flag1 or Flag then
			require(script.Parent["ReactFiberWorkLoop.new"]).scheduleUpdateOnFiber(Child, SyncLane, NoTimestamp)
		end
		if Child1 ~= nil and not Flag1 then
			Callback1(Child1, UpdatedFamilies, StaleFamilies)
		end
		if Sibling ~= nil then
			Callback1(Sibling, UpdatedFamilies, StaleFamilies)
		end
	end
end

local ReactFiberHotReloadingModule = {
	setRefreshHandler = function(Value)
		-- upvalues: DEV (copy), Callback (ref)
		if DEV then
			Callback = Value
		end
	end,
	resolveFunctionForHotReloading = function(p1)
		-- upvalues: DEV (copy), Callback (ref)
		if not DEV then
			return p1
		elseif Callback == nil then
			return p1
		else
			local CallbackResult = Callback(p1)
			
			return if CallbackResult == nil then p1 else CallbackResult.current
		end
	end,
	resolveClassForHotReloading = function(p1)
		-- upvalues: DEV (copy), Callback (ref)
		if not DEV then
			return p1
		elseif Callback == nil then
			return p1
		else
			local CallbackResult = Callback(p1)
			
			return if CallbackResult == nil then p1 else CallbackResult.current
		end
	end,
	resolveForwardRefForHotReloading = function(p1)
		-- upvalues: DEV (copy), Callback (ref), REACTFORWARDREFTYPE (copy)
		if not DEV then
			return p1
		end
		if Callback == nil then
			return p1
		end
		local CallbackResult = Callback(p1)
		
		if CallbackResult ~= nil then
			return CallbackResult.current
		end
		if p1 ~= nil and typeof(p1.render) == "function" then
			local Render = p1.render
			local Render1 = nil
			
			if DEV then
				if Callback == nil then
					Render1 = Render
				else
					local CallbackResult1 = Callback(Render)
					Render1 = if CallbackResult1 == nil then Render else CallbackResult1.current
				end
			else
				Render1 = Render
			end
			if p1.render ~= Render1 then
				local config = {
					["$$typeof"] = REACTFORWARDREFTYPE,
					render = Render1,
					displayName = nil
				}
				
				if p1.displayName ~= nil then
					config.displayName = p1.displayName
				end
				return config
			end
		end
		return p1
	end,
	isCompatibleFamilyForHotReloading = function(p1, p2): boolean
		-- upvalues: DEV (copy), Callback (ref), ClassComponent (copy), FunctionComponent (copy), REACTLAZYTYPE (copy), ForwardRef (copy), REACTFORWARDREFTYPE (copy), MemoComponent (copy), SimpleMemoComponent (copy), REACTMEMOTYPE (copy)
		if not DEV then
			return false
		end
		if Callback == nil then
			return false
		end
		local ElementType = p1.elementType
		local Type = p2.type
		local Flag = false
		local Typeof = if typeof(Type) == "table" and Type ~= nil then Type["$$typeof"] else nil
		local Tag = p1.tag
		
		if Tag == ClassComponent then
			if typeof(Type) == "function" then
				Flag = true
			end
		elseif Tag == FunctionComponent then
			if typeof(Type) == "function" then
				Flag = true
			elseif Typeof == REACTLAZYTYPE then
				Flag = true
			end
		elseif Tag == ForwardRef then
			if Typeof == REACTFORWARDREFTYPE then
				Flag = true
			elseif Typeof == REACTLAZYTYPE then
				Flag = true
			end
		else
			if Tag ~= MemoComponent and Tag ~= SimpleMemoComponent then
				return false
			end
			if Typeof == REACTMEMOTYPE then
				Flag = true
			elseif Typeof == REACTLAZYTYPE then
				Flag = true
			end
		end
		if Flag then
			local CallbackResult = Callback(ElementType)
			
			if CallbackResult ~= nil and CallbackResult == Callback(Type) then
				return true
			end
		end
		return false
	end,
	markFailedErrorBoundaryForHotReloading = function(p1)
		-- upvalues: DEV (copy), Callback (ref), NewResult (ref), Set (copy)
		if DEV then
			if Callback == nil then return end
			if NewResult == nil then
				NewResult = Set.new()
			end
			NewResult:add(p1)
		end
	end,
	scheduleRefresh = scheduleRefresh,
	scheduleRoot = function(p1, p2)
		-- upvalues: DEV (copy)
		if DEV then
			if p1.context ~= require(script.Parent["ReactFiberContext.new"]).emptyContextObject then return end
			local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
			local FlushSyncFunction: (any) -> () = ReactFiberWorkLoopNewModule.flushSync
			ReactFiberWorkLoopNewModule.flushPassiveEffects()
			FlushSyncFunction(function()
				-- upvalues: p2 (copy), p1 (copy)
				require(script.Parent["ReactFiberReconciler.new"]).updateContainer(p2, p1, nil, nil)
			end)
		end
	end,
	findHostInstancesForRefresh = function(p1, p2)
		-- upvalues: DEV (copy), Set (copy), Array (copy), Callback2 (ref), Error1 (copy)
		if not DEV then
			error(Error1.new("Did not expect findHostInstancesForRefresh to be called in production."))
			
			return
		end
		local NewSet = Set.new()
		Callback2(p1.current, Set.new(Array.map(p2, function(p3)
			return p3.current
		end)), NewSet)
		
		return NewSet
	end
}

Callback2 = function(Child, NewResult, NewResult1)
	-- upvalues: DEV (copy), FunctionComponent (copy), SimpleMemoComponent (copy), ClassComponent (copy), ForwardRef (copy), Callback3 (ref), Callback2 (ref)
	if DEV then
		local Child1 = Child.child
		local Sibling = Child.sibling
		local Tag = Child.tag
		local Type = Child.type
		local Type1 = if Tag == FunctionComponent or Tag == SimpleMemoComponent or Tag == ClassComponent then Type elseif Tag == ForwardRef then Type.render else nil
		
		if if Type1 ~= nil and NewResult:has(Type1) then true else false then
			Callback3(Child, NewResult1)
		elseif Child1 ~= nil then
			Callback2(Child1, NewResult, NewResult1)
		end
		if Sibling ~= nil then
			Callback2(Sibling, NewResult, NewResult1)
		end
	end
end

Callback3 = function(Child, p1)
	-- upvalues: DEV (copy), Callback4 (ref), HostComponent (copy), HostPortal (copy), HostRoot (copy), Error1 (copy)
	if DEV then
		if Callback4(Child, p1) then return end
		local Return = Child
		while true do
			local Tag = Return.tag
			if Tag == HostComponent then break end
			if Tag == HostPortal then
				p1:add(Return.stateNode.containerInfo)
				
				return
			elseif Tag == HostRoot then
				p1:add(Return.stateNode.containerInfo)
				
				return
			elseif Return.return_ == nil then
				error(Error1.new("Expected to reach root first."))
			end
			Return = Return.return_
		end
	end
end

Callback4 = function(Child, p2): boolean
	-- upvalues: DEV (copy), HostComponent (copy)
	repeat
		if not DEV then break end
		local Child1 = Child
		local Flag = false
		while true do
			if Child1.tag == HostComponent then
				Flag = true
				p2:add(Child1.stateNode)
			elseif Child1.child ~= nil then
				Child1.child.return_ = Child1
				Child1 = Child1.child
				continue
			end
			if Child1 == Child then
				return Flag
			end
			while Child1.sibling == nil do
				if Child1.return_ == nil or Child1.return_ == Child then
					return Flag
				end
				Child1 = Child1.return_
			end
			assert(Child1.sibling ~= nil, "should be non-nil")
			Child1.sibling.return_ = Child1.return_
			Child1 = Child1.sibling
		end
	until true
	return false
end

return ReactFiberHotReloadingModule