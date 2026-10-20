local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Interactable = UIBloxModule.Core.Control.Interactable
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), RoactModule (copy), Interactable (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	return RoactModule.createElement(Interactable, {
		Size = UDim2.new(1, 0, 0, 28),
		Position = UDim2.new(0, 0, 1, -28),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		[RoactModule.Event.Activated] = p1.activateButton,
		ZIndex = 10,
		BackgroundTransparency = 1
	}, {
		BoundingFrame = RoactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.SystemPrimaryDefault.Color
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Font = UseStyleResultFont.CaptionHeader.Font,
				TextSize = UseStyleResultFont.CaptionHeader.RelativeSize * UseStyleResultFont.BaseSize,
				Text = UseLocalizationFunction({
					detail = if p1.itemsCount then { "Feature.Avatar.Label.Details", quantity = p1.itemsCount } else "Feature.Avatar.Label.DetailsButton"
				}).detail,
				TextColor3 = Theme.SystemPrimaryContent.Color
			})
		})
	})
end