local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)
local TopicContentsRoduxModule = require(Parent.TopicContentsRodux)
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents
local OmniUtilsModule = require(DiscoveryMonolith.Modules.LuaApp.Util.Omni.OmniUtils)

local function _(p1)
	-- upvalues: OmniUtilsModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), OmniUtilsModule (upval)
		return OmniUtilsModule.storeForContentType(p1:getState(), p2)
	end
end

local _ = function()
	-- upvalues: CryoModule (copy)
	return function(p1, p2)
		-- upvalues: CryoModule (upval)
		local v1 = p2[p1.contentId]
		
		return if v1 == nil then nil else CryoModule.Dictionary.join(v1, p1)
	end
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: TopicContentsModel (copy)
	return if p1 then TopicContentsModel.fromContentList(p1, p2, p3, p4) else nil
end

return function(p1, TopicId, p2)
	-- upvalues: OmniUtilsModule (copy), CryoModule (copy), TopicContentsModel (copy), AddTopicContentsFunction (copy)
	return function(p3)
		-- upvalues: OmniUtilsModule (upval), CryoModule (upval), p1 (copy), TopicId (copy), p2 (copy), TopicContentsModel (upval), AddTopicContentsFunction (upval)
		local function v11(p4)
			-- upvalues: p3 (copy), OmniUtilsModule (upval)
			return OmniUtilsModule.storeForContentType(p3:getState(), p4)
		end
		
		local function v12(p4, p5)
			-- upvalues: CryoModule (upval)
			local v1 = p5[p4.contentId]
			
			return if v1 == nil then nil else CryoModule.Dictionary.join(v1, p4)
		end
		
		local t = {}
		
		for _, sort in ipairs(p3:getState().OmniRecommendations[p1].sorts) do
			if sort.topicId then
				local Text = tostring(sort.topicId)
				
				if TopicId == nil or TopicId == sort.topicId then
					local Recommendations = sort.recommendations
					local FromContentListResult = if Recommendations then TopicContentsModel.fromContentList(Recommendations, v11, v12, p2) else nil
					
					if FromContentListResult then
						if t[Text] then
							p3:dispatch(AddTopicContentsFunction(Text, FromContentListResult, true))
						else
							p3:dispatch(AddTopicContentsFunction(Text, FromContentListResult))
							t[Text] = true
						end
					end
				end
			end
		end
	end
end