local playButtonStates = require(script:FindFirstAncestor("VirtualEvents").Parent.GamePlayButton).PlayButtonStates

return function(p1)
	-- upvalues: playButtonStates (ref)
	return {
		isJoinEventDisabled = not (if p1.playButtonState ~= playButtonStates.Playable then p1.playButtonState == playButtonStates.PlayableWithParty else true),
		isRsvpDisabled = not (p1.playabilityStatus and p1.playabilityStatus.isPlayable)
	}
end