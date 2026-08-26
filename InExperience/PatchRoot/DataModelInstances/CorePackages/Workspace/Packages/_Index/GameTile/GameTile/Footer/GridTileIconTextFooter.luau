local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getGameTileMetadataFontModule = require(gameTile.Footer.getGameTileMetadataFont)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local gameTileTypesModule = require(gameTile.GameTileTypes)

return function(p1)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), gameTileTypesModule (ref), getGameTileMetadataFontModule (ref), reactModule (ref), imageSetLabel (ref)
	local var1, var2
	local var3 = useDesignTokens()
	local var4 = useTextSizeOffset()
	local var5 = useTokens()
	local var6 = if p1.isUnifiedGameTile then var5.Size.Size_500 else var3.Size.Size_500
	local var7 = if not p1.isUnifiedGameTile then if p1.isNarrowScreenXSmall and p1.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow then var5.Gap.XXSmall else var5.Gap.XSmall else var3.Size.Size_100
	local var8 = if p1.isUnifiedGameTile then var5.Color.Content.Default else var3.Color.Content.Default
	local var9 = getGameTileMetadataFontModule(p1.useLargerFont, var3, var5 or nil, if p1.isUnifiedGameTile then true else nil)
	local fontSize = var9.FontSize
	local _ = nil
	local _ = nil
	
	if p1.iconSize then
		var1 = p1.iconSize
		var2 = var3.Size.Size_500
	else
		var1 = fontSize / 1.26
		var2 = var1
	end
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var6 + var4),
		AutomaticSize = Enum.AutomaticSize.None,
		Position = p1.Position
	}, {
		IconSlot = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var2, var2),
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Icon = if p1.iconElement then p1.iconElement else reactModule.createElement(imageSetLabel, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Image = p1.icon,
				ImageColor3 = var8.Color3,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(var1, var1),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		}),
		Text = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = false,
			Text = p1.text,
			Size = UDim2.new(1, -(var2 + var7), 0, fontSize + var4),
			AutomaticSize = Enum.AutomaticSize.None,
			Position = UDim2.new(0, var2 + var7, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = fontSize,
			Font = var9.Font,
			TextTransparency = var8.Transparency,
			TextColor3 = var8.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end