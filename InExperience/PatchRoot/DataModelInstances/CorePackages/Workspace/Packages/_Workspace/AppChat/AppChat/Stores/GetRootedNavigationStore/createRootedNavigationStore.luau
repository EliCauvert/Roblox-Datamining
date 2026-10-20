local SignalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Count = 0
	local v1 = nil
	
	local function cancelNavigation()
		-- upvalues: v1 (ref), Signal2 (copy)
		v1 = nil
		Signal2(false)
	end
	
	return {
		getIsNavigationPending = Signal,
		beginNavigation = function(): number
			-- upvalues: Count (ref), v1 (ref), Signal2 (copy)
			Count += 1
			v1 = Count
			Signal2(true)
			
			return Count
		end,
		completeNavigation = function(p1)
			-- upvalues: Signal (copy), v1 (ref), Signal2 (copy)
			if Signal(false) and p1 == v1 then
				v1 = nil
				Signal2(false)
			end
		end,
		cancelNavigation = cancelNavigation,
		reset = cancelNavigation
	}
end