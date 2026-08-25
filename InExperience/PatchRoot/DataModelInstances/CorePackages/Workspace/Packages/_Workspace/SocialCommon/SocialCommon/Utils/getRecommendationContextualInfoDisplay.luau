local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local getMutualFriendsTextModule = require(socialCommon.Utils.getMutualFriendsText)
local recommendationContextTypeModule = require(socialCommon.Enums.RecommendationContextType)
local images = require(parent.UIBlox).App.ImageSet.Images

return function(p0)
	-- upvalues: recommendationContextTypeModule (ref), getMutualFriendsTextModule (ref), images (ref)
	local frequents = nil
	local friend = nil
	local var3 = p0.recommendation.contextType and p0.recommendation.contextType.rawValue()
	local mutualFriendsCount = p0.recommendation.mutualFriendsCount or 0
	
	if p0.recommendation.hasIncomingFriendRequest then
		frequents = p0.localized.connectionRequests
		friend = nil
	end
	if var3 == recommendationContextTypeModule.Contacts.rawValue() then
		frequents = p0.localized.contacts
	elseif var3 == recommendationContextTypeModule.MutualFriends.rawValue() and mutualFriendsCount > 0 then
		frequents = getMutualFriendsTextModule({
			mutualFriendsCount = mutualFriendsCount,
			localized = {
				mutualConnections = p0.localized.mutualConnections,
				singularMutualConnection = p0.localized.singularMutualConnection
			}
		})
		friend = images["icons/status/player/friend"]
	elseif var3 == recommendationContextTypeModule.Frequents.rawValue() then
		frequents = p0.localized.frequents
	end
	return { text = frequents, icon = friend }
end