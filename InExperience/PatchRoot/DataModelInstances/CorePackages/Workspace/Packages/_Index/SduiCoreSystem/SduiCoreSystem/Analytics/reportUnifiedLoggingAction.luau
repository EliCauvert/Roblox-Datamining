local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local unifiedLoggingModule = require(parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilderModule = require(sduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local fFlagSduiErrorCleanup = require(parent.SharedFlags).FFlagSduiErrorCleanup

return function(p0, p1, p2)
	-- upvalues: fFlagSduiErrorCleanup (ref), sduiCollectionAnalyticsBuilderModule (ref), sduiErrorsModule (ref), unifiedLoggingModule (ref)
	local var4 = if fFlagSduiErrorCleanup then p2.getCollectionData and p2.getCollectionData() or nil else nil
	local var5 = sduiCollectionAnalyticsBuilderModule.buildAndValidateItemAnalyticsData(p0, p2.analyticsData, p2.ancestorAnalyticsData, nil, p1.actionType, function(_)
		-- upvalues: fFlagSduiErrorCleanup (copy), var4 (write), p0 (ref), sduiErrorsModule (copy), p1 (ref)
		if not fFlagSduiErrorCleanup or var4 ~= nil then
			p0.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.LogActionInvalidItemData, { name = p1.actionType })
		end
	end)
	assert(var5, "itemAnalyticsData must exist")
	
	if not fFlagSduiErrorCleanup then
		var4 = p2.getCollectionData and p2.getCollectionData() or nil
	end
	if not var4 then
		if not fFlagSduiErrorCleanup then
			p0.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.LogActionMissingCollectionData, { name = p1.actionType })
		end
		var4 = sduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	end
	assert(var4, "collectionAnalyticsData must exist")
	unifiedLoggingModule.SendItemActionEvent.sendFromServerDrivenUi(p0.dependencies.eventIngest, var5, var5.itemPosition, var4, p0.appPage, var4.collectionId, var4.contentType, var4.itemsPerRow, var4.collectionPosition, var4.totalNumberOfItems, nil, p1.actionType, p1.actionParams, var4.startRowNumber)
end