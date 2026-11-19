local Parent = script:FindFirstAncestor("GameInvite").Parent
local _ = require(Parent.Signals)

local function _()
	-- upvalues: Parent (copy)
	return require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.InviteFriends
end

local _ = function()
	-- upvalues: Parent (copy)
	return require(Parent.InExperienceSideSheetStore.GetSideSheetStore)(false)
end

return {
	getInviteFriendsAreaBesideSideSheet = function(p1)
		-- upvalues: Parent (copy)
		return require(Parent.InExperienceSideSheetStore.getClaimedWindowAreaBesideSideSheet)(require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.InviteFriends, p1)
	end,
	isInviteFriendsClaimedBesideSideSheet = function(): boolean
		-- upvalues: Parent (copy)
		return require(Parent.InExperienceSideSheetStore.GetSideSheetStore)(false).getWindowShownBesideSideSheet(false) == require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.InviteFriends
	end,
	releaseInviteFriendsBesideSideSheet = function()
		-- upvalues: Parent (copy)
		require(Parent.InExperienceSideSheetStore.releaseWindowBesideSideSheet)(require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.InviteFriends, require(Parent.InExperienceSideSheetStore.AnalyticsConstants).Source.InviteClosed)
	end,
	dropInviteFriendsClaimBesideSideSheet = function()
		-- upvalues: Parent (copy)
		if require(Parent.InExperienceSideSheetStore.GetSideSheetStore)(false).getWindowShownBesideSideSheet(false) == require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.InviteFriends then
			require(Parent.InExperienceSideSheetStore.GetSideSheetStore)(false).setWindowShownBesideSideSheet(nil)
		end
	end
}