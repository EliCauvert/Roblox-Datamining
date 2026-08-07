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
local var7 = images["icons/status/games/people-playing_small"]
local vector2 = Vector2.new(1e999, 1e999)

return function(p0) --[[ line: 61 | named "GridTileGameStats" ]]
	-- upvalues: useDesignTokens (ref), useTextSizeOffset (ref), useTokens (ref), fFlagLuaAppFixSmallScreenFooterStatsOverlap (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), gameTileTypesModule (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppMigrateGameTileFooterValueFixes (ref), getGameTileMetadataFontModule (ref), reactModule (ref), fFlagLuaAppNarrowTileHideRating (ref), textService (ref), vector2 (ref), imageSetLabel (ref), ratingSmall (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), var7 (ref)
	local var12
	local var9 = useDesignTokens()
	local var10 = useTextSizeOffset()
	local var11 = useTokens()
	
	if fFlagLuaAppFixSmallScreenFooterStatsOverlap then
		var12 = useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
		
		if var12 then
			var12 = p0.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow
			var12 = nil
		end
	else
		var12 = false
	end
	local createElement_1
	local var13 = useBreakpointXOrSmaller(responsiveModule.Keys.Small) and p0.gameTileLayoutType == gameTileTypesModule.GameTileLayoutType.Narrow
	local var14 = if p0.isUnifiedGameTile then if fFlagLuaAppMigrateGameTileFooterValueFixes then var11.Size.Size_500 else var11.Size.Size_300 elseif fFlagLuaAppMigrateGameTileFooterValueFixes then var9.Size.Size_500 else var9.Size.Size_300
	local var15 = if p0.isUnifiedGameTile then if var12 or fFlagLuaAppNarrowTileSmallerFooterFont and p0.compactMetadataFormat then var11.Gap.XXSmall else var11.Gap.XSmall else var9.Size.Size_100
	local var16 = if p0.isUnifiedGameTile then if fFlagLuaAppMigrateGameTileFooterValueFixes then if var12 then var11.Gap.XXSmall else var11.Gap.Small else var11.Gap.Medium else var9.Size.Size_200
	local var17 = if p0.isUnifiedGameTile then var11.Color.Content.Default else var9.Color.Content.Default
	local var18 = getGameTileMetadataFontModule(p0.useLargerFont, var9, var11 or nil, if p0.isUnifiedGameTile then true else nil, if fFlagLuaAppNarrowTileSmallerFooterFont then p0.compactMetadataFormat else nil)
	local fontSize = var18.FontSize
	local font = var18.Font
	local var19 = var10 > 0 and var13
	local var20 = fontSize / 1.26
	local ratingText = p0.ratingText
	local var21 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: fFlagLuaAppNarrowTileHideRating (copy), p0 (ref), ratingText (ref), textService (copy), fontSize (ref), font (ref), vector2 (copy)
		return if fFlagLuaAppNarrowTileHideRating and p0.hideRating or (ratingText == nil or ratingText == "") then 0 else textService:GetTextSize(ratingText, fontSize, font, vector2).X
	end, {
		ratingText,
		fontSize,
		font,
		var10,
		if fFlagLuaAppNarrowTileHideRating then p0.hideRating else nil
	})
	local var22 = var20 + var15 + var21 + var16
	local createElement = reactModule.createElement
	local var23 = "Frame"
	local t = {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, if var19 then 1 else 0, if var19 then 0 else var14 + var10),
		Position = p0.Position,
		LayoutOrder = p0.LayoutOrder
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = if var19 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if var19 then nil else UDim.new(0, var16)
		}),
		RatingsFrame = if fFlagLuaAppNarrowTileHideRating and p0.hideRating then nil else reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var21 + var20 + var15, 0, var14 + var10)
		}, {
			RatingIconSlot = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var20, var20),
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = reactModule.createElement(imageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = ratingSmall,
					ImageColor3 = var17.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(var20, var20),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			RatingText = reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = ratingText,
				Size = UDim2.new(0, var21 + var15, 0, fontSize + var10),
				Position = UDim2.new(0, var20 + var15, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				TextSize = fontSize,
				Font = var18.Font,
				TextTransparency = var17.Transparency,
				TextColor3 = var17.Color3,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	}
	
	if fFlagLuaAppNarrowTileHidePlayerCount and p0.hidePlayerCount then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = if var19 then UDim2.new(1, 0, 0, var14 + var10) elseif fFlagLuaAppNarrowTileHideRating and p0.hideRating then UDim2.new(1, 0, 0, var14 + var10) else UDim2.new(1, -var22, 0, var14 + var10)
		}, {
			PlayerCountIconSlot = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(var20, var20),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				Icon = reactModule.createElement(imageSetLabel, {
					ImageTransparency = 0,
					BackgroundTransparency = 1,
					Image = var7,
					ImageColor3 = var17.Color3,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(var20, var20),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			}),
			PlayerCountText = reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Text = p0.playerCountText,
				Size = UDim2.new(1, (-var20) - var15, 0, fontSize + var10),
				Position = UDim2.new(0, var20 + var15, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				TextSize = var18.FontSize,
				Font = var18.Font,
				TextTransparency = var17.Transparency,
				TextColor3 = var17.Color3,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end
	t_1.PlayerCountFrame = createElement_1
	
	return createElement(var23, t, t_1)
end