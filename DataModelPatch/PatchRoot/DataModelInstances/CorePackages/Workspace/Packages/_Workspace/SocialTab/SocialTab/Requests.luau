local SocialTab = script:FindFirstAncestor("SocialTab")

return {
	FetchChatSettings = require(SocialTab.Parent.AppChat.FetchChatSettings),
	GetUserV2FromUserId = require(SocialTab.dependencies).NetworkingUsers.GetUserV2FromUserId
}