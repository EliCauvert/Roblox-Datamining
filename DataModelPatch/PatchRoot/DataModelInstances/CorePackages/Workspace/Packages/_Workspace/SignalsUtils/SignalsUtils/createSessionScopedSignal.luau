local Parent = script:FindFirstAncestor("SignalsUtils").Parent
local SignalsModule = require(Parent.Signals)
local GetCurrentUserIdFunction = require(Parent.UserLib).Stores.LocalUserIdStore.getCurrentUserId

return function(p1, p2)
	-- upvalues: SignalsModule (copy), GetCurrentUserIdFunction (copy)
	local Computed = SignalsModule.createComputed(function(p3)
		-- upvalues: GetCurrentUserIdFunction (upval), SignalsModule (upval), p1 (copy), p2 (copy)
		GetCurrentUserIdFunction(p3)
		local Signal, Signal2 = SignalsModule.createSignal(p1, p2)
		
		return { getter = Signal, setter = Signal2 }
	end)
	
	return function(p3)
		-- upvalues: Computed (copy)
		return Computed(p3).getter(p3)
	end, function(p3)
		-- upvalues: Computed (copy)
		Computed().setter(p3)
	end
end