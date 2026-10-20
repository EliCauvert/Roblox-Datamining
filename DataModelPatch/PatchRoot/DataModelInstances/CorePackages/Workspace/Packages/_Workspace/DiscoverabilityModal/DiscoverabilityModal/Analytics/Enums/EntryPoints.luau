local Contexts = require(script.Parent.Parent.Parent.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts

return {
	AddFriends = Contexts.AddFriends,
	HomePage = `{Contexts.HomePage}FriendsSort`,
	HomePageProfile = `{Contexts.HomePage}Profile`,
	SocialTabProfile = `{Contexts.SocialTab}Profile`,
	ContactsList = `{Contexts.ContactImport}FindFriendsBanner`
}