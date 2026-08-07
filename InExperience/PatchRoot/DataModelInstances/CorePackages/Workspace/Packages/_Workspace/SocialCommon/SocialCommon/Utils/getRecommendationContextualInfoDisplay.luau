local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local getMutualFriendsTextModule = require(socialCommon.Utils.getMutualFriendsText)
local recommendationContextTypeModule = require(socialCommon.Enums.RecommendationContextType)
local images = require(parent.UIBlox).App.ImageSet.Images
local fFlagHomepagePYMKUseHorizontalUserList = require(parent.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList

return function(p0) --[[ line: 45 ]]
	-- upvalues: fFlagHomepagePYMKUseHorizontalUserList (ref), recommendationContextTypeModule (ref), getMutualFriendsTextModule (ref), images (ref)
	local connectionRequests = nil
	local friend = nil
	local var3 = p0.recommendation.contextType and p0.recommendation.contextType.rawValue()
	local mutualFriendsCount = p0.recommendation.mutualFriendsCount or 0
	
	if fFlagHomepagePYMKUseHorizontalUserList and p0.recommendation.hasIncomingFriendRequest then
		connectionRequests = p0.localized.connectionRequests
		friend = nil
	end
	if var3 == recommendationContextTypeModule.Contacts.rawValue() then
		connectionRequests = p0.localized.contacts
	elseif var3 == recommendationContextTypeModule.MutualFriends.rawValue() and mutualFriendsCount > 0 then
		connectionRequests = getMutualFriendsTextModule({
			mutualFriendsCount = mutualFriendsCount,
			localized = {
				mutualConnections = p0.localized.mutualConnections,
				singularMutualConnection = p0.localized.singularMutualConnection
			}
		})
		friend = images["icons/status/player/friend"]
	elseif var3 == recommendationContextTypeModule.Frequents.rawValue() then
		connectionRequests = p0.localized.frequents
	end
	if not fFlagHomepagePYMKUseHorizontalUserList and p0.recommendation.hasIncomingFriendRequest then
		connectionRequests = p0.localized.connectionRequests
		friend = nil
	end
	return { text = connectionRequests, icon = friend }
end