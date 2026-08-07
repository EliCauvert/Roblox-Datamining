local parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 8 ]]
	return { topicKey = p0, topicContents = p1, isAppend = p2 }
end)