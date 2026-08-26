local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local unifiedLoggingModule = require(parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilderModule = require(sduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local getSduiImpressionHandlerRegistryModule = require(sduiCoreSystem.getSduiImpressionHandlerRegistry)
local _ = require(sduiCoreSystem.SduiImpressionEventType)
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: sduiErrorsModule (ref), sduiCollectionAnalyticsBuilderModule (ref), getSduiImpressionHandlerRegistryModule (ref), fFlagSduiEdpStoreImpressionsLogging (ref), unifiedLoggingModule (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.LogImpressionsMissingCollectionData, {}, p1.appPage)
	end
	p4 = p4 or sduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	assert(p4, "collectionAnalyticsData must exist")
	local impressionHandlerConfig = nil
	
	if p6 then
		impressionHandlerConfig = getSduiImpressionHandlerRegistryModule().getImpressionHandlerConfig(p6)
		
		if not impressionHandlerConfig then
			unifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p1.dependencies.eventIngest, p2, p3, p4, p1.appPage, p4.collectionId, p4.contentType, p4.itemsPerRow, p4.collectionPosition, p5, p6)
		elseif impressionHandlerConfig.handler then
			impressionHandlerConfig.handler(p1, p2, p3, p4, p5, if fFlagSduiEdpStoreImpressionsLogging then p8 else nil)
		end
	end
	if p7 == nil then
		if impressionHandlerConfig and impressionHandlerConfig.skipItemImpressionsLog then
			return
		end
	elseif p7 then
		return
	end
	unifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p1.dependencies.eventIngest, p2, p3, p4, p1.appPage, p4.collectionId, p4.contentType, p4.itemsPerRow, p4.collectionPosition, p5)
end