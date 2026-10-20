local GameTile = script:FindFirstAncestor("GameTile")
local SharedFlagsModule = require(GameTile.Parent.SharedFlags)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local FFlagLuaAppContinueSortInstantPlay = SharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience

return function(p1)
	-- upvalues: TileOverflowMenuItems (copy), FFlagLuaAppContinueSortInstantPlay (copy), FFlagLuaAppEnableReportExperience (copy)
	local t = {}
	
	if p1.isSponsored then
		if p1.enableSponsoredFeedback then
			t[TileOverflowMenuItems.WhyThisAd] = true
		end
		if p1.enableReportAd then
			t[TileOverflowMenuItems.ReportAd] = true
		end
	end
	if p1.enableExplicitFeedback then
		t[TileOverflowMenuItems.NotInterested] = true
	end
	if FFlagLuaAppContinueSortInstantPlay and p1.enableGameDetails then
		t[TileOverflowMenuItems.GameDetails] = true
	end
	if FFlagLuaAppEnableReportExperience and p1.enableReportExperience and not p1.isSponsored then
		t[TileOverflowMenuItems.ReportExperience] = true
	end
	return t
end