local reactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({})
	
	return {
		onConversationActivated = reactModule.useCallback(function(p0)
			-- upvalues: var2 (ref)
			var2(function(p1)
				-- upvalues: p0 (ref)
				local cloned = table.clone(p1)
				
				if cloned[p0] then
					cloned[p0] = nil
					
					return cloned
				end
				cloned[p0] = true
				
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