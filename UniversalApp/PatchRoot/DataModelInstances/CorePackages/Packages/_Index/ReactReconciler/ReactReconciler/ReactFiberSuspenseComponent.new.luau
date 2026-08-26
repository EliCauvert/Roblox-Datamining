local _ = require(script.Parent.Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberLane)
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local noFlags = reactFiberFlagsModule.NoFlags
local didCapture = reactFiberFlagsModule.DidCapture
local isSuspenseInstancePending = reactFiberHostConfigModule.isSuspenseInstancePending
local isSuspenseInstanceFallback = reactFiberHostConfigModule.isSuspenseInstanceFallback

return {
	shouldCaptureSuspense = function(p1, p2)
		local memoizedState = p1.memoizedState
		
		if memoizedState then
			return memoizedState.dehydrated ~= nil
		end
		local memoizedProps = p1.memoizedProps
		
		return if memoizedProps.fallback == nil then false elseif memoizedProps.unstable_avoidThisFallback == true then p2 else true
	end,
	findFirstSuspended = function(p1)
		-- upvalues: suspenseComponent (ref), isSuspenseInstancePending (ref), isSuspenseInstanceFallback (ref), suspenseListComponent (ref), didCapture (ref), noFlags (ref)
		local var1 = p1
		while var1 ~= nil do
			if var1.tag == suspenseComponent then
				local memoizedState = var1.memoizedState
				
				if memoizedState then
					local dehydrated = memoizedState.dehydrated
					
					if dehydrated ~= nil and not isSuspenseInstancePending(dehydrated) and not isSuspenseInstanceFallback(dehydrated) then
						if var1 ~= p1 then
							while var1.sibling == nil do
								if var1.return_ ~= nil and var1.return_ ~= p1 then
									var1 = var1.return_
									continue
								end
								return nil
							end
							var1.sibling.return_ = var1.return_
							var1 = var1.sibling
						end
						return nil
					end
					return var1
				end
			elseif var1.tag == suspenseListComponent and var1.memoizedProps.revealOrder ~= nil then
				if bit32.band(var1.flags, didCapture) == noFlags then
				end
				return var1
			elseif var1.child == nil then
			else
				var1.child.return_ = var1
				var1 = var1.child
			end
		end
		return nil
	end
}