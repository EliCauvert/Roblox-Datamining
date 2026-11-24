local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local Button = FoundationModule.Button
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local InputSize = FoundationModule.Enums.InputSize
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ResponsiveModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Text (copy)
	local CoreScriptsAdsLabelWhyThisAd = UseLocalizationFunction({
		Title = "CoreScripts.Ads.Label.WhyThisAd",
		LearnMore = "InGame.CommonUI.Badge.Popup.LearnMoreLink"
	})
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsNotLearnMoreUrlMatch = p1.learnMoreUrl ~= ""
	local AdvertiserName = if p1.payerName == "" then p1.advertiserName else p1.payerName
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}),
		size = DialogSize.Small,
		onClose = if IsUsePreferredInputResultMatch then nil else p1.onClose
	}, {
		Title = ReactModule.createElement(Dialog.Title, { text = CoreScriptsAdsLabelWhyThisAd.Title }),
		Content = ReactModule.createElement(Dialog.Content, nil, {
			Column = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Body = ReactModule.createElement(Dialog.Text, {
					LayoutOrder = 1,
					Text = if AdvertiserName == "" then "You are seeing this ad based on non-personalized factors that may include device info, location, and age to serve you appropriate content. To change your Ad Preferences, visit the \"Privacy & Content Maturity\" page under account settings." else `You are seeing this ad based on non-personalized factors that may include device info, location, and age to serve you appropriate content. To change your Ad Preferences, visit the "Privacy & Content Maturity" page under account settings. This sponsorship was paid for by {AdvertiserName}.`
				}),
				LearnMore = if IsNotLearnMoreUrlMatch then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y"
				}, {
					Button = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						icon = "arrow-up-right-from-square",
						text = CoreScriptsAdsLabelWhyThisAd.LearnMore,
						variant = ButtonVariant.Utility,
						size = InputSize.Medium,
						onActivated = function()
							-- upvalues: p1 (copy)
							p1.onLearnMore(p1.learnMoreUrl)
						end
					}),
					LeaveWarning = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
						Text = "This may disconnect you from current experience and prevent you from rejoining the same server with your friends later."
					})
				}) else nil
			})
		})
	})
end