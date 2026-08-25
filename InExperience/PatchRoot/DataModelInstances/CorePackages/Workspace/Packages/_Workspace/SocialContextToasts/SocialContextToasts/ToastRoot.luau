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

return function(p0)
	-- upvalues: useSelector (ref), getFFlagSocialContextToastEventStream (ref), cryoModule (ref), toastTypesModule (ref), reactModule (ref), toastWrapperModule (ref), buttonType (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (ref)
	local var5 = useSelector(function(p1)
		return p1.ToastContent
	end)
	local var6 = if getFFlagSocialContextToastEventStream() then cryoModule.Dictionary.join(p0.analyticsProps, { toastType = var5.toastType }) else nil
	
	if var5.toastType == toastTypesModule.None then
		return nil
	elseif var5.toastType == toastTypesModule.YouJoinedFriends then
		local t = nil
		local userList = var5.userList
		
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
			analyticsProps = var6
		})
	else
		return if var5.toastType == toastTypesModule.FriendJoinedYou then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendJoinedYou",
					FRIEND_NAME = var5.joinerName
				}
			},
			userIdList = { var5.joinerUserId },
			analyticsProps = var6
		}) elseif var5.toastType == toastTypesModule.FriendInNonRootPlace then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendInNonRootPlace",
					FRIEND_NAME = var5.joinerName
				}
			},
			userIdList = { var5.joinerUserId },
			analyticsProps = var6
		}) elseif var5.toastType == toastTypesModule.FollowYourFriend then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				button = "Feature.SocialContextToast.Action.JoinFriend",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendInOtherUniverse",
					FRIEND_NAME = var5.joinerName,
					EXPERIENCE_NAME = var5.experienceName
				}
			},
			userIdList = { var5.joinerUserId },
			onActivated = var5.onActivated,
			buttonType = buttonType.PrimaryContextual,
			analyticsProps = var6
		}) elseif var5.toastType == toastTypesModule.InviteBack then reactModule.createElement(toastWrapperModule, {
			areUsersActive = false,
			toastStrings = {
				button = "Feature.SocialContextToast.Action.InviteBack",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendNotInGame",
					FRIEND_NAME = var5.joinerName
				}
			},
			userIdList = { var5.joinerUserId },
			onActivated = var5.onActivated,
			analyticsProps = var6
		}) elseif var5.toastType == toastTypesModule.InviteSuccess then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationConfirmation"
			},
			analyticsProps = var6
		}) elseif var5.toastType == toastTypesModule.InviteFailure then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationFailure"
			},
			analyticsProps = var6
		}) elseif getFFlagEnableReferredPlayerJoinRemoteEvent() and var5.toastType == toastTypesModule.InviteeJoinedYou then reactModule.createElement(toastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.InviteeJoinedYou",
					INVITEE_NAME = var5.joinerName
				}
			},
			userIdList = { var5.joinerUserId },
			analyticsProps = var6
		}) else nil
	end
end