local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SetNicknameModalModule = require(script.Parent.SetNicknameModal)
local ReactModule = require(Parent1.React)
local FriendsNetworkingModule = require(Parent.Networking.FriendsNetworking)
local UserProfilesModule = require(Parent1.UserProfiles)
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent1.RobloxAppHooks).useLocalUserId
local RobloxAppNavigationModule = require(Parent1.RobloxAppNavigation)
local UseNavigationFunction = require(Parent1.Navigation).useNavigation
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local UserProfilesDisplayNameAndUsernameByUserIds = UserProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds

return function()
	-- upvalues: UseScreenSizeFunction (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseNavigationFunction (copy), RobloxAppNavigationModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesDisplayNameAndUsernameByUserIds (copy), UserProfilesModule (copy), FriendsNetworkingModule (copy), ReactModule (copy), SetNicknameModalModule (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseNavigationResult = UseNavigationFunction()
	local FriendRequestParams = RobloxAppNavigationModule.useNavigationProps(function(_, p1)
		return { friendRequestParams = p1.friendRequestParams }
	end).friendRequestParams
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = { FriendRequestParams.targetUserId },
		query = UserProfilesDisplayNameAndUsernameByUserIds
	})
	local DisplayNameFromId = if FriendRequestParams and UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getDisplayNameFromId(UseUserProfilesFetchResult.data, FriendRequestParams.targetUserId) else nil
	
	local function ValidateNickname(SenderNickname)
		-- upvalues: UseLocalUserIdResult (copy), UseDispatchResult (copy), FriendsNetworkingModule (upval)
		return UseDispatchResult(FriendsNetworkingModule.ValidateFriendRequestNickname.API({
			senderNickname = SenderNickname,
			currentUserId = UseLocalUserIdResult
		}))
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return ReactModule.createElement(SetNicknameModalModule, {
		friendRequestSource = FriendRequestParams.source,
		recipientDisplayName = DisplayNameFromId,
		screenSize = UseScreenSizeResult,
		navigateBack = UseNavigationResult.goBack,
		sendFriendRequest = function()
			-- upvalues: UseLocalUserIdResult (copy), FriendRequestParams (copy), UseDispatchResult (copy), FriendsNetworkingModule (upval)
			return UseDispatchResult(FriendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = UseLocalUserIdResult,
				targetUserId = FriendRequestParams.targetUserId,
				friendshipOriginSourceType = FriendRequestParams.source
			}))
		end,
		sendFriendRequestWithNickname = function(SenderNickname)
			-- upvalues: UseLocalUserIdResult (copy), FriendRequestParams (copy), UseDispatchResult (copy), FriendsNetworkingModule (upval)
			return UseDispatchResult(FriendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = UseLocalUserIdResult,
				targetUserId = FriendRequestParams.targetUserId,
				friendshipOriginSourceType = FriendRequestParams.source,
				senderNickname = SenderNickname
			}))
		end,
		validateNickname = ValidateNickname,
		onTextInput = UseStateResult,
		setOnTextInput = UseStateResult2,
		isSaveButtonEnabled = UseStateResult1,
		setSaveButtonEnabled = UseStateResult2_1,
		source = FriendRequestParams.source
	})
end