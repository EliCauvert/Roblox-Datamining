local SignalsModule = require(script:FindFirstAncestor("PeopleService").Parent.Signals)

function createPersonStore(p1) --[[ Line: 14 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	
	return {
		getPerson = function() --[[ Line: 18 ]]
			-- upvalues: p1 (copy)
			return p1
		end,
		getOrder = Signal,
		setOrder = Signal2
	}
end

return createPersonStore