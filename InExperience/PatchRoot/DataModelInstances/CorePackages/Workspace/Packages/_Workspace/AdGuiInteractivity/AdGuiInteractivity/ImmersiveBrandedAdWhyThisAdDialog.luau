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

return function(p0) --[[ line: 27 ]]
	-- upvalues: useLocalization (ref), reactModule (ref), default (ref), immersiveBrandedAdsLearnMoreUrl (ref), adsInteractivityTelemetryModule (ref), dialog (ref), dialogSize (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local advertiserName = p0.advertiserName or ""
	local var8 = useLocalization({
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
			onClose = reactModule.useCallback(function(_) --[[ line: 53 ]]
				-- upvalues: p0 (ref)
				p0.onDismiss()
			end, { p0.onDismiss })
		}, {
			dialogTitle = reactModule.createElement(dialog.Title, { text = var8.WhyThisAdText }),
			dialogContent = reactModule.createElement(dialog.Content, nil, {
				content = reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-small" }, {
					dialogText = reactModule.createElement(dialog.Text, {
						LayoutOrder = 1,
						Text = if advertiserName ~= "" then var8.DynamicAdvertiserBodyText else var8.StaticBodyText
					}),
					link = reactModule.createElement(button, {
						LayoutOrder = 2,
						icon = "icons/navigation/externallink",
						text = var8.LearnMoreLinkText,
						variant = buttonVariant.Link,
						onActivated = reactModule.useCallback(function() --[[ line: 46 ]]
							-- upvalues: default (copy), immersiveBrandedAdsLearnMoreUrl (copy), adsInteractivityTelemetryModule (copy), p0 (ref)
							default:openURL(immersiveBrandedAdsLearnMoreUrl):catch(function(_) --[[ line: 47 ]]
								-- upvalues: adsInteractivityTelemetryModule (copy), p0 (copy)
								adsInteractivityTelemetryModule.logImmersiveBrandedAdLinkingFailedCounter("whyThisAd.learnMore")
								p0.onDismiss()
							end)
						end, { p0.onDismiss }),
						size = inputSize.Small
					})
				})
			}),
			dialogActions = reactModule.createElement(dialog.Actions, {
				actions = {
					{
						text = var8.CloseButtonText,
						variant = buttonVariant.Standard,
						onActivated = p0.onDismiss
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