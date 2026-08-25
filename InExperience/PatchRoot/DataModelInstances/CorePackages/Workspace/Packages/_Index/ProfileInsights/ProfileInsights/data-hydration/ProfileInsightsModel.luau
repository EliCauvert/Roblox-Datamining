local parent = script:FindFirstAncestor("ProfileInsights").Parent
local cryoModule = require(parent.Cryo)
local createSignal = require(parent.Signals).createSignal
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

local function createProfileInsight(p0, p1)
	-- upvalues: cryoModule (ref), fFlagPlayerSearchEnableOnlineFrequents (ref)
	local t = {
		targetUserId = "",
		isOfflineFrequents = false,
		userId = p0,
		mutualFriends = {}
	}
	
	if not p1 or type(p1) ~= "table" then
		return t
	elseif p1.targetUser then
		t.targetUserId = tostring(p1.targetUser)
	end
	for i, v in p1.profileInsights do
		if v.mutualFriendInsight and v.mutualFriendInsight.mutualFriends then
			local mutualFriends = v.mutualFriendInsight.mutualFriends
			t.mutualFriends = cryoModule.List.foldLeft(cryoModule.Dictionary.keys(mutualFriends), function(p2, p3)
				-- upvalues: mutualFriends (ref)
				local var3 = mutualFriends[p3]
				table.insert(p2, {
					id = p3,
					username = var3.username,
					displayName = var3.displayName
				})
				
				return p2
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
		local var4, var5 = createSignal({})
		
		return { getProfileInsights = var4, setProfileInsights = var5 }
	end,
	createProfileInsightsList = function(p4)
		-- upvalues: createProfileInsight (ref)
		local t = {}
		
		if not p4 or type(p4) ~= "table" then
			return t
		end
		for i, v in p4 do
			table.insert(t, createProfileInsight(v.targetUser, v))
		end
		return t
	end,
	createProfileInsight = createProfileInsight
}