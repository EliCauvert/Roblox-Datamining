local gameTile = script:FindFirstAncestor("GameTile")
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagLuaAppEnableSponsoredReportAd = require(gameTile.Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd

return function(p0) --[[ line: 10 | named "getAvailableGameTileOverflowMenuItems" ]]
	-- upvalues: fFlagLuaAppEnableSponsoredReportAd (ref), tileOverflowMenuItems (ref)
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
	return t
end