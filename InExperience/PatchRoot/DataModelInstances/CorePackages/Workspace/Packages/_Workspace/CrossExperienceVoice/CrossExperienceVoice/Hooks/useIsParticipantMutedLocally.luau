local useSelector = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).RoactUtils.Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref)
		if not p2 or not p2.Squad or not p2.Squad.CrossExperienceVoice then
			return nil
		end
		local var1 = p2.Squad.CrossExperienceVoice.Participants.participants[p1]
		
		return if var1 then var1.isMutedLocally else nil
	end)
end