local topicInfosRodux = script:FindFirstAncestor("TopicInfosRodux")
local addTopicInfosModule = require(topicInfosRodux.AddTopicInfos)
local parent = topicInfosRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

return {
	key = "TopicInfosKey",
	reducer = function(p0, p1)
		-- upvalues: addTopicInfosModule (ref), cryoModule (ref)
		p0 = p0 or {}
		assert(p0, "")
		
		if p1.type == addTopicInfosModule.name then
			local t = {}
			
			for i, v in p1.topicInfos do
				t[v.uniqueKey] = v
			end
			p0 = cryoModule.Dictionary.join(p0, t)
		end
		return p0
	end
}