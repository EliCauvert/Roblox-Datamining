local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local Parent = SocialContextToasts.Parent
local ToastWrapperModule = require(SocialContextToasts.ToastWrapper)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local ToastTypesModule = require(SocialContextToasts.Enums.ToastTypes)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local CryoModule = require(Parent.Cryo)
local GetFFlagSocialContextToastEventStreamFunction = require(Parent.SharedFlags).GetFFlagSocialContextToastEventStream
local GetFFlagEnableReferredPlayerJoinRemoteEventFunction = require(Parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent

return function(p1) --[[ Line: 44 | Named "ToastRoot" ]]
	-- upvalues: UseSelectorFunction (copy), GetFFlagSocialContextToastEventStreamFunction (copy), CryoModule (copy), ToastTypesModule (copy), ReactModule (copy), ToastWrapperModule (copy), ButtonType (copy), GetFFlagEnableReferredPlayerJoinRemoteEventFunction (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 45 ]]
		return p2.ToastContent
	end)
	local JoinResult = if GetFFlagSocialContextToastEventStreamFunction() then CryoModule.Dictionary.join(p1.analyticsProps, { toastType = UseSelectorResult.toastType }) else nil
	
	if UseSelectorResult.toastType == ToastTypesModule.None then
		return nil
	end
	if UseSelectorResult.toastType ~= ToastTypesModule.YouJoinedFriends then
		return if UseSelectorResult.toastType == ToastTypesModule.FriendJoinedYou then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendJoinedYou",
					FRIEND_NAME = UseSelectorResult.joinerName
				}
			},
			userIdList = { UseSelectorResult.joinerUserId },
			analyticsProps = JoinResult
		}) elseif UseSelectorResult.toastType == ToastTypesModule.FriendInNonRootPlace then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.FriendInNonRootPlace",
					FRIEND_NAME = UseSelectorResult.joinerName
				}
			},
			userIdList = { UseSelectorResult.joinerUserId },
			analyticsProps = JoinResult
		}) elseif UseSelectorResult.toastType == ToastTypesModule.FollowYourFriend then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				button = "Feature.SocialContextToast.Action.JoinFriend",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendInOtherUniverse",
					FRIEND_NAME = UseSelectorResult.joinerName,
					EXPERIENCE_NAME = UseSelectorResult.experienceName
				}
			},
			userIdList = { UseSelectorResult.joinerUserId },
			onActivated = UseSelectorResult.onActivated,
			buttonType = ButtonType.PrimaryContextual,
			analyticsProps = JoinResult
		}) elseif UseSelectorResult.toastType == ToastTypesModule.InviteBack then ReactModule.createElement(ToastWrapperModule, {
			areUsersActive = false,
			toastStrings = {
				button = "Feature.SocialContextToast.Action.InviteBack",
				label = {
					"Feature.SocialContextToast.Message.FollowedFriendNotInGame",
					FRIEND_NAME = UseSelectorResult.joinerName
				}
			},
			userIdList = { UseSelectorResult.joinerUserId },
			onActivated = UseSelectorResult.onActivated,
			analyticsProps = JoinResult
		}) elseif UseSelectorResult.toastType == ToastTypesModule.InviteSuccess then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationConfirmation"
			},
			analyticsProps = JoinResult
		}) elseif UseSelectorResult.toastType == ToastTypesModule.InviteFailure then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				label = "Feature.SocialContextToast.Message.InvitationFailure"
			},
			analyticsProps = JoinResult
		}) elseif GetFFlagEnableReferredPlayerJoinRemoteEventFunction() and UseSelectorResult.toastType == ToastTypesModule.InviteeJoinedYou then ReactModule.createElement(ToastWrapperModule, {
			toastStrings = {
				label = {
					"Feature.SocialContextToast.Message.InviteeJoinedYou",
					INVITEE_NAME = UseSelectorResult.joinerName
				}
			},
			userIdList = { UseSelectorResult.joinerUserId },
			analyticsProps = JoinResult
		}) else nil
	end
	local ToastStrings = nil
	local UserList = UseSelectorResult.userList
	
	if #UserList == 1 then
		ToastStrings = {
			label = {
				"Feature.SocialContextToast.Message.YouJoinedOneFriend",
				FRIEND_NAME = UserList[1].name
			}
		}
	elseif #UserList == 2 then
		ToastStrings = {
			label = {
				"Feature.SocialContextToast.Message.YouJoinedTwoFriends",
				FRIEND_NAME_ONE = UserList[1].name,
				FRIEND_NAME_TWO = UserList[2].name
			}
		}
	elseif #UserList > 2 then
		ToastStrings = {
			label = {
				"Feature.SocialContextToast.Message.YouJoinedManyFriends",
				FRIEND_NAME = UserList[1].name,
				FRIEND_COUNT = #UserList - 1
			}
		}
	end
	local UserIdList = {}
	
	for i, _ in UserList do
		table.insert(UserIdList, UserList[i].userId)
	end
	return ReactModule.createElement(ToastWrapperModule, {
		toastStrings = ToastStrings,
		userIdList = UserIdList,
		analyticsProps = JoinResult
	})
end