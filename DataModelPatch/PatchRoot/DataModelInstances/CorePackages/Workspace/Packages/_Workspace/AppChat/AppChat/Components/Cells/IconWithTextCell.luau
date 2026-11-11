local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local BaseCellModule = require(script.Parent.BaseCell)
local _ = require(AppChat.types)
local config = {
	Text = "titleText",
	primaryIconSize = 32,
	isDisabled = false,
	secondaryIcon = "",
	secondaryIconSize = 24,
	iconCellWidth = 60,
	LayoutOrder = 0,
	showDivider = true,
	Size = UDim2.new(1, 0, 1, 0),
	onActivated = function()
		print("IconWithTextCell onActivated")
	end,
	style = CryoModule.Dictionary.join(require(AppChat.SocialLibraries).Components.TestStyle, { Tokens = { Color = { None = {} } } })
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), BaseCellModule (copy), ImageSetLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Style = JoinResult.style
	local Theme = Style.Theme
	local StyleFont = Style.Font
	local NoPrimaryIcon = JoinResult.primaryIcon == nil
	
	return ReactModule.createElement(BaseCellModule, {
		Size = JoinResult.Size,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Style.Tokens.Color.None.Transparency,
		onPressedBackgroundColor3 = Theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = Theme.BackgroundOnPress.Transparency,
		LayoutOrder = JoinResult.LayoutOrder,
		onActivated = JoinResult.onActivated,
		showDivider = JoinResult.showDivider,
		dividerColor3 = Theme.Divider.Color,
		dividerTransparency = Theme.Divider.Transparency,
		isDisabled = JoinResult.isDisabled,
		avatarCircleCellWidth = JoinResult.iconCellWidth,
		testId = p1.testId
	}, {
		leftFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, -JoinResult.iconCellWidth, 1, 0)
		}, {
			leftListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			imageFrame = if NoPrimaryIcon then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, JoinResult.iconCellWidth, 0, JoinResult.primaryIconSize)
			}, {
				primaryIcon = ReactModule.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = JoinResult.primaryIcon,
					Size = UDim2.new(0, JoinResult.primaryIconSize, 0, JoinResult.primaryIconSize),
					ImageColor3 = Theme.IconEmphasis.Color
				})
			}),
			text = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, if NoPrimaryIcon then 0 else -JoinResult.iconCellWidth, 1, 0),
				Text = JoinResult.Text,
				TextSize = StyleFont.Header2.RelativeSize * StyleFont.BaseSize,
				Font = StyleFont.Header2.Font,
				TextColor3 = Theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		}),
		rightFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5),
			Size = UDim2.fromOffset(JoinResult.iconCellWidth, JoinResult.iconCellWidth)
		}, {
			secondaryIcon = JoinResult.secondaryIcon and ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = JoinResult.secondaryIcon,
				Size = UDim2.fromOffset(JoinResult.secondaryIconSize, JoinResult.secondaryIconSize)
			})
		})
	})
end)