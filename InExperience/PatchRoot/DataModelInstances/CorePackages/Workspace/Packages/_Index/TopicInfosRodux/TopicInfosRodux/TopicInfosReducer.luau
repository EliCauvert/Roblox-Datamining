local TopicInfosRodux = script:FindFirstAncestor("TopicInfosRodux")
local AddTopicInfosModule = require(TopicInfosRodux.AddTopicInfos)
local Parent = TopicInfosRodux.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)

return {
	key = "TopicInfosKey",
	reducer = function(p1, p2) --[[ Line: 14 ]]
		-- upvalues: AddTopicInfosModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2.type == AddTopicInfosModule.name then
			local t = {}
			
			for _, topicInfo in p2.topicInfos do
				t[topicInfo.uniqueKey] = topicInfo
			end
			P0 = CryoModule.Dictionary.join(P0, t)
		end
		return P0
	end
}