local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local _ = require(UserSearch.Common.LocalTypes)
local _ = require(Parent.GraphQLServer)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local SocialCommonModule = require(Parent.SocialCommon)
local UseMutualFriendsTextFunction = SocialCommonModule.Hooks.useMutualFriendsText
local ContextualInfoTypes = SocialCommonModule.Enums.ContextualInfoTypes
local PresenceType = require(UserSearch.Rodux.RoduxPresence).Enums.PresenceType
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local PresenceType1 = if FFlagUserSearchPresenceStoreMigrationModule then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local FFlagUserSearchUseThisIsYou = require(Parent.SharedFlags).FFlagUserSearchUseThisIsYou
local FFlagUserSearchClassmatesInsight = require(Parent.SharedFlags).FFlagUserSearchClassmatesInsight
local IconsStatusPlayerFriend = Images["icons/status/player/friend"]
local IconsStatusPlayerFollowing = Images["icons/status/player/following"]

local function v15(PreviousUsernames, Text: string) --[[ Line: 34 ]]
	if not PreviousUsernames or #PreviousUsernames == 0 then
		return false
	end
	for i = 1, #PreviousUsernames do
		if string.lower(PreviousUsernames[i]) == string.lower(Text) then
			return PreviousUsernames[i]
		end
	end
	return false
end

return function(p1) --[[ Line: 62 ]]
	-- upvalues: UseRelationshipSelectorModule (copy), UseLocalizationFunction (copy), FFlagUserSearchUseThisIsYou (copy), FFlagUserSearchClassmatesInsight (copy), UseMutualFriendsTextFunction (copy), ContextualInfoTypes (copy), v15 (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), PresenceType1 (copy), PresenceType (copy), IconsStatusPlayerFriend (copy), IconsStatusPlayerFollowing (copy)
	local UseRelationshipSelectorModuleResult = UseRelationshipSelectorModule(p1.userId)
	local ShouldUseCompactTiles = p1.shouldUseCompactTiles
	local ShouldUseCompactTiles1 = p1.shouldUseCompactTiles
	local UseLocalizationResult = UseLocalizationFunction({
		newUsername = "Feature.PlayerSearchResults.Label.NewUsername",
		frequents = "Feature.Friends.Label.Frequent",
		youAreFriends = if ShouldUseCompactTiles then nil else "Feature.PlayerSearchResults.Label.YouAreFriends",
		youAreFollowing = if ShouldUseCompactTiles then nil else "Feature.PlayerSearchResults.Label.YouAreFollowing",
		thisIsYou = if FFlagUserSearchUseThisIsYou then "Feature.PlayerSearchResults.Label.ThisIsYou" elseif ShouldUseCompactTiles then nil else "Feature.PlayerSearchResults.Label.ThisIsYou",
		friend = if ShouldUseCompactTiles then "Feature.Friends.Label.Friend" else nil,
		following = if ShouldUseCompactTiles then "Feature.Friends.Label.Following" else nil,
		you = if ShouldUseCompactTiles then "Feature.PlayerSearchResults.Label.You" else nil,
		classmates = if FFlagUserSearchClassmatesInsight then "Feature.Schools.Label.Classmates" else nil
	})
	local ProfileInsight = p1.profileInsight
	local CountMutualFriends: number = ProfileInsight and ProfileInsight.mutualFriends and #ProfileInsight.mutualFriends or 0
	local UseMutualFriendsTextResult = UseMutualFriendsTextFunction(CountMutualFriends)
	
	if UseRelationshipSelectorModuleResult.isMyself then
		return {
			text = if FFlagUserSearchUseThisIsYou then UseLocalizationResult.thisIsYou elseif ShouldUseCompactTiles then UseLocalizationResult.you else UseLocalizationResult.thisIsYou
		}, ContextualInfoTypes.IsMyself
	elseif v15(p1.previousUsernames, p1.searchKeyword) then
		return { text = UseLocalizationResult.newUsername }, ContextualInfoTypes.PreviousUsername
	elseif UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.Friend then
		if p1.shouldUseCompactTiles and ((if FFlagUserSearchPresenceStoreMigrationModule then p1.userPresence and p1.userPresence.userPresenceType == PresenceType1.InGame else p1.userPresence and p1.userPresence.userPresenceType == PresenceType.InGame) and p1.userPresence and p1.userPresence.lastLocation and p1.userPresence.universeId) then
			return { text = p1.userPresence.lastLocation }, ContextualInfoTypes.ExperienceLastLocation
		else
			return {
				text = if ShouldUseCompactTiles then UseLocalizationResult.friend else UseLocalizationResult.youAreFriends,
				icon = if ShouldUseCompactTiles1 then nil else IconsStatusPlayerFriend
			}, ContextualInfoTypes.Friend
		end
	elseif UseRelationshipSelectorModuleResult.following == true then
		return {
			text = if ShouldUseCompactTiles then UseLocalizationResult.following else UseLocalizationResult.youAreFollowing,
			icon = if ShouldUseCompactTiles1 then nil else IconsStatusPlayerFollowing
		}, ContextualInfoTypes.Following
	elseif ProfileInsight then
		if CountMutualFriends > 0 then
			return {
				text = UseMutualFriendsTextResult,
				icon = if ShouldUseCompactTiles1 then nil else IconsStatusPlayerFriend
			}, ContextualInfoTypes.MutualFriends
		elseif ProfileInsight.isOfflineFrequents then
			return { text = UseLocalizationResult.frequents }, ContextualInfoTypes.Frequents
		end
	end
	if FFlagUserSearchClassmatesInsight and ProfileInsight and ProfileInsight.isClassmate then
		return { text = UseLocalizationResult.classmates }, ContextualInfoTypes.Classmates
	else
		return nil, nil
	end
end