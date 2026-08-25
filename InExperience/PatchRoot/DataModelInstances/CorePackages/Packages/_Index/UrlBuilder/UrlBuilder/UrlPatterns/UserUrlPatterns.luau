return function(p0)
	return {
		profile = p0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType|}"),
		group = p0.fromString("www:communities/{groupId}/{groupName|}#!/about"),
		forumComment = p0.fromString("www:communities/{groupId}#!/forums/{categoryId}/post/{postId}/comment/{commentId}"),
		friends = p0.fromString("www:users/{userId}/friends"),
		inventory = p0.fromString("www:users/{userId}/inventory"),
		search = p0.fromString("www:search/users?{keyword}"),
		profileWithFriendshipSourceType = p0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType}"),
		followers = p0.fromString("www:users/{userId}/friends#!/followers"),
		following = p0.fromString("www:users/{userId}/friends#!/following"),
		report = function(p1)
			-- upvalues: p0 (ref)
			return p0.fromString("www:abusereport/embedded/chat?id={userId}&{actionName}&{conversationId}&{redirecturl}")({
				actionName = "chat",
				userId = p1.userId,
				conversationId = p1.conversationId,
				redirecturl = p0.fromString("www:home")()
			})
		end,
		appsflyer = function(p2)
			-- upvalues: p0 (ref)
			return p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p0.fromString("mobilenav:profile?userId={userId}&friendshipSourceType={sourceType}")(p2),
				webUrl = p0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType}")(p2)
			})
		end
	}
end