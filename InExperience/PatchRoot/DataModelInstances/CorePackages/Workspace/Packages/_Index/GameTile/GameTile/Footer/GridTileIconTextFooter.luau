local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getGameTileMetadataFontModule = require(gameTile.Footer.getGameTileMetadataFont)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local gameTileTypesModule = require(gameTile.GameTileTypes)

return function(p0) --[[ line: 52 | named "GridTileIconTextFooter" ]]
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), gameTileTypesModule (ref), getGameTileMetadataFontModule (ref), reactModule (ref), imageSetLabel (ref)
	local var12, var13
	local var5 = useDesignTokens()
	local var6 = useTextSizeOffset()
	local var7 = useTokens()
	local var8 = if p0.isUnifiedGameTile then var7.Size.Size_500 elseif fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_500 else var5.Global.Space_250
	local var9 = if not p0.isUnifiedGameTile then if p0.isNarrowScreenXSmall and p0.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow then var7.Gap.XXSmall else var7.Gap.XSmall elseif fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_100 else var5.Global.Space_50
	local var10 = if p0.isUnifiedGameTile then var7.Color.Content.Default elseif fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Default else var5.Semantic.Color.Text.Default
	local var11 = getGameTileMetadataFontModule(p0.useLargerFont, var5, var7 or nil, if p0.isUnifiedGameTile then true else nil)
	local fontSize = var11.FontSize
	local _ = nil
	local _ = nil
	
	if p0.iconSize then
		var12 = p0.iconSize
		var13 = if fFlagRenameDeprecatedUIBloxTokens then var5.Size.Size_500 else var5.Global.Size_250
	else
		var12 = fontSize / 1.26
		var13 = var12
	end
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var8 + var6),
		AutomaticSize = Enum.AutomaticSize.None,
		Position = p0.Position
	}, {
		IconSlot = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var13, var13),
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Icon = if p0.iconElement then p0.iconElement else reactModule.createElement(imageSetLabel, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Image = p0.icon,
				ImageColor3 = var10.Color3,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(var12, var12),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		}),
		Text = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = false,
			Text = p0.text,
			Size = UDim2.new(1, -(var13 + var9), 0, fontSize + var6),
			AutomaticSize = Enum.AutomaticSize.None,
			Position = UDim2.new(0, var13 + var9, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			TextSize = fontSize,
			Font = var11.Font,
			TextTransparency = var10.Transparency,
			TextColor3 = var10.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end