local UnifiedEventLogConstantsModule = require(script.Parent.Parent.UnifiedEventLogConstants)
local List = {}

return {
	addToSelectionList = function(p1)
		-- upvalues: List (ref)
		table.insert(List, p1)
	end,
	removeFromSelectionList = function(p1)
		-- upvalues: UnifiedEventLogConstantsModule (copy), List (ref)
		local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
		local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
		
		for i, value in List do
			if value[Text] == p1[Text] and value[Text1] == p1[Text1] then
				table.remove(List, i)
				break
			end
		end
	end,
	getSelectionList = function()
		-- upvalues: List (ref)
		return List
	end,
	clearSelectionList = function()
		-- upvalues: List (ref)
		List = {}
	end
}