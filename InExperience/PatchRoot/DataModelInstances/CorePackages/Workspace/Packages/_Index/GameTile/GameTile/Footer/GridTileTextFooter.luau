local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local GetGameTileMetadataFontModule = require(GameTile.Footer.getGameTileMetadataFont)

local function _(p1, p2)
	return p1 * (p2 or 1)
end

return function(Frame: Frame)
	-- upvalues: UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), GetGameTileMetadataFontModule (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local Default = if Frame.isUnifiedGameTile then UseTokensResult.Color.Content.Default else UseDesignTokensResult.Color.Content.Default
	local GameTileMetadataFontModule = GetGameTileMetadataFontModule(Frame.useLargerFont, UseDesignTokensResult, UseTokensResult, if Frame.isUnifiedGameTile then true else nil)
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(if Frame.shouldSizeToContentWidth then 0 else 1, 0, 0, ((if Frame.isUnifiedGameTile then UseTokensResult.Size.Size_500 else UseDesignTokensResult.Size.Size_500) + UseTextSizeOffsetResult) * (Frame.linesOfText or 1)),
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
			Font = if FoundationFontFaceMigration then nil else GameTileMetadataFontModule.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GameTileMetadataFontModule.Font) else nil,
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