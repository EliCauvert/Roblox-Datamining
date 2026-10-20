local DependenciesModule = require(script.Parent.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local WithLocalizationFunction = DependenciesModule.withLocalization
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ShareLinkInvalidModal = Roact.Component:extend("ShareLinkInvalidModal")
ShareLinkInvalidModal.validateProps = T.interface({ closeModal = T.callback, screenSize = T.Vector2 })

function ShareLinkInvalidModal.render(p1)
	-- upvalues: WithLocalizationFunction (copy), Roact (copy), InteractiveAlert (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithLocalizationFunction({
		titleText = "Feature.SocialShare.Label.InvalidLinkError",
		bodyText = "Feature.SocialShare.Description.InvalidLinkError",
		buttonText = "Feature.Friends.Label.Cancel"
	})(function(p2)
		-- upvalues: Roact (upval), InteractiveAlert (upval), Props (copy), ButtonType (upval)
		return Roact.createElement(InteractiveAlert, {
			screenSize = Props.screenSize,
			title = p2.titleText,
			bodyText = p2.bodyText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { text = p2.buttonText, onActivated = Props.closeModal }
					}
				}
			}
		})
	end)
end

return ShareLinkInvalidModal