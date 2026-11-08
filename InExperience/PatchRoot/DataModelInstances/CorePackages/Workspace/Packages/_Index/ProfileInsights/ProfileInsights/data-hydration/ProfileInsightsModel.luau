local Parent = script:FindFirstAncestor("ProfileInsights").Parent
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = require(Parent.Signals).createSignal
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagProfileInsightsParseClassmates = require(Parent.SharedFlags).FFlagProfileInsightsParseClassmates
local FFlagProfileInsightsKeyByRankingStrategy = require(Parent.SharedFlags).FFlagProfileInsightsKeyByRankingStrategy

local function _(p1): boolean
	return p1 ~= nil and p1 ~= -1
end

local config = {
	mutualFriendInsight = {
		field = "mutualFriends",
		hasValue = function(p1): boolean
			return #p1.mutualFriends > 0
		end
	},
	offlineFrequentsInsight = {
		field = "isOfflineFrequents",
		hasValue = function(p1): boolean
			return p1.isOfflineFrequents == true
		end
	},
	playedTogetherInsight = if FFlagPlayerSearchEnableOnlineFrequents then {
		field = "isOfflineFrequents",
		hasValue = function(p1): boolean
			return p1.isOfflineFrequents == true
		end
	} else nil,
	friendshipAgeInsight = {
		field = "friendshipAgeUnixSeconds",
		hasValue = function(p1): boolean
			local FriendshipAgeUnixSeconds = p1.friendshipAgeUnixSeconds
			
			return FriendshipAgeUnixSeconds ~= nil and FriendshipAgeUnixSeconds ~= -1
		end
	},
	friendRequestOriginInsight = {
		field = "friendRequestOriginSource",
		hasValue = function(p1): boolean
			local FriendRequestOriginSource = p1.friendRequestOriginSource
			
			return FriendRequestOriginSource ~= nil and FriendRequestOriginSource ~= -1
		end
	},
	accountCreationDateInsight = {
		field = "accountCreationDateUnixSeconds",
		hasValue = function(p1): boolean
			local AccountCreationDateUnixSeconds = p1.accountCreationDateUnixSeconds
			
			return AccountCreationDateUnixSeconds ~= nil and AccountCreationDateUnixSeconds ~= -1
		end
	},
	accountLocationInsight = {
		field = "localizedCountryName",
		hasValue = function(p1): boolean
			local LocalizedCountryName = p1.localizedCountryName
			
			return LocalizedCountryName ~= nil and LocalizedCountryName ~= ""
		end
	},
	classmatesInsight = if FFlagProfileInsightsParseClassmates then {
		field = "isClassmate",
		hasValue = function(p1): boolean
			return p1.isClassmate == true
		end
	} else nil
}

local function getRankedInsightKeys(ProfileInsights, p1)
	-- upvalues: config (copy)
	local List = {}
	
	for _, profileInsight in ProfileInsights do
		for i, value in config do
			if profileInsight[i] and value and table.find(List, value.field) == nil and value.hasValue(p1) then
				table.insert(List, value.field)
			end
		end
	end
	return List
end

local function createProfileInsight(UserId, p2)
	-- upvalues: CryoModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagProfileInsightsParseClassmates (copy), FFlagProfileInsightsKeyByRankingStrategy (copy), getRankedInsightKeys (copy)
	local config = {
		targetUserId = "",
		isOfflineFrequents = false,
		userId = UserId,
		mutualFriends = {}
	}
	
	if not p2 or type(p2) ~= "table" then
		return config
	end
	if p2.targetUser then
		config.targetUserId = tostring(p2.targetUser)
	end
	for _, profileInsight in p2.profileInsights do
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
	if FFlagProfileInsightsKeyByRankingStrategy then
		config.rankedInsightKeys = getRankedInsightKeys(p2.profileInsights, config)
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