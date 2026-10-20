local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local PlayerContext = UIBloxModule.App.Indicator.PlayerContext
local UserProfilesModule = require(Parent.UserProfiles)

local function truncateSomeNames(Text: string, p1): string
	return if p1.shouldTruncateLongNames and #Text >= 13 then string.format("%s%s", string.sub(Text, 1, 12), "…") else Text
end

local function getNamesListText(CombinedNameFromIds, p1): string
	-- upvalues: CryoModule (copy), truncateSomeNames (copy)
	local List = {}
	
	for i = 1, math.min(#CombinedNameFromIds, 3) do
		table.insert(List, CombinedNameFromIds[i])
	end
	return table.concat(CryoModule.List.map(List, function(p2)
		-- upvalues: truncateSomeNames (upval), p1 (copy)
		return truncateSomeNames(p2, p1)
	end), ", ")
end

local function _(p2: number, p3: number, p4)
	local OneMutualFriendText = p4.oneMutualFriendText
	local PluralMutualFriendsText = p4.pluralMutualFriendsText
	local OneOtherMutualFriendText = p4.oneOtherMutualFriendText
	local PluralOtherMutualFriendsText = p4.pluralOtherMutualFriendsText
	
	if p2 == 1 then
		return OneMutualFriendText
	elseif p2 <= 3 then
		return PluralMutualFriendsText
	else
		local v1 = p2 - p3
		
		return `+ {v1} {if v1 == 1 then OneOtherMutualFriendText else PluralOtherMutualFriendsText}`
	end
end

local _ = function(p5: number, p6, p7, p8): string
	-- upvalues: getNamesListText (copy)
	local NamesListText = getNamesListText(p6, p7)
	local Smallest = math.min(#p6, 3)
	local OneMutualFriendText = p8.oneMutualFriendText
	local PluralMutualFriendsText = p8.pluralMutualFriendsText
	local OneOtherMutualFriendText = p8.oneOtherMutualFriendText
	local PluralOtherMutualFriendsText = p8.pluralOtherMutualFriendsText
	local OneMutualFriendText1 = nil
	
	if p5 == 1 then
		OneMutualFriendText1 = OneMutualFriendText
	elseif p5 <= 3 then
		OneMutualFriendText1 = PluralMutualFriendsText
	else
		local v2 = p5 - Smallest
		OneMutualFriendText1 = `+ {v2} {if v2 == 1 then OneOtherMutualFriendText else PluralOtherMutualFriendsText}`
	end
	return `{NamesListText} {OneMutualFriendText1}`
end

return function(p9)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), CryoModule (copy), UserProfilesModule (copy), getNamesListText (copy), ReactModule (copy), PlayerContext (copy), Images (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		oneMutualFriendText = TextKeysModule.OneMutualFriend,
		pluralMutualFriendsText = TextKeysModule.PluralMutualFriends,
		oneOtherMutualFriendText = TextKeysModule.OneOtherMutualFriend,
		pluralOtherMutualFriendsText = TextKeysModule.PluralOtherMutualFriends
	})
	local MutualFriendsCount: number = p9.mutualFriendsCount
	local MapResult = CryoModule.List.map(p9.mutualFriends, function(p10): string
		return (tostring(p10))
	end)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = MapResult,
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local CombinedNameFromIds = {}
	local Text = ""
	local CountMutualFriends = #p9.mutualFriends
	
	if UseUserProfilesFetchResult.data then
		for i, value in ipairs(MapResult) do
			local CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, value)
			Text ..= CombinedNameFromId
			
			if i ~= CountMutualFriends then
				Text ..= ", "
			end
			CombinedNameFromIds[i] = CombinedNameFromId
		end
	end
	local NamesListText = getNamesListText(CombinedNameFromIds, { shouldTruncateLongNames = MutualFriendsCount > 1 })
	local Smallest = math.min(#CombinedNameFromIds, 3)
	local OneMutualFriendText = UseLocalizationResult.oneMutualFriendText
	local PluralMutualFriendsText = UseLocalizationResult.pluralMutualFriendsText
	local OneOtherMutualFriendText = UseLocalizationResult.oneOtherMutualFriendText
	local PluralOtherMutualFriendsText = UseLocalizationResult.pluralOtherMutualFriendsText
	local OneMutualFriendText1 = nil
	
	if MutualFriendsCount == 1 then
		OneMutualFriendText1 = OneMutualFriendText
	elseif MutualFriendsCount <= 3 then
		OneMutualFriendText1 = PluralMutualFriendsText
	else
		local MutualFriendsCountDelta = MutualFriendsCount - Smallest
		OneMutualFriendText1 = `+ {MutualFriendsCountDelta} {if MutualFriendsCountDelta == 1 then OneOtherMutualFriendText else PluralOtherMutualFriendsText}`
	end
	return ReactModule.createElement(PlayerContext, {
		textHeight = 30,
		icon = Images["icons/status/player/friend"],
		text = `{NamesListText} {OneMutualFriendText1}`
	})
end