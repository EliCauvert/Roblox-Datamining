local Parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(TopicInfos)
	return { topicInfos = TopicInfos }
end)