local topicInfosRodux = script:FindFirstAncestor("TopicInfosRodux")
local addTopicInfosModule = require(topicInfosRodux.AddTopicInfos)
local parent = topicInfosRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

return {
	key = "TopicInfosKey",
	reducer = function(p1, p2)
		-- upvalues: addTopicInfosModule (ref), cryoModule (ref)
		p1 = p1 or {}
		assert(p1, "")
		
		if p2.type == addTopicInfosModule.name then
			local t = {}
			
			for i, v in p2.topicInfos do
				t[v.uniqueKey] = v
			end
			p1 = cryoModule.Dictionary.join(p1, t)
		end
		return p1
	end
}