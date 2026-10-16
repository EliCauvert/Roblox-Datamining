local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagSupportSubmissionOnAllReportNodes = require(Parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "ParagraphNode" ]]
	-- upvalues: UseArTranslationFunction (copy), UseLayoutSlotsFunction (copy), ReactModule (copy), EyebrowModule (copy), TextWithTranslationModule (copy), FooterModule (copy), Button (copy), ButtonVariant (copy), FoundationModule (copy), FFlagSupportSubmissionOnAllReportNodes (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	
	return ReactModule.createElement(UseLayoutSlotsResult.Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, {
			Eyebrow = ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = ReactModule.createElement(UseLayoutSlotsResult.Title, {
				layoutOrder = 1,
				input = p1.title,
				subtitle = p1.subtitle
			}),
			Paragraph = ReactModule.createElement(TextWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = p1.paragraph
			}),
			Footer = if p1.footerItems then ReactModule.createElement(FooterModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 3,
				footerItems = p1.footerItems
			}) else nil
		}),
		actions = if p1.onNext then ReactModule.createElement(Button, {
			text = TranslateIntoStringFunction(p1.nextButtonText),
			variant = ButtonVariant.Emphasis,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			isLoading = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
			isDisabled = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
			onActivated = p1.onNext
		}) else nil
	})
end)