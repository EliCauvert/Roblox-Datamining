local SocialTabsPageRouter = {}

for _, value in require(script:FindFirstAncestor("SocialTabsPage").Common.TabConfig).routeOrder do
	table.insert(SocialTabsPageRouter, { [value.id] = { getScreen = value.getScreen } })
end
return SocialTabsPageRouter