local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p1, p2)
	-- upvalues: unifiedEventLogConstantsModule (ref)
	if p2[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "selectedItemIndex"] ~= nil then
		p1.selectedItemIndex = nil
	end
	if p2[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "keyword"] ~= nil then
		p1.keyword = nil
	end
	return p1
end