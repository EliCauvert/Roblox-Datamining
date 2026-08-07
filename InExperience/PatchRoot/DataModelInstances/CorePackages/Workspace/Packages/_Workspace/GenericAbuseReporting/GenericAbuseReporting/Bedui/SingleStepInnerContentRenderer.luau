local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local beduiAnalyticsModule = require(genericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local componentType = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).ComponentType
local dropdownModule = require(genericAbuseReporting.Bedui.Components.Dropdown)
local freeCommentModule = require(genericAbuseReporting.Bedui.Components.FreeComment)
local paragraphModule = require(genericAbuseReporting.Bedui.Components.Paragraph)
local selectorModule = require(genericAbuseReporting.Bedui.Components.Selector)
local sendAnalyticsEvent = beduiAnalyticsModule.sendAnalyticsEvent
local telemetryEventType = beduiAnalyticsModule.TelemetryEventType
local useAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local webViewLinkModule = require(genericAbuseReporting.Bedui.Components.WebViewLink)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport

return reactModule.memo(function(p0) --[[ line: 30 | named "SingleStepInnerContentRenderer" ]]
	-- upvalues: useAnalyticsContextModule (ref), reactModule (ref), componentType (ref), dropdownModule (ref), freeCommentModule (ref), paragraphModule (ref), webViewLinkModule (ref), fFlagAddThumbnailSelectorReport (ref), selectorModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), view (ref)
	local var9 = useAnalyticsContextModule()
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-xxlarge" }, reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: p0 (ref), componentType (copy), reactModule (copy), dropdownModule (copy), freeCommentModule (copy), paragraphModule (copy), webViewLinkModule (copy), fFlagAddThumbnailSelectorReport (copy), selectorModule (copy), var9 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy)
		if p0.contentConfig == nil then
			return {}
		end
		local t = {}
		
		if p0.contentConfig.type ~= "configurableComponentList" then
			return {}
		end
		for i, v in ipairs(p0.contentConfig.configurableComponentList.components) do
			if v.componentType == componentType.Dropdown then
				t[`{v.componentType}{i}`] = reactModule.createElement(dropdownModule, {
					component = v,
					isErrorState = v.formDataKey ~= nil and table.find(p0.formDataKeysWithError, v.formDataKey) ~= nil,
					layoutOrder = i
				})
			end
			if v.componentType == componentType.FreeComment then
				t[`{v.componentType}{i}`] = reactModule.createElement(freeCommentModule, {
					component = v,
					isErrorState = v.formDataKey ~= nil and table.find(p0.formDataKeysWithError, v.formDataKey) ~= nil,
					layoutOrder = i
				})
			elseif v.componentType == componentType.Paragraph then
				t[`{v.componentType}{i}`] = reactModule.createElement(paragraphModule, { component = v, layoutOrder = i })
			elseif v.componentType == componentType.WebViewLink then
				t[`{v.componentType}{i}`] = reactModule.createElement(webViewLinkModule, { component = v, layoutOrder = i })
			elseif fFlagAddThumbnailSelectorReport and v.componentType == componentType.Selector then
				t[`{v.componentType}{i}`] = reactModule.createElement(selectorModule, {
					abuseVector = var9.abuseVector,
					component = v,
					isErrorState = v.formDataKey ~= nil and table.find(p0.formDataKeysWithError, v.formDataKey) ~= nil,
					layoutOrder = i
				})
			else
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var9,
					meta = {
						error = `SingleStepInnerContentRenderer - Unsupported component type: {v.componentType}`
					}
				})
			end
		end
		return t
	end, {
		p0.contentConfig,
		p0.formDataKeysWithError,
		sendAnalyticsEvent,
		var9
	}))
end)