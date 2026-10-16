local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local HttpService = game:GetService("HttpService")
local Images = require(Parent.UIBlox).App.ImageSet.Images
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local ContextualInfoTypes = require(Parent.SocialCommon).Enums.ContextualInfoTypes
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local NetworkingFriendsModule = require(ProfilePlatform.Networking.NetworkingFriends)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local RefreshProfilePlatformModule = require(ProfilePlatform.Networking.refreshProfilePlatform)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local FriendsStoreChallengeNetworkModule = require(ProfilePlatform.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local USERFRIENDINGERRORS = ConstantsModule.USER_FRIENDING_ERRORS
local STATUSCODES = ConstantsModule.STATUS_CODES

local function setErrorToast(p1, AddFriend, p2) --[[ Line: 32 ]]
	-- upvalues: EnumsModule (copy), STATUSCODES (copy), USERFRIENDINGERRORS (copy), HttpService (copy), SetCurrentToastMessageFunction (copy)
	local function getErrorToastMessage(StatusCode, Code) --[[ Line: 33 ]]
		-- upvalues: AddFriend (copy), EnumsModule (upval), STATUSCODES (upval), USERFRIENDINGERRORS (upval), p1 (copy)
		if AddFriend == EnumsModule.ProfileActions.AddFriend or AddFriend == EnumsModule.ProfileActions.AddFriendFromContacts then
			if StatusCode == STATUSCODES.BAD_REQUEST then
				return ({
					[USERFRIENDINGERRORS.INVALID_TARGET_USER_ERROR] = p1.localized.invalidTargetUserError,
					[USERFRIENDINGERRORS.ALREADY_FRIEND_ERROR] = p1.localized.alreadyFriendError,
					[USERFRIENDINGERRORS.MAX_FRIENDS_ERROR] = p1.localized.maxFriendsError,
					[USERFRIENDINGERRORS.INVALID_NICKNAME_ERROR] = p1.localized.invalidNicknameError
				})[Code]
			elseif StatusCode == STATUSCODES.UNAUTHORIZED then
				return ({
					[USERFRIENDINGERRORS.UNAUTHORIZED_ERROR] = p1.localized.unauthorizedError
				})[Code]
			elseif StatusCode == STATUSCODES.FORBIDDEN then
				return ({
					[USERFRIENDINGERRORS.USER_BANNED_ERROR] = p1.localized.userBannedError,
					[USERFRIENDINGERRORS.USER_BLOCKED_ERROR] = p1.localized.userBlockedError,
					[USERFRIENDINGERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = p1.localized.userNotPassedCaptchaError
				})[Code]
			elseif StatusCode == STATUSCODES.TOO_MANY_REQUESTS then
				return ({
					[USERFRIENDINGERRORS.TOO_MANY_REQUESTS_ERROR] = p1.localized.tooManyRequestsError
				})[Code]
			end
		end
		return nil
	end
	
	if p2 == nil then
		p1.dispatch(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = p1.localized.defaultFriendingError
		}))
		
		return
	else
		local Data = if p2.Body then HttpService:JSONDecode(p2.Body) else nil
		p1.dispatch(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = getErrorToastMessage(p2.StatusCode, if Data and Data.errors and Data.errors[1] and Data.errors[1].code then Data.errors[1].code else nil) or p1.localized.defaultFriendingError
		}))
	end
end

return {
	[EnumsModule.ProfileActions.AddFriend] = function(p1) --[[ Line: 84 ]]
		-- upvalues: EnumsModule (copy), ButtonVariant (copy), ProfileTypes (copy), EventNamesModule (copy), SetCurrentToastMessageFunction (copy), Images (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), NetworkingFriendsModule (copy), RefreshProfilePlatformActionInfoModule (copy), setErrorToast (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AddFriend],
			variant = ButtonVariant.Emphasis,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 89 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), EnumsModule (upval), SetCurrentToastMessageFunction (upval), Images (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), NetworkingFriendsModule (upval), RefreshProfilePlatformActionInfoModule (upval), setErrorToast (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonAddFriend, {
						buttonSurface = p1.buttonSurface,
						absolutePosition = p1.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p1.profileWrapperContext.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p1.profileWrapperContext.sourceInfo.isRecommendation,
						source = p1.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p1.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p1.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p1.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p1.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					p1.dispatch(SetCurrentToastMessageFunction({
						isLocalized = true,
						toastMessage = p1.localized.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"]
					}))
					
					return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.RequestFriendship(p1.profileId, p1.profileWrapperContext.sourceInfo.friendshipOriginSourceType, nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else p1.dispatch(NetworkingFriendsModule.RequestFriendshipFromUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId,
						friendshipOriginSourceType = p1.profileWrapperContext.sourceInfo.friendshipOriginSourceType
					}))):andThen(function() --[[ Line: 121 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformActionInfoModule (upval)
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end):catch(function(Err) --[[ Line: 126 ]]
						-- upvalues: setErrorToast (upval), p1 (upval), EnumsModule (upval)
						setErrorToast(p1, EnumsModule.ProfileActions.AddFriend, Err)
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.AddFriendFromContacts] = function(p1) --[[ Line: 134 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), SetCurrentToastMessageFunction (copy), Images (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), NetworkingFriendsModule (copy), ContextualInfoTypes (copy), RefreshProfilePlatformModule (copy), setErrorToast (copy)
		return {
			variant = ButtonVariant.Emphasis,
			text = p1.localized[EnumsModule.ProfileActions.AddFriendFromContacts],
			onActivated = {
				[ProfileTypes.Contact] = function() --[[ Line: 139 ]]
					-- upvalues: p1 (copy), SetCurrentToastMessageFunction (upval), Images (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), NetworkingFriendsModule (upval), ContextualInfoTypes (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval), setErrorToast (upval)
					p1.dispatch(SetCurrentToastMessageFunction({
						isLocalized = true,
						toastMessage = p1.localized.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"]
					}))
					
					return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.RequestFriendship(p1.profileId, nil, { isContact = true }, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else p1.dispatch(NetworkingFriendsModule.RequestFriendshipFromContactId.API({
						currentUserId = p1.localUserId,
						contactId = p1.profileId,
						contextType = ContextualInfoTypes.Contacts
					}))):andThen(function() --[[ Line: 158 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
						return p1.dispatch(RefreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = {
								EnumsModule.Components.ContactProfileHeader,
								EnumsModule.Components.Actions,
								EnumsModule.Components.ContactDescription
							}
						}))
					end):catch(function(Err) --[[ Line: 169 ]]
						-- upvalues: setErrorToast (upval), p1 (upval), EnumsModule (upval)
						setErrorToast(p1, EnumsModule.ProfileActions.AddFriendFromContacts, Err)
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.AddFriendFromContactsSent] = function(p1) --[[ Line: 177 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy)
		return {
			isDisabled = true,
			variant = ButtonVariant.Subtle,
			text = p1.localized[EnumsModule.ProfileActions.AddFriendFromContactsSent],
			onActivated = {
				[ProfileTypes.Contact] = function() --[[ Line: 182 ]] end
			}
		}
	end,
	[EnumsModule.ProfileActions.CannotAddFriend] = function(p1) --[[ Line: 188 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy)
		return {
			isDisabled = true,
			text = p1.localized[EnumsModule.ProfileActions.CannotAddFriend],
			onActivated = { [ProfileTypes.User] = function() --[[ Line: 192 ]] end }
		}
	end
}