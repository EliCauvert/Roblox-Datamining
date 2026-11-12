local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local BaseCellModule = require(script.Parent.BaseCell)
local _ = require(AppChat.types)
local config = {
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
	style = require(AppChat.SocialLibraries).Components.TestStyle
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), ReactModule (copy), BaseCellModule (copy), ImageSetLabel (copy), NormalizeFontFaceFunction (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local Style = UnionResult.style
	local Theme = Style.Theme
	local StyleFont = Style.Font
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local NoPrimaryIcon = UnionResult.primaryIcon == nil
	
	return ReactModule.createElement(BaseCellModule, {
		Size = UDim2.new(1, UnionResult.widthOffset, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = UnionResult.BackgroundTransparency or Theme.BackgroundDefault.Transparency,
		onPressedBackgroundColor3 = Theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = Theme.BackgroundOnPress.Transparency,
		LayoutOrder = UnionResult.LayoutOrder,
		onActivated = UnionResult.onActivated,
		showDivider = UnionResult.showDivider,
		dividerColor3 = Theme.Divider.Color,
		dividerTransparency = Theme.Divider.Transparency,
		isDisabled = UnionResult.isDisabled,
		avatarCircleCellWidth = UnionResult.iconCellWidth
	}, {
		leftFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, -UnionResult.iconCellWidth, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			leftListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			leftFramePadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UnionResult.topPadding),
				PaddingBottom = UDim.new(0, UnionResult.bottomPadding)
			}),
			imageFrame = if NoPrimaryIcon then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, UnionResult.iconCellWidth, 0, UnionResult.primaryIconSize)
			}, {
				primaryIcon = ReactModule.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = UnionResult.primaryIcon,
					Size = UDim2.new(0, UnionResult.primaryIconSize, 0, UnionResult.primaryIconSize),
					ImageColor3 = Theme.IconEmphasis.Color
				})
			}),
			textFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				uiListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				titleText = ReactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, if NoPrimaryIcon then 0 else -UnionResult.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = UnionResult.Text,
					TextSize = StyleFont.Header2.RelativeSize * StyleFont.BaseSize,
					Font = if FoundationFontFaceMigration then nil else StyleFont.Header2.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.TitleLarge.Font) else nil,
					TextColor3 = Theme.TextEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				subTitleText = if UnionResult.SubTitleText then ReactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, if NoPrimaryIcon then 0 else -UnionResult.iconCellWidth, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = UnionResult.SubTitleText,
					TextSize = StyleFont.BodySmall.RelativeSize * StyleFont.BaseSize,
					Font = if FoundationFontFaceMigration then nil else StyleFont.BodySmall.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
					TextColor3 = Theme.TextDefault.Color,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil
			})
		}),
		rightFrame = if UnionResult.secondaryIcon then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(UnionResult.iconCellWidth, UnionResult.iconCellWidth)
		}, {
			secondaryIcon = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = UnionResult.secondaryIcon,
				Size = UDim2.fromOffset(UnionResult.secondaryIconSize, UnionResult.secondaryIconSize)
			})
		}) else nil
	})
end)