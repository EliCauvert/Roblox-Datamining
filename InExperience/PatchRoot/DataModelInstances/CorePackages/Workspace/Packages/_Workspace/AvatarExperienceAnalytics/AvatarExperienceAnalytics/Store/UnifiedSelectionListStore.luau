local unifiedEventLogConstantsModule = require(script.Parent.Parent.UnifiedEventLogConstants)
local t = {}

return {
	addToSelectionList = function(p0) --[[ line: 5 ]]
		-- upvalues: t (write)
		table.insert(t, p0)
	end,
	removeFromSelectionList = function(p1) --[[ line: 9 ]]
		-- upvalues: unifiedEventLogConstantsModule (ref), t (write)
		local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
		local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
		
		for i, v in t do
			if v[text] == p1[text] and v[text_1] == p1[text_1] then
				table.remove(t, i)
				
				return
			end
		end
	end,
	getSelectionList = function() --[[ line: 21 ]]
		-- upvalues: t (write)
		return t
	end,
	clearSelectionList = function() --[[ line: 25 ]]
		-- upvalues: t (write)
		t = {}
	end
}