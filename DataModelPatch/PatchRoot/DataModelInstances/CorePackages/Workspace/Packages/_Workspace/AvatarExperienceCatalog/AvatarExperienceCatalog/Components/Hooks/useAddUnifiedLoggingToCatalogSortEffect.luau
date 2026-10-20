local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local WidgetIxpLayerMapModule = require(AvatarExperienceCatalog.Utils.WidgetIxpLayerMap)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1)
	-- upvalues: WidgetIxpLayerMapModule (copy), ReactModule (copy), AddUnifiedEventLoggingFunction (copy), CryoModule (copy), UnifiedEventLogEnums (copy), UnifiedEventLogConstants (copy), WidgetConstantsModule (copy)
	local ContainerRef = p1.containerRef
	local WidgetInfo = p1.widgetInfo
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local WidgetRow = p1.widgetRow
	local UiTreatmentType = p1.uiTreatmentType
	local WidgetIxpLayerMapModuleEntry = WidgetIxpLayerMapModule[WidgetInfo.type]
	ReactModule.useEffect(function()
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
end