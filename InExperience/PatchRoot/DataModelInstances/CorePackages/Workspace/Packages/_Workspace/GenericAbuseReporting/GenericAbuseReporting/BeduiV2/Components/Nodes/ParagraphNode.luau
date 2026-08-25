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

return reactModule.memo(function(p0)
	-- upvalues: useArTranslation (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), reactModule (ref), eyebrowModule (ref), textWithTranslationModule (ref), footerModule (ref), button (ref), buttonVariant (ref), foundationModule (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var8 = useLayoutSlots()
	local body = var8.Body
	local actions = var8.Actions
	local var9 = if fFlagAbuseReportMenuV2 then var8.Layout else nil
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p0.eyebrow }),
		Title = reactModule.createElement(var8.Title, {
			layoutOrder = 1,
			input = p0.title,
			subtitle = p0.subtitle
		}),
		Paragraph = reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2,
			input = p0.paragraph
		}),
		Footer = if fFlagAbuseReportMenuV2 and p0.footerItems then reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p0.footerItems
		}) else nil
	}
	local var11 = if p0.onNext then reactModule.createElement(button, {
		text = translateIntoString(p0.nextButtonText),
		variant = buttonVariant.Emphasis,
		fillBehavior = foundationModule.Enums.FillBehavior.Fill,
		isLoading = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else false,
		isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else false,
		onActivated = p0.onNext
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var9, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var11
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var11 then reactModule.createElement(actions, nil, { Button = var11 }) else nil
	})
end)