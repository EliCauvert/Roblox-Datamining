local parent = script:FindFirstAncestor("UserList").Parent
local dataHydrationModule = require(parent.DataHydration)
local profileCTAStore = dataHydrationModule.Profile.ProfileCTAStore
local requests = dataHydrationModule.Friends.Requests
local friendsStore = dataHydrationModule.Friends.FriendsStore
local images = require(parent.UIBlox).App.ImageSet.Images
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local friendingErrorCodesModule = require(script.Parent.FriendingErrorCodes)
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
	-- upvalues: getErrorToastMessage (ref), setCurrentToastMessage (ref)
	p1(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = getErrorToastMessage(p2, if type(p3) == "table" then p3.statusCode else nil, if type(p3) == "table" then p3.firstErrorCode else nil) or p2.defaultFriendingError
	}))
end

return {
	executeAddFriend = function(p1)
		-- upvalues: requests (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return requests.RequestFriendshipFromUserId(p1.targetUserId, p1.friendshipOriginSourceType):andThen(function()
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
		-- upvalues: friendsStore (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return friendsStore.get().AcceptFriendRequest(p1.targetUserId):andThen(function()
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
	end,
	executeDeclineFriendRequest = function(p1)
		-- upvalues: friendsStore (ref), profileCTAStore (ref), showErrorToast (ref)
		return friendsStore.get().DeclineFriendRequest(p1.targetUserId):andThen(function()
			-- upvalues: p1 (ref), profileCTAStore (copy)
			profileCTAStore.get().getCTA(p1.targetUserId, true)
		end):catch(function(p2)
			-- upvalues: showErrorToast (copy), p1 (ref)
			showErrorToast(p1.dispatch, p1.localized, p2)
		end)
	end
}