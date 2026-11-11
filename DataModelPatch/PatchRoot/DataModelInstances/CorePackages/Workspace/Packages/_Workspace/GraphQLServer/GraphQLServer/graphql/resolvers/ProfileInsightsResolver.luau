local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local HttpService = game:GetService("HttpService")
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.Parent.generatedTypes)
local _ = require(Parent.LuauPolyfill)
local ProfileInsightsConnectorModule = require(script.Parent.Parent.connectors.ProfileInsightsConnector)
local FindProfileInsightsByUserIdsFunction = ProfileInsightsConnectorModule.findProfileInsightsByUserIds
local FindProfileInsightsByUserIdsFeedFunction = ProfileInsightsConnectorModule.findProfileInsightsByUserIdsFeed
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

local function _(p1, p2)
	for _, profileInsight in p1.profileInsights do
		if profileInsight[p2] then
			return profileInsight[p2]
		end
	end
	return {}
end

return {
	ProfileInsights = {
		targetUserId = function(p3)
			return p3.targetUser
		end,
		mutualFriends = function(p3)
			-- upvalues: CryoModule (copy)
			local MutualFriendInsight = nil
			for _, profileInsight in p3.profileInsights do
				if profileInsight.mutualFriendInsight then
					MutualFriendInsight = profileInsight.mutualFriendInsight
					local MutualFriends = if MutualFriendInsight then MutualFriendInsight.mutualFriends else {}
					
					return if MutualFriends then CryoModule.List.foldLeft(CryoModule.Dictionary.keys(MutualFriends), function(List, Id)
						-- upvalues: MutualFriends (copy)
						local MutualFriend = MutualFriends[Id]
						table.insert(List, {
							id = Id,
							username = MutualFriend.username,
							displayName = MutualFriend.displayName
						})
						
						return List
					end, {}) else {}
				end
			end
			MutualFriendInsight = {}
		end,
		isOfflineFrequents = function(p4): boolean
			-- upvalues: FFlagPlayerSearchEnableOnlineFrequents (copy)
			local OfflineFrequentsInsight = nil
			for _, profileInsight in p4.profileInsights do
				if profileInsight.offlineFrequentsInsight then
					OfflineFrequentsInsight = profileInsight.offlineFrequentsInsight
					local PlayedTogetherInsight = nil
					if FFlagPlayerSearchEnableOnlineFrequents then
						for _, profileInsight1 in p4.profileInsights do
							if profileInsight1.playedTogetherInsight then
								PlayedTogetherInsight = profileInsight1.playedTogetherInsight
							else
								continue
							end
						end
						PlayedTogetherInsight = {}
					else
						PlayedTogetherInsight = nil
					end
					if not FFlagPlayerSearchEnableOnlineFrequents then
						return if OfflineFrequentsInsight and OfflineFrequentsInsight.havePlayedTogether then true else false
					elseif OfflineFrequentsInsight and OfflineFrequentsInsight.havePlayedTogether or PlayedTogetherInsight and PlayedTogetherInsight.havePlayedTogether then
						return true
					else
						return false
					end
				end
			end
			OfflineFrequentsInsight = {}
		end,
		friendshipAgeUnixSeconds = function(p5)
			local FriendshipAgeInsight = nil
			for _, profileInsight in p5.profileInsights do
				if profileInsight.friendshipAgeInsight then
					FriendshipAgeInsight = profileInsight.friendshipAgeInsight
					return FriendshipAgeInsight.friendsSinceDateTime and FriendshipAgeInsight.friendsSinceDateTime.seconds or -1
				end
			end
			FriendshipAgeInsight = {}
		end,
		friendRequestOriginSource = function(p6)
			local FriendRequestOriginInsight = nil
			for _, profileInsight in p6.profileInsights do
				if profileInsight.friendRequestOriginInsight then
					FriendRequestOriginInsight = profileInsight.friendRequestOriginInsight
					return FriendRequestOriginInsight.friendRequestOriginSource or -1
				end
			end
			FriendRequestOriginInsight = {}
		end,
		accountCreationDateUnixSeconds = function(p7)
			local AccountCreationDateInsight = nil
			for _, profileInsight in p7.profileInsights do
				if profileInsight.accountCreationDateInsight then
					AccountCreationDateInsight = profileInsight.accountCreationDateInsight
					return AccountCreationDateInsight.accountCreatedDateTime and AccountCreationDateInsight.accountCreatedDateTime.seconds or -1
				end
			end
			AccountCreationDateInsight = {}
		end,
		localizedCountryName = function(p8)
			local AccountLocationInsight = nil
			for _, profileInsight in p8.profileInsights do
				if profileInsight.accountLocationInsight then
					AccountLocationInsight = profileInsight.accountLocationInsight
					return AccountLocationInsight and AccountLocationInsight.localizedCountryName or ""
				end
			end
			AccountLocationInsight = {}
		end,
		userAgeVerifiedBracket = function(p9): string
			local UserAgeVerifiedInsight = nil
			for _, profileInsight in p9.profileInsights do
				if profileInsight.userAgeVerifiedInsight then
					UserAgeVerifiedInsight = profileInsight.userAgeVerifiedInsight
					return if UserAgeVerifiedInsight and UserAgeVerifiedInsight.namespace and UserAgeVerifiedInsight.verifiedAgeBandLabel then `{UserAgeVerifiedInsight.namespace}.{UserAgeVerifiedInsight.verifiedAgeBandLabel}` else ""
				end
			end
			UserAgeVerifiedInsight = {}
		end
	},
	ProfileInsightsPages = {
		id = function(p10)
			-- upvalues: HttpService (copy)
			return if p10.pageId then p10.pageId else HttpService:GenerateGUID(false)
		end,
		profileInsights = function(p10)
			return p10.profileInsights
		end
	},
	Query = {
		profilesInsights = function(_, p10, p11)
			-- upvalues: FindProfileInsightsByUserIdsFeedFunction (copy), FFlagPlayerSearchEnableOnlineFrequents (copy)
			return FindProfileInsightsByUserIdsFeedFunction(p10.userIds, p10.count, p10.pageId, if FFlagPlayerSearchEnableOnlineFrequents then p10.rankingStrategy else nil, p11.fetchImpl)
		end,
		profilesInsightsByUserIds = function(_, p10, p11)
			-- upvalues: FindProfileInsightsByUserIdsFunction (copy)
			return FindProfileInsightsByUserIdsFunction(p10.userIds, p10.count, p10.rankingStrategy, p11.fetchImpl)
		end
	}
}