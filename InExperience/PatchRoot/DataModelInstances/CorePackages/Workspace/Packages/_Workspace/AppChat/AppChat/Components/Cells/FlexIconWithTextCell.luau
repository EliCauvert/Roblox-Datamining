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
	onActivated = function() --[[ line: 54 ]]
		print("FlexIconWithTextCell onActivated")
	end,
	style = require(appChat.SocialLibraries).Components.TestStyle
}

return memo(function(p0) --[[ line: 70 | named "FlexIconWithTextCell" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), baseCellModule (ref), imageSetLabel (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local style = var5.style
	local theme = style.Theme
	local font = style.Font
	local var6 = var5.primaryIcon == nil
	
	return reactModule.createElement(baseCellModule, {
		Size = UDim2.new(1, var5.widthOffset, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = var5.BackgroundTransparency or theme.BackgroundDefault.Transparency,
		onPressedBackgroundColor3 = theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = theme.BackgroundOnPress.Transparency,
		LayoutOrder = var5.LayoutOrder,
		onActivated = var5.onActivated,
		showDivider = var5.showDivider,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency,
		isDisabled = var5.isDisabled,
		avatarCircleCellWidth = var5.iconCellWidth
	}, {
		leftFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, -var5.iconCellWidth, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			leftListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			leftFramePadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var5.topPadding),
				PaddingBottom = UDim.new(0, var5.bottomPadding)
			}),
			imageFrame = if not var6 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, var5.iconCellWidth, 0, var5.primaryIconSize)
			}, {
				primaryIcon = reactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = var5.primaryIcon,
					Size = UDim2.new(0, var5.primaryIconSize, 0, var5.primaryIconSize),
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
					Size = UDim2.new(1, if var6 then 0 else -var5.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = var5.Text,
					TextSize = font.Header2.RelativeSize * font.BaseSize,
					Font = font.Header2.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				subTitleText = if var5.SubTitleText then reactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, if var6 then 0 else -var5.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = var5.SubTitleText,
					TextSize = font.BodySmall.RelativeSize * font.BaseSize,
					Font = font.BodySmall.Font,
					TextColor3 = theme.TextDefault.Color,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil
			})
		}),
		rightFrame = if var5.secondaryIcon then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var5.iconCellWidth, var5.iconCellWidth)
		}, {
			secondaryIcon = reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = var5.secondaryIcon,
				Size = UDim2.fromOffset(var5.secondaryIconSize, var5.secondaryIconSize)
			})
		}) else nil
	})
end)