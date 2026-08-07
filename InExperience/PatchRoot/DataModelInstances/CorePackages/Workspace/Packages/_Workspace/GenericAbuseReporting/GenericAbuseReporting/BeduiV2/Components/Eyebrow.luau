local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)

return reactModule.memo(function(p0) --[[ line: 20 | named "Eyebrow" ]]
	-- upvalues: reactModule (ref), textWithTranslationModule (ref)
	return if p0.eyebrow then reactModule.createElement(textWithTranslationModule, {
		tag = "size-full-0 auto-y text-label-large",
		input = p0.eyebrow,
		LayoutOrder = p0.layoutOrder
	}) else nil
end)