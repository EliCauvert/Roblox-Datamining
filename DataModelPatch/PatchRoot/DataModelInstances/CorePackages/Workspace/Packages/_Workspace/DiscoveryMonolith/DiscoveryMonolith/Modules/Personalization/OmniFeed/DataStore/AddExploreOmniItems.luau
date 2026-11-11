local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AppPage, TopicInfos, IsAppend, OmniFeedPageSection)
	return {
		appPage = AppPage,
		topicInfos = TopicInfos,
		isAppend = IsAppend,
		omniFeedPageSection = OmniFeedPageSection
	}
end)