local reactModule = require(game:GetService("CorePackages").Packages.React)
local dependenciesModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.dependencies)
local UIBlox = dependenciesModule.UIBlox
local useLocalization = dependenciesModule.Hooks.useLocalization
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local useStyle = UIBlox.Core.Style.useStyle

return function(p0) --[[ line: 29 | named "NoItemView" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local var2 = useStyle()
	local font = var2.Font
	local theme = var2.Theme
	local var3 = useLocalization({
		failedLabel = "Feature.Call.Label.Retry",
		placeCallLabel = "Feature.Call.Prompt.StartCall"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 10000,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 20),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		Image = if p0.isImageEnabled then reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = images[p0.imageName],
			Size = UDim2.fromOffset(96, 96)
		}) else nil,
		Message = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = font.Body.Font,
			Text = p0.messageText,
			TextColor3 = theme.TextDefault.Color,
			TextSize = font.Body.RelativeSize * font.BaseSize,
			TextTransparency = theme.TextDefault.Transparency
		}),
		FailedButton = if p0.isFailedButtonEnabled then reactModule.createElement("TextButton", {
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = theme.SystemPrimaryDefault.Transparency,
			BorderSizePixel = 0,
			Font = font.Header2.Font,
			LayoutOrder = 3,
			Text = var3.failedLabel,
			TextColor3 = theme.SystemPrimaryContent.Color,
			TextSize = font.Header2.RelativeSize * font.BaseSize,
			TextTransparency = theme.SystemPrimaryContent.Transparency,
			[reactModule.Event.Activated] = p0.onFailedButtonActivated
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8)
			}),
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(108, 36) })
		}) else nil,
		CallButton = if p0.isCallButtonEnabled then reactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 48),
			BackgroundColor3 = theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = theme.SystemPrimaryDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			[reactModule.Event.Activated] = p0.onCallButtonActivated
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			StartCallIcon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = "rbxassetid://15239343417",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(24, 24),
				ImageColor3 = theme.SystemPrimaryContent.Color
			}),
			StartCallButtonText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = font.Header2.Font,
				Text = var3.placeCallLabel,
				TextColor3 = theme.SystemPrimaryContent.Color,
				TextSize = font.Header2.RelativeSize * font.BaseSize,
				TextTransparency = theme.SystemPrimaryContent.Transparency
			})
		}) else nil
	})
end