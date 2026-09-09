local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local llama = require(PYMKCarousel.dependencies).llama
local socialCommonModule = require(PYMKCarousel.Parent.SocialCommon)
local _ = require(PYMKCarousel.Common.OmniTypes)
local getRecommendationsMetadataModule = require(script.Parent.getRecommendationsMetadata)
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local getFFlagTempFixInfiniteHomePYMKModule = require(PYMKCarousel.Flags.getFFlagTempFixInfiniteHomePYMK)

local var1 = function(p1, p2)
	-- upvalues: llama (ref)
	local sorts = p1.sorts or {}
	local var2 = llama.List.findWhere(sorts, function(p3)
		-- upvalues: p2 (ref)
		return p3.treatmentType == p2
	end)
	
	return if var2 then sorts[var2] else nil
end

return function(p1, p2, p3, p4)
	-- upvalues: getRecommendationsMetadataModule (ref), var1 (ref), getFFlagTempFixInfiniteHomePYMKModule (ref), llama (ref), contextualInfoTypes (ref)
	local t = {}
	local contentType = p2.contentType
	local treatmentType = p2.treatmentType
	
	for i, v in pairs(p1) do
		local var2 = getRecommendationsMetadataModule(v, contentType)
		local var3 = var1(v, treatmentType)
		local var4 = if var3 then var3.recommendations or {} else {}
		
		if not getFFlagTempFixInfiniteHomePYMKModule() or #var4 ~= 0 then
			if p4 then
				t = llama.List.push(t, p4(var3, var2))
			end
			t = llama.List.reduce(var4, function(p5, p6, p7)
				-- upvalues: contextualInfoTypes (copy), var2 (ref), p3 (ref), llama (copy)
				local var5 = var2[if p6.contentMetadata.contextType == contextualInfoTypes.Contacts then p6.contentStringId else tostring(p6.contentId)]
				
				return if var5 then if p3 then llama.List.push(p5, p3(var5, p7, p6.contentMetadata)) else p5 else p5
			end, t)
		end
	end
	return t
end