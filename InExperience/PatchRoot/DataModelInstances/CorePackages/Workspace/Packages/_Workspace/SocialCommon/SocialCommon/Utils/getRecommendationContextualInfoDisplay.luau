local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local getMutualFriendsTextModule = require(socialCommon.Utils.getMutualFriendsText)
local recommendationContextTypeModule = require(socialCommon.Enums.RecommendationContextType)
local images = require(parent.UIBlox).App.ImageSet.Images

return function(p1)
	-- upvalues: recommendationContextTypeModule (ref), getMutualFriendsTextModule (ref), images (ref)
	local frequents = nil
	local friend = nil
	local var1 = p1.recommendation.contextType and p1.recommendation.contextType.rawValue()
	local mutualFriendsCount = p1.recommendation.mutualFriendsCount or 0
	
	if p1.recommendation.hasIncomingFriendRequest then
		frequents = p1.localized.connectionRequests
		friend = nil
	end
	if var1 == recommendationContextTypeModule.Contacts.rawValue() then
		frequents = p1.localized.contacts
	elseif var1 == recommendationContextTypeModule.MutualFriends.rawValue() and mutualFriendsCount > 0 then
		frequents = getMutualFriendsTextModule({
			mutualFriendsCount = mutualFriendsCount,
			localized = {
				mutualConnections = p1.localized.mutualConnections,
				singularMutualConnection = p1.localized.singularMutualConnection
			}
		})
		friend = images["icons/status/player/friend"]
	elseif var1 == recommendationContextTypeModule.Frequents.rawValue() then
		frequents = p1.localized.frequents
	end
	return { text = frequents, icon = friend }
end