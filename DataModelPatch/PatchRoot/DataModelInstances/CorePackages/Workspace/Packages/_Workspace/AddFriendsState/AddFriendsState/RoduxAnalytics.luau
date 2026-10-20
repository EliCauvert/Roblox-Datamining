local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.SocialLuaAnalytics).Analytics.RoduxAnalytics.config({
	keyPath = `{require(AddFriendsState.RODUX_KEY)}.Analytics`
})