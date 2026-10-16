local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local FFlagAXSduiSeeAllClickLogging = require(Parent.AvatarExperienceFlags).FFlagAXSduiSeeAllClickLogging
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local WidgetIxpLayerMapModule = require(AvatarExperienceCatalog.Utils.WidgetIxpLayerMap)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1) --[[ Line: 84 | Named "useAddUnifiedLoggingToCatalogSortEffect" ]]
	-- upvalues: WidgetIxpLayerMapModule (copy), ReactModule (copy), AddUnifiedEventLoggingFunction (copy), CryoModule (copy), UnifiedEventLogEnums (copy), UnifiedEventLogConstants (copy), WidgetConstantsModule (copy), FFlagAXSduiSeeAllClickLogging (copy), HttpService (copy)
	local ContainerRef = p1.containerRef
	local WidgetInfo = p1.widgetInfo
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local WidgetRow = p1.widgetRow
	local UiTreatmentType = p1.uiTreatmentType
	local WidgetIxpLayerMapModuleEntry = WidgetIxpLayerMapModule[WidgetInfo.type]
	ReactModule.useEffect(function() --[[ Line: 93 ]]
		-- upvalues: AddUnifiedEventLoggingFunction (upval), ContainerRef (copy), CryoModule (upval), WidgetAnalyticsInfo (copy), UnifiedEventLogEnums (upval), WidgetRow (copy), UiTreatmentType (copy), WidgetInfo (copy), UnifiedEventLogConstants (upval), WidgetIxpLayerMapModuleEntry (copy), WidgetConstantsModule (upval)
		AddUnifiedEventLoggingFunction(ContainerRef, CryoModule.Dictionary.join(WidgetAnalyticsInfo, {
			gridPositionColumn = 1,
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
			gridPositionRow = WidgetRow,
			uiTreatmentType = UiTreatmentType,
			themeId = WidgetInfo.tagId
		}), {
			sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
		})
		local Current = ContainerRef.current
		
		if WidgetIxpLayerMapModuleEntry and Current then
			Current:SetAttribute(WidgetConstantsModule.WidgetExposureMetadata.AttributeKey, WidgetIxpLayerMapModuleEntry)
			
			return
		end
		if Current then
			Current:SetAttribute(WidgetConstantsModule.WidgetExposureMetadata.AttributeKey, nil)
		end
	end, {
		WidgetIxpLayerMapModuleEntry,
		WidgetRow,
		UiTreatmentType,
		WidgetInfo.tagId,
		WidgetAnalyticsInfo
	})
	
	if FFlagAXSduiSeeAllClickLogging then
		local SeeAllRef = p1.seeAllRef
		local HasSeeAllCallback = p1.seeAllCallback ~= nil
		ReactModule.useEffect(function() --[[ Line: 122 ]]
			-- upvalues: HasSeeAllCallback (copy), SeeAllRef (copy), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogEnums (upval), WidgetAnalyticsInfo (copy), HttpService (upval), WidgetInfo (copy), WidgetRow (copy), UnifiedEventLogConstants (upval)
			if HasSeeAllCallback and SeeAllRef and SeeAllRef.current then
				AddUnifiedEventLoggingFunction(SeeAllRef, {
					elementName = "SEE_ALL",
					gridPositionColumn = 1,
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					requestId = WidgetAnalyticsInfo.requestId,
					elementMetadata = HttpService:JSONEncode({
						widget_id = WidgetAnalyticsInfo.widgetId,
						widget_type = WidgetAnalyticsInfo.widgetType,
						tag_id = WidgetInfo.tagId
					}),
					gridPositionRow = WidgetRow
				}, {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
		end, {
			HasSeeAllCallback,
			WidgetRow,
			WidgetInfo.tagId,
			WidgetAnalyticsInfo
		})
	end
end