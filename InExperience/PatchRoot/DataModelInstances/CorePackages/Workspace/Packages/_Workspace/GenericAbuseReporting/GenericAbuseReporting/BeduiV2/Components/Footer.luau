local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useDefaultTags = foundationModule.Hooks.useDefaultTags
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)

return reactModule.memo(function(p0) --[[ line: 29 | named "Footer" ]]
	-- upvalues: useDefaultTags (ref), reactModule (ref), textWithTranslationModule (ref), view (ref)
	local var4 = useDefaultTags(p0.additionalTag, "col gap-small size-full-0 auto-y")
	
	if not p0.footerItems then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p0.footerItems) do
		table.insert(t, reactModule.createElement(textWithTranslationModule, {
			tag = "auto-xy text-body-small",
			input = v.label,
			LayoutOrder = i
		}))
	end
	return reactModule.createElement(view, {
		padding = p0.padding,
		tag = var4,
		LayoutOrder = p0.layoutOrder
	}, t)
end)