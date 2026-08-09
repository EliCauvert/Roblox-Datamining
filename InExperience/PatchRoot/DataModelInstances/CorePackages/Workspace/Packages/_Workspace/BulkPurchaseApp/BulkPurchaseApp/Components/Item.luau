local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local useDesignTokens = require(parent.Style).useDesignTokens
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagReplaceMissingDesignTokens = sharedFlagsModule.FFlagReplaceMissingDesignTokens
local boxModule = require(script.Parent.Box)

local function mapTokens(p0) --[[ line: 15 ]]
	-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
	local var4 = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_1200 else p0.Global.Size_600
	local var5 = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_200 else p0.Global.Space_100
	
	return {
		fontStyle = if fFlagRenameDeprecatedUIBloxTokens then p0.Typography.BodyLarge else p0.Semantic.Typography.Body,
		colorStyle = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Content.Default else p0.Semantic.Color.Text.Default,
		imageRightMargin = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_300 else p0.Global.Space_150,
		imageBoxSize = var4,
		imageBoxPadding = var5,
		imageBoxTransparency = (if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Common.Shimmer else p0.Semantic.Color.Common.Placeholder).Transparency,
		imageBoxBackgroundColor = (if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Common.Shimmer else p0.Semantic.Color.Common.Placeholder).Color3,
		imageBoxCornerRadius = if fFlagRenameDeprecatedUIBloxTokens then p0.Radius.Medium else p0.Semantic.Radius.Medium,
		imageSize = var4 - var5 * 2
	}
end

return function(p1) --[[ line: 55 | named "Item" ]]
	-- upvalues: useDesignTokens (ref), mapTokens (ref), reactModule (ref), boxModule (ref), styledTextLabel (ref), fFlagReplaceMissingDesignTokens (ref)
	local var6 = useDesignTokens(mapTokens)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, var6.imageBoxSize),
		LayoutOrder = p1.LayoutOrder
	}, {
		ImageBox = reactModule.createElement(boxModule, {
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(var6.imageBoxSize, var6.imageBoxSize),
			BackgroundTransparency = var6.imageBoxTransparency,
			BackgroundColor3 = var6.imageBoxBackgroundColor,
			padding = {
				var6.imageBoxPadding,
				var6.imageBoxPadding,
				var6.imageBoxPadding,
				var6.imageBoxPadding
			},
			cornerRadius = UDim.new(0, var6.imageBoxCornerRadius)
		}, {
			Image = reactModule.createElement("ImageLabel", {
				Image = p1.image,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var6.imageSize, var6.imageSize),
				[reactModule.Tag] = "data-testid=BulkPurchaseApp_ItemImage"
			})
		}),
		LineItem = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(var6.imageBoxSize + var6.imageRightMargin, 0),
			Size = UDim2.new(1, -(var6.imageBoxSize + var6.imageRightMargin), 1, 0)
		}, reactModule.createElement(styledTextLabel, {
			fontStyle = var6.fontStyle,
			colorStyle = var6.colorStyle,
			text = p1.name,
			textTruncate = Enum.TextTruncate.AtEnd,
			textYAlignment = Enum.TextYAlignment.Top,
			size = UDim2.new(0.66, 0, 1, 0),
			lineHeight = if fFlagReplaceMissingDesignTokens then var6.fontStyle.LineHeight else var6.fontStyle.lineHeight
		}), reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0.33, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, p1.endSlot))
	})
end