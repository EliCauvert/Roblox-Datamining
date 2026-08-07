local parent = script.Parent.Parent
local builderIconModule = require(parent.Common.builderIcon)
local sharedFlagsModule = require(parent.Parent.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local t = {
	[Enum.FriendStatus.Friend] = builderIconModule("two-people", "Filled"),
	[Enum.FriendStatus.FriendRequestReceived] = builderIconModule("person-clock", "Filled")
}
local var3 = builderIconModule("circle-slash")
local var4 = builderIconModule("hammer-code", "Filled")
local var5 = builderIconModule("person-check", "Filled")
local var6 = builderIconModule("premium")

local function _(p0) --[[ line: 20 | named "getSocialIcon" ]]
	-- upvalues: var3 (ref), t (ref)
	return if p0 then if p0.isBlocked then var3 else t[p0.friendStatus] else nil
end

return function(p1, p2, p3, p4) --[[ line: 30 | named "getPlayerBadgeIcon" ]]
	-- upvalues: var3 (ref), t (ref), var4 (ref), var5 (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), var6 (ref)
	if not p1 then
		return nil
	end
	local var7 = if not p4 then nil elseif p4.isBlocked then var3 else t[p4.friendStatus]
	
	if var7 then
		return var7
	elseif p3 and p3.isPlaceOwner then
		return var4
	elseif p1.CustomPlayerIcons and p1.CustomPlayerIcons[p2.UserId] then
		return p1.CustomPlayerIcons[p2.UserId]
	elseif p3 and p3.specialGroupIcon then
		return p3.specialGroupIcon
	elseif p4 and p4.isFollowing then
		return var5
	end
	local var8 = p2.MembershipType == Enum.MembershipType.Premium
	
	if fFlagEnableBlackbirdCheck then
		return if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and p2.HasRobloxSubscription then p1.SubscriptionIcon elseif fFlagHidePremiumIconography or not var8 then nil else var6
	elseif var8 then
		return var6
	end
end