local fFlagLuaAppUserSeenCollectionUnifiedFields = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.SharedFlags).FFlagLuaAppUserSeenCollectionUnifiedFields

return function(p0, p1) --[[ line: 32 | named "buildUserSeenCollectionPayload" ]]
	-- upvalues: fFlagLuaAppUserSeenCollectionUnifiedFields (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	
	for i, v in p0 do
		table.insert(t, tostring(v.userId))
		table.insert(t_1, tostring(v.index))
		table.insert(t_2, tostring(v.presence))
		table.insert(t_3, tostring(v.recommendationRank))
		table.insert(t_4, tostring(v.friendStatus))
		table.insert(t_5, tostring(v.recommendationContextType))
		table.insert(t_6, tostring(v.isRecommendation))
		table.insert(t_7, tostring(v.universeId))
	end
	return {
		userIds = table.concat(t, ","),
		absolutePositions = table.concat(t_1, ","),
		presences = table.concat(t_2, ","),
		recommendationRanks = table.concat(t_3, ","),
		friendStatuses = table.concat(t_4, ","),
		recommendationContextTypes = table.concat(t_5, ","),
		isRecommendations = table.concat(t_6, ","),
		universeIds = table.concat(t_7, ","),
		tileCount = #t,
		sessionEventCount = p1,
		contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then "User" else nil
	}
end