local parent = script:FindFirstAncestor("GraphQLServer").Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.Parent.generatedTypes)
local _ = require(parent.LuauPolyfill)
local profileInsightsConnectorModule = require(script.Parent.Parent.connectors.ProfileInsightsConnector)
local findProfileInsightsByUserIds = profileInsightsConnectorModule.findProfileInsightsByUserIds
local findProfileInsightsByUserIdsFeed = profileInsightsConnectorModule.findProfileInsightsByUserIdsFeed
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

local _ = function(p1, p2)
	for i, v in p1.profileInsights do
		if v[p2] then
			return v[p2]
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
			-- upvalues: cryoModule (ref)
			local t
			local _ = nil
			
			for i, v in p3.profileInsights do
				if v.mutualFriendInsight then
					t = v.mutualFriendInsight
					local var1 = if t then t.mutualFriends else {}
					
					return if var1 then cryoModule.List.foldLeft(cryoModule.Dictionary.keys(var1), function(p4, p5)
						-- upvalues: var1 (ref)
						local var2 = var1[p5]
						table.insert(p4, {
							id = p5,
							username = var2.username,
							displayName = var2.displayName
						})
						
						return p4
					end, {}) else {}
				end
			end
			t = {}
		end,
		isOfflineFrequents = function(p4)
			-- upvalues: fFlagPlayerSearchEnableOnlineFrequents (ref)
			local t
			local _ = nil
			local _ = nil
			
			for i, v in p4.profileInsights do
				if v.offlineFrequentsInsight then
					t = v.offlineFrequentsInsight
					local t_1
					if fFlagPlayerSearchEnableOnlineFrequents then
						for i, v in p4.profileInsights do
							if v.playedTogetherInsight then
								t_1 = v.playedTogetherInsight
							end
						end
						t_1 = {}
					else
						t_1 = nil
					end
					return if fFlagPlayerSearchEnableOnlineFrequents then t and t.havePlayedTogether or t_1 and t_1.havePlayedTogether else t and t.havePlayedTogether
				end
			end
			t = {}
		end,
		friendshipAgeUnixSeconds = function(p5)
			local t
			for i, v in p5.profileInsights do
				if v.friendshipAgeInsight then
					t = v.friendshipAgeInsight
					return if t.friendsSinceDateTime then t.friendsSinceDateTime.seconds else -1
				end
			end
			t = {}
		end,
		friendRequestOriginSource = function(p6)
			local t
			for i, v in p6.profileInsights do
				if v.friendRequestOriginInsight then
					t = v.friendRequestOriginInsight
					return t.friendRequestOriginSource or -1
				end
			end
			t = {}
		end,
		accountCreationDateUnixSeconds = function(p7)
			local t
			for i, v in p7.profileInsights do
				if v.accountCreationDateInsight then
					t = v.accountCreationDateInsight
					return if t.accountCreatedDateTime then t.accountCreatedDateTime.seconds else -1
				end
			end
			t = {}
		end,
		localizedCountryName = function(p8)
			local t
			for i, v in p8.profileInsights do
				if v.accountLocationInsight then
					t = v.accountLocationInsight
					return if t then t.localizedCountryName else ""
				end
			end
			t = {}
		end,
		userAgeVerifiedBracket = function(p9)
			local t
			for i, v in p9.profileInsights do
				if v.userAgeVerifiedInsight then
					t = v.userAgeVerifiedInsight
					return if t and t.namespace and t.verifiedAgeBandLabel then `{t.namespace}.{t.verifiedAgeBandLabel}` else ""
				end
			end
			t = {}
		end
	},
	ProfileInsightsPages = {
		id = function(p10)
			-- upvalues: httpService (ref)
			return if p10.pageId then p10.pageId else httpService:GenerateGUID(false)
		end,
		profileInsights = function(p10)
			return p10.profileInsights
		end
	},
	Query = {
		profilesInsights = function(_, p10, p11)
			-- upvalues: findProfileInsightsByUserIdsFeed (ref), fFlagPlayerSearchEnableOnlineFrequents (ref)
			return findProfileInsightsByUserIdsFeed(p10.userIds, p10.count, p10.pageId, if fFlagPlayerSearchEnableOnlineFrequents then p10.rankingStrategy else nil, p11.fetchImpl)
		end,
		profilesInsightsByUserIds = function(_, p10, p11)
			-- upvalues: findProfileInsightsByUserIds (ref)
			return findProfileInsightsByUserIds(p10.userIds, p10.count, p10.rankingStrategy, p11.fetchImpl)
		end
	}
}