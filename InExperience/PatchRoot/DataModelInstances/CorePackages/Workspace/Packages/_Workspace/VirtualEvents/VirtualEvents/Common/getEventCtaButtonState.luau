local PlayButtonStates = require(script:FindFirstAncestor("VirtualEvents").Parent.GamePlayButton).PlayButtonStates

return function(p1) --[[ Line: 14 | Named "getEventCtaButtonState" ]]
	-- upvalues: PlayButtonStates (copy)
	return {
		isJoinEventDisabled = not (p1.playButtonState == PlayButtonStates.Playable or p1.playButtonState == PlayButtonStates.PlayableWithParty),
		isRsvpDisabled = not (p1.playabilityStatus and p1.playabilityStatus.isPlayable)
	}
end