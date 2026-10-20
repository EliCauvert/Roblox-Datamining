local FFlagLuaAppUserSeenCollectionUnifiedFields = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.SharedFlags).FFlagLuaAppUserSeenCollectionUnifiedFields

return function(List, SessionEventCount)
	-- upvalues: FFlagLuaAppUserSeenCollectionUnifiedFields (copy)
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	local List5 = {}
	local List6 = {}
	local List7 = {}
	local List8 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value.userId)))
		table.insert(List2, (tostring(value.index)))
		table.insert(List3, (tostring(value.presence)))
		table.insert(List4, (tostring(value.recommendationRank)))
		table.insert(List5, (tostring(value.friendStatus)))
		table.insert(List6, (tostring(value.recommendationContextType)))
		table.insert(List7, (tostring(value.isRecommendation)))
		table.insert(List8, (tostring(value.universeId)))
	end
	return {
		userIds = table.concat(List1, ","),
		absolutePositions = table.concat(List2, ","),
		presences = table.concat(List3, ","),
		recommendationRanks = table.concat(List4, ","),
		friendStatuses = table.concat(List5, ","),
		recommendationContextTypes = table.concat(List6, ","),
		isRecommendations = table.concat(List7, ","),
		universeIds = table.concat(List8, ","),
		tileCount = #List1,
		sessionEventCount = SessionEventCount,
		contentType = if FFlagLuaAppUserSeenCollectionUnifiedFields then "User" else nil
	}
end