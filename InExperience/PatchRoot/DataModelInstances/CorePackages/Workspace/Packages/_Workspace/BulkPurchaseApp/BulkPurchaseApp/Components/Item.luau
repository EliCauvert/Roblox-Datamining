local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagReplaceMissingDesignTokens = require(parent.SharedFlags).FFlagReplaceMissingDesignTokens
local boxModule = require(script.Parent.Box)

local function mapTokens(p1)
	local size1200 = p1.Size.Size_1200
	local size200 = p1.Size.Size_200
	
	return {
		fontStyle = p1.Typography.BodyLarge,
		colorStyle = p1.Color.Content.Default,
		imageRightMargin = p1.Size.Size_300,
		imageBoxSize = size1200,
		imageBoxPadding = size200,
		imageBoxTransparency = p1.Color.Common.Shimmer.Transparency,
		imageBoxBackgroundColor = p1.Color.Common.Shimmer.Color3,
		imageBoxCornerRadius = p1.Radius.Medium,
		imageSize = size1200 - size200 * 2
	}
end

return function(p1)
	-- upvalues: useDesignTokens (ref), mapTokens (ref), reactModule (ref), boxModule (ref), styledTextLabel (ref), fFlagReplaceMissingDesignTokens (ref)
	local var1 = useDesignTokens(mapTokens)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, var1.imageBoxSize),
		LayoutOrder = p1.LayoutOrder
	}, {
		ImageBox = reactModule.createElement(boxModule, {
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(var1.imageBoxSize, var1.imageBoxSize),
			BackgroundTransparency = var1.imageBoxTransparency,
			BackgroundColor3 = var1.imageBoxBackgroundColor,
			padding = {
				var1.imageBoxPadding,
				var1.imageBoxPadding,
				var1.imageBoxPadding,
				var1.imageBoxPadding
			},
			cornerRadius = UDim.new(0, var1.imageBoxCornerRadius)
		}, {
			Image = reactModule.createElement("ImageLabel", {
				Image = p1.image,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var1.imageSize, var1.imageSize),
				[reactModule.Tag] = "data-testid=BulkPurchaseApp_ItemImage"
			})
		}),
		LineItem = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(var1.imageBoxSize + var1.imageRightMargin, 0),
			Size = UDim2.new(1, -(var1.imageBoxSize + var1.imageRightMargin), 1, 0)
		}, reactModule.createElement(styledTextLabel, {
			fontStyle = var1.fontStyle,
			colorStyle = var1.colorStyle,
			text = p1.name,
			textTruncate = Enum.TextTruncate.AtEnd,
			textYAlignment = Enum.TextYAlignment.Top,
			size = UDim2.new(0.66, 0, 1, 0),
			lineHeight = if fFlagReplaceMissingDesignTokens then var1.fontStyle.LineHeight else var1.fontStyle.lineHeight
		}), reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, p1.endSlot))
	})
end