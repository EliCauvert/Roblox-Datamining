local Players = game:GetService("Players")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local GetFFlagEnablePartyVoiceOnlyForEligibleUsersFunction = require(Parent.SquadsCore.Flags).GetFFlagEnablePartyVoiceOnlyForEligibleUsers
local GetFStringPartyVoiceEligibilityAllowListFunction = require(Parent.SquadsCore.Flags).GetFStringPartyVoiceEligibilityAllowList

function getIsUserWhitelisted(Number): boolean
	-- upvalues: GetFStringPartyVoiceEligibilityAllowListFunction (copy)
	for i in GetFStringPartyVoiceEligibilityAllowListFunction():gmatch("%d+") do
		if tonumber(i) == Number then
			return true
		end
	end
	return false
end

function useIsAnyOtherUserPartyVoiceEligible()
	-- upvalues: Players (copy), UseCurrentSquadSelectorFunction (copy), React (copy)
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local UseMemoResult = React.useMemo(function()
		-- upvalues: UseCurrentSquadSelectorResult (copy)
		return if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.members else {}
	end, { UseCurrentSquadSelectorResult })
	
	return React.useMemo(function(): boolean
		-- upvalues: UserId (copy), UseMemoResult (copy)
		if UserId ~= 0 then
			for _, value in ipairs(UseMemoResult) do
				if value.userId ~= UserId and (value.partyVoiceEligible or getIsUserWhitelisted(value.userId)) then
					return true
				end
			end
		end
		return false
	end, { UserId, UseMemoResult })
end

return if GetFFlagEnablePartyVoiceOnlyForEligibleUsersFunction() then useIsAnyOtherUserPartyVoiceEligible else function(): boolean
	return true
end