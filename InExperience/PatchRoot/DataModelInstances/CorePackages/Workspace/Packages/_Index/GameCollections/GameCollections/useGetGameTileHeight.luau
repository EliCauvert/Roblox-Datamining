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

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 22 | named "useGetGameTileHeight" ]]
	-- upvalues: useDesignTokens (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), fFlagLuaAppFixHomeGridPlaceholderFlowIssues (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gameTileConstants (ref), reactModule (ref), gameCollectionLayoutCalculatorsModule (ref)
	local var6
	local var4 = useDesignTokens()
	local _ = nil
	local var5 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	
	if fFlagLuaAppFixHomeGridPlaceholderFlowIssues then
		var6 = var5
		
		if var6 then
			var6 = p5
			
			if var6 then
				var6 = false
				
				if p5 > 0 then
					local var7
					if not fFlagLuaAppNarrowTileHideRating then
						var7 = fFlagLuaAppNarrowTileHidePlayerCount
						
						if var7 then
							var7 = p8
						end
						var6 = not var7
					end
				end
			end
		end
	else
		var6 = var5
		
		if var6 then
			var6 = false
			
			if p5 > 0 then
				local var8
				if not fFlagLuaAppNarrowTileHideRating then
					var8 = fFlagLuaAppNarrowTileHidePlayerCount
					
					if var8 then
						var8 = p8
					end
					var6 = not var8
				end
			end
		end
	end
	local var9 = if var6 then gameTileConstants.TileTextLines[p1].largeMetadataTextLines else gameTileConstants.TileTextLines[p1].metadataTextLines
	
	return reactModule.useCallback(function(p9) --[[ line: 50 ]]
		-- upvalues: gameCollectionLayoutCalculatorsModule (copy), p0 (ref), p1 (ref), var4 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), var9 (write)
		return gameCollectionLayoutCalculatorsModule.calculateTileHeightFromWidth(p9, p0, p1, var4, p2, p3, p4, p5, p6, p7, var9)
	end, {
		var4, p0, p1, p2, p3, p4, p5, p6, p7, var9,
		if fFlagLuaAppNarrowTileHideRating or fFlagLuaAppNarrowTileHidePlayerCount then p8 else nil
	})
end