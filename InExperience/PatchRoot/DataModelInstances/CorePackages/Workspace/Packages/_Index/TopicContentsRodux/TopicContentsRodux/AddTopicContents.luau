local Parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(TopicKey, TopicContents, IsAppend) --[[ Line: 8 ]]
	return {
		topicKey = TopicKey,
		topicContents = TopicContents,
		isAppend = IsAppend
	}
end)