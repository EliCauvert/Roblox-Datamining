local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local ParticipantAvatarModule = require(FriendsCalling.Components.CallParticipant.ParticipantAvatar)
local AvatarSize = FoundationModule.Enums.AvatarSize
local IconName = FoundationModule.Enums.IconName
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), ParticipantAvatarModule (copy), AvatarSize (copy), IconButton (copy), IconName (copy), InputSize (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-small size-full padding-medium stroke-standard stroke-default radius-large clip bg-surface-200"
	}, {
		Avatar = ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "friends-calling-pip-drag-target",
			ref = p1.onDragInputTarget,
			Size = UDim2.fromOffset(70, 70)
		}, {
			Content = ReactModule.createElement(ParticipantAvatarModule, {
				ringSize = 70,
				avatarSize = AvatarSize.XLarge,
				isDimmed = p1.participant.isDimmed,
				isSpeaking = p1.participant.isSpeaking,
				userId = p1.participant.userId
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center gap-xsmall auto-xy padding-xsmall radius-circle bg-over-media-300"
		}, {
			Headphones = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "friends-calling-pip-headphones",
				icon = IconName.Headphones,
				onActivated = p1.onToggleConversationAudio,
				size = InputSize.Medium
			}),
			Microphone = ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "friends-calling-pip-microphone",
				icon = if p1.isMicrophoneMuted then IconName.MicrophoneSlash else IconName.Microphone,
				onActivated = p1.onToggleMicrophone,
				size = InputSize.Medium
			})
		})
	})
end