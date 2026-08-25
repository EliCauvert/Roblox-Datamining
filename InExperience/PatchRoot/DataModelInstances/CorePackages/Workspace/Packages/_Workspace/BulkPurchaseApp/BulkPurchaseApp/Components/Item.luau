local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagReplaceMissingDesignTokens = require(parent.SharedFlags).FFlagReplaceMissingDesignTokens
local boxModule = require(script.Parent.Box)

local function mapTokens(p0)
	local size1200 = p0.Size.Size_1200
	local size200 = p0.Size.Size_200
	
	return {
		fontStyle = p0.Typography.BodyLarge,
		colorStyle = p0.Color.Content.Default,
		imageRightMargin = p0.Size.Size_300,
		imageBoxSize = size1200,
		imageBoxPadding = size200,
		imageBoxTransparency = p0.Color.Common.Shimmer.Transparency,
		imageBoxBackgroundColor = p0.Color.Common.Shimmer.Color3,
		imageBoxCornerRadius = p0.Radius.Medium,
		imageSize = size1200 - size200 * 2
	}
end

return function(p1)
	-- upvalues: useDesignTokens (ref), mapTokens (ref), reactModule (ref), boxModule (ref), styledTextLabel (ref), fFlagReplaceMissingDesignTokens (ref)
	local var3 = useDesignTokens(mapTokens)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, var3.imageBoxSize),
		LayoutOrder = p1.LayoutOrder
	}, {
		ImageBox = reactModule.createElement(boxModule, {
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(var3.imageBoxSize, var3.imageBoxSize),
			BackgroundTransparency = var3.imageBoxTransparency,
			BackgroundColor3 = var3.imageBoxBackgroundColor,
			padding = {
				var3.imageBoxPadding,
				var3.imageBoxPadding,
				var3.imageBoxPadding,
				var3.imageBoxPadding
			},
			cornerRadius = UDim.new(0, var3.imageBoxCornerRadius)
		}, {
			Image = reactModule.createElement("ImageLabel", {
				Image = p1.image,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var3.imageSize, var3.imageSize),
				[reactModule.Tag] = "data-testid=BulkPurchaseApp_ItemImage"
			})
		}),
		LineItem = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(var3.imageBoxSize + var3.imageRightMargin, 0),
			Size = UDim2.new(1, -(var3.imageBoxSize + var3.imageRightMargin), 1, 0)
		}, reactModule.createElement(styledTextLabel, {
			fontStyle = var3.fontStyle,
			colorStyle = var3.colorStyle,
			text = p1.name,
			textTruncate = Enum.TextTruncate.AtEnd,
			textYAlignment = Enum.TextYAlignment.Top,
			size = UDim2.new(0.66, 0, 1, 0),
			lineHeight = if fFlagReplaceMissingDesignTokens then var3.fontStyle.LineHeight else var3.fontStyle.lineHeight
		}), reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, p1.endSlot))
	})
end