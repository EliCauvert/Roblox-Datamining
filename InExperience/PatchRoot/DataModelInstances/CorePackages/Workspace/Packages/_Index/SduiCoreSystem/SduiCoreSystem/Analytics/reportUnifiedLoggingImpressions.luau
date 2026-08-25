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

return function(p0, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiErrorsModule (ref), sduiCollectionAnalyticsBuilderModule (ref), getSduiImpressionHandlerRegistryModule (ref), fFlagSduiEdpStoreImpressionsLogging (ref), unifiedLoggingModule (ref)
	if not p3 then
		p0.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.LogImpressionsMissingCollectionData, {}, p0.appPage)
	end
	p3 = p3 or sduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	assert(p3, "collectionAnalyticsData must exist")
	local impressionHandlerConfig = nil
	
	if p5 then
		impressionHandlerConfig = getSduiImpressionHandlerRegistryModule().getImpressionHandlerConfig(p5)
		
		if not impressionHandlerConfig then
			unifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p0.dependencies.eventIngest, p1, p2, p3, p0.appPage, p3.collectionId, p3.contentType, p3.itemsPerRow, p3.collectionPosition, p4, p5)
		elseif impressionHandlerConfig.handler then
			impressionHandlerConfig.handler(p0, p1, p2, p3, p4, if fFlagSduiEdpStoreImpressionsLogging then p7 else nil)
		end
	end
	if p6 == nil then
		if impressionHandlerConfig and impressionHandlerConfig.skipItemImpressionsLog then
			return
		end
	elseif p6 then
		return
	end
	unifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p0.dependencies.eventIngest, p1, p2, p3, p0.appPage, p3.collectionId, p3.contentType, p3.itemsPerRow, p3.collectionPosition, p4)
end