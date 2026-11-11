local SocialTabState = script:FindFirstAncestor("SocialTabState")
local DependenciesModule = require(SocialTabState.dependencies)
local AppChatNetworking = DependenciesModule.AppChatNetworking

return DependenciesModule.Rodux.createReducer(0, {
	[require(SocialTabState.Requests.GetUnreadConversationCount).Succeeded.name] = function(p1, p2)
		return if p2.responseBody and p2.responseBody.count then p2.responseBody.count else p1
	end,
	[AppChatNetworking.rodux.GetConversationMetadata.Succeeded.name] = function(p1, p2)
		return if p2.responseBody and p2.responseBody.global_unread_count then p2.responseBody.global_unread_count else p1
	end,
	[AppChatNetworking.rodux.ClearGlobalUnreadCount.Succeeded.name] = function(p1, p2)
		return if p2.responseBody and p2.responseBody.status == "success" then 0 else p1
	end
})