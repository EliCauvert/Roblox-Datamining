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
	local var6 = useScreenSize()
	local var7 = useDispatch()
	local var8 = useLocalUserId()
	local var9 = useNavigation()
	local friendRequestParams = robloxAppNavigationModule.useNavigationProps(function(_, p0)
		return { friendRequestParams = p0.friendRequestParams }
	end).friendRequestParams
	local var10 = useUserProfilesFetch({
		userIds = { friendRequestParams.targetUserId },
		query = userProfilesDisplayNameAndUsernameByUserIds
	})
	local _ = nil
	local var11 = if friendRequestParams and var10 and var10.data then userProfilesModule.Selectors.getDisplayNameFromId(var10.data, friendRequestParams.targetUserId) else nil
	
	local var12 = function(p1)
		-- upvalues: var8 (ref), var7 (ref), friendsNetworkingModule (copy)
		return var7(friendsNetworkingModule.ValidateFriendRequestNickname.API({ senderNickname = p1, currentUserId = var8 }))
	end
	
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	
	return reactModule.createElement(setNicknameModalModule, {
		friendRequestSource = friendRequestParams.source,
		recipientDisplayName = var11,
		screenSize = var6,
		navigateBack = var9.goBack,
		sendFriendRequest = function()
			-- upvalues: var8 (ref), friendRequestParams (ref), var7 (ref), friendsNetworkingModule (copy)
			return var7(friendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = var8,
				targetUserId = friendRequestParams.targetUserId,
				friendshipOriginSourceType = friendRequestParams.source
			}))
		end,
		sendFriendRequestWithNickname = function(p2)
			-- upvalues: var8 (ref), friendRequestParams (ref), var7 (ref), friendsNetworkingModule (copy)
			return var7(friendsNetworkingModule.RequestFriendshipFromUserId.API({
				currentUserId = var8,
				targetUserId = friendRequestParams.targetUserId,
				friendshipOriginSourceType = friendRequestParams.source,
				senderNickname = p2
			}))
		end,
		validateNickname = var12,
		onTextInput = var13,
		setOnTextInput = var14,
		isSaveButtonEnabled = var15,
		setSaveButtonEnabled = var16,
		source = friendRequestParams.source
	})
end