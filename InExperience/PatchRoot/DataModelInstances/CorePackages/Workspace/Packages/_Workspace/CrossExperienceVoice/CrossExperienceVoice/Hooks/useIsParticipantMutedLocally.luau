local UseSelectorFunction = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).RoactUtils.Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 8 ]]
		-- upvalues: p1 (copy)
		if p2 and p2.Squad and p2.Squad.CrossExperienceVoice then
			local Participant = p2.Squad.CrossExperienceVoice.Participants.participants[p1]
			
			return if Participant then Participant.isMutedLocally else nil
		else
			return nil
		end
	end)
end