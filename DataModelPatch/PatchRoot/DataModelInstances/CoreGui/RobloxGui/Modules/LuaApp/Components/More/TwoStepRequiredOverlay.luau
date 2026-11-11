local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)
local AETwoFactorLogOutMessage = game:DefineFastFlag("AETwoFactorLogOutMessage", false)

return function(p1)
	-- upvalues: WithLocalizationModule (copy), AETwoFactorLogOutMessage (copy), RoactModule (copy), InteractiveAlert (copy), Images (copy), ButtonType (copy)
	local ClosePrompt = p1.closePrompt
	local NavigateToSecuritySettings = p1.navigateToSecuritySettings
	
	return WithLocalizationModule({
		title = "Authentication.TwoStepVerification.Title.VerificationRequired",
		cancel = "Feature.Catalog.Action.Cancel",
		gotoSecurity = "Authentication.TwoStepVerification.Action.GoToSecurity",
		message = if AETwoFactorLogOutMessage then "Authentication.TwoStepVerification.Label.TwoStepRequiredLogout" else "Authentication.TwoStepVerification.Label.TwoStepRequired"
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), Images (upval), ClosePrompt (copy), ButtonType (upval), NavigateToSecuritySettings (copy), p1 (copy)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.title,
			titleIcon = Images["icons/status/error_large"],
			bodyText = p2.message,
			buttonStackInfo = {
				buttons = {
					{ props = { onActivated = ClosePrompt, text = p2.cancel } },
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = NavigateToSecuritySettings,
							text = p2.gotoSecurity
						}
					}
				}
			},
			screenSize = p1.screenSize
		})
	end)
end