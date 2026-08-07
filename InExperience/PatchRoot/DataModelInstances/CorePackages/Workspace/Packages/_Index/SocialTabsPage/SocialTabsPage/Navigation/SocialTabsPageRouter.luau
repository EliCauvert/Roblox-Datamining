local t = {}

for i, v in require(script:FindFirstAncestor("SocialTabsPage").Common.TabConfig).routeOrder do
	table.insert(t, { [v.id] = { getScreen = v.getScreen } })
end
return t