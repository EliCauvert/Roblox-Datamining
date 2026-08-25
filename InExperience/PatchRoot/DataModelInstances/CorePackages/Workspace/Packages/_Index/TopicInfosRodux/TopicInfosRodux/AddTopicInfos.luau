local parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { topicInfos = p0 }
end)