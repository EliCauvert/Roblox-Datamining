local AdGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local Parent = AdGuiInteractivity.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AdsInteractivityTelemetryModule = require(AdGuiInteractivity.AdsInteractivityTelemetry)
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Button = FoundationModule.Button
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ImmersiveBrandedAdsLearnMoreUrl = game:DefineFastString("ImmersiveBrandedAdsLearnMoreUrl", "www.roblox.com")

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Default (copy), ImmersiveBrandedAdsLearnMoreUrl (copy), AdsInteractivityTelemetryModule (copy), Dialog (copy), DialogSize (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local AdvertiserName = p1.advertiserName or ""
	local UseLocalizationResult = UseLocalizationFunction({
		WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd",
		CloseButtonText = "CoreScripts.Ads.Action.Close",
		StaticBodyText = "CoreScripts.Ads.Label.InExperienceDisclosureStatic",
		LearnMoreLinkText = "InGame.CommonUI.Badge.Popup.LearnMoreLink",
		DynamicAdvertiserBodyText = {
			"CoreScripts.Ads.ImmersiveBrandedAds.WhyThisAd",
			AdvertiserName = AdvertiserName
		}
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		dialog = ReactModule.createElement(Dialog.Root, {
			size = DialogSize.Small,
			onClose = ReactModule.useCallback(function(_)
				-- upvalues: p1 (copy)
				p1.onDismiss()
			end, { p1.onDismiss })
		}, {
			dialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.WhyThisAdText }),
			dialogContent = ReactModule.createElement(Dialog.Content, nil, {
				content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-small" }, {
					dialogText = ReactModule.createElement(Dialog.Text, {
						LayoutOrder = 1,
						Text = if AdvertiserName == "" then UseLocalizationResult.StaticBodyText else UseLocalizationResult.DynamicAdvertiserBodyText
					}),
					link = ReactModule.createElement(Button, {
						LayoutOrder = 2,
						icon = "icons/navigation/externallink",
						text = UseLocalizationResult.LearnMoreLinkText,
						variant = ButtonVariant.Link,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: Default (upval), ImmersiveBrandedAdsLearnMoreUrl (upval), AdsInteractivityTelemetryModule (upval), p1 (copy)
							Default:openURL(ImmersiveBrandedAdsLearnMoreUrl):catch(function(_)
								-- upvalues: AdsInteractivityTelemetryModule (upval), p1 (upval)
								AdsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("whyThisAd.learnMore")
								p1.onDismiss()
							end)
						end, { p1.onDismiss }),
						size = InputSize.Small
					})
				})
			}),
			dialogActions = ReactModule.createElement(Dialog.Actions, {
				actions = {
					{
						text = UseLocalizationResult.CloseButtonText,
						variant = ButtonVariant.Standard,
						onActivated = p1.onDismiss
					}
				}
			})
		}),
		modal = ReactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		})
	})
end