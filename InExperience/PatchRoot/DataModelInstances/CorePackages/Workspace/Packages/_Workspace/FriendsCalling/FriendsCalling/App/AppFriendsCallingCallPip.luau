local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local ReactModule = require(FriendsCalling.Parent.React)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local CallPipModule = require(FriendsCalling.Components.CallPip.CallPip)
local Host = {
	exposesTopSafeArea = false,
	followsAppColorMode = true,
	displayOrder = require(FriendsCalling.CallPipDisplayOrder).InApp,
	screenInsets = Enum.ScreenInsets.None
}
local Participant = {
	userId = 0,
	name = "Name",
	statusText = "Ringing",
	isMuted = false,
	isSpeaking = false,
	isDimmed = true,
	showStatusAnimation = true
}

return function()
	-- upvalues: ReactModule (copy), CallPipModule (copy), Host (copy), Participant (copy)
	return ReactModule.createElement(CallPipModule, {
		isMicrophoneMuted = false,
		host = Host,
		participant = Participant
	})
end