local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local UnifiedLoggingModule = require(Parent.UnifiedLogging)
local SduiCollectionAnalyticsBuilderModule = require(SduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local FFlagSduiErrorCleanup = require(Parent.SharedFlags).FFlagSduiErrorCleanup

return function(p1, p2, p3)
	-- upvalues: FFlagSduiErrorCleanup (copy), SduiCollectionAnalyticsBuilderModule (copy), SduiErrorsModule (copy), UnifiedLoggingModule (copy)
	local CollectionData = FFlagSduiErrorCleanup and (p3.getCollectionData and p3.getCollectionData()) or nil
	local AndValidateItemAnalyticsData = SduiCollectionAnalyticsBuilderModule.buildAndValidateItemAnalyticsData(p1, p3.analyticsData, p3.ancestorAnalyticsData, nil, p2.actionType, function(_)
		-- upvalues: FFlagSduiErrorCleanup (upval), CollectionData (ref), p1 (copy), SduiErrorsModule (upval), p2 (copy)
		if not FFlagSduiErrorCleanup or CollectionData ~= nil then
			p1.dependencies.logger.reportCounter(SduiErrorsModule.SduiCounterName.LogActionInvalidItemData, { name = p2.actionType })
		end
	end)
	assert(AndValidateItemAnalyticsData, "itemAnalyticsData must exist")
	
	if not FFlagSduiErrorCleanup then
		CollectionData = p3.getCollectionData and p3.getCollectionData() or nil
	end
	if not CollectionData then
		if not FFlagSduiErrorCleanup then
			p1.dependencies.logger.reportCounter(SduiErrorsModule.SduiCounterName.LogActionMissingCollectionData, { name = p2.actionType })
		end
		CollectionData = SduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	end
	assert(CollectionData, "collectionAnalyticsData must exist")
	UnifiedLoggingModule.SendItemActionEvent.sendFromServerDrivenUi(p1.dependencies.eventIngest, AndValidateItemAnalyticsData, AndValidateItemAnalyticsData.itemPosition, CollectionData, p1.appPage, CollectionData.collectionId, CollectionData.contentType, CollectionData.itemsPerRow, CollectionData.collectionPosition, CollectionData.totalNumberOfItems, nil, p2.actionType, p2.actionParams, CollectionData.startRowNumber)
end