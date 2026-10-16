local Parent = script.Parent.Parent
local BuilderIconModule = require(Parent.Common.builderIcon)
local SharedFlagsModule = require(Parent.Parent.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local config = {
	[Enum.FriendStatus.Friend] = BuilderIconModule("two-people", "Filled"),
	[Enum.FriendStatus.FriendRequestReceived] = BuilderIconModule("person-clock", "Filled")
}
local CircleSlash = BuilderIconModule("circle-slash")
local HammerCode = BuilderIconModule("hammer-code", "Filled")
local PersonCheck = BuilderIconModule("person-check", "Filled")
local Premium = BuilderIconModule("premium")

local function _(p1) --[[ Line: 20 | Named "getSocialIcon" ]]
	-- upvalues: CircleSlash (copy), config (copy)
	return if p1 then if p1.isBlocked then CircleSlash else config[p1.friendStatus] else nil
end

return function(p1, Player: Player, p2, p3) --[[ Line: 30 | Named "getPlayerBadgeIcon" ]]
	-- upvalues: CircleSlash (copy), config (copy), HammerCode (copy), PersonCheck (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), Premium (copy)
	if not p1 then
		return nil
	end
	local CircleSlash1 = if p3 then if p3.isBlocked then CircleSlash else config[p3.friendStatus] else nil
	
	if CircleSlash1 then
		return CircleSlash1
	end
	if p2 and p2.isPlaceOwner then
		return HammerCode
	end
	if p1.CustomPlayerIcons and p1.CustomPlayerIcons[Player.UserId] then
		return p1.CustomPlayerIcons[Player.UserId]
	end
	if p2 and p2.specialGroupIcon then
		return p2.specialGroupIcon
	end
	if p3 and p3.isFollowing then
		return PersonCheck
	end
	local IsMembershipTypeMatch = Player.MembershipType == Enum.MembershipType.Premium
	
	if FFlagEnableBlackbirdCheck then
		if game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and Player.HasRobloxSubscription then
			return p1.SubscriptionIcon
		elseif not FFlagHidePremiumIconography and IsMembershipTypeMatch then
			return Premium
		end
	elseif IsMembershipTypeMatch then
		return Premium
	end
	return nil
end