local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.UnifiedLogging)
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors
local fFlagLuaAppSduiRouteName = require(parent.SharedFlags).FFlagLuaAppSduiRouteName

return function(p0, p1, p2, p3) --[[ line: 15 | named "getImpressionsTag" ]]
	-- upvalues: sduiErrors (ref), fFlagLuaAppSduiRouteName (ref)
	local collectionId = nil
	local collectionComponentType = nil
	
	if p1 then
		collectionId = p1.collectionId
		collectionComponentType = p1.collectionComponentType
		
		if not collectionComponentType then
			p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = p3 }, p2.appPage)
		end
		if not collectionId then
			p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = p3 }, p2.appPage)
		end
	else
		p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = p3 }, p2.appPage)
	end
	return `{p3}_{collectionComponentType}_{if fFlagLuaAppSduiRouteName then p2.routeName or p2.appPage else p2.appPage}_{collectionId or -1}_{p0}`
end