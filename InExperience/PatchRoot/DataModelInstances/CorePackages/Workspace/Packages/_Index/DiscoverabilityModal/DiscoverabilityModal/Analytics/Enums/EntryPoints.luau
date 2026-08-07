local contexts = require(script.Parent.Parent.Parent.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts

return {
	AddFriends = contexts.AddFriends,
	HomePage = `{contexts.HomePage}FriendsSort`,
	HomePageProfile = `{contexts.HomePage}Profile`,
	SocialTabProfile = `{contexts.SocialTab}Profile`,
	ContactsList = `{contexts.ContactImport}FindFriendsBanner`
}