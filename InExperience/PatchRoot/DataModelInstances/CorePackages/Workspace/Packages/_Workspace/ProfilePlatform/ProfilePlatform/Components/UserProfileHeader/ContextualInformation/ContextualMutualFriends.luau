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

local function truncateSomeNames(p1, p2)
	return if p2.shouldTruncateLongNames and #p1 >= 13 then string.format("%s%s", string.sub(p1, 1, 12), "\226\128\166") else p1
end

local function getNamesListText(p1, p2)
	-- upvalues: cryoModule (ref), truncateSomeNames (ref)
	local t = {}
	
	for i = 1, math.min(#p1, 3) do
		table.insert(t, p1[i])
	end
	return table.concat(cryoModule.List.map(t, function(p3)
		-- upvalues: truncateSomeNames (copy), p2 (ref)
		return truncateSomeNames(p3, p2)
	end), ", ")
end

local function _(p3, p4, p5)
	local oneMutualFriendText = p5.oneMutualFriendText
	local pluralMutualFriendsText = p5.pluralMutualFriendsText
	local oneOtherMutualFriendText = p5.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = p5.pluralOtherMutualFriendsText
	
	if p3 == 1 then
		return oneMutualFriendText
	elseif p3 <= 3 then
		return pluralMutualFriendsText
	end
	local var1 = p3 - p4
	
	return `+ {var1} {if var1 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
end

local _ = function(p6, p7, p8, p9)
	-- upvalues: getNamesListText (ref)
	local var2
	local var3 = getNamesListText(p7, p8)
	local minValue = math.min(#p7, 3)
	local oneMutualFriendText = p9.oneMutualFriendText
	local pluralMutualFriendsText = p9.pluralMutualFriendsText
	local oneOtherMutualFriendText = p9.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = p9.pluralOtherMutualFriendsText
	
	if p6 == 1 then
		var2 = oneMutualFriendText
	elseif p6 <= 3 then
		var2 = pluralMutualFriendsText
	else
		local var4 = p6 - minValue
		var2 = `+ {var4} {if var4 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
	end
	return `{var3} {var2}`
end

return function(p10)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), cryoModule (ref), userProfilesModule (ref), getNamesListText (ref), reactModule (ref), playerContext (ref), images (ref)
	local var5 = useLocalization({
		oneMutualFriendText = if fFlagConnectionsToFriendsRename then textKeysModule.OneMutualFriend else textKeysModule.OneMutualConnection,
		pluralMutualFriendsText = if fFlagConnectionsToFriendsRename then textKeysModule.PluralMutualFriends else textKeysModule.PluralMutualConnections,
		oneOtherMutualFriendText = if fFlagConnectionsToFriendsRename then textKeysModule.OneOtherMutualFriend else textKeysModule.OneOtherMutualConnection,
		pluralOtherMutualFriendsText = if fFlagConnectionsToFriendsRename then textKeysModule.PluralOtherMutualFriends else textKeysModule.PluralOtherMutualConnections
	})
	local mutualFriendsCount = p10.mutualFriendsCount
	local var6 = cryoModule.List.map(p10.mutualFriends, function(p11)
		return tostring(p11)
	end)
	local var7 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = var6,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local t = {}
	local var8 = ""
	local mutualFriendsCount_1 = #p10.mutualFriends
	
	if var7.data then
		for i, v in ipairs(var6) do
			local combinedNameFromId = userProfilesModule.Selectors.getCombinedNameFromId(var7.data, v)
			var8 ..= combinedNameFromId
			
			if i ~= mutualFriendsCount_1 then
				var8 ..= ", "
			end
			t[i] = combinedNameFromId
		end
	end
	local var9
	local var10 = getNamesListText(t, { shouldTruncateLongNames = mutualFriendsCount > 1 })
	local minValue = math.min(#t, 3)
	local oneMutualFriendText = var5.oneMutualFriendText
	local pluralMutualFriendsText = var5.pluralMutualFriendsText
	local oneOtherMutualFriendText = var5.oneOtherMutualFriendText
	local pluralOtherMutualFriendsText = var5.pluralOtherMutualFriendsText
	
	if mutualFriendsCount == 1 then
		var9 = oneMutualFriendText
	elseif mutualFriendsCount <= 3 then
		var9 = pluralMutualFriendsText
	else
		local var11 = mutualFriendsCount - minValue
		var9 = `+ {var11} {if var11 == 1 then oneOtherMutualFriendText else pluralOtherMutualFriendsText}`
	end
	return reactModule.createElement(playerContext, {
		textHeight = 30,
		icon = images["icons/status/player/friend"],
		text = `{var10} {var9}`
	})
end