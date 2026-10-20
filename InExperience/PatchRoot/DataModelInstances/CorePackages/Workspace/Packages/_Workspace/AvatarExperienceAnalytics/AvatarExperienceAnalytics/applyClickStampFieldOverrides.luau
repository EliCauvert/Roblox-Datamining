local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p1, p2)
	-- upvalues: UnifiedEventLogConstantsModule (copy)
	if p2[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "selectedItemIndex"] ~= nil then
		p1.selectedItemIndex = nil
	end
	if p2[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "keyword"] ~= nil then
		p1.keyword = nil
	end
	return p1
end