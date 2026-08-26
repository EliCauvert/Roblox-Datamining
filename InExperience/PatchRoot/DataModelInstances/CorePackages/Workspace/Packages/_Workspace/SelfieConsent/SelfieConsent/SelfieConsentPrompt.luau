local reactModule = require(script.Parent.Parent.React)
local localizationModule = require(script.Parent.Parent.Localization)
local foundationModule = require(script.Parent.Parent.Foundation)
local legallySensitiveContentModule = require(script.Parent.Parent.LegallySensitiveContent)
local button = foundationModule.Button
local dialog = foundationModule.Dialog
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local useLocalization = localizationModule.Hooks.useLocalization
local consentName = legallySensitiveContentModule.ConsentName
local useLegallySensitiveContentAndActions = legallySensitiveContentModule.useLegallySensitiveContentAndActions
local linkingProtocol = require(script.Parent.Parent.LinkingProtocol).LinkingProtocol
local avatarCreationService = game:GetService("AvatarCreationService")
local browserService = game:GetService("BrowserService")
local userInputService = game:GetService("UserInputService")

return function(p1)
	-- upvalues: useLocalization (ref), useLegallySensitiveContentAndActions (ref), consentName (ref), reactModule (ref), dialog (ref), dialogSize (ref), view (ref), button (ref), buttonVariant (ref), userInputService (ref), browserService (ref), linkingProtocol (ref), avatarCreationService (ref)
	local var1 = useLocalization({
		title = "AvatarGeneration.SelfieConsent.Title",
		bodyText = "AvatarGeneration.SelfieConsent.BodyTextLink",
		privacyLinkText = "AvatarGeneration.SelfieConsent.PrivacyLinkText",
		agreeButton = "AvatarGeneration.SelfieConsent.AgreeButton",
		cancelButton = "AvatarGeneration.SelfieConsent.CancelButton"
	})
	local _, var2 = useLegallySensitiveContentAndActions(consentName.PhotoToAvatar, "in-experience-photo-to-avatar-selfie-consent")
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Large }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogView = reactModule.createElement(view, { tag = "col fill auto-xy items-start gap-medium" }, {
				DialogContentText = reactModule.createElement(dialog.Text, { Text = var1.bodyText }),
				DialogFooter = reactModule.createElement(button, {
					text = var1.privacyLinkText,
					variant = buttonVariant.Link,
					onActivated = function()
						-- upvalues: userInputService (copy), browserService (copy), linkingProtocol (copy)
						if userInputService:GetPlatform() == Enum.Platform.Android then
							browserService:OpenBrowserWindow("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy")
							
							return
						end
						linkingProtocol.default:openURL("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy")
					end
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.agreeButton,
					variant = buttonVariant.Emphasis,
					onActivated = function()
						-- upvalues: avatarCreationService (copy), p1 (ref), var2 (ref)
						avatarCreationService:HandleSelfieConsentResult(true)
						p1.displaySelfieConsent(false)
						var2.grantOneTimeUserConsentWithAuditing(nil, {
							privacyPolicyLink = "https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy"
						})
					end
				},
				{
					text = var1.cancelButton,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: avatarCreationService (copy), p1 (ref)
						avatarCreationService:HandleSelfieConsentResult(false)
						p1.displaySelfieConsent(false)
					end
				}
			}
		})
	})
end