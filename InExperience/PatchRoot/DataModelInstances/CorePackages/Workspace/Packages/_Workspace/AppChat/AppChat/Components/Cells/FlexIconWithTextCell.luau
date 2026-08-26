local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local baseCellModule = require(script.Parent.BaseCell)
local _ = require(appChat.types)
local t = {
	Text = "titleText",
	primaryIconSize = 32,
	isDisabled = false,
	topPadding = 8,
	bottomPadding = 8,
	widthScale = 1,
	widthOffset = 0,
	secondaryIcon = "",
	secondaryIconSize = 24,
	iconCellWidth = 60,
	LayoutOrder = 0,
	BackgroundTransparency = nil,
	showDivider = true,
	onActivated = function()
		print("FlexIconWithTextCell onActivated")
	end,
	style = require(appChat.SocialLibraries).Components.TestStyle
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), baseCellModule (ref), imageSetLabel (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local style = var1.style
	local theme = style.Theme
	local font = style.Font
	local var2 = var1.primaryIcon == nil
	
	return reactModule.createElement(baseCellModule, {
		Size = UDim2.new(1, var1.widthOffset, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = var1.BackgroundTransparency or theme.BackgroundDefault.Transparency,
		onPressedBackgroundColor3 = theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = theme.BackgroundOnPress.Transparency,
		LayoutOrder = var1.LayoutOrder,
		onActivated = var1.onActivated,
		showDivider = var1.showDivider,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency,
		isDisabled = var1.isDisabled,
		avatarCircleCellWidth = var1.iconCellWidth
	}, {
		leftFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, -var1.iconCellWidth, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			leftListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			leftFramePadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var1.topPadding),
				PaddingBottom = UDim.new(0, var1.bottomPadding)
			}),
			imageFrame = if not var2 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, var1.iconCellWidth, 0, var1.primaryIconSize)
			}, {
				primaryIcon = reactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = var1.primaryIcon,
					Size = UDim2.new(0, var1.primaryIconSize, 0, var1.primaryIconSize),
					ImageColor3 = theme.IconEmphasis.Color
				})
			}) else nil,
			textFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				uiListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				titleText = reactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, if var2 then 0 else -var1.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = var1.Text,
					TextSize = font.Header2.RelativeSize * font.BaseSize,
					Font = font.Header2.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				subTitleText = if var1.SubTitleText then reactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, if var2 then 0 else -var1.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = var1.SubTitleText,
					TextSize = font.BodySmall.RelativeSize * font.BaseSize,
					Font = font.BodySmall.Font,
					TextColor3 = theme.TextDefault.Color,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil
			})
		}),
		rightFrame = if var1.secondaryIcon then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var1.iconCellWidth, var1.iconCellWidth)
		}, {
			secondaryIcon = reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = var1.secondaryIcon,
				Size = UDim2.fromOffset(var1.secondaryIconSize, var1.secondaryIconSize)
			})
		}) else nil
	})
end)