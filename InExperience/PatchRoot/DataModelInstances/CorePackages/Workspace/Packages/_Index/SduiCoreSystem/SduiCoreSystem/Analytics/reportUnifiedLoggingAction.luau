local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local UnifiedLoggingModule = require(SduiCoreSystem.Parent.UnifiedLogging)
local SduiCollectionAnalyticsBuilderModule = require(SduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)

return function(p1, p2, p3)
	-- upvalues: SduiCollectionAnalyticsBuilderModule (copy), SduiErrorsModule (copy), UnifiedLoggingModule (copy)
	local CollectionData = p3.getCollectionData and p3.getCollectionData() or nil
	local AndValidateItemAnalyticsData = SduiCollectionAnalyticsBuilderModule.buildAndValidateItemAnalyticsData(p1, p3.analyticsData, p3.ancestorAnalyticsData, nil, p2.actionType, function(_)
		-- upvalues: CollectionData (ref), p1 (copy), SduiErrorsModule (upval), p2 (copy)
		if CollectionData ~= nil then
			p1.dependencies.logger.reportCounter(SduiErrorsModule.SduiCounterName.LogActionInvalidItemData, { name = p2.actionType })
		end
	end)
	assert(AndValidateItemAnalyticsData, "itemAnalyticsData must exist")
	
	if not CollectionData then
		CollectionData = SduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	end
	assert(CollectionData, "collectionAnalyticsData must exist")
	UnifiedLoggingModule.SendItemActionEvent.sendFromServerDrivenUi(p1.dependencies.eventIngest, AndValidateItemAnalyticsData, AndValidateItemAnalyticsData.itemPosition, CollectionData, p1.appPage, CollectionData.collectionId, CollectionData.contentType, CollectionData.itemsPerRow, CollectionData.collectionPosition, CollectionData.totalNumberOfItems, nil, p2.actionType, p2.actionParams, CollectionData.startRowNumber)
end