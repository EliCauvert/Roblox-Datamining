local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		getExpandedCommentIds = Signal,
		toggle = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: p1 (copy)
				local Copy = table.clone(Tbl)
				
				if Copy[p1] then
					Copy[p1] = nil
					
					return Copy
				else
					Copy[p1] = true
					
					return Copy
				end
			end)
		end
	}
end