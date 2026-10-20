local Parent = script:FindFirstAncestor("EngagementScreen").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	return ReactModule.createElement(Button, {
		fitContent = true,
		buttonType = ButtonType.Secondary,
		text = UseLocalizationFunction({
			switchAccounts = {
				"CommonUI.Features.Label.EngagementScreen.SwitchAccounts",
				platform = "Console"
			}
		}).switchAccounts,
		fontStyle = p1.fontStyle,
		standardSize = StandardButtonSize.Regular,
		layoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated
	})
end