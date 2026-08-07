local topicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local topicContentsModelModule = require(topicContentsRodux.TopicContentsModel)
local addTopicContentsModule = require(topicContentsRodux.AddTopicContents)
local parent = topicContentsRodux.Parent
local cryoModule = require(parent.Cryo)
local addTopicInfos = require(parent.TopicInfosRodux).AddTopicInfos
local _ = require(parent.DiscoveryTypes)

return {
	key = "TopicContentsKey",
	reducer = function(p0, p1) --[[ line: 12 ]]
		-- upvalues: addTopicInfos (ref), topicContentsModelModule (ref), cryoModule (ref), addTopicContentsModule (ref)
		local var4 = p0 or {}
		
		if p1.type == addTopicInfos.name then
			local t = {}
			
			for i, v in pairs(p1.topicInfos) do
				t[v.uniqueKey] = var4[v.uniqueKey] or topicContentsModelModule.new()
			end
			var4 = cryoModule.Dictionary.join(var4, t)
			
			return var4
		elseif p1.type == addTopicContentsModule.name then
			local topicContents = p1.topicContents
			local topicKey = var4[p1.topicKey]
			
			if topicKey ~= nil then
				if p1.isAppend then
					topicContents.entries = cryoModule.List.join(topicKey.entries, topicContents.entries)
				end
				if topicContents.updatedTimestamp == nil then
					topicContents.updatedTimestamp = topicKey.updatedTimestamp
				end
			end
			if topicContents.updatedTimestamp == nil then
				topicContents.updatedTimestamp = tick()
			end
			var4 = cryoModule.Dictionary.join(var4, { [p1.topicKey] = topicContents })
		end
		return var4
	end
}