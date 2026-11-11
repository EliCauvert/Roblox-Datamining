local DependenciesModule = require(script.Parent.Parent.dependencies)
local React = DependenciesModule.React
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle

return function()
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), React (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
	})
	local UseStyleResult = UseStyleFunction()
	
	return React.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = UseLocalizationResult.maxAccountsReachedText,
		TextSize = UseStyleResult.Font.BaseSize,
		TextColor3 = UseStyleResult.Theme.TextDefault.Color,
		TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		Font = UseStyleResult.Font.Body.Font,
		TextXAlignment = Enum.TextXAlignment.Center,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = React.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		})
	})
end