local adGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local parent = adGuiInteractivity.Parent
local reactModule = require(parent.React)
local linkingProtocolModule = require(parent.LinkingProtocol)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local adsInteractivityTelemetryModule = require(adGuiInteractivity.AdsInteractivityTelemetry)
local default = linkingProtocolModule.LinkingProtocol.default
local dialog = foundationModule.Dialog
local view = foundationModule.View
local button = foundationModule.Button
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useLocalization = localizationModule.Hooks.useLocalization
local immersiveBrandedAdsLearnMoreUrl = game:DefineFastString("ImmersiveBrandedAdsLearnMoreUrl", "www.roblox.com")

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), default (ref), immersiveBrandedAdsLearnMoreUrl (ref), adsInteractivityTelemetryModule (ref), dialog (ref), dialogSize (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local advertiserName = p1.advertiserName or ""
	local var1 = useLocalization({
		WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd",
		CloseButtonText = "CoreScripts.Ads.Action.Close",
		StaticBodyText = "CoreScripts.Ads.Label.InExperienceDisclosureStatic",
		LearnMoreLinkText = "InGame.CommonUI.Badge.Popup.LearnMoreLink",
		DynamicAdvertiserBodyText = {
			"CoreScripts.Ads.ImmersiveBrandedAds.WhyThisAd",
			AdvertiserName = advertiserName
		}
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		dialog = reactModule.createElement(dialog.Root, {
			size = dialogSize.Small,
			onClose = reactModule.useCallback(function(_)
				-- upvalues: p1 (ref)
				p1.onDismiss()
			end, { p1.onDismiss })
		}, {
			dialogTitle = reactModule.createElement(dialog.Title, { text = var1.WhyThisAdText }),
			dialogContent = reactModule.createElement(dialog.Content, nil, {
				content = reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-small" }, {
					dialogText = reactModule.createElement(dialog.Text, {
						LayoutOrder = 1,
						Text = if advertiserName ~= "" then var1.DynamicAdvertiserBodyText else var1.StaticBodyText
					}),
					link = reactModule.createElement(button, {
						LayoutOrder = 2,
						icon = "icons/navigation/externallink",
						text = var1.LearnMoreLinkText,
						variant = buttonVariant.Link,
						onActivated = reactModule.useCallback(function()
							-- upvalues: default (copy), immersiveBrandedAdsLearnMoreUrl (copy), adsInteractivityTelemetryModule (copy), p1 (ref)
							default:openURL(immersiveBrandedAdsLearnMoreUrl):catch(function(_)
								-- upvalues: adsInteractivityTelemetryModule (copy), p1 (copy)
								adsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("whyThisAd.learnMore")
								p1.onDismiss()
							end)
						end, { p1.onDismiss }),
						size = inputSize.Small
					})
				})
			}),
			dialogActions = reactModule.createElement(dialog.Actions, {
				actions = {
					{
						text = var1.CloseButtonText,
						variant = buttonVariant.Standard,
						onActivated = p1.onDismiss
					}
				}
			})
		}),
		modal = reactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		})
	})
end