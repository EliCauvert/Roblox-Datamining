local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local getGameTileMetadataFontModule = require(gameTile.Footer.getGameTileMetadataFont)

local _ = function(p1, p2)
	return p1 * (p2 or 1)
end

return function(p1)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), getGameTileMetadataFontModule (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2 = useTextSizeOffset()
	local var3 = useTokens()
	local var4 = if p1.isUnifiedGameTile then var3.Size.Size_500 else var1.Size.Size_500
	local var5 = if p1.isUnifiedGameTile then var3.Color.Content.Default else var1.Color.Content.Default
	local var6 = getGameTileMetadataFontModule(p1.useLargerFont, var1, var3, if p1.isUnifiedGameTile then true else nil)
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(if p1.shouldSizeToContentWidth then 0 else 1, 0, 0, (var4 + var2) * (p1.linesOfText or 1)),
		AutomaticSize = if p1.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint
	}, {
		Text = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = p1.text,
			Size = UDim2.new(if p1.shouldSizeToContentWidth then 0 else 1, 0, 0, (var6.FontSize + var2) * (p1.linesOfText or 1)),
			AutomaticSize = if p1.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = var6.FontSize,
			Font = var6.Font,
			TextTransparency = var5.Transparency,
			TextColor3 = var5.Color3,
			TextWrapped = p1.TextWrapped or false,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = p1.TextYAlignment or Enum.TextYAlignment.Center,
			ClipsDescendants = p1.ClipsDescendants,
			RichText = p1.RichText
		})
	})
end