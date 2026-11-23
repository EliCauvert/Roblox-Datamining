local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local DataHydrationModule = require(Parent.DataHydration)
local EnumsModule = require(UserList.Common.Enums)
local TextKeysModule = require(UserList.Common.TextKeys)
local FriendingActionsModule = require(UserList.Cta.friendingActions)
local FriendsStoreChallengeNetworkModule = require(UserList.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local Requests = DataHydrationModule.Friends.Requests
local FriendsStore = DataHydrationModule.Friends.FriendsStore
local ButtonTypes = EnumsModule.ButtonTypes
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), FriendingActionsModule (copy), ButtonTypes (copy), Requests (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), FriendsStore (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		friendRequestSent = TextKeysModule.FriendRequestSent,
		friendAdded = TextKeysModule.FriendAdded,
		invalidTargetUserError = TextKeysModule.InvalidTargetUserError,
		alreadyFriendError = TextKeysModule.AlreadyFriendError,
		maxFriendsError = TextKeysModule.MaxFriendsError,
		invalidNicknameError = TextKeysModule.InvalidNicknameError,
		unauthorizedError = TextKeysModule.UnauthorizedError,
		userBannedError = TextKeysModule.UserBannedError,
		userBlockedError = TextKeysModule.UserBlockedError,
		userNotPassedCaptchaError = TextKeysModule.UserNotPassedCaptchaError,
		tooManyRequestsError = TextKeysModule.TooManyRequestsError,
		defaultFriendingError = TextKeysModule.DefaultFriendingError,
		acceptOrDeclineError = TextKeysModule.SomethingIsWrong
	})
	local ShowToastFunction = p1.showToast
	local FriendshipOriginSourceType = p1.friendshipOriginSourceType
	
	return ReactModule.useMemo(function()
		-- upvalues: ShowToastFunction (copy), FriendingActionsModule (upval), UseLocalizationResult (copy), ButtonTypes (upval), Requests (upval), FriendshipOriginSourceType (copy), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), FriendsStore (upval)
		local function handleResult(Promise, FriendAdded, AcceptOrDeclineError, Callback)
			-- upvalues: ShowToastFunction (upval), FriendingActionsModule (upval), UseLocalizationResult (upval)
			return Promise:andThen(function()
				-- upvalues: FriendAdded (copy), ShowToastFunction (upval), Callback (copy)
				if FriendAdded then
					ShowToastFunction(FriendAdded, false)
				end
				if Callback then
					Callback()
				end
			end, function(p2)
				-- upvalues: FriendingActionsModule (upval), UseLocalizationResult (upval), AcceptOrDeclineError (copy), ShowToastFunction (upval)
				local T = if type(p2) == "table" then p2 else {}
				ShowToastFunction(FriendingActionsModule.getErrorToastMessage(UseLocalizationResult, T.statusCode, T.firstErrorCode) or AcceptOrDeclineError, true)
			end)
		end
		
		return {
			[ButtonTypes.Add] = function(p2, p3)
				-- upvalues: Requests (upval), FriendshipOriginSourceType (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), handleResult (copy), UseLocalizationResult (upval)
				return handleResult(Requests.RequestFriendshipFromUserId(p2, FriendshipOriginSourceType, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil), UseLocalizationResult.friendRequestSent, UseLocalizationResult.defaultFriendingError, p3)
			end,
			[ButtonTypes.Accept] = function(p2, p3)
				-- upvalues: FriendsStore (upval), handleResult (copy), UseLocalizationResult (upval)
				return handleResult(FriendsStore.get().AcceptFriendRequest(p2), UseLocalizationResult.friendAdded, UseLocalizationResult.acceptOrDeclineError, p3)
			end,
			[ButtonTypes.Dismiss] = function(p2, p3)
				-- upvalues: FriendsStore (upval), handleResult (copy), UseLocalizationResult (upval)
				return handleResult(FriendsStore.get().DeclineFriendRequest(p2), nil, UseLocalizationResult.acceptOrDeclineError, p3)
			end
		}
	end, {
		UseLocalizationResult,
		ShowToastFunction,
		FriendshipOriginSourceType
	})
end