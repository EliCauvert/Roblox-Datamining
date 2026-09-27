local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useDefaultTags = foundationModule.Hooks.useDefaultTags
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local linkOpenedSource = analyticsServiceModule.LinkOpenedSource

return reactModule.memo(function(p1)
	-- upvalues: useDefaultTags (ref), reactModule (ref), textWithTranslationModule (ref), linkOpenedSource (ref), view (ref)
	local var1 = useDefaultTags(p1.additionalTag, "col gap-small size-full-0 auto-y")
	
	if not p1.footerItems or #p1.footerItems == 0 then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p1.footerItems) do
		table.insert(t, reactModule.createElement(textWithTranslationModule, {
			tag = "auto-xy text-body-small",
			input = v.label,
			linkId = v.id,
			linkSource = linkOpenedSource.Footer,
			layoutOrder = i
		}))
	end
	return reactModule.createElement(view, {
		padding = p1.padding,
		tag = var1,
		LayoutOrder = p1.layoutOrder
	}, t)
end)