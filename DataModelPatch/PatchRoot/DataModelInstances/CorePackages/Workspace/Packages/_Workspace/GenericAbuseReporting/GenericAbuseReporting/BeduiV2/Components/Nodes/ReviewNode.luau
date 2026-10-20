local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local PreviewBoxModule = require(GenericAbuseReporting.BeduiV2.Components.PreviewBox)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), UseLayoutSlotsFunction (copy), ReactModule (copy), View (copy), EyebrowModule (copy), PreviewBoxModule (copy), DashModule (copy), TextWithTranslationModule (copy), FFlagAbuseReportMenuV2 (copy), FooterModule (copy), Button (copy), ButtonVariant (copy), FoundationModule (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	
	return ReactModule.createElement(UseLayoutSlotsResult.Layout, {
		body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
			TitleContainer = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Eyebrow = p1.eyebrow and ReactModule.createElement(EyebrowModule, { layoutOrder = 1, eyebrow = p1.eyebrow }),
				Title = ReactModule.createElement(UseLayoutSlotsResult.Title, {
					layoutOrder = 2,
					input = p1.title,
					subtitle = p1.subtitle
				})
			}),
			Preview = p1.preview and ReactModule.createElement(PreviewBoxModule, { layoutOrder = 2, preview = p1.preview }),
			DetailsContainer = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 3
			}, DashModule.map(p1.details, function(p2)
				-- upvalues: ReactModule (upval), View (upval), TextWithTranslationModule (upval)
				return ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-xsmall" }, {
					Heading = ReactModule.createElement(TextWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 1,
						input = p2.heading,
						fontStyle = { Font = Enum.Font.BuilderSansBold }
					}),
					Text = ReactModule.createElement(TextWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 2,
						input = p2.text
					})
				})
			end)),
			Footer = if FFlagAbuseReportMenuV2 and p1.footerItems then ReactModule.createElement(FooterModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 4,
				footerItems = p1.footerItems
			}) else nil
		}),
		actions = if p1.onNext then ReactModule.createElement(Button, {
			text = TranslateIntoStringFunction(p1.nextButtonText),
			variant = ButtonVariant.Emphasis,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			isLoading = p1.isSubmitting,
			isDisabled = p1.isSubmitting,
			onActivated = p1.onNext
		}) else nil
	})
end)