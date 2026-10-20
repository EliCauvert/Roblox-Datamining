local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetGameTileMetadataFontModule = require(GameTile.Footer.getGameTileMetadataFont)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local GameTileTypesModule = require(GameTile.GameTileTypes)

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), GameTileTypesModule (copy), GetGameTileMetadataFontModule (copy), ReactModule (copy), ImageSetLabel (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult: number = UseTextSizeOffsetFunction()
	local UseTokensResult = UseTokensFunction()
	local Size500 = if p1.isUnifiedGameTile then UseTokensResult.Size.Size_500 else UseDesignTokensResult.Size.Size_500
	local XXSmall = if p1.isUnifiedGameTile then if p1.isNarrowScreenXSmall and p1.gameTileLayoutType == GameTileTypesModule.GameTileLayoutType.Narrow then UseTokensResult.Gap.XXSmall else UseTokensResult.Gap.XSmall else UseDesignTokensResult.Size.Size_100
	local Default = if p1.isUnifiedGameTile then UseTokensResult.Color.Content.Default else UseDesignTokensResult.Color.Content.Default
	local GameTileMetadataFontModule = GetGameTileMetadataFontModule(p1.useLargerFont, UseDesignTokensResult, UseTokensResult or nil, if p1.isUnifiedGameTile then true else nil)
	local FontSize: number = GameTileMetadataFontModule.FontSize
	local Size500_1 = nil
	local IconSize = nil
	
	if p1.iconSize then
		IconSize = p1.iconSize
		Size500_1 = UseDesignTokensResult.Size.Size_500
	else
		IconSize = FontSize / 1.26
		Size500_1 = IconSize
	end
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Size500 + UseTextSizeOffsetResult),
		AutomaticSize = Enum.AutomaticSize.None,
		Position = p1.Position
	}, {
		IconSlot = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(Size500_1, Size500_1),
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Icon = if p1.iconElement then p1.iconElement else ReactModule.createElement(ImageSetLabel, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Image = p1.icon,
				ImageColor3 = Default.Color3,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(IconSize, IconSize),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		}),
		Text = ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = false,
			Text = p1.text,
			Size = UDim2.new(1, -(Size500_1 + XXSmall), 0, FontSize + UseTextSizeOffsetResult),
			AutomaticSize = Enum.AutomaticSize.None,
			Position = UDim2.new(0, Size500_1 + XXSmall, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = FontSize,
			Font = if FoundationFontFaceMigration then nil else GameTileMetadataFontModule.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GameTileMetadataFontModule.Font) else nil,
			TextTransparency = Default.Transparency,
			TextColor3 = Default.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end