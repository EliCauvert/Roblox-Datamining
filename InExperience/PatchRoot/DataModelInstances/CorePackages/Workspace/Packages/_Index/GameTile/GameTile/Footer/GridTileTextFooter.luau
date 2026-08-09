local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local getGameTileMetadataFontModule = require(gameTile.Footer.getGameTileMetadataFont)

local _ = function(p0, p1) --[[ line: 45 ]]
	return p0 * (p1 or 1)
end

return function(p2) --[[ line: 49 | named "GridTileTextFooter" ]]
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), getGameTileMetadataFontModule (ref), reactModule (ref)
	local var3 = useDesignTokens()
	local var4 = useTextSizeOffset()
	local var5 = useTokens()
	local var6 = if p2.isUnifiedGameTile then var5.Size.Size_500 elseif fFlagRenameDeprecatedUIBloxTokens then var3.Size.Size_500 else var3.Global.Space_250
	local var7 = if p2.isUnifiedGameTile then var5.Color.Content.Default elseif fFlagRenameDeprecatedUIBloxTokens then var3.Color.Content.Default else var3.Semantic.Color.Text.Default
	local var8 = getGameTileMetadataFontModule(p2.useLargerFont, var3, var5, if p2.isUnifiedGameTile then true else nil)
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = p2.LayoutOrder,
		Size = UDim2.new(if p2.shouldSizeToContentWidth then 0 else 1, 0, 0, (var6 + var4) * (p2.linesOfText or 1)),
		AutomaticSize = if p2.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
		Position = p2.Position,
		AnchorPoint = p2.AnchorPoint
	}, {
		Text = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = p2.text,
			Size = UDim2.new(if p2.shouldSizeToContentWidth then 0 else 1, 0, 0, (var8.FontSize + var4) * (p2.linesOfText or 1)),
			AutomaticSize = if p2.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = var8.FontSize,
			Font = var8.Font,
			TextTransparency = var7.Transparency,
			TextColor3 = var7.Color3,
			TextWrapped = p2.TextWrapped or false,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = p2.TextYAlignment or Enum.TextYAlignment.Center,
			ClipsDescendants = p2.ClipsDescendants,
			RichText = p2.RichText
		})
	})
end