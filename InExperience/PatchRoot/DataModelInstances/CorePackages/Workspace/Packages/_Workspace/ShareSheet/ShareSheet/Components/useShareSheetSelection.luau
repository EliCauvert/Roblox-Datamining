local reactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({})
	
	return {
		onConversationActivated = reactModule.useCallback(function(p1)
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
		end, {}),
		onSendActivated = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2({})
		end, {}),
		selectedConversationIds = var1
	}
end