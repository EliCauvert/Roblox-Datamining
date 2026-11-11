local _ = require(script.Parent.Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberLane)
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local NoFlags = ReactFiberFlagsModule.NoFlags
local DidCapture = ReactFiberFlagsModule.DidCapture
local IsSuspenseInstancePendingFunction = ReactFiberHostConfigModule.isSuspenseInstancePending
local IsSuspenseInstanceFallbackFunction = ReactFiberHostConfigModule.isSuspenseInstanceFallback

return {
	shouldCaptureSuspense = function(p1, p2): boolean
		local MemoizedState = p1.memoizedState
		
		if MemoizedState then
			return MemoizedState.dehydrated ~= nil
		else
			local MemoizedProps = p1.memoizedProps
			
			return MemoizedProps.fallback ~= nil and (MemoizedProps.unstable_avoidThisFallback ~= true or not p2)
		end
	end,
	findFirstSuspended = function(Child)
		-- upvalues: SuspenseComponent (copy), IsSuspenseInstancePendingFunction (copy), IsSuspenseInstanceFallbackFunction (copy), SuspenseListComponent (copy), DidCapture (copy), NoFlags (copy)
		local Child1 = Child
		while Child1 ~= nil do
			if Child1.tag == SuspenseComponent then
				local MemoizedState = Child1.memoizedState
				
				if MemoizedState then
					local Dehydrated = MemoizedState.dehydrated
					
					if Dehydrated == nil or IsSuspenseInstancePendingFunction(Dehydrated) or IsSuspenseInstanceFallbackFunction(Dehydrated) then
						return Child1
					end
				end
			elseif Child1.tag ~= SuspenseListComponent or Child1.memoizedProps.revealOrder == nil then
				if Child1.child ~= nil then
					Child1.child.return_ = Child1
					Child1 = Child1.child
					continue
				end
			elseif bit32.band(Child1.flags, DidCapture) ~= NoFlags then
				return Child1
			end
			if Child1 == Child then
				return nil
			end
			while Child1.sibling == nil do
				if Child1.return_ == nil or Child1.return_ == Child then
					return nil
				end
				Child1 = Child1.return_
			end
			Child1.sibling.return_ = Child1.return_
			Child1 = Child1.sibling
		end
		return nil
	end
}