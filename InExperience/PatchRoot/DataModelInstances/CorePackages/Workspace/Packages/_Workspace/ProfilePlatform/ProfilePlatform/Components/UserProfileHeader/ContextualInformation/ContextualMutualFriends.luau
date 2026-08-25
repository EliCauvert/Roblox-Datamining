local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local playerContext = UIBloxModule.App.Indicator.PlayerContext
local userProfilesModule = require(parent.UserProfiles)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

local function truncateSomeNames(p0, p1)
	return if p1.shouldTruncateLongNames and #p0 >= 13 then string.format("%s%s", string.sub(p0, 1, 12), "\226\128\166") else p0
end

local function getNamesListText(p2, p3)
	-- upvalues: cryoModule (ref), truncateSomeNames (ref)
	local t = {}
	
	for i = 1, math.min(#p2, 3) do
		table.insert(t, p2[i])
	end
	return table.concat(cryoModule.List.map(t, function(p4)
		-- upvalues: truncateSomeNames (copy), p3 (ref)
		return truncateSomeNames(p4, p3)
	end), ", ")
end

local function _(p5, p6, p7)
	local oneMutualFriendText = p7.oneMutualFriendText
	local pluralMutualFriendsText = p7.pluralMutualFriendsText
	local oneOtherMutualFriendText = p7.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = p7.pluralOtherMutualFriendsText
	
	if p5 == 1 then
		return oneMutualFriendText
	elseif p5 <= 3 then
		return pluralMutualFriendsText
	end
	local var9 = p5 - p6
	
	return `+ {var9} {if var9 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
end

local _ = function(p8, p9, p10, p11)
	-- upvalues: getNamesListText (ref)
	local var12
	local var10 = getNamesListText(p9, p10)
	local minValue = math.min(#p9, 3)
	local oneMutualFriendText = p11.oneMutualFriendText
	local pluralMutualFriendsText = p11.pluralMutualFriendsText
	local oneOtherMutualFriendText = p11.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = p11.pluralOtherMutualFriendsText
	
	if p8 == 1 then
		var12 = oneMutualFriendText
	elseif p8 <= 3 then
		var12 = pluralMutualFriendsText
	else
		local var13 = p8 - minValue
		var12 = `+ {var13} {if var13 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
	end
	return `{var10} {var12}`
end

return function(p12)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), cryoModule (ref), userProfilesModule (ref), getNamesListText (ref), reactModule (ref), playerContext (ref), images (ref)
	local var14 = useLocalization({
		oneMutualFriendText = if fFlagConnectionsToFriendsRename then textKeysModule.OneMutualFriend else textKeysModule.OneMutualConnection,
		pluralMutualFriendsText = if fFlagConnectionsToFriendsRename then textKeysModule.PluralMutualFriends else textKeysModule.PluralMutualConnections,
		oneOtherMutualFriendText = if fFlagConnectionsToFriendsRename then textKeysModule.OneOtherMutualFriend else textKeysModule.OneOtherMutualConnection,
		pluralOtherMutualFriendsText = if fFlagConnectionsToFriendsRename then textKeysModule.PluralOtherMutualFriends else textKeysModule.PluralOtherMutualConnections
	})
	local mutualFriendsCount = p12.mutualFriendsCount
	local var15 = cryoModule.List.map(p12.mutualFriends, function(p13)
		return tostring(p13)
	end)
	local var16 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var15,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local t = {}
	local var18 = ""
	local mutualFriendsCount_1 = #p12.mutualFriends
	
	if var16.data then
		for i, v in ipairs(var15) do
			local combinedNameFromId = userProfilesModule.Selectors.getCombinedNameFromId(var16.data, v)
			var18 ..= combinedNameFromId
			
			if i ~= mutualFriendsCount_1 then
				var18 ..= ", "
			end
			t[i] = combinedNameFromId
		end
	end
	local var23
	local var21 = getNamesListText(t, { shouldTruncateLongNames = mutualFriendsCount > 1 })
	local minValue = math.min(#t, 3)
	local oneMutualFriendText = var14.oneMutualFriendText
	local pluralMutualFriendsText = var14.pluralMutualFriendsText
	local oneOtherMutualFriendText = var14.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = var14.pluralOtherMutualFriendsText
	
	if mutualFriendsCount == 1 then
		var23 = oneMutualFriendText
	elseif mutualFriendsCount <= 3 then
		var23 = pluralMutualFriendsText
	else
		local var24 = mutualFriendsCount - minValue
		var23 = `+ {var24} {if var24 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
	end
	return reactModule.createElement(playerContext, {
		textHeight = 30,
		icon = images["icons/status/player/friend"],
		text = `{var21} {var23}`
	})
end