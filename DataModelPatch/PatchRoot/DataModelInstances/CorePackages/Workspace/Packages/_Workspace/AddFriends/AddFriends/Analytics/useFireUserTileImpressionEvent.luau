local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local EntityTypes = require(Parent.SocialLuaAnalytics).Analytics.Enums.EntityTypes
local GetRecommendationContextualInfoTypeFunction = require(Parent.SocialCommon).Utils.getRecommendationContextualInfoType
local EventNamesModule = require(script.Parent.EventNames)
local UseFireAnalyticsEventModule = require(script.Parent.useFireAnalyticsEvent)
local AddFriendsStateModule = require(Parent.AddFriendsState)
local RecommendationContextType = AddFriendsStateModule.RoduxFriends.Enums.RecommendationContextType
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AddFriendsSelectorFunction = AddFriendsStateModule.AddFriendsSelector
local FFlagAddFriendsPYMKPresenceAnalytics = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics

return function(p1, p2, Namespace)
	-- upvalues: UseFireAnalyticsEventModule (copy), FFlagAddFriendsPYMKPresenceAnalytics (copy), UseSelectorFunction (copy), AddFriendsSelectorFunction (copy), ReactModule (copy), RecommendationContextType (copy), GetRecommendationContextualInfoTypeFunction (copy), EntityTypes (copy), EventNamesModule (copy)
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseSelectorResult = if FFlagAddFriendsPYMKPresenceAnalytics then UseSelectorFunction(function(p3)
		-- upvalues: AddFriendsSelectorFunction (upval)
		return AddFriendsSelectorFunction(p3, "Presence.byUserId") or {}
	end) else nil
	
	return ReactModule.useCallback(function(List)
		-- upvalues: FFlagAddFriendsPYMKPresenceAnalytics (upval), p1 (copy), UseSelectorResult (copy), RecommendationContextType (upval), GetRecommendationContextualInfoTypeFunction (upval), EntityTypes (upval), p2 (copy), UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), Namespace (copy)
		local TargetUserId = ""
		local AbsolutePosition = ""
		local Rank = ""
		local ContextType = ""
		local EntityType = ""
		local RowInSort = ""
		local Text = if FFlagAddFriendsPYMKPresenceAnalytics then "" else nil
		for _, value in ipairs(List) do
			local v1 = p1[value]
			
			if v1 then
				local UserPresenceType = if FFlagAddFriendsPYMKPresenceAnalytics then (UseSelectorResult and UseSelectorResult[v1.id] or {}).userPresenceType else nil
				local IsContextTypeMatch: boolean = v1.contextType and v1.contextType == RecommendationContextType.Contacts
				TargetUserId ..= v1.id or (v1.entityId or "") .. ","
				AbsolutePosition ..= value .. ","
				Rank ..= v1.rank or "" .. ","
				ContextType ..= GetRecommendationContextualInfoTypeFunction(v1) or "" .. ","
				EntityType ..= if IsContextTypeMatch then EntityTypes.Contact else "" .. ","
				RowInSort ..= math.floor((value - 1) / p2) + 1 .. ","
				
				if FFlagAddFriendsPYMKPresenceAnalytics then
					Text ..= UserPresenceType and tostring(UserPresenceType) or "" .. ","
				else
					Text = nil
				end
			end
		end
		UseFireAnalyticsEventModuleResult(EventNamesModule.UserTileImpression, {
			namespace = Namespace,
			targetUserId = TargetUserId,
			absolutePosition = AbsolutePosition,
			rank = Rank,
			contextType = ContextType,
			entityType = EntityType,
			rowInSort = RowInSort,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then Text else nil
		})
	end, {
		UseFireAnalyticsEventModuleResult,
		p1,
		p2,
		Namespace,
		if FFlagAddFriendsPYMKPresenceAnalytics then UseSelectorResult else nil
	})
end