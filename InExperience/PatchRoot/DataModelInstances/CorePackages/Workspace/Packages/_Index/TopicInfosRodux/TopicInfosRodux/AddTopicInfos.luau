local Parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(TopicInfos) --[[ Line: 12 ]]
	return { topicInfos = TopicInfos }
end)