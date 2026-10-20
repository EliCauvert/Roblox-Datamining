local GetFoundationMappedStyleTokensModule = require(script:FindFirstAncestor("AvatarExperienceHeadRefinement").Utils.getFoundationMappedStyleTokens)

return function(p1): number
	-- upvalues: GetFoundationMappedStyleTokensModule (copy)
	local Tokens = p1.tokens
	local FoundationMappedStyleTokensModule = GetFoundationMappedStyleTokensModule(Tokens)
	local ItemCount: number = p1.itemCount
	local LargeTileContainerSize: number = FoundationMappedStyleTokensModule.largeTileContainerSize
	local TileListPaddingTop = FoundationMappedStyleTokensModule.tileListPaddingTop
	local TileListPaddingBottom = FoundationMappedStyleTokensModule.tileListPaddingBottom
	local TileListPaddingBetweenItems: number = FoundationMappedStyleTokensModule.tileListPaddingBetweenItems
	
	local function _(p2: number)
		-- upvalues: LargeTileContainerSize (copy), TileListPaddingBetweenItems (copy), TileListPaddingTop (copy), TileListPaddingBottom (copy)
		return LargeTileContainerSize * p2 + (if p2 > 1 then (p2 - 1) * TileListPaddingBetweenItems else 0) + TileListPaddingTop + TileListPaddingBottom
	end
	
	local Ceiled: number = if ItemCount and ItemCount > 0 then math.ceil(ItemCount / 4) else 1
	
	return (math.clamp(math.min(LargeTileContainerSize * Ceiled + (if Ceiled > 1 then (Ceiled - 1) * TileListPaddingBetweenItems else 0) + TileListPaddingTop + TileListPaddingBottom, p1.availableViewportHeight - (FoundationMappedStyleTokensModule.containerPaddingTop + FoundationMappedStyleTokensModule.containerPaddingBottom + Tokens.Size.Size_1000 + Tokens.Size.Size_800 * 2)), LargeTileContainerSize * 1 + 0 + TileListPaddingTop + TileListPaddingBottom, LargeTileContainerSize * 7 + 6 * TileListPaddingBetweenItems + TileListPaddingTop + TileListPaddingBottom))
end