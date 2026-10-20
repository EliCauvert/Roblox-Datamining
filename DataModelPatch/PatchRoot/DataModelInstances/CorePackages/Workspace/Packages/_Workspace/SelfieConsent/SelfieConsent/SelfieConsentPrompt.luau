local ReactModule = require(script.Parent.Parent.React)
local FoundationModule = require(script.Parent.Parent.Foundation)
local LegallySensitiveContentModule = require(script.Parent.Parent.LegallySensitiveContent)
local Button = FoundationModule.Button
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local UseLocalizationFunction = require(script.Parent.Parent.Localization).Hooks.useLocalization
local ConsentName = LegallySensitiveContentModule.ConsentName
local UseLegallySensitiveContentAndActionsFunction = LegallySensitiveContentModule.useLegallySensitiveContentAndActions
local LinkingProtocol = require(script.Parent.Parent.LinkingProtocol).LinkingProtocol
local AvatarCreationService = game:GetService("AvatarCreationService")
local BrowserService = game:GetService("BrowserService")
local UserInputService = game:GetService("UserInputService")

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseLegallySensitiveContentAndActionsFunction (copy), ConsentName (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Button (copy), ButtonVariant (copy), UserInputService (copy), BrowserService (copy), LinkingProtocol (copy), AvatarCreationService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "AvatarGeneration.SelfieConsent.Title",
		bodyText = "AvatarGeneration.SelfieConsent.BodyTextLink",
		privacyLinkText = "AvatarGeneration.SelfieConsent.PrivacyLinkText",
		agreeButton = "AvatarGeneration.SelfieConsent.AgreeButton",
		cancelButton = "AvatarGeneration.SelfieConsent.CancelButton"
	})
	local _, InExperiencePhotoToAvatarSelfieConsent2 = UseLegallySensitiveContentAndActionsFunction(ConsentName.PhotoToAvatar, "in-experience-photo-to-avatar-selfie-consent")
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Large }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogView = ReactModule.createElement(View, { tag = "col fill auto-xy items-start gap-medium" }, {
				DialogContentText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.bodyText }),
				DialogFooter = ReactModule.createElement(Button, {
					text = UseLocalizationResult.privacyLinkText,
					variant = ButtonVariant.Link,
					onActivated = function()
						-- upvalues: UserInputService (upval), BrowserService (upval), LinkingProtocol (upval)
						if UserInputService:GetPlatform() == Enum.Platform.Android then
							BrowserService:OpenBrowserWindow("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy")
							
							return
						else
							LinkingProtocol.default:openURL("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy")
						end
					end
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.agreeButton,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: AvatarCreationService (upval), p1 (copy), InExperiencePhotoToAvatarSelfieConsent2 (copy)
						AvatarCreationService:HandleSelfieConsentResult(true)
						p1.displaySelfieConsent(false)
						InExperiencePhotoToAvatarSelfieConsent2.grantOneTimeUserConsentWithAuditing(nil, {
							privacyPolicyLink = "https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy"
						})
					end
				},
				{
					text = UseLocalizationResult.cancelButton,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: AvatarCreationService (upval), p1 (copy)
						AvatarCreationService:HandleSelfieConsentResult(false)
						p1.displaySelfieConsent(false)
					end
				}
			}
		})
	})
end