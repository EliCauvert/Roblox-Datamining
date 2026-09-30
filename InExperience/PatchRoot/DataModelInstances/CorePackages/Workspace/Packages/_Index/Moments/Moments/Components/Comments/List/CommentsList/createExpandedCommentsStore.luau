local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		getExpandedCommentIds = var1,
		toggle = function(p1)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: p1 (ref)
				local cloned = table.clone(p2)
				
				if cloned[p1] then
					cloned[p1] = nil
					
					return cloned
				end
				cloned[p1] = true
				
				return cloned
			end)
		end
	}
end