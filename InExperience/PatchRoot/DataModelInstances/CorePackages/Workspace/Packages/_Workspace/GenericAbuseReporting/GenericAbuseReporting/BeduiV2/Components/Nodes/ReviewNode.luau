local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local previewBoxModule = require(genericAbuseReporting.BeduiV2.Components.PreviewBox)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

return reactModule.memo(function(p0) --[[ line: 47 | named "ReviewNode" ]]
	-- upvalues: useArTranslation (ref), useLayoutSlots (ref), reactModule (ref), view (ref), eyebrowModule (ref), previewBoxModule (ref), dashModule (ref), textWithTranslationModule (ref), fFlagAbuseReportMenuV2 (ref), footerModule (ref), button (ref), buttonVariant (ref), foundationModule (ref)
	local var10 = useLayoutSlots()
	
	return reactModule.createElement(var10.Layout, {
		body = reactModule.createElement(view, { tag = "col gap-large size-full-0 auto-y" }, {
			TitleContainer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Eyebrow = p0.eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 1, eyebrow = p0.eyebrow }),
				Title = reactModule.createElement(var10.Title, {
					layoutOrder = 2,
					input = p0.title,
					subtitle = p0.subtitle
				})
			}),
			Preview = p0.preview and reactModule.createElement(previewBoxModule, { layoutOrder = 2, preview = p0.preview }),
			DetailsContainer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 3
			}, dashModule.map(p0.details, function(p1) --[[ line: 81 ]]
				-- upvalues: reactModule (copy), view (copy), textWithTranslationModule (copy)
				return reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-xsmall" }, {
					Heading = reactModule.createElement(textWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 1,
						input = p1.heading,
						fontStyle = { Font = Enum.Font.BuilderSansBold }
					}),
					Text = reactModule.createElement(textWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 2,
						input = p1.text
					})
				})
			end)),
			Footer = if fFlagAbuseReportMenuV2 and p0.footerItems then reactModule.createElement(footerModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 4,
				footerItems = p0.footerItems
			}) else nil
		}),
		actions = if p0.onNext then reactModule.createElement(button, {
			text = useArTranslation().translateIntoString(p0.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isLoading = p0.isSubmitting,
			isDisabled = p0.isSubmitting,
			onActivated = p0.onNext
		}) else nil
	})
end)