local useSelector = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).RoactUtils.Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		-- upvalues: p0 (ref)
		if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
			return nil
		end
		local var0 = p1.Squad.CrossExperienceVoice.Participants.participants[p0]
		
		return if var0 then var0.isMutedLocally else nil
	end)
end