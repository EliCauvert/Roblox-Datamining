local playButtonStates = require(script:FindFirstAncestor("VirtualEvents").Parent.GamePlayButton).PlayButtonStates

return function(p0)
	-- upvalues: playButtonStates (ref)
	return {
		isJoinEventDisabled = not (if p0.playButtonState ~= playButtonStates.Playable then p0.playButtonState == playButtonStates.PlayableWithParty else true),
		isRsvpDisabled = not (p0.playabilityStatus and p0.playabilityStatus.isPlayable)
	}
end