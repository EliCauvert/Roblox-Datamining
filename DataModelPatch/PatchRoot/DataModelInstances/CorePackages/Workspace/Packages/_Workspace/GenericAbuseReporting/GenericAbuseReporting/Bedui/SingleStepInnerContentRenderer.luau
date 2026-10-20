local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local BeduiAnalyticsModule = require(GenericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local ComponentType = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).ComponentType
local DropdownModule = require(GenericAbuseReporting.Bedui.Components.Dropdown)
local FreeCommentModule = require(GenericAbuseReporting.Bedui.Components.FreeComment)
local ParagraphModule = require(GenericAbuseReporting.Bedui.Components.Paragraph)
local SelectorModule = require(GenericAbuseReporting.Bedui.Components.Selector)
local SendAnalyticsEventFunction = BeduiAnalyticsModule.sendAnalyticsEvent
local TelemetryEventType = BeduiAnalyticsModule.TelemetryEventType
local UseAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local WebViewLinkModule = require(GenericAbuseReporting.Bedui.Components.WebViewLink)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport

return ReactModule.memo(function(p1)
	-- upvalues: UseAnalyticsContextModule (copy), ReactModule (copy), ComponentType (copy), DropdownModule (copy), FreeCommentModule (copy), ParagraphModule (copy), WebViewLinkModule (copy), FFlagAddThumbnailSelectorReport (copy), SelectorModule (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), View (copy)
	local UseAnalyticsContextModuleResult = UseAnalyticsContextModule()
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-xxlarge" }, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ComponentType (upval), ReactModule (upval), DropdownModule (upval), FreeCommentModule (upval), ParagraphModule (upval), WebViewLinkModule (upval), FFlagAddThumbnailSelectorReport (upval), SelectorModule (upval), UseAnalyticsContextModuleResult (copy), SendAnalyticsEventFunction (upval), TelemetryEventType (upval)
		if p1.contentConfig == nil then
			return {}
		end
		local Elements = {}
		
		if p1.contentConfig.type ~= "configurableComponentList" then
			return {}
		end
		for LayoutOrder, component in ipairs(p1.contentConfig.configurableComponentList.components) do
			if component.componentType == ComponentType.Dropdown then
				Elements[`{component.componentType}{LayoutOrder}`] = ReactModule.createElement(DropdownModule, {
					component = component,
					isErrorState = component.formDataKey ~= nil and table.find(p1.formDataKeysWithError, component.formDataKey) ~= nil,
					layoutOrder = LayoutOrder
				})
			elseif component.componentType == ComponentType.FreeComment then
				Elements[`{component.componentType}{LayoutOrder}`] = ReactModule.createElement(FreeCommentModule, {
					component = component,
					isErrorState = component.formDataKey ~= nil and table.find(p1.formDataKeysWithError, component.formDataKey) ~= nil,
					layoutOrder = LayoutOrder
				})
			elseif component.componentType == ComponentType.Paragraph then
				Elements[`{component.componentType}{LayoutOrder}`] = ReactModule.createElement(ParagraphModule, { component = component, layoutOrder = LayoutOrder })
			elseif component.componentType == ComponentType.WebViewLink then
				Elements[`{component.componentType}{LayoutOrder}`] = ReactModule.createElement(WebViewLinkModule, { component = component, layoutOrder = LayoutOrder })
			elseif FFlagAddThumbnailSelectorReport and component.componentType == ComponentType.Selector then
				Elements[`{component.componentType}{LayoutOrder}`] = ReactModule.createElement(SelectorModule, {
					abuseVector = UseAnalyticsContextModuleResult.abuseVector,
					component = component,
					isErrorState = component.formDataKey ~= nil and table.find(p1.formDataKeysWithError, component.formDataKey) ~= nil,
					layoutOrder = LayoutOrder
				})
			else
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Error,
					context = UseAnalyticsContextModuleResult,
					meta = {
						error = `SingleStepInnerContentRenderer - Unsupported component type: {component.componentType}`
					}
				})
			end
		end
		return Elements
	end, {
		p1.contentConfig,
		p1.formDataKeysWithError,
		SendAnalyticsEventFunction,
		UseAnalyticsContextModuleResult
	})))
end)