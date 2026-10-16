local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ProfileCTAStore = DataHydrationModule.Profile.ProfileCTAStore
local Requests = DataHydrationModule.Friends.Requests
local FriendsStore = DataHydrationModule.Friends.FriendsStore
local FriendsStoreChallengeNetworkModule = require(UserList.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local FriendingErrorCodesModule = require(script.Parent.FriendingErrorCodes)
local IconsActionsFriendsFriendAdd = require(Parent.UIBlox).App.ImageSet.Images["icons/actions/friends/friendAdd"]

local function _(p1) --[[ Line: 64 | Named "refreshCTA" ]]
	-- upvalues: ProfileCTAStore (copy)
	ProfileCTAStore.get().getCTA(p1, true)
end

local function getErrorToastMessage(p1, StatusCode, FirstErrorCode) --[[ Line: 69 ]]
	-- upvalues: FriendingErrorCodesModule (copy)
	return if StatusCode == 400 then ({
		[FriendingErrorCodesModule.INVALID_TARGET_USER] = p1.invalidTargetUserError,
		[FriendingErrorCodesModule.ALREADY_FRIEND] = p1.alreadyFriendError,
		[FriendingErrorCodesModule.MAX_FRIENDS] = p1.maxFriendsError,
		[FriendingErrorCodesModule.INVALID_NICKNAME] = p1.invalidNicknameError
	})[FirstErrorCode] elseif StatusCode == 401 then ({
		[FriendingErrorCodesModule.UNAUTHORIZED] = p1.unauthorizedError
	})[FirstErrorCode] elseif StatusCode == 403 then ({
		[FriendingErrorCodesModule.USER_BANNED] = p1.userBannedError,
		[FriendingErrorCodesModule.USER_BLOCKED] = p1.userBlockedError,
		[FriendingErrorCodesModule.USER_NOT_PASSED_CAPTCHA] = p1.userNotPassedCaptchaError
	})[FirstErrorCode] elseif StatusCode == 429 then ({
		[FriendingErrorCodesModule.TOO_MANY_REQUESTS] = p1.tooManyRequestsError
	})[FirstErrorCode] else nil
end

local function showErrorToast(Callback: (any) -> (), Localized, p1) --[[ Line: 95 ]]
	-- upvalues: getErrorToastMessage (copy), SetCurrentToastMessageFunction (copy)
	Callback(SetCurrentToastMessageFunction({
		isLocalized = true,
		toastMessage = getErrorToastMessage(Localized, if type(p1) == "table" then p1.statusCode else nil, if type(p1) == "table" then p1.firstErrorCode else nil) or Localized.defaultFriendingError
	}))
end

return {
	executeAddFriend = function(p1) --[[ Line: 106 ]]
		-- upvalues: Requests (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), ProfileCTAStore (copy), SetCurrentToastMessageFunction (copy), IconsActionsFriendsFriendAdd (copy), showErrorToast (copy)
		return Requests.RequestFriendshipFromUserId(p1.targetUserId, p1.friendshipOriginSourceType, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil):andThen(function() --[[ Line: 112 ]]
			-- upvalues: p1 (copy), ProfileCTAStore (upval), SetCurrentToastMessageFunction (upval), IconsActionsFriendsFriendAdd (upval)
			ProfileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = p1.localized.friendRequestSent,
				toastIcon = IconsActionsFriendsFriendAdd
			}))
		end):catch(function(Err) --[[ Line: 120 ]]
			-- upvalues: showErrorToast (upval), p1 (copy)
			showErrorToast(p1.dispatch, p1.localized, Err)
		end)
	end,
	executeAcceptFriendRequest = function(p1) --[[ Line: 125 ]]
		-- upvalues: FriendsStore (copy), ProfileCTAStore (copy), SetCurrentToastMessageFunction (copy), IconsActionsFriendsFriendAdd (copy), showErrorToast (copy)
		return FriendsStore.get().AcceptFriendRequest(p1.targetUserId):andThen(function() --[[ Line: 128 ]]
			-- upvalues: p1 (copy), ProfileCTAStore (upval), SetCurrentToastMessageFunction (upval), IconsActionsFriendsFriendAdd (upval)
			ProfileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = p1.localized.friendAdded,
				toastIcon = IconsActionsFriendsFriendAdd
			}))
		end):catch(function(Err) --[[ Line: 136 ]]
			-- upvalues: showErrorToast (upval), p1 (copy)
			showErrorToast(p1.dispatch, p1.localized, Err)
		end)
	end,
	executeDeclineFriendRequest = function(p1) --[[ Line: 141 ]]
		-- upvalues: FriendsStore (copy), ProfileCTAStore (copy), showErrorToast (copy)
		return FriendsStore.get().DeclineFriendRequest(p1.targetUserId):andThen(function() --[[ Line: 144 ]]
			-- upvalues: p1 (copy), ProfileCTAStore (upval)
			ProfileCTAStore.get().getCTA(p1.targetUserId, true)
		end):catch(function(Err) --[[ Line: 147 ]]
			-- upvalues: showErrorToast (upval), p1 (copy)
			showErrorToast(p1.dispatch, p1.localized, Err)
		end)
	end
}