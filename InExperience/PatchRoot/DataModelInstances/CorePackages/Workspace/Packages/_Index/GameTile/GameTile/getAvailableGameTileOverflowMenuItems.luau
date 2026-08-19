local gameTile = script:FindFirstAncestor("GameTile")
local sharedFlagsModule = require(gameTile.Parent.SharedFlags)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay

return function(p0) --[[ line: 11 | named "getAvailableGameTileOverflowMenuItems" ]]
	-- upvalues: fFlagLuaAppEnableSponsoredReportAd (ref), tileOverflowMenuItems (ref), fFlagLuaAppContinueSortInstantPlay (ref)
	local t = {}
	
	if fFlagLuaAppEnableSponsoredReportAd then
		if p0.isSponsored then
			if p0.enableSponsoredFeedback then
				t[tileOverflowMenuItems.WhyThisAd] = true
			end
			if p0.enableReportAd then
				t[tileOverflowMenuItems.ReportAd] = true
			end
		end
	elseif p0.enableSponsoredFeedback and p0.isSponsored then
		t[tileOverflowMenuItems.WhyThisAd] = true
	end
	if p0.enableExplicitFeedback then
		t[tileOverflowMenuItems.NotInterested] = true
	end
	if fFlagLuaAppContinueSortInstantPlay and p0.enableGameDetails then
		t[tileOverflowMenuItems.GameDetails] = true
	end
	return t
end