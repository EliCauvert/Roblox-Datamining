local textService = game:GetService("TextService")
local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getGameTileMetadataFontModule = require(gameTile.Footer.getGameTileMetadataFont)
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local gameTileTypesModule = require(gameTile.GameTileTypes)
local fFlagLuaAppMigrateGameTileFooterValueFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes
local fFlagLuaAppFixSmallScreenFooterStatsOverlap = require(parent.SharedFlags).FFlagLuaAppFixSmallScreenFooterStatsOverlap
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local ratingSmall = images["icons/status/games/rating_small"]
local var1 = images["icons/status/games/people-playing_small"]
local vector2 = Vector2.new(1e999, 1e999)

return function(p1)
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), fFlagLuaAppFixSmallScreenFooterStatsOverlap (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppMigrateGameTileFooterValueFixes (ref), getGameTileMetadataFontModule (ref), reactModule (ref), fFlagLuaAppNarrowTileHideRating (ref), textService (ref), vector2 (ref), imageSetLabel (ref), ratingSmall (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), var1 (ref)
	local var2
	local var3 = useDesignTokens()
	local var4 = useTextSizeOffset()
	local var5 = useTokens()
	
	if fFlagLuaAppFixSmallScreenFooterStatsOverlap then
		var2 = useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
		
		if var2 then
			var2 = p1.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow
			var2 = nil
		end
	else
		var2 = false
	end
	local createElement_1
	local var6 = useBreakpointXOrSmaller(responsiveModule.Keys.Small) and p1.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow
	local var7 = if p1.isUnifiedGameTile then if fFlagLuaAppMigrateGameTileFooterValueFixes then var5.Size.Size_500 else var5.Size.Size_300 elseif fFlagLuaAppMigrateGameTileFooterValueFixes then var3.Size.Size_500 else var3.Size.Size_300
	local var8 = if p1.isUnifiedGameTile then if var2 or fFlagLuaAppNarrowTileSmallerFooterFont and p1.compactMetadataFormat then var5.Gap.XXSmall else var5.Gap.XSmall else var3.Size.Size_100
	local var9 = if p1.isUnifiedGameTile then if fFlagLuaAppMigrateGameTileFooterValueFixes then if var2 then var5.Gap.XXSmall else var5.Gap.Small else var5.Gap.Medium else var3.Size.Size_200
	local var10 = if p1.isUnifiedGameTile then var5.Color.Content.Default else var3.Color.Content.Default
	local var11 = getGameTileMetadataFontModule(p1.useLargerFont, var3, var5 or nil, if p1.isUnifiedGameTile then true else nil, if fFlagLuaAppNarrowTileSmallerFooterFont then p1.compactMetadataFormat else nil)
	local fontSize = var11.FontSize
	local font = var11.Font
	local var12 = var4 > 0 and var6
	local var13 = fontSize / 1.26
	local ratingText = p1.ratingText
	local var14 = reactModule.useMemo(function()
		-- upvalues: fFlagLuaAppNarrowTileHideRating (copy), p1 (ref), ratingText (ref), textService (copy), fontSize (ref), font (ref), vector2 (copy)
		return if fFlagLuaAppNarrowTileHideRating and p1.hideRating or (ratingText == nil or ratingText == "") then 0 else textService:GetTextSize(ratingText, fontSize, font, vector2).X
	end, {
		ratingText,
		fontSize,
		font,
		var4,
		if fFlagLuaAppNarrowTileHideRating then p1.hideRating else nil
	})
	local var15 = var13 + var8 + var14 + var9
	local createElement = reactModule.createElement
	local var16 = "Frame"
	local t = {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, if var12 then 1 else 0, if var12 then 0 else var7 + var4),
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = if var12 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if var12 then nil else UDim.new(0, var9)
		}),
		RatingsFrame = if fFlagLuaAppNarrowTileHideRating and p1.hideRating then nil else reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var14 + var13 + var8, 0, var7 + var4)
		}, {
			RatingIconSlot = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var13, var13),
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = reactModule.createElement(imageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = ratingSmall,
					ImageColor3 = var10.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(var13, var13),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			RatingText = reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = ratingText,
				Size = UDim2.new(0, var14 + var8, 0, fontSize + var4),
				Position = UDim2.new(0, var13 + var8, 0.5, 0),
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
	}
	
	if fFlagLuaAppNarrowTileHidePlayerCount and p1.hidePlayerCount then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = if var12 then UDim2.new(1, 0, 0, var7 + var4) elseif fFlagLuaAppNarrowTileHideRating and p1.hideRating then UDim2.new(1, 0, 0, var7 + var4) else UDim2.new(1, -var15, 0, var7 + var4)
		}, {
			PlayerCountIconSlot = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(var13, var13),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = reactModule.createElement(imageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = var1,
					ImageColor3 = var10.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(var13, var13),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			PlayerCountText = reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = p1.playerCountText,
				Size = UDim2.new(1, (-var13) - var8, 0, fontSize + var4),
				Position = UDim2.new(0, var13 + var8, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				TextSize = var11.FontSize,
				Font = var11.Font,
				TextTransparency = var10.Transparency,
				TextColor3 = var10.Color3,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end
	t_1.PlayerCountFrame = createElement_1
	
	return createElement(var16, t, t_1)
end