local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AvatarExperienceCommon)
local fFlagAXSduiSeeAllClickLogging = require(parent.AvatarExperienceFlags).FFlagAXSduiSeeAllClickLogging
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedEventLogConstants = avatarExperienceAnalyticsModule.UnifiedEventLogConstants
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local widgetIxpLayerMapModule = require(avatarExperienceCatalog.Utils.WidgetIxpLayerMap)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1)
	-- upvalues: widgetIxpLayerMapModule (ref), reactModule (ref), addUnifiedEventLogging (ref), cryoModule (ref), unifiedEventLogEnums (ref), unifiedEventLogConstants (ref), widgetConstantsModule (ref), fFlagAXSduiSeeAllClickLogging (ref), httpService (ref)
	local containerRef = p1.containerRef
	local widgetInfo = p1.widgetInfo
	local widgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local widgetRow = p1.widgetRow
	local uiTreatmentType = p1.uiTreatmentType
	local type = widgetIxpLayerMapModule[widgetInfo.type]
	reactModule.useEffect(function()
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
	
	if fFlagAXSduiSeeAllClickLogging then
		local seeAllRef = p1.seeAllRef
		local var1 = p1.seeAllCallback ~= nil
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), seeAllRef (ref), addUnifiedEventLogging (copy), unifiedEventLogEnums (copy), widgetAnalyticsInfo (ref), httpService (copy), widgetInfo (ref), widgetRow (ref), unifiedEventLogConstants (copy)
			if var1 and seeAllRef and seeAllRef.current then
				addUnifiedEventLogging(seeAllRef, {
					elementName = "SEE_ALL",
					gridPositionColumn = 1,
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					requestId = widgetAnalyticsInfo.requestId,
					elementMetadata = httpService:JSONEncode({
						widget_id = widgetAnalyticsInfo.widgetId,
						widget_type = widgetAnalyticsInfo.widgetType,
						tag_id = widgetInfo.tagId
					}),
					gridPositionRow = widgetRow
				}, {
					sessionTagName = unifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
		end, { var1, widgetRow, widgetInfo.tagId, widgetAnalyticsInfo })
	end
end