local parent = script:FindFirstAncestor("GraphQLServer").Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.Parent.generatedTypes)
local _ = require(parent.LuauPolyfill)
local profileInsightsConnectorModule = require(script.Parent.Parent.connectors.ProfileInsightsConnector)
local findProfileInsightsByUserIds = profileInsightsConnectorModule.findProfileInsightsByUserIds
local findProfileInsightsByUserIdsFeed = profileInsightsConnectorModule.findProfileInsightsByUserIdsFeed
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

local _ = function(p0, p1)
	for i, v in p0.profileInsights do
		if v[p1] then
			return v[p1]
		end
	end
	return {}
end

return {
	ProfileInsights = {
		targetUserId = function(p2)
			return p2.targetUser
		end,
		mutualFriends = function(p3)
			-- upvalues: cryoModule (ref)
			local t
			local _ = nil
			
			for i, v in p3.profileInsights do
				if v.mutualFriendInsight then
					t = v.mutualFriendInsight
					local var4 = if t then t.mutualFriends else {}
					
					return if var4 then cryoModule.List.foldLeft(cryoModule.Dictionary.keys(var4), function(p4, p5)
						-- upvalues: var4 (ref)
						local var5 = var4[p5]
						table.insert(p4, {
							id = p5,
							username = var5.username,
							displayName = var5.displayName
						})
						
						return p4
					end, {}) else {}
				end
			end
			t = {}
		end,
		isOfflineFrequents = function(p6)
			-- upvalues: fFlagPlayerSearchEnableOnlineFrequents (ref)
			local t
			local _ = nil
			local _ = nil
			
			for i, v in p6.profileInsights do
				if v.offlineFrequentsInsight then
					t = v.offlineFrequentsInsight
					local t_1
					if fFlagPlayerSearchEnableOnlineFrequents then
						for i, v in p6.profileInsights do
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
		friendshipAgeUnixSeconds = function(p7)
			local t
			for i, v in p7.profileInsights do
				if v.friendshipAgeInsight then
					t = v.friendshipAgeInsight
					return if t.friendsSinceDateTime then t.friendsSinceDateTime.seconds else -1
				end
			end
			t = {}
		end,
		friendRequestOriginSource = function(p8)
			local t
			for i, v in p8.profileInsights do
				if v.friendRequestOriginInsight then
					t = v.friendRequestOriginInsight
					return t.friendRequestOriginSource or -1
				end
			end
			t = {}
		end,
		accountCreationDateUnixSeconds = function(p9)
			local t
			for i, v in p9.profileInsights do
				if v.accountCreationDateInsight then
					t = v.accountCreationDateInsight
					return if t.accountCreatedDateTime then t.accountCreatedDateTime.seconds else -1
				end
			end
			t = {}
		end,
		localizedCountryName = function(p10)
			local t
			for i, v in p10.profileInsights do
				if v.accountLocationInsight then
					t = v.accountLocationInsight
					return if t then t.localizedCountryName else ""
				end
			end
			t = {}
		end,
		userAgeVerifiedBracket = function(p11)
			local t
			for i, v in p11.profileInsights do
				if v.userAgeVerifiedInsight then
					t = v.userAgeVerifiedInsight
					return if t and t.namespace and t.verifiedAgeBandLabel then `{t.namespace}.{t.verifiedAgeBandLabel}` else ""
				end
			end
			t = {}
		end
	},
	ProfileInsightsPages = {
		id = function(p12)
			-- upvalues: httpService (ref)
			return if p12.pageId then p12.pageId else httpService:GenerateGUID(false)
		end,
		profileInsights = function(p13)
			return p13.profileInsights
		end
	},
	Query = {
		profilesInsights = function(_, p14, p15)
			-- upvalues: findProfileInsightsByUserIdsFeed (ref), fFlagPlayerSearchEnableOnlineFrequents (ref)
			return findProfileInsightsByUserIdsFeed(p14.userIds, p14.count, p14.pageId, if fFlagPlayerSearchEnableOnlineFrequents then p14.rankingStrategy else nil, p15.fetchImpl)
		end,
		profilesInsightsByUserIds = function(_, p16, p17)
			-- upvalues: findProfileInsightsByUserIds (ref)
			return findProfileInsightsByUserIds(p16.userIds, p16.count, p16.rankingStrategy, p17.fetchImpl)
		end
	}
}