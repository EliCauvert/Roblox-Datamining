local socialCommon = script:FindFirstAncestor("SocialCommon")
local recommendationContextTypeModule = require(socialCommon.Enums.RecommendationContextType)
local contextualInfoTypesModule = require(socialCommon.Enums.ContextualInfoTypes)

return function(p1)
	-- upvalues: recommendationContextTypeModule (ref), contextualInfoTypesModule (ref)
	local var1 = p1.contextType and p1.contextType.rawValue()
	
	return if var1 == recommendationContextTypeModule.MutualFriends.rawValue() then contextualInfoTypesModule.MutualFriends elseif var1 == recommendationContextTypeModule.Frequents.rawValue() then contextualInfoTypesModule.Frequents elseif var1 == recommendationContextTypeModule.Contacts.rawValue() then contextualInfoTypesModule.Contacts else nil
end