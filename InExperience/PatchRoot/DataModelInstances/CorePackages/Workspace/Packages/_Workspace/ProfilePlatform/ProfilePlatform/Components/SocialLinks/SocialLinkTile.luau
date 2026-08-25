local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local useStyle = UIBloxModule.Core.Style.useStyle
local medium = UIBloxModule.App.ImageSet.Enum.IconSize.Medium

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), iconButton (ref), medium (ref)
	local var2 = useStyle()
	local tileSize = p0.tileSize or 80
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(0, tileSize, 0, tileSize + 24),
		Name = "SocialLinkTile_" .. p0.name
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 8)
		}),
		TextLabel = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextSize = 14,
			TextWrapped = true,
			Name = "NameLabel",
			Size = UDim2.new(1, 0, 0, 24),
			Text = p0.name,
			TextColor3 = var2.Theme.TextDefault.Color,
			Font = Enum.Font.GothamMedium,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Center
		}),
		IconBackground = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 0.9,
			BorderSizePixel = 0,
			Name = "IconBackground",
			Size = UDim2.fromOffset(84, 84),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			IconButton = reactModule.createElement(iconButton, {
				backgroundTransparency = 1,
				icon = p0.icon,
				size = UDim2.fromOffset(84, 84),
				iconColor3 = var2.Theme.IconEmphasis.Color,
				iconSize = medium,
				onActivated = p0.onActivated
			})
		})
	})
end