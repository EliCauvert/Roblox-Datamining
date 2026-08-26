local parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { topicInfos = p1 }
end)