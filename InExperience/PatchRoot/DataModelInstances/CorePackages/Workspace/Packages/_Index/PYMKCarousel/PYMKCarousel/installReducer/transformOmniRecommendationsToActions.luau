local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local Llama = require(PYMKCarousel.dependencies).llama
local _ = require(PYMKCarousel.Common.OmniTypes)
local GetRecommendationsMetadataModule = require(script.Parent.getRecommendationsMetadata)
local ContextualInfoTypes = require(PYMKCarousel.Parent.SocialCommon).Enums.ContextualInfoTypes
local GetFFlagTempFixInfiniteHomePYMKModule = require(PYMKCarousel.Flags.getFFlagTempFixInfiniteHomePYMK)

local function v6(p1, TreatmentType) --[[ Line: 25 ]]
	-- upvalues: Llama (copy)
	local Sorts = p1.sorts or {}
	local Where = Llama.List.findWhere(Sorts, function(p2): boolean --[[ Line: 30 ]]
		-- upvalues: TreatmentType (copy)
		return p2.treatmentType == TreatmentType
	end)
	
	return if Where then Sorts[Where] else nil
end

return function(List, p1, Callback1, Callback) --[[ Line: 36 ]]
	-- upvalues: GetRecommendationsMetadataModule (copy), v6 (copy), GetFFlagTempFixInfiniteHomePYMKModule (copy), Llama (copy), ContextualInfoTypes (copy)
	local PushResult = {}
	local ContentType = p1.contentType
	local TreatmentType = p1.treatmentType
	
	for _, value in pairs(List) do
		local RecommendationsMetadataModule = GetRecommendationsMetadataModule(value, ContentType)
		local v1 = v6(value, TreatmentType)
		local Recommendations = if v1 then v1.recommendations or {} else {}
		
		if not GetFFlagTempFixInfiniteHomePYMKModule() or #Recommendations ~= 0 then
			if Callback then
				PushResult = Llama.List.push(PushResult, Callback(v1, RecommendationsMetadataModule))
			end
			PushResult = Llama.List.reduce(Recommendations, function(p2, p3, p4) --[[ Line: 61 ]]
				-- upvalues: ContextualInfoTypes (upval), RecommendationsMetadataModule (copy), Callback1 (copy), Llama (upval)
				local RecommendationsMetadataModuleEntry = RecommendationsMetadataModule[if p3.contentMetadata.contextType == ContextualInfoTypes.Contacts then p3.contentStringId else tostring(p3.contentId)]
				local ContentMetadata = p3.contentMetadata
				
				return if RecommendationsMetadataModuleEntry and Callback1 then Llama.List.push(p2, Callback1(RecommendationsMetadataModuleEntry, p4, ContentMetadata)) else p2
			end, PushResult)
		end
	end
	return PushResult
end