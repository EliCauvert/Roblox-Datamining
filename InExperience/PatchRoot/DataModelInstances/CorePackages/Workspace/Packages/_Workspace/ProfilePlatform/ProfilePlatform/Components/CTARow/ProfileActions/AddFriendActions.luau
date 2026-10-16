local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local socialCommonModule = require(parent.SocialCommon)
local images = require(parent.UIBlox).App.ImageSet.Images
local buttonVariant = foundationModule.Enums.ButtonVariant
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local networkingFriendsModule = require(profilePlatform.Networking.NetworkingFriends)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local refreshProfilePlatformModule = require(profilePlatform.Networking.refreshProfilePlatform)
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()
local USER_FRIENDING_ERRORS = constantsModule.USER_FRIENDING_ERRORS
local STATUS_CODES = constantsModule.STATUS_CODES

local function setErrorToast(value, p1, p2)
	-- upvalues: enumsModule (ref), STATUS_CODES (ref), USER_FRIENDING_ERRORS (ref), httpService (ref), setCurrentToastMessage (ref)
	local function getErrorToastMessage(p3, p4)
		-- upvalues: p1 (ref), enumsModule (copy), STATUS_CODES (copy), USER_FRIENDING_ERRORS (copy), value (ref)
		if p1 == enumsModule.ProfileActions.AddFriend or p1 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p3 == STATUS_CODES.BAD_REQUEST then ({
				[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = value.localized.invalidTargetUserError,
				[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = value.localized.alreadyFriendError,
				[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = value.localized.maxFriendsError,
				[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = value.localized.invalidNicknameError
			})[p4] elseif p3 == STATUS_CODES.UNAUTHORIZED then ({
				[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = value.localized.unauthorizedError
			})[p4] elseif p3 == STATUS_CODES.FORBIDDEN then ({
				[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = value.localized.userBannedError,
				[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = value.localized.userBlockedError,
				[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = value.localized.userNotPassedCaptchaError
			})[p4] elseif p3 == STATUS_CODES.TOO_MANY_REQUESTS then ({
				[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = value.localized.tooManyRequestsError
			})[p4] else nil
		end
	end
	
	if p2 == nil then
		value.dispatch(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = value.localized.defaultFriendingError
		}))
		
		return
	end
	local var2 = if p2.Body then httpService:JSONDecode(p2.Body) else nil
	value.dispatch(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = getErrorToastMessage(p2.StatusCode, if var2 and var2.errors and (var2.errors[1] and var2.errors[1].code) then var2.errors[1].code else nil) or value.localized.defaultFriendingError
	}))
end

return {
	[enumsModule.ProfileActions.AddFriend] = function(p1)
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), setCurrentToastMessage (ref), images (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), refreshProfilePlatformActionInfoModule (ref), setErrorToast (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AddFriend],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), enumsModule (copy), setCurrentToastMessage (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), networkingFriendsModule (copy), refreshProfilePlatformActionInfoModule (copy), setErrorToast (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
						buttonSurface = p1.buttonSurface,
						absolutePosition = p1.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p1.profileWrapperContext.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p1.profileWrapperContext.sourceInfo.isRecommendation,
						source = p1.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p1.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p1.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p1.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p1.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					p1.dispatch(setCurrentToastMessage({
						isLocalized = true,
						toastMessage = p1.localized.friendRequestSentToast,
						toastIcon = images["icons/actions/friends/friendAdd"]
					}))
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(p1.profileId, p1.profileWrapperContext.sourceInfo.friendshipOriginSourceType) else p1.dispatch(networkingFriendsModule.RequestFriendshipFromUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId,
						friendshipOriginSourceType = p1.profileWrapperContext.sourceInfo.friendshipOriginSourceType
					}))):andThen(function()
						-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end):catch(function(p2)
						-- upvalues: setErrorToast (copy), p1 (copy), enumsModule (copy)
						setErrorToast(p1, enumsModule.ProfileActions.AddFriend, p2)
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddFriendFromContacts] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), setCurrentToastMessage (ref), images (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), setErrorToast (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p1.localized[enumsModule.ProfileActions.AddFriendFromContacts],
			onActivated = {
				[profileTypes.Contact] = function()
					-- upvalues: p1 (ref), setCurrentToastMessage (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), networkingFriendsModule (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), enumsModule (copy), setErrorToast (copy)
					p1.dispatch(setCurrentToastMessage({
						isLocalized = true,
						toastMessage = p1.localized.friendRequestSentToast,
						toastIcon = images["icons/actions/friends/friendAdd"]
					}))
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(p1.profileId, nil, { isContact = true }) else p1.dispatch(networkingFriendsModule.RequestFriendshipFromContactId.API({
						currentUserId = p1.localUserId,
						contactId = p1.profileId,
						contextType = contextualInfoTypes.Contacts
					}))):andThen(function()
						-- upvalues: p1 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						return p1.dispatch(refreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = {
								enumsModule.Components.ContactProfileHeader,
								enumsModule.Components.Actions,
								enumsModule.Components.ContactDescription
							}
						}))
					end):catch(function(p2)
						-- upvalues: setErrorToast (copy), p1 (copy), enumsModule (copy)
						setErrorToast(p1, enumsModule.ProfileActions.AddFriendFromContacts, p2)
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddFriendFromContactsSent] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			variant = buttonVariant.Subtle,
			text = p1.localized[enumsModule.ProfileActions.AddFriendFromContactsSent],
			onActivated = {
				[profileTypes.Contact] = function() end
			}
		}
	end,
	[enumsModule.ProfileActions.CannotAddFriend] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p1.localized[enumsModule.ProfileActions.CannotAddFriend],
			onActivated = { [profileTypes.User] = function() end }
		}
	end
}