local TopicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local TopicContentsModelModule = require(TopicContentsRodux.TopicContentsModel)
local AddTopicContentsModule = require(TopicContentsRodux.AddTopicContents)
local Parent = TopicContentsRodux.Parent
local CryoModule = require(Parent.Cryo)
local AddTopicInfos = require(Parent.TopicInfosRodux).AddTopicInfos
local _ = require(Parent.DiscoveryTypes)

return {
	key = "TopicContentsKey",
	reducer = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: AddTopicInfos (copy), TopicContentsModelModule (copy), CryoModule (copy), AddTopicContentsModule (copy)
		local P0 = p1 or {}
		
		if p2.type == AddTopicInfos.name then
			local t = {}
			
			for _, topicInfo in pairs(p2.topicInfos) do
				t[topicInfo.uniqueKey] = P0[topicInfo.uniqueKey] or TopicContentsModelModule.new()
			end
			P0 = CryoModule.Dictionary.join(P0, t)
			
			return P0
		else
			if p2.type == AddTopicContentsModule.name then
				local TopicContents = p2.topicContents
				local Entry = P0[p2.topicKey]
				
				if Entry ~= nil then
					if p2.isAppend then
						TopicContents.entries = CryoModule.List.join(Entry.entries, TopicContents.entries)
					end
					if TopicContents.updatedTimestamp == nil then
						TopicContents.updatedTimestamp = Entry.updatedTimestamp
					end
				end
				if TopicContents.updatedTimestamp == nil then
					TopicContents.updatedTimestamp = tick()
				end
				P0 = CryoModule.Dictionary.join(P0, { [p2.topicKey] = TopicContents })
			end
			return P0
		end
	end
}