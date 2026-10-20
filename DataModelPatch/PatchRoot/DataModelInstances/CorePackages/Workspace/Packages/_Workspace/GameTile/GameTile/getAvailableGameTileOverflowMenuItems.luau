local GameTile = script:FindFirstAncestor("GameTile")
local SharedFlagsModule = require(GameTile.Parent.SharedFlags)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local FFlagLuaAppEnableSponsoredReportAd = SharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppSupportSponsoredExplicitFeedback = SharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppSupportSponsoredExplicitFeedback1 = game:DefineFastFlag("LuaAppEnableSponsoredExplicitFeedback", false) and FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppSupportSponsoredExplicitFeedback2 = game:DefineFastFlag("LuaAppForceSponsoredExplicitFeedback", false) and FFlagLuaAppSupportSponsoredExplicitFeedback

return function(p1)
	-- upvalues: FFlagLuaAppEnableSponsoredReportAd (copy), TileOverflowMenuItems (copy), FFlagLuaAppSupportSponsoredExplicitFeedback2 (copy), FFlagLuaAppSupportSponsoredExplicitFeedback1 (copy)
	local t = {}
	
	if FFlagLuaAppEnableSponsoredReportAd then
		if p1.isSponsored then
			if p1.enableSponsoredFeedback then
				t[TileOverflowMenuItems.WhyThisAd] = true
			end
			if p1.enableReportAd then
				t[TileOverflowMenuItems.ReportAd] = true
			end
		end
	elseif p1.enableSponsoredFeedback and p1.isSponsored then
		t[TileOverflowMenuItems.WhyThisAd] = true
	end
	if p1.enableExplicitFeedback and (FFlagLuaAppSupportSponsoredExplicitFeedback2 or not p1.isSponsored or FFlagLuaAppSupportSponsoredExplicitFeedback1 and p1.enableSponsoredFeedback and p1.isSponsored) then
		t[TileOverflowMenuItems.NotInterested] = true
	end
	return t
end