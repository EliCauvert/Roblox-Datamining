local useSelector = require(script:FindFirstAncestor("SquadsCore").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsUserPartyVoiceEligibleModule = require(script.Parent.useIsUserPartyVoiceEligible)

function useIsLocalPlayerPartyVoiceEligible() --[[ line: 9 ]]
	-- upvalues: useSelector (ref), useIsUserPartyVoiceEligibleModule (ref)
	local var1 = useSelector(function(p0) --[[ line: 10 ]]
		return if p0 and p0.LocalUserId then tonumber(p0.LocalUserId) or 0 else 0
	end)
	
	return useIsUserPartyVoiceEligibleModule(var1), var1 == 0
end

return useIsLocalPlayerPartyVoiceEligible