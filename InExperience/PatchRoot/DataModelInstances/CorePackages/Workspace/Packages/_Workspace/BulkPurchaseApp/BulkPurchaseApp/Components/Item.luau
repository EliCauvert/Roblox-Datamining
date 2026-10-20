local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagReplaceMissingDesignTokens = require(Parent.SharedFlags).FFlagReplaceMissingDesignTokens
local BoxModule = require(script.Parent.Box)

local function mapTokens(p1)
	local Size1200 = p1.Size.Size_1200
	local Size200: number = p1.Size.Size_200
	
	return {
		fontStyle = p1.Typography.BodyLarge,
		colorStyle = p1.Color.Content.Default,
		imageRightMargin = p1.Size.Size_300,
		imageBoxSize = Size1200,
		imageBoxPadding = Size200,
		imageBoxTransparency = p1.Color.Common.Shimmer.Transparency,
		imageBoxBackgroundColor = p1.Color.Common.Shimmer.Color3,
		imageBoxCornerRadius = p1.Radius.Medium,
		imageSize = Size1200 - Size200 * 2
	}
end

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), ReactModule (copy), BoxModule (copy), StyledTextLabel (copy), FFlagReplaceMissingDesignTokens (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, UseDesignTokensResult.imageBoxSize),
		LayoutOrder = Frame.LayoutOrder
	}, {
		ImageBox = ReactModule.createElement(BoxModule, {
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(UseDesignTokensResult.imageBoxSize, UseDesignTokensResult.imageBoxSize),
			BackgroundTransparency = UseDesignTokensResult.imageBoxTransparency,
			BackgroundColor3 = UseDesignTokensResult.imageBoxBackgroundColor,
			padding = {
				UseDesignTokensResult.imageBoxPadding,
				UseDesignTokensResult.imageBoxPadding,
				UseDesignTokensResult.imageBoxPadding,
				UseDesignTokensResult.imageBoxPadding
			},
			cornerRadius = UDim.new(0, UseDesignTokensResult.imageBoxCornerRadius)
		}, {
			Image = ReactModule.createElement("ImageLabel", {
				Image = Frame.image,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(UseDesignTokensResult.imageSize, UseDesignTokensResult.imageSize),
				[ReactModule.Tag] = "data-testid=BulkPurchaseApp_ItemImage"
			})
		}),
		LineItem = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(UseDesignTokensResult.imageBoxSize + UseDesignTokensResult.imageRightMargin, 0),
			Size = UDim2.new(1, -(UseDesignTokensResult.imageBoxSize + UseDesignTokensResult.imageRightMargin), 1, 0)
		}, ReactModule.createElement(StyledTextLabel, {
			fontStyle = UseDesignTokensResult.fontStyle,
			colorStyle = UseDesignTokensResult.colorStyle,
			text = Frame.name,
			textTruncate = Enum.TextTruncate.AtEnd,
			textYAlignment = Enum.TextYAlignment.Top,
			size = UDim2.new(0.66, 0, 1, 0),
			lineHeight = if FFlagReplaceMissingDesignTokens then UseDesignTokensResult.fontStyle.LineHeight else UseDesignTokensResult.fontStyle.lineHeight
		}), ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, Frame.endSlot))
	})
end