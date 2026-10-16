local ReactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)

return function() --[[ Line: 14 | Named "useShareSheetSelection" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	
	return {
		onConversationActivated = ReactModule.useCallback(function(p1) --[[ Line: 16 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(Tbl) --[[ Line: 18 ]]
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
		onSendActivated = ReactModule.useCallback(function() --[[ Line: 29 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2({})
		end, {}),
		selectedConversationIds = UseStateResult
	}
end