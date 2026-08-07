local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local useCurrentSquadMemberModule = require(script.Parent.useCurrentSquadMember)
local reactModule = require(parent.React)
local _ = require(parent.RoduxSquads)
local getFFlagEnablePartyVoiceOnlyForEligibleUsersModule = require(squadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers)
local getFStringPartyVoiceEligibilityAllowListModule = require(squadsCore.Flags.GetFStringPartyVoiceEligibilityAllowList)

function getIsUserWhitelisted(p0) --[[ line: 15 ]]
	-- upvalues: getFStringPartyVoiceEligibilityAllowListModule (ref)
	for i in getFStringPartyVoiceEligibilityAllowListModule():gmatch("%d+") do
		if tonumber(i) == p0 then
			return true
		end
	end
	return false
end

function useIsUserPartyVoiceEligible(p1) --[[ line: 24 ]]
	-- upvalues: useCurrentSquadMemberModule (ref), reactModule (ref)
	local var5 = useCurrentSquadMemberModule(p1)
	
	return reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: var5 (ref)
		return var5 and var5.partyVoiceEligible == true
	end, { var5 }) or reactModule.useMemo(function() --[[ line: 31 ]]
		-- upvalues: p1 (ref)
		return getIsUserWhitelisted(p1)
	end, { p1 })
end

return if getFFlagEnablePartyVoiceOnlyForEligibleUsersModule() then useIsUserPartyVoiceEligible else function(_) --[[ line: 40 ]]
	return true
end