local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local useCurrentSquadMemberModule = require(script.Parent.useCurrentSquadMember)
local reactModule = require(parent.React)
local _ = require(parent.RoduxSquads)
local getFFlagEnablePartyVoiceOnlyForEligibleUsersModule = require(squadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers)
local getFStringPartyVoiceEligibilityAllowListModule = require(squadsCore.Flags.GetFStringPartyVoiceEligibilityAllowList)

function getIsUserWhitelisted(p1)
	-- upvalues: getFStringPartyVoiceEligibilityAllowListModule (ref)
	for i in getFStringPartyVoiceEligibilityAllowListModule():gmatch("%d+") do
		if tonumber(i) == p1 then
			return true
		end
	end
	return false
end

function useIsUserPartyVoiceEligible(p2)
	-- upvalues: useCurrentSquadMemberModule (ref), reactModule (ref)
	local var1 = useCurrentSquadMemberModule(p2)
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return var1 and var1.partyVoiceEligible == true
	end, { var1 }) or reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return getIsUserWhitelisted(p2)
	end, { p2 })
end

return if getFFlagEnablePartyVoiceOnlyForEligibleUsersModule() then useIsUserPartyVoiceEligible else function(_)
	return true
end