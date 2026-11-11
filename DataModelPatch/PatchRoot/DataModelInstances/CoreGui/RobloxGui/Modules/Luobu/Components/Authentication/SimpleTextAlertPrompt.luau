local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)
local TModule = require(CorePackages.Packages.t)
local InteractiveAlert = require(CorePackages.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert
local SimpleTextAlertPrompt = RoactModule.PureComponent:extend("SimpleTextAlertPrompt")
SimpleTextAlertPrompt.validateProps = TModule.strictInterface({
	titleKey = TModule.string,
	bodyTextKey = TModule.string,
	confirmButtonTextKey = TModule.string,
	confirmButtonCallback = TModule.callback,
	screenSize = TModule.Vector2
})

function SimpleTextAlertPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy)
	local ConfirmButtonCallback = p1.props.confirmButtonCallback
	local ScreenSize = p1.props.screenSize
	
	return WithLocalizationModule({
		title = p1.props.titleKey,
		bodyText = p1.props.bodyTextKey,
		confirmButtonText = p1.props.confirmButtonTextKey
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), ConfirmButtonCallback (copy), ScreenSize (copy)
		return RoactModule.createElement(InteractiveAlert, {
			title = p2.title,
			bodyText = p2.bodyText,
			buttonStackInfo = {
				buttons = {
					{
						props = {
							onActivated = ConfirmButtonCallback,
							text = p2.confirmButtonText
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = ScreenSize
		})
	end)
end

return RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end, function(_)
	return {}
end)(SimpleTextAlertPrompt)