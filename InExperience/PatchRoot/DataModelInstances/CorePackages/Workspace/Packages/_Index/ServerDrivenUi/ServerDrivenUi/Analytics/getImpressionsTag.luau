local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(Parent.UnifiedLogging)
local SduiErrors = require(Parent.SduiCoreSystem).SduiErrors

return function(p1, p2, p3, Name): string --[[ Line: 13 | Named "getImpressionsTag" ]]
	-- upvalues: SduiErrors (copy)
	local CollectionId = nil
	local CollectionComponentType = nil
	
	if p2 then
		CollectionId = p2.collectionId
		CollectionComponentType = p2.collectionComponentType
		
		if not CollectionComponentType then
			p3.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = Name }, p3.appPage)
		end
		if not CollectionId then
			p3.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = Name }, p3.appPage)
		end
	else
		p3.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = Name }, p3.appPage)
	end
	return `{Name}_{CollectionComponentType}_{p3.routeName or p3.appPage}_{CollectionId or -1}_{p1}`
end