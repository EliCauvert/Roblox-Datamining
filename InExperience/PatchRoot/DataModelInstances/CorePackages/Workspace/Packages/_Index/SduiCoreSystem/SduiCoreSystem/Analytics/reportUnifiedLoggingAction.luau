local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local unifiedLoggingModule = require(sduiCoreSystem.Parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilderModule = require(sduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)

return function(p1, p2, p3)
	-- upvalues: sduiCollectionAnalyticsBuilderModule (ref), sduiErrorsModule (ref), unifiedLoggingModule (ref)
	local var1 = p3.getCollectionData and p3.getCollectionData() or nil
	local var2 = sduiCollectionAnalyticsBuilderModule.buildAndValidateItemAnalyticsData(p1, p3.analyticsData, p3.ancestorAnalyticsData, nil, p2.actionType, function(_)
		-- upvalues: var1 (write), p1 (ref), sduiErrorsModule (copy), p2 (ref)
		if var1 ~= nil then
			p1.dependencies.logger.reportCounter(sduiErrorsModule.SduiCounterName.LogActionInvalidItemData, { name = p2.actionType })
		end
	end)
	assert(var2, "itemAnalyticsData must exist")
	var1 = var1 or sduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	assert(var1, "collectionAnalyticsData must exist")
	unifiedLoggingModule.SendItemActionEvent.sendFromServerDrivenUi(p1.dependencies.eventIngest, var2, var2.itemPosition, var1, p1.appPage, var1.collectionId, var1.contentType, var1.itemsPerRow, var1.collectionPosition, var1.totalNumberOfItems, nil, p2.actionType, p2.actionParams, var1.startRowNumber)
end