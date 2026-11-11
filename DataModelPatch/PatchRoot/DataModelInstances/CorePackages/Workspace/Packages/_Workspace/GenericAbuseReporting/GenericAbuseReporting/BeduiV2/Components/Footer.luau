local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseDefaultTagsFunction = FoundationModule.Hooks.useDefaultTags
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)

return ReactModule.memo(function(p1)
	-- upvalues: UseDefaultTagsFunction (copy), ReactModule (copy), TextWithTranslationModule (copy), View (copy)
	local ColGapSmallSizeFull0AutoY = UseDefaultTagsFunction(p1.additionalTag, "col gap-small size-full-0 auto-y")
	
	if not p1.footerItems then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, footerItem in ipairs(p1.footerItems) do
		table.insert(Elements, ReactModule.createElement(TextWithTranslationModule, {
			tag = "auto-xy text-body-small",
			input = footerItem.label,
			LayoutOrder = LayoutOrder
		}))
	end
	return ReactModule.createElement(View, {
		padding = p1.padding,
		tag = ColGapSmallSizeFull0AutoY,
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)