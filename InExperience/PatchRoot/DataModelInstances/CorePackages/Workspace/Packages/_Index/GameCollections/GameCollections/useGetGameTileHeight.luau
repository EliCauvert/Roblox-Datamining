local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local gameTileConstants = require(parent.GameTile).GameTileConstants
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local gameCollectionLayoutCalculatorsModule = require(gameCollections.GameCollectionLayoutCalculators)
local fFlagLuaAppFixHomeGridPlaceholderFlowIssues = require(parent.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: useDesignTokens (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), fFlagLuaAppFixHomeGridPlaceholderFlowIssues (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gameTileConstants (ref), reactModule (ref), gameCollectionLayoutCalculatorsModule (ref)
	local var1
	local var2 = useDesignTokens()
	local _ = nil
	local var3 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	
	if fFlagLuaAppFixHomeGridPlaceholderFlowIssues then
		var1 = var3
		
		if var1 then
			var1 = p6
			
			if var1 then
				var1 = false
				
				if p6 > 0 then
					local var4
					if not fFlagLuaAppNarrowTileHideRating then
						var4 = fFlagLuaAppNarrowTileHidePlayerCount
						
						if var4 then
							var4 = p9
						end
						var1 = not var4
					end
				end
			end
		end
	else
		var1 = var3
		
		if var1 then
			var1 = false
			
			if p6 > 0 then
				local var5
				if not fFlagLuaAppNarrowTileHideRating then
					var5 = fFlagLuaAppNarrowTileHidePlayerCount
					
					if var5 then
						var5 = p9
					end
					var1 = not var5
				end
			end
		end
	end
	local var6 = if var1 then gameTileConstants.TileTextLines[p2].largeMetadataTextLines else gameTileConstants.TileTextLines[p2].metadataTextLines
	
	return reactModule.useCallback(function(p10)
		-- upvalues: gameCollectionLayoutCalculatorsModule (copy), p1 (ref), p2 (ref), var2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), var6 (write)
		return gameCollectionLayoutCalculatorsModule.calculateTileHeightFromWidth(p10, p1, p2, var2, p3, p4, p5, p6, p7, p8, var6)
	end, {
		var2, p1, p2, p3, p4, p5, p6, p7, p8, var6,
		if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then p9 else nil
	})
end