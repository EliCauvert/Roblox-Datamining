local socialCommon = script:FindFirstAncestor("SocialCommon")
local recommendationContextTypeModule = require(socialCommon.Enums.RecommendationContextType)
local contextualInfoTypesModule = require(socialCommon.Enums.ContextualInfoTypes)

return function(p0) --[[ line: 11 | named "getRecommendationContextualInfoType" ]]
	-- upvalues: recommendationContextTypeModule (ref), contextualInfoTypesModule (ref)
	local var3 = p0.contextType and p0.contextType.rawValue()
	
	return if var3 == recommendationContextTypeModule.MutualFriends.rawValue() then contextualInfoTypesModule.MutualFriends elseif var3 == recommendationContextTypeModule.Frequents.rawValue() then contextualInfoTypesModule.Frequents elseif var3 == recommendationContextTypeModule.Contacts.rawValue() then contextualInfoTypesModule.Contacts else nil
end