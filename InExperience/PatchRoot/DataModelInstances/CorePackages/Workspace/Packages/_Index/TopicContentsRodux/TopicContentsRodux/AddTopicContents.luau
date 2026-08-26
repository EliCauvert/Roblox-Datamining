local parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { topicKey = p1, topicContents = p2, isAppend = p3 }
end)