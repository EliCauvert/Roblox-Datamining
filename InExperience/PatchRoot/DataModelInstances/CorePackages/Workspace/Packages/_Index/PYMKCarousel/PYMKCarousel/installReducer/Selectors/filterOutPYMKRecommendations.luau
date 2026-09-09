local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local llama = dependenciesModule.llama
local constantsModule = require(parent.Common.Constants)
local _ = require(parent.Common.ModelTypes)
local recommendationSourceEnum = dependenciesModule.SocialCommon.Enums.RecommendationSourceEnum

return function(p1)
	-- upvalues: getDeepValue (ref), constantsModule (ref), recommendationSourceEnum (ref), llama (ref)
	return function(p2)
		-- upvalues: getDeepValue (copy), constantsModule (copy), recommendationSourceEnum (copy), llama (copy), p1 (ref)
		local var1 = getDeepValue(p2, string.format("%s.Friends.recommendations.bySource.%s", constantsModule.RODUX_KEY, recommendationSourceEnum.HomepagePYMKCarousel)) or {}
		
		return llama.List.filter(p1, function(p3)
			-- upvalues: var1 (ref)
			return var1[p3.id]
		end)
	end
end