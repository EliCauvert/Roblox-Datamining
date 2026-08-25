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
	shouldCaptureSuspense = function(p0, p1)
		local memoizedState = p0.memoizedState
		
		if memoizedState then
			return memoizedState.dehydrated ~= nil
		end
		local memoizedProps = p0.memoizedProps
		
		return if memoizedProps.fallback == nil then false elseif memoizedProps.unstable_avoidThisFallback == true then p1 else true
	end,
	findFirstSuspended = function(p2)
		-- upvalues: suspenseComponent (ref), isSuspenseInstancePending (ref), isSuspenseInstanceFallback (ref), suspenseListComponent (ref), didCapture (ref), noFlags (ref)
		local var3 = p2
		while var3 ~= nil do
			if var3.tag == suspenseComponent then
				local memoizedState = var3.memoizedState
				
				if memoizedState then
					local dehydrated = memoizedState.dehydrated
					
					if dehydrated ~= nil and not isSuspenseInstancePending(dehydrated) and not isSuspenseInstanceFallback(dehydrated) then
						if var3 ~= p2 then
							while var3.sibling == nil do
								if var3.return_ ~= nil and var3.return_ ~= p2 then
									var3 = var3.return_
									continue
								end
								return nil
							end
							var3.sibling.return_ = var3.return_
							var3 = var3.sibling
						end
						return nil
					end
					return var3
				end
			elseif var3.tag == suspenseListComponent and var3.memoizedProps.revealOrder ~= nil then
				if bit32.band(var3.flags, didCapture) == noFlags then
				end
				return var3
			elseif var3.child == nil then
			else
				var3.child.return_ = var3
				var3 = var3.child
			end
		end
		return nil
	end
}