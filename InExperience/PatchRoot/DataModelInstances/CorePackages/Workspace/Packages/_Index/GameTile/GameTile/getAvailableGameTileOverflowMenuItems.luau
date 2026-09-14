local gameTile = script:FindFirstAncestor("GameTile")
local sharedFlagsModule = require(gameTile.Parent.SharedFlags)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppContinueSortInstantPlay = sharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppEnableReportExperience = sharedFlagsModule.FFlagLuaAppEnableReportExperience

return function(p1)
	-- upvalues: fFlagLuaAppEnableSponsoredReportAd (ref), tileOverflowMenuItems (ref), fFlagLuaAppContinueSortInstantPlay (ref), fFlagLuaAppEnableReportExperience (ref)
	local t = {}
	
	if fFlagLuaAppEnableSponsoredReportAd then
		if p1.isSponsored then
			if p1.enableSponsoredFeedback then
				t[tileOverflowMenuItems.WhyThisAd] = true
			end
			if p1.enableReportAd then
				t[tileOverflowMenuItems.ReportAd] = true
			end
		end
	elseif p1.enableSponsoredFeedback and p1.isSponsored then
		t[tileOverflowMenuItems.WhyThisAd] = true
	end
	if p1.enableExplicitFeedback then
		t[tileOverflowMenuItems.NotInterested] = true
	end
	if fFlagLuaAppContinueSortInstantPlay and p1.enableGameDetails then
		t[tileOverflowMenuItems.GameDetails] = true
	end
	if fFlagLuaAppEnableReportExperience and p1.enableReportExperience and not p1.isSponsored then
		t[tileOverflowMenuItems.ReportExperience] = true
	end
	return t
end