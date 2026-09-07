local parent = script.Parent.Parent
local parent_1 = parent.Parent
local setNicknameModalModule = require(script.Parent.SetNicknameModal)
local reactModule = require(parent_1.React)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local friendsNetworkingModule = require(parent.Networking.FriendsNetworking)
local userProfilesModule = require(parent_1.UserProfiles)
local useScreenSize = robloxAppHooksModule.useScreenSize
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent_1.RobloxAppHooks).useLocalUserId
local robloxAppNavigationModule = require(parent_1.RobloxAppNavigation)
local useNavigation = require(parent_1.Navigation).useNavigation
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local userProfilesDisplayNameAndUsernameByUserIds = userProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds

return function()
	-- upvalues: useScreenSize (ref), useDispatch (ref), useLocalUserId (ref), useNavigation (ref), robloxAppNavigationModule (ref), useUserProfilesFetch (ref), userProfilesDisplayNameAndUsernameByUserIds (ref), userProfilesModule (ref), friendsNetworkingModule (ref), reactModule (ref), setNicknameModalModule (ref)
	local var1 = useScreenSize()
	local var2 = useDispatch()
	local var3 = useLocalUserId()
	local var4 = useNavigation()
	local friendRequestParams = robloxAppNavigationModule.useNavigationProps(function(_, p1)
		return { friendRequestParams = p1.friendRequestParams }
	end).friendRequestParams
	local var5 = useUserProfilesFetch({
		userIds = { friendRequestParams.targetUserId },
		query = userProfilesDisplayNameAndUsernameByUserIds
	})
	local _ = nil
	local var6 = if friendRequestParams and var5 and var5.data then userProfilesModule.Selectors.getDisplayNameFromId(var5.data, friendRequestParams.targetUserId) else nil
	
	local var7 = function(p1)
		-- upvalues: var3 (ref), var2 (ref), friendsNetworkingModule (copy)
		return var2(friendsNetworkingModule.ValidateFriendRequestNickname.API({ senderNickname = p1, currentUserId = var3 }))
	end
	
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	
	return reactModule.createElement(setNicknameModalModule, {
		friendRequestSource = friendRequestParams.source,
		recipientDisplayName = var6,
		screenSize = var1,
		navigateBack = var4.goBack,
		sendFriendRequest = function()
			-- upvalues: var3 (ref), friendRequestParams (ref), var2 (ref), friendsNetworkingModule (copy)
			return var2(friendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = var3,
				targetUserId = friendRequestParams.targetUserId,
				friendshipOriginSourceType = friendRequestParams.source
			}))
		end,
		sendFriendRequestWithNickname = function(p1)
			-- upvalues: var3 (ref), friendRequestParams (ref), var2 (ref), friendsNetworkingModule (copy)
			return var2(friendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = var3,
				targetUserId = friendRequestParams.targetUserId,
				friendshipOriginSourceType = friendRequestParams.source,
				senderNickname = p1
			}))
		end,
		validateNickname = var7,
		onTextInput = var8,
		setOnTextInput = var9,
		isSaveButtonEnabled = var10,
		setSaveButtonEnabled = var11,
		source = friendRequestParams.source
	})
end