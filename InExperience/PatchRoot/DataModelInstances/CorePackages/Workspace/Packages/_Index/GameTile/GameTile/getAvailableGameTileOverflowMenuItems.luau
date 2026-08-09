local gameTile = script:FindFirstAncestor("GameTile")
local sharedFlagsModule = require(gameTile.Parent.SharedFlags)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppSupportSponsoredExplicitFeedback = sharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppSupportSponsoredExplicitFeedback_1 = game:DefineFastFlag("LuaAppEnableSponsoredExplicitFeedback", false) and fFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppSupportSponsoredExplicitFeedback_2 = game:DefineFastFlag("LuaAppForceSponsoredExplicitFeedback", false) and fFlagLuaAppSupportSponsoredExplicitFeedback

return function(p0) --[[ line: 15 | named "getAvailableGameTileOverflowMenuItems" ]]
	-- upvalues: fFlagLuaAppEnableSponsoredReportAd (ref), tileOverflowMenuItems (ref), fFlagLuaAppSupportSponsoredExplicitFeedback_2 (ref), fFlagLuaAppSupportSponsoredExplicitFeedback_1 (ref)
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
	if p0.enableExplicitFeedback and (fFlagLuaAppSupportSponsoredExplicitFeedback_2 or not p0.isSponsored or fFlagLuaAppSupportSponsoredExplicitFeedback_1 and p0.enableSponsoredFeedback and p0.isSponsored) then
		t[tileOverflowMenuItems.NotInterested] = true
	end
	return t
end