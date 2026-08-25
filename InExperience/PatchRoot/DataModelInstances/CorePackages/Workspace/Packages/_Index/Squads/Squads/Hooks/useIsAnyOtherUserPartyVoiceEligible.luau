local playersService = game:GetService("Players")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local getFFlagEnablePartyVoiceOnlyForEligibleUsers = require(parent.SquadsCore.Flags).GetFFlagEnablePartyVoiceOnlyForEligibleUsers
local getFStringPartyVoiceEligibilityAllowList = require(parent.SquadsCore.Flags).GetFStringPartyVoiceEligibilityAllowList

function getIsUserWhitelisted(p0)
	-- upvalues: getFStringPartyVoiceEligibilityAllowList (ref)
	for i in getFStringPartyVoiceEligibilityAllowList():gmatch("%d+") do
		if tonumber(i) == p0 then
			return true
		end
	end
	return false
end

function useIsAnyOtherUserPartyVoiceEligible()
	-- upvalues: playersService (ref), useCurrentSquadSelector (ref), react (ref)
	local var3 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
	local var4 = useCurrentSquadSelector()
	local var5 = react.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 then var4.members else {}
	end, { var4 })
	
	return react.useMemo(function()
		-- upvalues: var3 (ref), var5 (ref)
		if var3 ~= 0 then
			for i, v in ipairs(var5) do
				if v.userId ~= var3 and (v.partyVoiceEligible or getIsUserWhitelisted(v.userId)) then
					return true
				end
			end
		end
		return false
	end, { var3, var5 })
end

return if getFFlagEnablePartyVoiceOnlyForEligibleUsers() then useIsAnyOtherUserPartyVoiceEligible else function()
	return true
end