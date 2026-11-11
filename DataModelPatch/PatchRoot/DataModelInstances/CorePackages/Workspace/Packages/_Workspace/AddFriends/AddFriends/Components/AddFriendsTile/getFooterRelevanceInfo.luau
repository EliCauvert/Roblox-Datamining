local Parent = script:FindFirstAncestor("AddFriends").Parent
local TModule = require(Parent.t)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local PresenceType = require(Parent.AddFriendsState).RoduxPresence.Enums.PresenceType
local Constants = require(Parent.ContactImporter).Constants
local FriendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local SocialCommonModule = require(Parent.SocialCommon)
local GetRecommendationContextualInfoDisplayFunction = SocialCommonModule.Utils.getRecommendationContextualInfoDisplay
local GetRecommendationContextualInfoTypeFunction = SocialCommonModule.Utils.getRecommendationContextualInfoType
local GetMutualFriendsTextFunction = SocialCommonModule.Utils.getMutualFriendsText
local ContextualInfoTypes = SocialCommonModule.Enums.ContextualInfoTypes
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor
local StrictInterfaceResult = TModule.strictInterface({
	mutualFriends = TModule.optional(TModule.table),
	amIFollowingUser = TModule.optional(TModule.boolean),
	isUserFollowingMe = TModule.optional(TModule.boolean),
	sentFromExperienceName = TModule.optional(TModule.string),
	isFriendRequest = TModule.boolean,
	isRecommendation = TModule.optional(TModule.boolean),
	userPresenceType = TModule.optional(TModule.userdata),
	lastLocation = TModule.optional(TModule.string),
	originSourceType = TModule.optional(TModule.string),
	contextType = TModule.optional(TModule.userdata),
	mutualFriendsCount = TModule.optional(TModule.number),
	hasIncomingFriendRequest = TModule.optional(TModule.boolean)
})

local function _(p1): boolean
	return p1 ~= nil and #p1 > 0
end

return function(p1, p2, p3)
	-- upvalues: StrictInterfaceResult (copy), Constants (copy), FriendshipOriginSourceType (copy), GetMutualFriendsTextFunction (copy), Images (copy), ContextualInfoTypes (copy), FFlagAddFriendsRenderTileRefactor (copy), PresenceType (copy), GetRecommendationContextualInfoDisplayFunction (copy), GetRecommendationContextualInfoTypeFunction (copy)
	assert(StrictInterfaceResult(p1))
	
	if p1.isFriendRequest then
		if p3.contactNameText then
			return {
				text = p3.contactNameText,
				fontStyle = p2.Font.CaptionBody
			}, "HaveContact"
		elseif p1.originSourceType == Constants.PHONE_CONTACT_IMPORTER then
			return {
				text = p3.fromContactsText,
				fontStyle = p2.Font.CaptionBody
			}, "FromCI"
		elseif p1.originSourceType == FriendshipOriginSourceType.QrCode.rawValue() then
			return {
				text = p3.foundThroughQRCode,
				fontStyle = p2.Font.CaptionBody
			}, "FRomQR"
		else
			local MutualFriends = p1.mutualFriends
			
			if MutualFriends ~= nil and #MutualFriends > 0 then
				return {
					text = GetMutualFriendsTextFunction({
						mutualFriendsCount = #p1.mutualFriends,
						localized = {
							mutualConnections = p3.mutualConnections,
							singularMutualConnection = p3.singularMutualConnection
						}
					}),
					fontStyle = p2.Font.CaptionBody,
					icon = Images["icons/status/player/friend"]
				}, ContextualInfoTypes.MutualFriends
			elseif p1.sentFromExperienceName ~= nil then
				return {
					text = p3.sentFromWithContextText,
					fontStyle = p2.Font.CaptionBody
				}, "FromExperience"
			elseif p1.amIFollowingUser then
				return {
					text = p3.youAreFollowingText,
					fontStyle = p2.Font.CaptionBody,
					icon = Images["icons/status/player/following"]
				}, "FollowingUser"
			elseif p1.isUserFollowingMe then
				return {
					text = p3.followsYouText,
					fontStyle = p2.Font.CaptionBody,
					icon = Images["icons/status/player/following"]
				}, "FollowingMe"
			else
				return nil
			end
		end
	elseif not FFlagAddFriendsRenderTileRefactor and p1.userPresenceType == PresenceType.InGame then
		return p1.lastLocation and {
			text = p1.lastLocation,
			fontStyle = p2.Font.CaptionBody,
			icon = Images["icons/actions/friends/friendsplaying"],
			iconTransparency = p2.Theme.BackgroundUIDefault.Transparency,
			iconSize = UDim2.new(0, 24, 0, 24)
		}, "LastLocation"
	elseif p1.isRecommendation then
		local Recommendation = {
			contextType = p1.contextType,
			mutualFriendsCount = p1.mutualFriendsCount,
			hasIncomingFriendRequest = p1.hasIncomingFriendRequest
		}
		local RecommendationContextualInfoDisplay = GetRecommendationContextualInfoDisplayFunction({
			recommendation = Recommendation,
			localized = {
				mutualConnections = p3.mutualConnections,
				singularMutualConnection = p3.singularMutualConnection,
				frequents = p3.frequents,
				connectionRequests = p3.connectionRequests,
				contacts = p3.fromContacts
			}
		})
		
		return {
			text = RecommendationContextualInfoDisplay.text,
			fontStyle = p2.Font.CaptionBody,
			icon = RecommendationContextualInfoDisplay.icon
		}, GetRecommendationContextualInfoTypeFunction(Recommendation)
	else
		return nil
	end
end