local signalsModule = require(script:FindFirstAncestor("PeopleService").Parent.Signals)

function createPersonStore(p0)
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	return {
		getPerson = function()
			-- upvalues: p0 (ref)
			return p0
		end,
		getOrder = var1,
		setOrder = var2
	}
end

return createPersonStore