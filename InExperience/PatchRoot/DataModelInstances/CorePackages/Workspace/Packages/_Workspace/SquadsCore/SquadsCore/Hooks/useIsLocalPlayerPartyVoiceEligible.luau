local useSelector = require(script:FindFirstAncestor("SquadsCore").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsUserPartyVoiceEligibleModule = require(script.Parent.useIsUserPartyVoiceEligible)

function useIsLocalPlayerPartyVoiceEligible()
	-- upvalues: useSelector (ref), useIsUserPartyVoiceEligibleModule (ref)
	local var1 = useSelector(function(p1)
		return if p1 and p1.LocalUserId then tonumber(p1.LocalUserId) or 0 else 0
	end)
	
	return useIsUserPartyVoiceEligibleModule(var1), var1 == 0
end

return useIsLocalPlayerPartyVoiceEligible