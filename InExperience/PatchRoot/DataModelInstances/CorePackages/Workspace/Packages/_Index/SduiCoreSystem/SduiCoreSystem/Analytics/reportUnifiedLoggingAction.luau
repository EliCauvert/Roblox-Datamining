local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local unifiedLoggingModule = require(parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilderModule = require(sduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local fFlagSduiErrorCleanup = require(parent.SharedFlags).FFlagSduiErrorCleanup

return function(p1, p2, p3)
	-- upvalues: fFlagSduiErrorCleanup (ref), sduiCollectionAnalyticsBuilderModule (ref), sduiErrorsModule (ref), unifiedLoggingModule (ref)
	local var1 = if fFlagSduiErrorCleanup then p3.getCollectionData and p3.getCollectionData() or nil else nil
	local var2 = sduiCollectionAnalyticsBuilderModule.buildAndValidateItemAnalyticsData(p1, p3.analyticsData, p3.ancestorAnalyticsData, nil, p2.actionType, function(_)
		-- upvalues: fFlagSduiErrorCleanup (copy), var1 (write), p1 (ref), sduiErrorsModule (copy), p2 (ref)
		if not fFlagSduiErrorCleanup or var1 ~= nil then
			p1.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.LogActionInvalidItemData, { name = p2.actionType })
		end
	end)
	assert(var2, "itemAnalyticsData must exist")
	
	if not fFlagSduiErrorCleanup then
		var1 = p3.getCollectionData and p3.getCollectionData() or nil
	end
	if not var1 then
		if not fFlagSduiErrorCleanup then
			p1.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.LogActionMissingCollectionData, { name = p2.actionType })
		end
		var1 = sduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	end
	assert(var1, "collectionAnalyticsData must exist")
	unifiedLoggingModule.SendItemActionEvent.sendFromServerDrivenUi(p1.dependencies.eventIngest, var2, var2.itemPosition, var1, p1.appPage, var1.collectionId, var1.contentType, var1.itemsPerRow, var1.collectionPosition, var1.totalNumberOfItems, nil, p2.actionType, p2.actionParams, var1.startRowNumber)
end