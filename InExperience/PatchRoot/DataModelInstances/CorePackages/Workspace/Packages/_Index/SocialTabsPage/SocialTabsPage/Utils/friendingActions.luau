local httpService = game:GetService("HttpService")
local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local dataHydrationModule = require(parent.DataHydration)
local profileCTAStore = dataHydrationModule.Profile.ProfileCTAStore
local var1 = dataHydrationModule.Friends.FriendsStore.get()
local friendingErrorCodesModule = require(socialTabsPage.Enums.FriendingErrorCodes)
local images = require(parent.UIBlox).App.ImageSet.Images
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local networkingFriendsModule = require(socialTabsPage.Networking.NetworkingFriends)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local friendAdd = images["icons/actions/friends/friendAdd"]
local _ = {
	BAD_REQUEST = 400,
	UNAUTHORIZED = 401,
	FORBIDDEN = 403,
	TOO_MANY_REQUESTS = 429
}

local function _(p1)
	-- upvalues: profileCTAStore (ref)
	profileCTAStore.get().getCTA(p1, true)
end

local function getErrorToastMessage(p1, p2, p3)
	-- upvalues: friendingErrorCodesModule (ref)
	return if p2 == 400 then ({
		[friendingErrorCodesModule.INVALID_TARGET_USER] = p1.invalidTargetUserError,
		[friendingErrorCodesModule.ALREADY_FRIEND] = p1.alreadyFriendError,
		[friendingErrorCodesModule.MAX_FRIENDS] = p1.maxFriendsError,
		[friendingErrorCodesModule.INVALID_NICKNAME] = p1.invalidNicknameError
	})[p3] elseif p2 == 401 then ({
		[friendingErrorCodesModule.UNAUTHORIZED] = p1.unauthorizedError
	})[p3] elseif p2 == 403 then ({
		[friendingErrorCodesModule.USER_BANNED] = p1.userBannedError,
		[friendingErrorCodesModule.USER_BLOCKED] = p1.userBlockedError,
		[friendingErrorCodesModule.USER_NOT_PASSED_CAPTCHA] = p1.userNotPassedCaptchaError
	})[p3] elseif p2 == 429 then ({
		[friendingErrorCodesModule.TOO_MANY_REQUESTS] = p1.tooManyRequestsError
	})[p3] else nil
end

local function showErrorToast(p1, p2, p3)
	-- upvalues: httpService (ref), getErrorToastMessage (ref), setCurrentToastMessage (ref)
	local defaultFriendingError = p2.defaultFriendingError
	
	if p3 ~= nil then
		local statusCode = p3.StatusCode
		local ok, status = pcall(function()
			-- upvalues: p3 (ref), httpService (copy)
			return if p3.Body then httpService:JSONDecode(p3.Body) else nil
		end)
		defaultFriendingError = getErrorToastMessage(p2, statusCode, if ok and status and (status.errors and status.errors[1]) and status.errors[1].code then status.errors[1].code else nil) or defaultFriendingError
	end
	p1(setCurrentToastMessage({ isLocalized = true, toastMessage = defaultFriendingError }))
end

return {
	executeAddFriend = function(p1)
		-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(p1.targetUserId, p1.friendshipOriginSourceType) else p1.dispatch(networkingFriendsModule.RequestFriendshipFromUserId.API({
			currentUserId = p1.currentUserId,
			targetUserId = p1.targetUserId,
			friendshipOriginSourceType = p1.friendshipOriginSourceType
		}))):andThen(function()
			-- upvalues: p1 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p1.localized.friendRequestSent,
				toastIcon = friendAdd
			}))
		end):catch(function(p2)
			-- upvalues: showErrorToast (copy), p1 (ref)
			showErrorToast(p1.dispatch, p1.localized, p2)
		end)
	end,
	executeAcceptFriendRequest = function(p1)
		-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.AcceptFriendRequest(p1.targetUserId) else p1.dispatch(networkingFriendsModule.AcceptFriendRequestFromUserId.API({
			currentUserId = p1.currentUserId,
			targetUserId = p1.targetUserId
		}))):andThen(function()
			-- upvalues: p1 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p1.localized.friendAdded,
				toastIcon = friendAdd
			}))
		end):catch(function(p2)
			-- upvalues: showErrorToast (copy), p1 (ref)
			showErrorToast(p1.dispatch, p1.localized, p2)
		end)
	end
}