local ShareGameAnalytics = require(script:FindFirstAncestor("ShareTargetGame").dependencies).SocialLibraries.Analytics.ShareGameAnalytics

return function(p1, p2)
	-- upvalues: ShareGameAnalytics (copy)
	return (ShareGameAnalytics.new(p1, p2, ShareGameAnalytics.ButtonName.LuaGameDetails))
end