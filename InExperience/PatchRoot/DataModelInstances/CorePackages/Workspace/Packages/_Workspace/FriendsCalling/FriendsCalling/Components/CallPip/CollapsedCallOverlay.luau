local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local ParticipantAvatarModule = require(FriendsCalling.Components.CallParticipant.ParticipantAvatar)
local _ = require(FriendsCalling.Stores.GetFriendsCallingStore)
local PassInputThroughModule = require(FriendsCalling.Utils.passInputThrough)
local FriendsCallingParticipantStatus = Enum.FriendsCallingParticipantStatus
local AvatarSize = FoundationModule.Enums.AvatarSize
local IconName = FoundationModule.Enums.IconName
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: FriendsCallingParticipantStatus (copy), ReactModule (copy), View (copy), PassInputThroughModule (copy), Text (copy), ParticipantAvatarModule (copy), AvatarSize (copy), IconButton (copy), IconName (copy), InputSize (copy)
	local Participant = p1.participant
	local IsRinging = if Participant == nil then p1.isRinging else Participant.showStatusAnimation
	local SelfParticipant = p1.selfParticipant
	local IsStatusMatch: boolean = SelfParticipant ~= nil and SelfParticipant.status == FriendsCallingParticipantStatus.Muted
	local IsCallVolumeMatch = p1.callVolume == 0
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-small size-full padding-medium stroke-standard stroke-default radius-large clip bg-surface-200",
		testId = "friends-calling-pip-drag-target",
		ref = p1.onDragInputTarget
	}, {
		Avatar = ReactModule.createElement(View, {
			LayoutOrder = 1,
			ref = PassInputThroughModule,
			Size = UDim2.fromOffset(70, 70)
		}, {
			Content = if IsRinging then ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				testId = "friends-calling-pip-ringing",
				Text = if Participant == nil then "Ringing" else Participant.statusText or ""
			}) elseif Participant == nil then nil else ReactModule.createElement(ParticipantAvatarModule, {
				ringSize = 70,
				avatarSize = AvatarSize.XLarge,
				isDimmed = Participant.isDimmed,
				isSpeaking = Participant.isSpeaking,
				userId = Participant.userId
			})
		}),
		Actions = if IsRinging then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center gap-xsmall auto-xy padding-xsmall radius-circle bg-over-media-300"
		}, {
			Speaker = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "friends-calling-pip-speaker",
				icon = if IsCallVolumeMatch then IconName.SpeakerSlash else IconName.Speaker,
				onActivated = function()
					-- upvalues: p1 (copy), IsCallVolumeMatch (copy)
					p1.onToggleConversationAudio(not IsCallVolumeMatch)
				end,
				size = InputSize.Medium
			}),
			Microphone = ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "friends-calling-pip-microphone",
				icon = if IsStatusMatch then IconName.MicrophoneSlash else IconName.Microphone,
				onActivated = function()
					-- upvalues: p1 (copy), IsStatusMatch (copy)
					p1.onToggleMicrophone(not IsStatusMatch)
				end,
				size = InputSize.Medium
			})
		})
	})
end