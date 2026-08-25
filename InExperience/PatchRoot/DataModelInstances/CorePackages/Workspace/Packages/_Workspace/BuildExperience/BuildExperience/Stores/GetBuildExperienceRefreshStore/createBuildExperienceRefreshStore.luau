local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	return {
		getRefreshTick = var1,
		bumpRefreshTick = function()
			-- upvalues: var2 (ref)
			var2(function(p0)
				return p0 + 1
			end)
		end
	}
end