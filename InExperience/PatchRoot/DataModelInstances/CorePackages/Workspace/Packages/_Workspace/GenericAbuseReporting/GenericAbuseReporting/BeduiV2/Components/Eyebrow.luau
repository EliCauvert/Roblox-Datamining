local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), TextWithTranslationModule (copy)
	return if p1.eyebrow then ReactModule.createElement(TextWithTranslationModule, {
		tag = "size-full-0 auto-y text-label-large",
		input = p1.eyebrow,
		LayoutOrder = p1.layoutOrder
	}) else nil
end)