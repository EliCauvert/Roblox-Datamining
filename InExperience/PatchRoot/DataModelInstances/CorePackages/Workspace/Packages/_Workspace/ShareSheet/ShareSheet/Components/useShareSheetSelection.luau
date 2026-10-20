local ReactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	
	return {
		onConversationActivated = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl)
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
		end, {}),
		onSendActivated = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2({})
		end, {}),
		selectedConversationIds = UseStateResult
	}
end