local SocialCommon = script:FindFirstAncestor("SocialCommon")
local RecommendationContextTypeModule = require(SocialCommon.Enums.RecommendationContextType)
local ContextualInfoTypesModule = require(SocialCommon.Enums.ContextualInfoTypes)

return function(p1)
	-- upvalues: RecommendationContextTypeModule (copy), ContextualInfoTypesModule (copy)
	local ContextType = p1.contextType
	local RawValueResult = ContextType and ContextType.rawValue()
	
	return if RawValueResult == RecommendationContextTypeModule.MutualFriends.rawValue() then ContextualInfoTypesModule.MutualFriends elseif RawValueResult == RecommendationContextTypeModule.Frequents.rawValue() then ContextualInfoTypesModule.Frequents elseif RawValueResult == RecommendationContextTypeModule.Contacts.rawValue() then ContextualInfoTypesModule.Contacts else nil
end