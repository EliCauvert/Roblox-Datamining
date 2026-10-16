local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local UseCurrentSquadMemberModule = require(script.Parent.useCurrentSquadMember)
local ReactModule = require(Parent.React)
local _ = require(Parent.RoduxSquads)
local GetFFlagEnablePartyVoiceOnlyForEligibleUsersModule = require(SquadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers)
local GetFStringPartyVoiceEligibilityAllowListModule = require(SquadsCore.Flags.GetFStringPartyVoiceEligibilityAllowList)

function getIsUserWhitelisted(Number): boolean --[[ Line: 15 ]]
	-- upvalues: GetFStringPartyVoiceEligibilityAllowListModule (copy)
	for i in GetFStringPartyVoiceEligibilityAllowListModule():gmatch("%d+") do
		if tonumber(i) == Number then
			return true
		end
	end
	return false
end

function useIsUserPartyVoiceEligible(p1) --[[ Line: 24 ]]
	-- upvalues: UseCurrentSquadMemberModule (copy), ReactModule (copy)
	local UseCurrentSquadMemberModuleResult = UseCurrentSquadMemberModule(p1)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 31 ]]
		-- upvalues: p1 (copy)
		return getIsUserWhitelisted(p1)
	end, { p1 })
	
	return ReactModule.useMemo(function(): boolean --[[ Line: 27 ]]
		-- upvalues: UseCurrentSquadMemberModuleResult (copy)
		return UseCurrentSquadMemberModuleResult and UseCurrentSquadMemberModuleResult.partyVoiceEligible == true
	end, { UseCurrentSquadMemberModuleResult }) or UseMemoResult
end

return if GetFFlagEnablePartyVoiceOnlyForEligibleUsersModule() then useIsUserPartyVoiceEligible else function(_): boolean --[[ Line: 40 ]]
	return true
end