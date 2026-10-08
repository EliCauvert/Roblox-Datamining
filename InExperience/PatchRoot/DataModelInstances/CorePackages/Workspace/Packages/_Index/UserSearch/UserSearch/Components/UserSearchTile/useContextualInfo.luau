local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local _ = require(userSearch.Common.LocalTypes)
local _ = require(parent.GraphQLServer)
local images = require(parent.UIBlox).App.ImageSet.Images
local socialCommonModule = require(parent.SocialCommon)
local useMutualFriendsText = socialCommonModule.Hooks.useMutualFriendsText
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local presenceType = require(userSearch.Rodux.RoduxPresence).Enums.PresenceType
local fFlagUserSearchPresenceStoreMigrationModule = require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local var1 = if fFlagUserSearchPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local fFlagUserSearchUseThisIsYou = require(parent.SharedFlags).FFlagUserSearchUseThisIsYou
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagUserSearchClassmatesInsight = require(parent.SharedFlags).FFlagUserSearchClassmatesInsight
local friend = images["icons/status/player/friend"]
local following = images["icons/status/player/following"]

local var2 = function(p1, p2)
	if not p1 or #p1 == 0 then
		return false
	end
	for i = 1, #p1 do
		if string.lower(p1[i]) ~= string.lower(p2) then
			continue
		end
		return p1[i]
	end
	return false
end

return function(p3)
	-- upvalues: useRelationshipSelectorModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), fFlagUserSearchUseThisIsYou (ref), fFlagUserSearchClassmatesInsight (ref), useMutualFriendsText (ref), contextualInfoTypes (ref), var2 (ref), fFlagUserSearchPresenceStoreMigrationModule (ref), var1 (ref), presenceType (ref), friend (ref), following (ref)
	local var3 = useRelationshipSelectorModule(p3.userId)
	local shouldUseCompactTiles = p3.shouldUseCompactTiles
	local shouldUseCompactTiles_1 = p3.shouldUseCompactTiles
	local var4 = useLocalization({
		newUsername = "Feature.PlayerSearchResults.Label.NewUsername",
		frequents = "Feature.Friends.Label.Frequent",
		youAreFriends = if shouldUseCompactTiles then nil elseif fFlagConnectionsToFriendsRename then "Feature.PlayerSearchResults.Label.YouAreFriends" else "Feature.PlayerSearchResults.Label.YouAreConnections",
		youAreFollowing = if shouldUseCompactTiles then nil else "Feature.PlayerSearchResults.Label.YouAreFollowing",
		thisIsYou = if fFlagUserSearchUseThisIsYou then "Feature.PlayerSearchResults.Label.ThisIsYou" elseif shouldUseCompactTiles then nil else "Feature.PlayerSearchResults.Label.ThisIsYou",
		friend = if shouldUseCompactTiles then if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.Friend" else "CommonUI.Features.Label.Connection" else nil,
		following = if shouldUseCompactTiles then "Feature.Friends.Label.Following" else nil,
		you = if shouldUseCompactTiles then "Feature.PlayerSearchResults.Label.You" else nil,
		classmates = if fFlagUserSearchClassmatesInsight then "Feature.Schools.Label.Classmates" else nil
	})
	local profileInsight = p3.profileInsight
	local var5 = profileInsight and (profileInsight.mutualFriends and (#profileInsight.mutualFriends or 0))
	local var6 = useMutualFriendsText(var5)
	
	if var3.isMyself then
		return {
			text = if fFlagUserSearchUseThisIsYou then var4.thisIsYou elseif shouldUseCompactTiles then var4.you else var4.thisIsYou
		}, contextualInfoTypes.IsMyself
	elseif var2(p3.previousUsernames, p3.searchKeyword) then
		return { text = var4.newUsername }, contextualInfoTypes.PreviousUsername
	elseif var3.status == Enum.FriendStatus.Friend then
		if p3.shouldUseCompactTiles then
			local userPresence
			if fFlagUserSearchPresenceStoreMigrationModule then
				userPresence = p3.userPresence
				
				if userPresence then
					userPresence = p3.userPresence.userPresenceType == var1.InGame
					userPresence = nil
				end
			else
				userPresence = p3.userPresence and p3.userPresence.userPresenceType == presenceType.InGame
			end
			if userPresence and p3.userPresence and (p3.userPresence.lastLocation and p3.userPresence.universeId) then
				return { text = p3.userPresence.lastLocation }, contextualInfoTypes.ExperienceLastLocation
			end
		end
		return {
			text = if shouldUseCompactTiles then var4.friend else var4.youAreFriends,
			icon = if shouldUseCompactTiles_1 then nil else friend
		}, contextualInfoTypes.Friend
	elseif var3.following == true then
		return {
			text = if shouldUseCompactTiles then var4.following else var4.youAreFollowing,
			icon = if shouldUseCompactTiles_1 then nil else following
		}, contextualInfoTypes.Following
	elseif profileInsight then
		if var5 > 0 then
			return {
				text = var6,
				icon = if shouldUseCompactTiles_1 then nil else friend
			}, contextualInfoTypes.MutualFriends
		elseif profileInsight.isOfflineFrequents then
			return { text = var4.frequents }, contextualInfoTypes.Frequents
		elseif fFlagUserSearchClassmatesInsight and profileInsight and profileInsight.isClassmate then
			return { text = var4.classmates }, contextualInfoTypes.Classmates
		end
		return nil, nil
	end
end