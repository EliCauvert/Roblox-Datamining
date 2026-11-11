local ReactModule = require(game:GetService("CorePackages").Packages.React)
local DependenciesModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.dependencies)
local UIBlox = DependenciesModule.UIBlox
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local UseLocalizationResult = UseLocalizationFunction({
		failedLabel = "Feature.Call.Label.Retry",
		placeCallLabel = "Feature.Call.Prompt.StartCall"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 10000,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 20),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		Image = if p1.isImageEnabled then ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = Images[p1.imageName],
			Size = UDim2.fromOffset(96, 96)
		}) else nil,
		Message = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = UseStyleResultFont.Body.Font,
			Text = p1.messageText,
			TextColor3 = Theme.TextDefault.Color,
			TextSize = UseStyleResultFont.Body.RelativeSize * UseStyleResultFont.BaseSize,
			TextTransparency = Theme.TextDefault.Transparency
		}),
		FailedButton = if p1.isFailedButtonEnabled then ReactModule.createElement("TextButton", {
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = Theme.SystemPrimaryDefault.Transparency,
			BorderSizePixel = 0,
			Font = UseStyleResultFont.Header2.Font,
			LayoutOrder = 3,
			Text = UseLocalizationResult.failedLabel,
			TextColor3 = Theme.SystemPrimaryContent.Color,
			TextSize = UseStyleResultFont.Header2.RelativeSize * UseStyleResultFont.BaseSize,
			TextTransparency = Theme.SystemPrimaryContent.Transparency,
			[ReactModule.Event.Activated] = p1.onFailedButtonActivated
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8)
			}),
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(108, 36) })
		}) else nil,
		CallButton = if p1.isCallButtonEnabled then ReactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 48),
			BackgroundColor3 = Theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = Theme.SystemPrimaryDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			[ReactModule.Event.Activated] = p1.onCallButtonActivated
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			StartCallIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://15239343417",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(24, 24),
				ImageColor3 = Theme.SystemPrimaryContent.Color
			}),
			StartCallButtonText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = UseStyleResultFont.Header2.Font,
				Text = UseLocalizationResult.placeCallLabel,
				TextColor3 = Theme.SystemPrimaryContent.Color,
				TextSize = UseStyleResultFont.Header2.RelativeSize * UseStyleResultFont.BaseSize,
				TextTransparency = Theme.SystemPrimaryContent.Transparency
			})
		}) else nil
	})
end