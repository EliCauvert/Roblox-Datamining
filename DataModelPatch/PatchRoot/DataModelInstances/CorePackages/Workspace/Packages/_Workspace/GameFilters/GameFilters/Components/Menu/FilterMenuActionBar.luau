local Parent = script:FindFirstAncestor("GameFilters").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), Button (copy), ButtonType (copy)
	local UseTokensResult = UseTokensFunction()
	local Surface100 = UseTokensResult.Color.Surface.Surface_100
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		BackgroundTransparency = Surface100.Transparency,
		BackgroundColor3 = Surface100.Color3,
		Size = Frame.Size
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XXLarge)
		}),
		ApplyButton = ReactModule.createElement(Button, {
			buttonType = ButtonType.PrimaryContextual,
			size = UDim2.fromScale(1, 1),
			text = UseLocalizationFunction({ apply = "CommonUI.Messages.Action.Apply" }).apply,
			isDisabled = not Frame.applyEnabled,
			onActivated = Frame.onApply
		})
	})
end