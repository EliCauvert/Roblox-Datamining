local signalsModule = require(script:FindFirstAncestor("PeopleService").Parent.Signals)

function createPersonStore(p0) --[[ line: 14 ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	return {
		getPerson = function() --[[ line: 18 ]]
			-- upvalues: p0 (ref)
			return p0
		end,
		getOrder = var1,
		setOrder = var2
	}
end

return createPersonStore