local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AvatarExperienceCommon)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedEventLogConstants = avatarExperienceAnalyticsModule.UnifiedEventLogConstants
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local widgetIxpLayerMapModule = require(avatarExperienceCatalog.Utils.WidgetIxpLayerMap)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p0) --[[ line: 72 | named "useAddUnifiedLoggingToCatalogSortEffect" ]]
	-- upvalues: widgetIxpLayerMapModule (ref), reactModule (ref), addUnifiedEventLogging (ref), cryoModule (ref), unifiedEventLogEnums (ref), unifiedEventLogConstants (ref), widgetConstantsModule (ref)
	local containerRef = p0.containerRef
	local widgetInfo = p0.widgetInfo
	local widgetAnalyticsInfo = p0.widgetAnalyticsInfo
	local widgetRow = p0.widgetRow
	local uiTreatmentType = p0.uiTreatmentType
	local type = widgetIxpLayerMapModule[widgetInfo.type]
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: addUnifiedEventLogging (copy), containerRef (ref), cryoModule (copy), widgetAnalyticsInfo (ref), unifiedEventLogEnums (copy), widgetRow (ref), uiTreatmentType (ref), widgetInfo (ref), unifiedEventLogConstants (copy), type (ref), widgetConstantsModule (copy)
		addUnifiedEventLogging(containerRef, cryoModule.Dictionary.join(widgetAnalyticsInfo, {
			gridPositionColumn = 1,
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
			gridPositionRow = widgetRow,
			uiTreatmentType = uiTreatmentType,
			themeId = widgetInfo.tagId
		}), {
			sessionTagName = unifiedEventLogConstants.L2_SESSION_TAG_NAME
		})
		local current = containerRef.current
		
		if type and current then
			current:SetAttribute(widgetConstantsModule.WidgetExposureMetadata.AttributeKey, type)
			
			return
		elseif current then
			current:SetAttribute(widgetConstantsModule.WidgetExposureMetadata.AttributeKey, nil)
		end
	end, {
		type,
		widgetRow,
		uiTreatmentType,
		widgetInfo.tagId,
		widgetAnalyticsInfo
	})
end