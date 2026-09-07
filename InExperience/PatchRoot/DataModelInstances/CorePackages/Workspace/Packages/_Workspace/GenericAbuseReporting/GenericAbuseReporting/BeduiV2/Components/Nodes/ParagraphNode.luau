local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagSupportSubmissionOnAllReportNodes = sharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

return reactModule.memo(function(p1)
	-- upvalues: useArTranslation (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), reactModule (ref), eyebrowModule (ref), textWithTranslationModule (ref), footerModule (ref), button (ref), buttonVariant (ref), foundationModule (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var1 = useLayoutSlots()
	local body = var1.Body
	local actions = var1.Actions
	local var2 = if fFlagAbuseReportMenuV2 then var1.Layout else nil
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
		Title = reactModule.createElement(var1.Title, {
			layoutOrder = 1,
			input = p1.title,
			subtitle = p1.subtitle
		}),
		Paragraph = reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2,
			input = p1.paragraph
		}),
		Footer = if fFlagAbuseReportMenuV2 and p1.footerItems then reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p1.footerItems
		}) else nil
	}
	local var3 = if p1.onNext then reactModule.createElement(button, {
		text = translateIntoString(p1.nextButtonText),
		variant = buttonVariant.Emphasis,
		fillBehavior = foundationModule.Enums.FillBehavior.Fill,
		isLoading = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		onActivated = p1.onNext
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var2, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var3
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var3 then reactModule.createElement(actions, nil, { Button = var3 }) else nil
	})
end)