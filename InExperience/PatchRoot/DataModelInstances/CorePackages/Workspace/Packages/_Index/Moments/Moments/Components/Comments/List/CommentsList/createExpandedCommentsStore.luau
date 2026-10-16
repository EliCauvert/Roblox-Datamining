local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function() --[[ Line: 15 | Named "createExpandedCommentsStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		getExpandedCommentIds = Signal,
		toggle = function(p1) --[[ Line: 18 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl) --[[ Line: 19 ]]
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