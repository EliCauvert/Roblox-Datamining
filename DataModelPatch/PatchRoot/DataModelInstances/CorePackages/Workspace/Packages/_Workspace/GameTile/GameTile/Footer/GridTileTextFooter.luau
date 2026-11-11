local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local GetGameTileMetadataFontModule = require(GameTile.Footer.getGameTileMetadataFont)

local function _(p1, p2)
	return p1 * (p2 or 1)
end

return function(Frame: Frame)
	-- upvalues: UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GetGameTileMetadataFontModule (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local Default = if Frame.isUnifiedGameTile then UseTokensResult.Color.Content.Default elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default
	local GameTileMetadataFontModule = GetGameTileMetadataFontModule(Frame.useLargerFont, UseDesignTokensResult, UseTokensResult, if Frame.isUnifiedGameTile then true else nil)
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(if Frame.shouldSizeToContentWidth then 0 else 1, 0, 0, ((if Frame.isUnifiedGameTile then UseTokensResult.Size.Size_500 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250) + UseTextSizeOffsetResult) * (Frame.linesOfText or 1)),
		AutomaticSize = if Frame.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint
	}, {
		Text = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = Frame.text,
			Size = UDim2.new(if Frame.shouldSizeToContentWidth then 0 else 1, 0, 0, (GameTileMetadataFontModule.FontSize + UseTextSizeOffsetResult) * (Frame.linesOfText or 1)),
			AutomaticSize = if Frame.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = GameTileMetadataFontModule.FontSize,
			Font = GameTileMetadataFontModule.Font,
			TextTransparency = Default.Transparency,
			TextColor3 = Default.Color3,
			TextWrapped = Frame.TextWrapped or false,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Frame.TextYAlignment or Enum.TextYAlignment.Center,
			ClipsDescendants = Frame.ClipsDescendants,
			RichText = Frame.RichText
		})
	})
end