local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.UnifiedLogging)
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors

return function(p1, p2, p3, p4)
	-- upvalues: sduiErrors (ref)
	local collectionId = nil
	local collectionComponentType = nil
	
	if p2 then
		collectionId = p2.collectionId
		collectionComponentType = p2.collectionComponentType
		
		if not collectionComponentType then
			p3.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = p4 }, p3.appPage)
		end
		if not collectionId then
			p3.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = p4 }, p3.appPage)
		end
	else
		p3.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = p4 }, p3.appPage)
	end
	return `{p4}_{collectionComponentType}_{p3.routeName or p3.appPage}_{collectionId or -1}_{p1}`
end