local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local GameCollectionLayoutCalculatorsModule = require(GameCollections.GameCollectionLayoutCalculators)
local FFlagLuaAppFixHomeGridPlaceholderFlowIssues = require(Parent.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount

return function(p1, p2, p3, p4, p5, p6: number, p7, p8, p9)
	-- upvalues: UseDesignTokensFunction (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), FFlagLuaAppFixHomeGridPlaceholderFlowIssues (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), GameTileConstants (copy), ReactModule (copy), GameCollectionLayoutCalculatorsModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local LargeMetadataTextLines = nil
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
	local Inverted: boolean = if FFlagLuaAppFixHomeGridPlaceholderFlowIssues then UseBreakpointXOrSmallerResult and (p6 and (p6 > 0 and not (if FFlagLuaAppNarrowTileHideRating then p9 else FFlagLuaAppNarrowTileHidePlayerCount and p9))) else UseBreakpointXOrSmallerResult and (p6 > 0 and not (if FFlagLuaAppNarrowTileHideRating then p9 else FFlagLuaAppNarrowTileHidePlayerCount and p9))
	LargeMetadataTextLines = if Inverted then GameTileConstants.TileTextLines[p2].largeMetadataTextLines else GameTileConstants.TileTextLines[p2].metadataTextLines
	
	return ReactModule.useCallback(function(p10)
		-- upvalues: GameCollectionLayoutCalculatorsModule (upval), p1 (copy), p2 (copy), UseDesignTokensResult (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), LargeMetadataTextLines (ref)
		return GameCollectionLayoutCalculatorsModule.calculateTileHeightFromWidth(p10, p1, p2, UseDesignTokensResult, p3, p4, p5, p6, p7, p8, LargeMetadataTextLines)
	end, {
		UseDesignTokensResult, p1, p2, p3, p4, p5, p6, p7, p8, LargeMetadataTextLines,
		if FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount then p9 else nil
	})
end