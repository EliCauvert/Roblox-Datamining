local topicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local topicContentsModelModule = require(topicContentsRodux.TopicContentsModel)
local addTopicContentsModule = require(topicContentsRodux.AddTopicContents)
local parent = topicContentsRodux.Parent
local cryoModule = require(parent.Cryo)
local addTopicInfos = require(parent.TopicInfosRodux).AddTopicInfos
local _ = require(parent.DiscoveryTypes)

return {
	key = "TopicContentsKey",
	reducer = function(p1, p2)
		-- upvalues: addTopicInfos (ref), topicContentsModelModule (ref), cryoModule (ref), addTopicContentsModule (ref)
		local var1 = p1 or {}
		
		if p2.type == addTopicInfos.name then
			local t = {}
			
			for i, v in pairs(p2.topicInfos) do
				t[v.uniqueKey] = var1[v.uniqueKey] or topicContentsModelModule.new()
			end
			var1 = cryoModule.Dictionary.join(var1, t)
			
			return var1
		elseif p2.type == addTopicContentsModule.name then
			local topicContents = p2.topicContents
			local topicKey = var1[p2.topicKey]
			
			if topicKey ~= nil then
				if p2.isAppend then
					topicContents.entries = cryoModule.List.join(topicKey.entries, topicContents.entries)
				end
				if topicContents.updatedTimestamp == nil then
					topicContents.updatedTimestamp = topicKey.updatedTimestamp
				end
			end
			if topicContents.updatedTimestamp == nil then
				topicContents.updatedTimestamp = tick()
			end
			var1 = cryoModule.Dictionary.join(var1, { [p2.topicKey] = topicContents })
		end
		return var1
	end
}