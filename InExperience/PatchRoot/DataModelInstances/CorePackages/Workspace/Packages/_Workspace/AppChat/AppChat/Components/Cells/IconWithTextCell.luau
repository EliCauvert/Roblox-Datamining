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
	secondaryIcon = "",
	secondaryIconSize = 24,
	iconCellWidth = 60,
	LayoutOrder = 0,
	showDivider = true,
	Size = UDim2.new(1, 0, 1, 0),
	onActivated = function() --[[ line: 44 ]]
		print("IconWithTextCell onActivated")
	end,
	style = cryoModule.Dictionary.join(require(appChat.SocialLibraries).Components.TestStyle, { Tokens = { Color = { None = {} } } })
}

return memo(function(p0) --[[ line: 65 | named "IconWithTextCell" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), baseCellModule (ref), imageSetLabel (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local style = var5.style
	local theme = style.Theme
	local font = style.Font
	local var6 = var5.primaryIcon == nil
	
	return reactModule.createElement(baseCellModule, {
		Size = var5.Size,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = style.Tokens.Color.None.Transparency,
		onPressedBackgroundColor3 = theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = theme.BackgroundOnPress.Transparency,
		LayoutOrder = var5.LayoutOrder,
		onActivated = var5.onActivated,
		showDivider = var5.showDivider,
		dividerColor3 = theme.Divider.Color,
		dividerTransparency = theme.Divider.Transparency,
		isDisabled = var5.isDisabled,
		avatarCircleCellWidth = var5.iconCellWidth,
		testId = p0.testId
	}, {
		leftFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, -var5.iconCellWidth, 1, 0)
		}, {
			leftListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
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
			text = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, if var6 then 0 else -var5.iconCellWidth, 1, 0),
				Text = var5.Text,
				TextSize = font.Header2.RelativeSize * font.BaseSize,
				Font = font.Header2.Font,
				TextColor3 = theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		}),
		rightFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5),
			Size = UDim2.fromOffset(var5.iconCellWidth, var5.iconCellWidth)
		}, {
			secondaryIcon = var5.secondaryIcon and reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = var5.secondaryIcon,
				Size = UDim2.fromOffset(var5.secondaryIconSize, var5.secondaryIconSize)
			})
		})
	})
end)