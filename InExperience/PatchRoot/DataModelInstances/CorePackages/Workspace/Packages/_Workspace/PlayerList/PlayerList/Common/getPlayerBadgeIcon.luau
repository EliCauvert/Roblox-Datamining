local parent = script.Parent.Parent
local builderIconModule = require(parent.Common.builderIcon)
local sharedFlagsModule = require(parent.Parent.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = sharedFlagsModule.FFlagHidePremiumIconography
local t = {
	[Enum.FriendStatus.Friend] = builderIconModule("two-people", "Filled"),
	[Enum.FriendStatus.FriendRequestReceived] = builderIconModule("person-clock", "Filled")
}
local var1 = builderIconModule("circle-slash")
local var2 = builderIconModule("hammer-code", "Filled")
local var3 = builderIconModule("person-check", "Filled")
local var4 = builderIconModule("premium")

local function _(p1)
	-- upvalues: var1 (ref), t (ref)
	return if p1 then if p1.isBlocked then var1 else t[p1.friendStatus] else nil
end

return function(p1, p2, p3, p4)
	-- upvalues: var1 (ref), t (ref), var2 (ref), var3 (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), var4 (ref)
	if not p1 then
		return nil
	end
	local var5 = if not p4 then nil elseif p4.isBlocked then var1 else t[p4.friendStatus]
	
	if var5 then
		return var5
	elseif p3 and p3.isPlaceOwner then
		return var2
	elseif p1.CustomPlayerIcons and p1.CustomPlayerIcons[p2.UserId] then
		return p1.CustomPlayerIcons[p2.UserId]
	elseif p3 and p3.specialGroupIcon then
		return p3.specialGroupIcon
	elseif p4 and p4.isFollowing then
		return var3
	end
	local var6 = p2.MembershipType == Enum.MembershipType.Premium
	
	if fFlagEnableBlackbirdCheck then
		return if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and p2.HasRobloxSubscription then p1.SubscriptionIcon elseif fFlagHidePremiumIconography or not var6 then nil else var4
	elseif var6 then
		return var4
	end
end