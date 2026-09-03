local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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

return reactModule.memo(function(p1)
	-- upvalues: useArTranslation (ref), useLayoutSlots (ref), reactModule (ref), view (ref), eyebrowModule (ref), previewBoxModule (ref), dashModule (ref), textWithTranslationModule (ref), footerModule (ref), button (ref), buttonVariant (ref), foundationModule (ref)
	local var1 = useLayoutSlots()
	
	return reactModule.createElement(var1.Layout, {
		body = reactModule.createElement(view, { tag = "col gap-large size-full-0 auto-y" }, {
			TitleContainer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Eyebrow = p1.eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 1, eyebrow = p1.eyebrow }),
				Title = reactModule.createElement(var1.Title, {
					layoutOrder = 2,
					input = p1.title,
					subtitle = p1.subtitle
				})
			}),
			Preview = p1.preview and reactModule.createElement(previewBoxModule, { layoutOrder = 2, preview = p1.preview }),
			DetailsContainer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 3
			}, dashModule.map(p1.details, function(p2)
				-- upvalues: reactModule (copy), view (copy), textWithTranslationModule (copy)
				return reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-xsmall" }, {
					Heading = reactModule.createElement(textWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 1,
						input = p2.heading,
						fontStyle = { Font = Enum.Font.BuilderSansBold }
					}),
					Text = reactModule.createElement(textWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 2,
						input = p2.text
					})
				})
			end)),
			Footer = if p1.footerItems then reactModule.createElement(footerModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 4,
				footerItems = p1.footerItems
			}) else nil
		}),
		actions = if p1.onNext then reactModule.createElement(button, {
			text = useArTranslation().translateIntoString(p1.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isLoading = p1.isSubmitting,
			isDisabled = p1.isSubmitting,
			onActivated = p1.onNext
		}) else nil
	})
end)