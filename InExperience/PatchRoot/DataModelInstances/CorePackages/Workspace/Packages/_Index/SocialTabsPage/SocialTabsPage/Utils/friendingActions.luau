local HttpService = game:GetService("HttpService")
local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ProfileCTAStore = DataHydrationModule.Profile.ProfileCTAStore
local FriendsStoreChallengeNetworkModule = require(SocialTabsPage.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local GetResult = DataHydrationModule.Friends.FriendsStore.get()
local FriendingErrorCodesModule = require(SocialTabsPage.Enums.FriendingErrorCodes)
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local NetworkingFriendsModule = require(SocialTabsPage.Networking.NetworkingFriends)
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local IconsActionsFriendsFriendAdd = require(Parent.UIBlox).App.ImageSet.Images["icons/actions/friends/friendAdd"]

local function _(p1)
	-- upvalues: ProfileCTAStore (copy)
	ProfileCTAStore.get().getCTA(p1, true)
end

local function getErrorToastMessage(p1, StatusCode, Code)
	-- upvalues: FriendingErrorCodesModule (copy)
	return if StatusCode == 400 then ({
		[FriendingErrorCodesModule.INVALID_TARGET_USER] = p1.invalidTargetUserError,
		[FriendingErrorCodesModule.ALREADY_FRIEND] = p1.alreadyFriendError,
		[FriendingErrorCodesModule.MAX_FRIENDS] = p1.maxFriendsError,
		[FriendingErrorCodesModule.INVALID_NICKNAME] = p1.invalidNicknameError
	})[Code] elseif StatusCode == 401 then ({
		[FriendingErrorCodesModule.UNAUTHORIZED] = p1.unauthorizedError
	})[Code] elseif StatusCode == 403 then ({
		[FriendingErrorCodesModule.USER_BANNED] = p1.userBannedError,
		[FriendingErrorCodesModule.USER_BLOCKED] = p1.userBlockedError,
		[FriendingErrorCodesModule.USER_NOT_PASSED_CAPTCHA] = p1.userNotPassedCaptchaError
	})[Code] elseif StatusCode == 429 then ({
		[FriendingErrorCodesModule.TOO_MANY_REQUESTS] = p1.tooManyRequestsError
	})[Code] else nil
end

local function showErrorToast(Callback: (any) -> (), Localized, p1)
	-- upvalues: HttpService (copy), getErrorToastMessage (copy), SetCurrentToastMessageFunction (copy)
	local DefaultFriendingError = Localized.defaultFriendingError
	
	if p1 ~= nil then
		local StatusCode = p1.StatusCode
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), HttpService (upval)
			return if p1.Body then HttpService:JSONDecode(p1.Body) else nil
		end)
		DefaultFriendingError = getErrorToastMessage(Localized, StatusCode, if Success and Result and Result.errors and Result.errors[1] and Result.errors[1].code then Result.errors[1].code else nil) or DefaultFriendingError
	end
	Callback(SetCurrentToastMessageFunction({ isLocalized = true, toastMessage = DefaultFriendingError }))
end

return {
	executeAddFriend = function(p1)
		-- upvalues: FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), NetworkingFriendsModule (copy), ProfileCTAStore (copy), SetCurrentToastMessageFunction (copy), IconsActionsFriendsFriendAdd (copy), showErrorToast (copy)
		return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.RequestFriendship(p1.targetUserId, p1.friendshipOriginSourceType, nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else p1.dispatch(NetworkingFriendsModule.RequestFriendshipFromUserId.API({
			currentUserId = p1.currentUserId,
			targetUserId = p1.targetUserId,
			friendshipOriginSourceType = p1.friendshipOriginSourceType
		}))):andThen(function()
			-- upvalues: p1 (copy), ProfileCTAStore (upval), SetCurrentToastMessageFunction (upval), IconsActionsFriendsFriendAdd (upval)
			ProfileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = p1.localized.friendRequestSent,
				toastIcon = IconsActionsFriendsFriendAdd
			}))
		end):catch(function(Err)
			-- upvalues: showErrorToast (upval), p1 (copy)
			showErrorToast(p1.dispatch, p1.localized, Err)
		end)
	end,
	executeAcceptFriendRequest = function(p1)
		-- upvalues: FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), NetworkingFriendsModule (copy), ProfileCTAStore (copy), SetCurrentToastMessageFunction (copy), IconsActionsFriendsFriendAdd (copy), showErrorToast (copy)
		return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.AcceptFriendRequest(p1.targetUserId) else p1.dispatch(NetworkingFriendsModule.AcceptFriendRequestFromUserId.API({
			currentUserId = p1.currentUserId,
			targetUserId = p1.targetUserId
		}))):andThen(function()
			-- upvalues: p1 (copy), ProfileCTAStore (upval), SetCurrentToastMessageFunction (upval), IconsActionsFriendsFriendAdd (upval)
			ProfileCTAStore.get().getCTA(p1.targetUserId, true)
			p1.dispatch(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = p1.localized.friendAdded,
				toastIcon = IconsActionsFriendsFriendAdd
			}))
		end):catch(function(Err)
			-- upvalues: showErrorToast (upval), p1 (copy)
			showErrorToast(p1.dispatch, p1.localized, Err)
		end)
	end
}