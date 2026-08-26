local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local parent = socialContextToasts.Parent
local toastWrapperModule = require(socialContextToasts.ToastWrapper)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local toastTypesModule = require(socialContextToasts.Enums.ToastTypes)
local buttonType = require(parent.UIBlox).App.Button.Enum.ButtonType
local cryoModule = require(parent.Cryo)
local getFFlagSocialContextToastEventStream = require(parent.SharedFlags).GetFFlagSocialContextToastEventStream
local getFFlagEnableReferredPlayerJoinRemoteEvent = require(parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent

return function(p1)
	-- upvalues: useSelector (ref), getFFlagSocialContextToastEventStream (ref), cryoModule (ref), toastTypesModule (ref), reactModule (ref), toastWrapperModule (ref), buttonType (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (ref)
	local var1 = useSelector(function(p2)
		return p2.ToastContent
	end)
	local var2 = if getFFlagSocialContextToastEventStream() then cryoModule.Dictionary.join(p1.analyticsProps, { toastType = var1.toastType }) else nil
	
	if var1.toastType == toastTypesModule.None then
		return nil
	elseif var1.toastType == toastTypesModule.YouJoinedFriends then
		local t = nil
		local userList = var1.userList
		
		if #userList == 1 then
			t = {
				label = {
					"Feature.SocialContextToast.Message.YouJoinedOneFriend",
					FRIEND_NAME = userList[1].name
				}
			}
		elseif #userList == 2 then
			t = {
				label = {
					"Feature.SocialContextToast.Message.YouJoinedTwoFriends",
					FRIEND_NAME_ONE = userList[1].name,
					FRIEND_NAME_TWO = userList[2].name
				}
			}
		elseif #userList > 2 then
			t = {
				label = {
					"Feature.SocialContextToast.Message.YouJoinedManyFriends",
					FRIEND_NAME = userList[1].name,
					FRIEND_COUNT = #userList - 1
				}
			}
		end
		local t_1 = {}
		
		for i, v in userList do
			table.insert(t_1, userList[i].userId)
		end
		return reactModule.createElement(toastWrapperModule, {
			toastStrings = t,
			userIdList = t_1,
			analyticsProps = var2
		})
	else
		return if var1.toastType == toastTypesModule.FriendJoinedYou then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendJoinedYou",
					FRIEND_NAME = var1.joinerName
				}
			},
			userIdList = { var1.joinerUserId },
			analyticsProps = var2
		}) elseif var1.toastType == toastTypesModule.FriendInNonRootPlace then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendInNonRootPlace",
					FRIEND_NAME = var1.joinerName
				}
			},
			userIdList = { var1.joinerUserId },
			analyticsProps = var2
		}) elseif var1.toastType == toastTypesModule.FollowYourFriend then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				button = "Feature.SocialContextToast.Action.JoinFriend",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendInOtherUniverse",
					FRIEND_NAME = var1.joinerName,
					EXPERIENCE_NAME = var1.experienceName
				}
			},
			userIdList = { var1.joinerUserId },
			onActivated = var1.onActivated,
			buttonType = buttonType.PrimaryContextual,
			analyticsProps = var2
		}) elseif var1.toastType == toastTypesModule.InviteBack then reactModule.createElement(toastWrapperModule, {
			areUsersActive = false,
			toastStrings = {
				button = "Feature.SocialContextToast.Action.InviteBack",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendNotInGame",
					FRIEND_NAME = var1.joinerName
				}
			},
			userIdList = { var1.joinerUserId },
			onActivated = var1.onActivated,
			analyticsProps = var2
		}) elseif var1.toastType == toastTypesModule.InviteSuccess then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationConfirmation"
			},
			analyticsProps = var2
		}) elseif var1.toastType == toastTypesModule.InviteFailure then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationFailure"
			},
			analyticsProps = var2
		}) elseif getFFlagEnableReferredPlayerJoinRemoteEvent() and var1.toastType == toastTypesModule.InviteeJoinedYou then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.InviteeJoinedYou",
					INVITEE_NAME = var1.joinerName
				}
			},
			userIdList = { var1.joinerUserId },
			analyticsProps = var2
		}) else nil
	end
end