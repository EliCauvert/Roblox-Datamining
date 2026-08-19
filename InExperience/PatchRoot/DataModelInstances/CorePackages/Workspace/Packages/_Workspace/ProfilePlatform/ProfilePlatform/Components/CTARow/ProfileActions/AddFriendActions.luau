local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local socialCommonModule = require(parent.SocialCommon)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local images = UIBloxModule.App.ImageSet.Images
local buttonVariant = foundationModule.Enums.ButtonVariant
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local appPage = robloxAppEnumsModule.AppPage
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local networkingFriendsModule = require(profilePlatform.Networking.NetworkingFriends)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local refreshProfilePlatformModule = require(profilePlatform.Networking.refreshProfilePlatform)
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local friendRequestNicknamesIXP = require(parent.FriendRequestNicknames).FriendRequestNicknamesIXP
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var13 = require(parent.DataHydration).Friends.FriendsStore.get()
local USER_FRIENDING_ERRORS = constantsModule.USER_FRIENDING_ERRORS
local STATUS_CODES = constantsModule.STATUS_CODES

local function setErrorToast(value, p0, p1) --[[ line: 40 ]]
	-- upvalues: enumsModule (ref), STATUS_CODES (ref), USER_FRIENDING_ERRORS (ref), httpService (ref), setCurrentToastMessage (ref)
	local function getErrorToastMessage(p2, p3) --[[ line: 41 ]]
		-- upvalues: p0 (ref), enumsModule (copy), STATUS_CODES (copy), USER_FRIENDING_ERRORS (copy), value (ref)
		if p0 == enumsModule.ProfileActions.AddFriend or p0 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p2 == STATUS_CODES.BAD_REQUEST then ({
				[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = value.localized.invalidTargetUserError,
				[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = value.localized.alreadyFriendError,
				[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = value.localized.maxFriendsError,
				[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = value.localized.invalidNicknameError
			})[p3] elseif p2 == STATUS_CODES.UNAUTHORIZED then ({
				[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = value.localized.unauthorizedError
			})[p3] elseif p2 == STATUS_CODES.FORBIDDEN then ({
				[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = value.localized.userBannedError,
				[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = value.localized.userBlockedError,
				[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = value.localized.userNotPassedCaptchaError
			})[p3] elseif p2 == STATUS_CODES.TOO_MANY_REQUESTS then ({
				[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = value.localized.tooManyRequestsError
			})[p3] else nil
		end
	end
	
	if p1 == nil then
		value.dispatch(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = value.localized.defaultFriendingError
		}))
		
		return
	end
	local var16 = if p1.Body then httpService:JSONDecode(p1.Body) else nil
	value.dispatch(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = getErrorToastMessage(p1.StatusCode, if var16 and var16.errors and (var16.errors[1] and var16.errors[1].code) then var16.errors[1].code else nil) or value.localized.defaultFriendingError
	}))
end

return {
	[enumsModule.ProfileActions.AddFriend] = function(p4) --[[ line: 92 ]]
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), setCurrentToastMessage (ref), images (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var13 (ref), networkingFriendsModule (ref), refreshProfilePlatformActionInfoModule (ref), setErrorToast (ref)
		return {
			text = p4.localized[enumsModule.ProfileActions.AddFriend],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 97 ]]
					-- upvalues: p4 (ref), eventNamesModule (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), navigateDown (copy), setCurrentToastMessage (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var13 (copy), networkingFriendsModule (copy), refreshProfilePlatformActionInfoModule (copy), setErrorToast (copy)
					p4.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
						buttonSurface = p4.buttonSurface,
						absolutePosition = p4.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p4.profileWrapperContext.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p4.profileWrapperContext.sourceInfo.isRecommendation,
						source = p4.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p4.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p4.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p4.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p4.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					
					if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not p4.friendRequestNicknamesEnabled then
						p4.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p4.localized.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var13.RequestFriendship(p4.profileId, p4.profileWrapperContext.sourceInfo.friendshipOriginSourceType) else p4.dispatch(networkingFriendsModule.RequestFriendshipFromUserId.API({
							targetUserId = p4.profileId,
							currentUserId = p4.localUserId,
							friendshipOriginSourceType = p4.profileWrapperContext.sourceInfo.friendshipOriginSourceType
						}))):andThen(function() --[[ line: 145 ]]
							-- upvalues: p4 (copy), refreshProfilePlatformActionInfoModule (copy)
							return p4.dispatch(refreshProfilePlatformActionInfoModule(p4.profileId, p4.actionsComponentRequest))
						end):catch(function(p5) --[[ line: 150 ]]
							-- upvalues: setErrorToast (copy), p4 (copy), enumsModule (copy)
							setErrorToast(p4, enumsModule.ProfileActions.AddFriend, p5)
						end)
					end
					local t = {
						name = appPage.SetNicknameModal,
						extraProps = {
							friendRequestParams = {
								targetUserId = p4.profileId,
								source = p4.profileWrapperContext.sourceInfo.friendshipOriginSourceType
							}
						}
					}
					
					return if fFlagSignalsNavP3Dispatch then var6.down(var6.fromLegacyPage(t)) else p4.dispatch(navigateDown(t))
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddFriendFromContacts] = function(p6) --[[ line: 159 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), setCurrentToastMessage (ref), images (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var13 (ref), networkingFriendsModule (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), setErrorToast (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p6.localized[enumsModule.ProfileActions.AddFriendFromContacts],
			onActivated = {
				[profileTypes.Contact] = function() --[[ line: 164 ]]
					-- upvalues: p6 (ref), setCurrentToastMessage (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var13 (copy), networkingFriendsModule (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), enumsModule (copy), setErrorToast (copy)
					p6.dispatch(setCurrentToastMessage({
						isLocalized = true,
						toastMessage = p6.localized.friendRequestSentToast,
						toastIcon = images["icons/actions/friends/friendAdd"]
					}))
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var13.RequestFriendship(p6.profileId, nil, { isContact = true }) else p6.dispatch(networkingFriendsModule.RequestFriendshipFromContactId.API({
						currentUserId = p6.localUserId,
						contactId = p6.profileId,
						contextType = contextualInfoTypes.Contacts
					}))):andThen(function() --[[ line: 178 ]]
						-- upvalues: p6 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						return p6.dispatch(refreshProfilePlatformModule({
							profileType = p6.profileType,
							profileId = p6.profileId,
							components = {
								enumsModule.Components.ContactProfileHeader,
								enumsModule.Components.Actions,
								enumsModule.Components.ContactDescription
							}
						}))
					end):catch(function(p7) --[[ line: 189 ]]
						-- upvalues: setErrorToast (copy), p6 (copy), enumsModule (copy)
						setErrorToast(p6, enumsModule.ProfileActions.AddFriendFromContacts, p7)
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddFriendFromContactsSent] = function(p8) --[[ line: 197 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			variant = buttonVariant.Subtle,
			text = p8.localized[enumsModule.ProfileActions.AddFriendFromContactsSent],
			onActivated = {
				[profileTypes.Contact] = function() --[[ line: 202 ]] end
			}
		}
	end,
	[enumsModule.ProfileActions.CannotAddFriend] = function(p9) --[[ line: 208 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p9.localized[enumsModule.ProfileActions.CannotAddFriend],
			onActivated = { [profileTypes.User] = function() --[[ line: 212 ]] end }
		}
	end
}