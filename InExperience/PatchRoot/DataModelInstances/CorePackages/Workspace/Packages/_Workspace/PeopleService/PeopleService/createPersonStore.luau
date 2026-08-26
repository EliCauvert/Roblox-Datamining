local signalsModule = require(script:FindFirstAncestor("PeopleService").Parent.Signals)

function createPersonStore(p1)
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	return {
		getPerson = function()
			-- upvalues: p1 (ref)
			return p1
		end,
		getOrder = var1,
		setOrder = var2
	}
end

return createPersonStore