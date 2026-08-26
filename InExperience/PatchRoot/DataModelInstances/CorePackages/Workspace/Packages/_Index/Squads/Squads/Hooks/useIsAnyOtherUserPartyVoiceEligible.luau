local playersService = game:GetService("Players")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local getFFlagEnablePartyVoiceOnlyForEligibleUsers = require(parent.SquadsCore.Flags).GetFFlagEnablePartyVoiceOnlyForEligibleUsers
local getFStringPartyVoiceEligibilityAllowList = require(parent.SquadsCore.Flags).GetFStringPartyVoiceEligibilityAllowList

function getIsUserWhitelisted(p1)
	-- upvalues: getFStringPartyVoiceEligibilityAllowList (ref)
	for i in getFStringPartyVoiceEligibilityAllowList():gmatch("%d+") do
		if tonumber(i) == p1 then
			return true
		end
	end
	return false
end

function useIsAnyOtherUserPartyVoiceEligible()
	-- upvalues: playersService (ref), useCurrentSquadSelector (ref), react (ref)
	local var1 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
	local var2 = useCurrentSquadSelector()
	local var3 = react.useMemo(function()
		-- upvalues: var2 (ref)
		return if var2 then var2.members else {}
	end, { var2 })
	
	return react.useMemo(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1 ~= 0 then
			for i, v in ipairs(var3) do
				if v.userId ~= var1 and (v.partyVoiceEligible or getIsUserWhitelisted(v.userId)) then
					return true
				end
			end
		end
		return false
	end, { var1, var3 })
end

return if getFFlagEnablePartyVoiceOnlyForEligibleUsers() then useIsAnyOtherUserPartyVoiceEligible else function()
	return true
end