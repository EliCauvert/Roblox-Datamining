local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagSupportSubmissionOnAllReportNodes = SharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), UseLayoutSlotsFunction (copy), FFlagAbuseReportMenuV2 (copy), ReactModule (copy), EyebrowModule (copy), TextWithTranslationModule (copy), FooterModule (copy), Button (copy), ButtonVariant (copy), FoundationModule (copy), FFlagSupportSubmissionOnAllReportNodes (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Body = UseLayoutSlotsResult.Body
	local Actions = UseLayoutSlotsResult.Actions
	local Layout = if FFlagAbuseReportMenuV2 then UseLayoutSlotsResult.Layout else nil
	local config = {
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
		Footer = if FFlagAbuseReportMenuV2 and p1.footerItems then ReactModule.createElement(FooterModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p1.footerItems
		}) else nil
	}
	local Element = if p1.onNext then ReactModule.createElement(Button, {
		text = TranslateIntoStringFunction(p1.nextButtonText),
		variant = ButtonVariant.Emphasis,
		fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
		isLoading = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		isDisabled = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		onActivated = p1.onNext
	}) else nil
	
	return if FFlagAbuseReportMenuV2 then ReactModule.createElement(Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, config),
		actions = Element
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Body, nil, config),
		Actions = if Element then ReactModule.createElement(Actions, nil, { Button = Element }) else nil
	})
end)