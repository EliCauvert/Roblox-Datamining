local parent = script:FindFirstAncestor("ProfileInsights").Parent
local cryoModule = require(parent.Cryo)
local createSignal = require(parent.Signals).createSignal
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

local function createProfileInsight(p1, p2)
	-- upvalues: cryoModule (ref), fFlagPlayerSearchEnableOnlineFrequents (ref)
	local t = {
		targetUserId = "",
		isOfflineFrequents = false,
		userId = p1,
		mutualFriends = {}
	}
	
	if not p2 or type(p2) ~= "table" then
		return t
	elseif p2.targetUser then
		t.targetUserId = tostring(p2.targetUser)
	end
	for i, v in p2.profileInsights do
		if v.mutualFriendInsight and v.mutualFriendInsight.mutualFriends then
			local mutualFriends = v.mutualFriendInsight.mutualFriends
			t.mutualFriends = cryoModule.List.foldLeft(cryoModule.Dictionary.keys(mutualFriends), function(p3, p4)
				-- upvalues: mutualFriends (ref)
				local var1 = mutualFriends[p4]
				table.insert(p3, {
					id = p4,
					username = var1.username,
					displayName = var1.displayName
				})
				
				return p3
			end, {})
		end
		if v.offlineFrequentsInsight then
			t.isOfflineFrequents = v.offlineFrequentsInsight.havePlayedTogether
		end
		if fFlagPlayerSearchEnableOnlineFrequents and v.playedTogetherInsight then
			t.isOfflineFrequents = t.isOfflineFrequents or v.playedTogetherInsight.havePlayedTogether
		end
		if v.friendshipAgeInsight then
			local friendshipAgeInsight = v.friendshipAgeInsight
			t.friendshipAgeUnixSeconds = if friendshipAgeInsight.friendsSinceDateTime then friendshipAgeInsight.friendsSinceDateTime.seconds else -1
		end
		if v.friendRequestOriginInsight then
			t.friendRequestOriginSource = v.friendRequestOriginInsight.friendRequestOriginSource or -1
		end
		if v.accountCreationDateInsight then
			local accountCreationDateInsight = v.accountCreationDateInsight
			t.accountCreationDateUnixSeconds = if accountCreationDateInsight.accountCreatedDateTime then accountCreationDateInsight.accountCreatedDateTime.seconds else -1
		end
		if v.accountLocationInsight then
			local accountLocationInsight = v.accountLocationInsight
			t.localizedCountryName = if accountLocationInsight then accountLocationInsight.localizedCountryName else ""
		end
		if v.accountCreationDateInsight then
			local accountCreationDateInsight = v.accountCreationDateInsight
			
			if accountCreationDateInsight and accountCreationDateInsight.namespace and accountCreationDateInsight.verifiedAgeBandLabel then
				t.userAgeVerifiedBracket = `{accountCreationDateInsight.namespace}.{accountCreationDateInsight.verifiedAgeBandLabel}`
			end
		end
	end
	return t
end

return {
	createProfileInsightsSignalList = function()
		-- upvalues: createSignal (ref)
		local var1, var2 = createSignal({})
		
		return { getProfileInsights = var1, setProfileInsights = var2 }
	end,
	createProfileInsightsList = function(p3)
		-- upvalues: createProfileInsight (ref)
		local t = {}
		
		if not p3 or type(p3) ~= "table" then
			return t
		end
		for i, v in p3 do
			table.insert(t, createProfileInsight(v.targetUser, v))
		end
		return t
	end,
	createProfileInsight = createProfileInsight
}