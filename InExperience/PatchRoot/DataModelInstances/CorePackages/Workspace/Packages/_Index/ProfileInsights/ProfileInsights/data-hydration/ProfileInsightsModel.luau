local Parent = script:FindFirstAncestor("ProfileInsights").Parent
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = require(Parent.Signals).createSignal
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagProfileInsightsParseClassmates = require(Parent.SharedFlags).FFlagProfileInsightsParseClassmates

local function createProfileInsight(UserId, p1)
	-- upvalues: CryoModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagProfileInsightsParseClassmates (copy)
	local config = {
		targetUserId = "",
		isOfflineFrequents = false,
		userId = UserId,
		mutualFriends = {}
	}
	
	if not p1 or type(p1) ~= "table" then
		return config
	end
	if p1.targetUser then
		config.targetUserId = tostring(p1.targetUser)
	end
	for _, profileInsight in p1.profileInsights do
		if profileInsight.mutualFriendInsight and profileInsight.mutualFriendInsight.mutualFriends then
			local MutualFriends = profileInsight.mutualFriendInsight.mutualFriends
			config.mutualFriends = CryoModule.List.foldLeft(CryoModule.Dictionary.keys(MutualFriends), function(List, Id)
				-- upvalues: MutualFriends (copy)
				local MutualFriend = MutualFriends[Id]
				table.insert(List, {
					id = Id,
					username = MutualFriend.username,
					displayName = MutualFriend.displayName
				})
				
				return List
			end, {})
		end
		if profileInsight.offlineFrequentsInsight then
			config.isOfflineFrequents = profileInsight.offlineFrequentsInsight.havePlayedTogether
		end
		if FFlagPlayerSearchEnableOnlineFrequents and profileInsight.playedTogetherInsight then
			local PlayedTogetherInsight = profileInsight.playedTogetherInsight
			config.isOfflineFrequents = config.isOfflineFrequents or PlayedTogetherInsight.havePlayedTogether
		end
		if profileInsight.friendshipAgeInsight then
			local FriendshipAgeInsight = profileInsight.friendshipAgeInsight
			config.friendshipAgeUnixSeconds = FriendshipAgeInsight.friendsSinceDateTime and FriendshipAgeInsight.friendsSinceDateTime.seconds or -1
		end
		if profileInsight.friendRequestOriginInsight then
			config.friendRequestOriginSource = profileInsight.friendRequestOriginInsight.friendRequestOriginSource or -1
		end
		if profileInsight.accountCreationDateInsight then
			local AccountCreationDateInsight = profileInsight.accountCreationDateInsight
			config.accountCreationDateUnixSeconds = AccountCreationDateInsight.accountCreatedDateTime and AccountCreationDateInsight.accountCreatedDateTime.seconds or -1
		end
		if profileInsight.accountLocationInsight then
			local AccountLocationInsight = profileInsight.accountLocationInsight
			config.localizedCountryName = AccountLocationInsight and AccountLocationInsight.localizedCountryName or ""
		end
		if FFlagProfileInsightsParseClassmates and profileInsight.classmatesInsight then
			config.isClassmate = profileInsight.classmatesInsight.isClassmate == true
		end
		if profileInsight.accountCreationDateInsight then
			local AccountCreationDateInsight = profileInsight.accountCreationDateInsight
			
			if AccountCreationDateInsight and AccountCreationDateInsight.namespace and AccountCreationDateInsight.verifiedAgeBandLabel then
				config.userAgeVerifiedBracket = `{AccountCreationDateInsight.namespace}.{AccountCreationDateInsight.verifiedAgeBandLabel}`
			end
		end
	end
	return config
end

return {
	createProfileInsightsSignalList = function()
		-- upvalues: CreateSignalFunction (copy)
		local Signal, Signal2 = CreateSignalFunction({})
		
		return {
			getProfileInsights = Signal,
			setProfileInsights = Signal2
		}
	end,
	createProfileInsightsList = function(List)
		-- upvalues: createProfileInsight (copy)
		local List1 = {}
		
		if not List or type(List) ~= "table" then
			return List1
		end
		for _, value in List do
			table.insert(List1, (createProfileInsight(value.targetUser, value)))
		end
		return List1
	end,
	createProfileInsight = createProfileInsight
}