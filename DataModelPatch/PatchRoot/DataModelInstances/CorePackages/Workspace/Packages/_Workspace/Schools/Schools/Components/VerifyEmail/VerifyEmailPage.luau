local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SchoolsPageModule = require(Schools.Components.Common.SchoolsPage)
local TextKeysModule = require(Schools.Common.TextKeys)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local TextInput = FoundationModule.TextInput
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), SchoolsPageModule (copy), View (copy), Text (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		headerTitle = TextKeysModule.VerifyEmailHeaderTitle,
		heading = TextKeysModule.VerifyEmailHeading,
		body = TextKeysModule.VerifyEmailBody,
		learnMore = TextKeysModule.VerifyEmailLearnMore,
		unidaysTerms = TextKeysModule.VerifyEmailUnidaysTerms,
		continueAction = TextKeysModule.VerifyEmailActionContinue,
		termsOfService = TextKeysModule.TermsOfService,
		privacyPolicy = TextKeysModule.PrivacyPolicy,
		emailPlaceholder = TextKeysModule.VerifyEmailPlaceholder
	})
	
	return ReactModule.createElement(SchoolsPageModule, {
		testId = "schools-verify-email-page",
		title = UseLocalizationResult.headerTitle,
		onBack = p1.onBack
	}, {
		HeadingBody = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-left size-full-0 auto-y"
		}, {
			Heading = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-bottom-xsmall text-heading-medium text-wrap text-align-x-left content-default",
				Text = UseLocalizationResult.heading
			}),
			Body = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = UseLocalizationResult.body
			}),
			LearnMore = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				RichText = true,
				tag = "auto-xy text-body-medium content-default",
				Text = `<u>{UseLocalizationResult.learnMore}</u>`,
				onActivated = p1.onLearnMore
			})
		}),
		Wrapper = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			EmailInput = ReactModule.createElement(TextInput, {
				LayoutOrder = 1,
				label = "",
				text = p1.email,
				placeholder = UseLocalizationResult.emailPlaceholder,
				width = UDim.new(1, 0),
				size = InputSize.Medium,
				hasError = p1.errorMessage ~= nil,
				hint = p1.errorMessage,
				onChanged = p1.onEmailChanged
			}),
			UnidaysTerms = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-muted",
				Text = UseLocalizationResult.unidaysTerms
			}),
			Continue = ReactModule.createElement(Button, {
				LayoutOrder = 3,
				text = UseLocalizationResult.continueAction,
				size = InputSize.Medium,
				variant = ButtonVariant.Emphasis,
				width = UDim.new(1, 0),
				onActivated = p1.onContinue
			}),
			Links = ReactModule.createElement(View, {
				LayoutOrder = 4,
				tag = "row align-x-center gap-xlarge size-full-0 auto-y"
			}, {
				TermsOfService = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					RichText = true,
					tag = "auto-xy text-body-medium content-emphasis",
					Text = `<u>{UseLocalizationResult.termsOfService}</u>`,
					onActivated = p1.onTermsOfService
				}),
				PrivacyPolicy = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					RichText = true,
					tag = "auto-xy text-body-medium content-emphasis",
					Text = `<u>{UseLocalizationResult.privacyPolicy}</u>`,
					onActivated = p1.onPrivacyPolicy
				})
			})
		})
	})
end