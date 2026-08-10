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

local function _(p0) --[[ line: 61 | named "refreshCTA" ]]
	-- upvalues: profileCTAStore (ref)
	profileCTAStore.get().getCTA(p0, true)
end

local function getErrorToastMessage(p1, p2, p3) --[[ line: 66 ]]
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

local function showErrorToast(p4, p5, p6) --[[ line: 92 ]]
	-- upvalues: getErrorToastMessage (ref), setCurrentToastMessage (ref)
	p4(setCurrentToastMessage({
		isLocalized = true,
		toastMessage = getErrorToastMessage(p5, if type(p6) == "table" then p6.statusCode else nil, if type(p6) == "table" then p6.firstErrorCode else nil) or p5.defaultFriendingError
	}))
end

return {
	executeAddFriend = function(p7) --[[ line: 103 ]]
		-- upvalues: requests (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return requests.RequestFriendshipFromUserId(p7.targetUserId, p7.friendshipOriginSourceType):andThen(function() --[[ line: 105 ]]
			-- upvalues: p7 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p7.targetUserId, true)
			p7.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p7.localized.friendRequestSent,
				toastIcon = friendAdd
			}))
		end):catch(function(p8) --[[ line: 113 ]]
			-- upvalues: showErrorToast (copy), p7 (ref)
			showErrorToast(p7.dispatch, p7.localized, p8)
		end)
	end,
	executeAcceptFriendRequest = function(p9) --[[ line: 118 ]]
		-- upvalues: friendsStore (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return friendsStore.get().AcceptFriendRequest(p9.targetUserId):andThen(function() --[[ line: 121 ]]
			-- upvalues: p9 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p9.targetUserId, true)
			p9.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p9.localized.friendAdded,
				toastIcon = friendAdd
			}))
		end):catch(function(p10) --[[ line: 129 ]]
			-- upvalues: showErrorToast (copy), p9 (ref)
			showErrorToast(p9.dispatch, p9.localized, p10)
		end)
	end,
	executeDeclineFriendRequest = function(p11) --[[ line: 134 ]]
		-- upvalues: friendsStore (ref), profileCTAStore (ref), showErrorToast (ref)
		return friendsStore.get().DeclineFriendRequest(p11.targetUserId):andThen(function() --[[ line: 137 ]]
			-- upvalues: p11 (ref), profileCTAStore (copy)
			profileCTAStore.get().getCTA(p11.targetUserId, true)
		end):catch(function(p12) --[[ line: 140 ]]
			-- upvalues: showErrorToast (copy), p11 (ref)
			showErrorToast(p11.dispatch, p11.localized, p12)
		end)
	end
}