local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Medium = UIBloxModule.App.ImageSet.Enum.IconSize.Medium

return function(p1) --[[ Line: 24 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), IconButton (copy), Medium (copy)
	local UseStyleResult = UseStyleFunction()
	local TileSize = p1.tileSize or 80
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(0, TileSize, 0, TileSize + 24),
		Name = "SocialLinkTile_" .. p1.name
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 8)
		}),
		TextLabel = ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextSize = 14,
			TextWrapped = true,
			Name = "NameLabel",
			Size = UDim2.new(1, 0, 0, 24),
			Text = p1.name,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			Font = Enum.Font.GothamMedium,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Center
		}),
		IconBackground = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 0.9,
			BorderSizePixel = 0,
			Name = "IconBackground",
			Size = UDim2.fromOffset(84, 84),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			IconButton = ReactModule.createElement(IconButton, {
				backgroundTransparency = 1,
				icon = p1.icon,
				size = UDim2.fromOffset(84, 84),
				iconColor3 = UseStyleResult.Theme.IconEmphasis.Color,
				iconSize = Medium,
				onActivated = p1.onActivated
			})
		})
	})
end