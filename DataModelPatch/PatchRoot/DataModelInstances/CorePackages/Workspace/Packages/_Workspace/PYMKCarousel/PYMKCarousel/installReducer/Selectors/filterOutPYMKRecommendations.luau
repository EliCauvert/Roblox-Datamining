local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local Llama = DependenciesModule.llama
local ConstantsModule = require(Parent.Common.Constants)
local _ = require(Parent.Common.ModelTypes)
local RecommendationSourceEnum = DependenciesModule.SocialCommon.Enums.RecommendationSourceEnum

return function(p1)
	-- upvalues: GetDeepValueFunction (copy), ConstantsModule (copy), RecommendationSourceEnum (copy), Llama (copy)
	return function(p2)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval), RecommendationSourceEnum (upval), Llama (upval), p1 (copy)
		local DeepValue = GetDeepValueFunction(p2, string.format("%s.Friends.recommendations.bySource.%s", ConstantsModule.RODUX_KEY, RecommendationSourceEnum.HomepagePYMKCarousel)) or {}
		
		return Llama.List.filter(p1, function(p3)
			-- upvalues: DeepValue (copy)
			return DeepValue[p3.id]
		end)
	end
end