local SocialCommon = script:FindFirstAncestor("SocialCommon")
local RecommendationContextTypeModule = require(SocialCommon.Enums.RecommendationContextType)
local ContextualInfoTypesModule = require(SocialCommon.Enums.ContextualInfoTypes)
local FFlagShowClassmatesOnPYMKModule = require(SocialCommon.Parent.SharedFlags.FFlagShowClassmatesOnPYMK)

return function(p1)
	-- upvalues: RecommendationContextTypeModule (copy), ContextualInfoTypesModule (copy), FFlagShowClassmatesOnPYMKModule (copy)
	local ContextType = p1.contextType
	local RawValueResult = ContextType and ContextType.rawValue()
	
	return if RawValueResult == RecommendationContextTypeModule.MutualFriends.rawValue() then ContextualInfoTypesModule.MutualFriends elseif RawValueResult == RecommendationContextTypeModule.Frequents.rawValue() then ContextualInfoTypesModule.Frequents elseif RawValueResult == RecommendationContextTypeModule.Contacts.rawValue() then ContextualInfoTypesModule.Contacts elseif FFlagShowClassmatesOnPYMKModule and RawValueResult == RecommendationContextTypeModule.Classmates.rawValue() then ContextualInfoTypesModule.Classmates else nil
end