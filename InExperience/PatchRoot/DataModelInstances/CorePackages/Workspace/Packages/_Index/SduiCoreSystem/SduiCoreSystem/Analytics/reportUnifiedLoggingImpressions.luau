local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local UnifiedLoggingModule = require(SduiCoreSystem.Parent.UnifiedLogging)
local SduiCollectionAnalyticsBuilderModule = require(SduiCoreSystem.Analytics.SduiCollectionAnalyticsBuilder)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local GetSduiImpressionHandlerRegistryModule = require(SduiCoreSystem.getSduiImpressionHandlerRegistry)
local _ = require(SduiCoreSystem.SduiImpressionEventType)

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ Line: 26 | Named "reportUnifiedLoggingImpressions" ]]
	-- upvalues: SduiErrorsModule (copy), SduiCollectionAnalyticsBuilderModule (copy), GetSduiImpressionHandlerRegistryModule (copy), UnifiedLoggingModule (copy)
	if not p4 then
		p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.LogImpressionsMissingCollectionData, {}, p1.appPage)
	end
	local P3 = p4 or SduiCollectionAnalyticsBuilderModule.DUMMY_COLLECTION_DATA
	assert(P3, "collectionAnalyticsData must exist")
	local ImpressionHandlerConfig = nil
	
	if p6 then
		ImpressionHandlerConfig = GetSduiImpressionHandlerRegistryModule().getImpressionHandlerConfig(p6)
		
		if ImpressionHandlerConfig then
			if ImpressionHandlerConfig.handler then
				ImpressionHandlerConfig.handler(p1, p2, p3, P3, p5, p8)
			end
		else
			UnifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p1.dependencies.eventIngest, p2, p3, P3, p1.appPage, P3.collectionId, P3.contentType, P3.itemsPerRow, P3.collectionPosition, p5, p6)
		end
	end
	if p7 == nil then
		if ImpressionHandlerConfig and ImpressionHandlerConfig.skipItemImpressionsLog then return end
	elseif p7 then return end
	UnifiedLoggingModule.SendItemImpressions.sendFromServerDrivenUi(p1.dependencies.eventIngest, p2, p3, P3, p1.appPage, P3.collectionId, P3.contentType, P3.itemsPerRow, P3.collectionPosition, p5)
end