local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p0, p1) --[[ line: 3 | named "applyClickStampFieldOverrides" ]]
	-- upvalues: unifiedEventLogConstantsModule (ref)
	if p1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "selectedItemIndex"] ~= nil then
		p0.selectedItemIndex = nil
	end
	if p1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "keyword"] ~= nil then
		p0.keyword = nil
	end
	return p0
end