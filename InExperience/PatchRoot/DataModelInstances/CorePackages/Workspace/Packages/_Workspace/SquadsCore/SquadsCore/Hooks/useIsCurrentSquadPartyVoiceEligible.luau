local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local useCurrentSquadParentChannelIdModule = require(squadsCore.Hooks.useCurrentSquadParentChannelId)
local reactModule = require(parent.React)
local getFFlagEnablePartyVoiceOnlyForUnfilteredThreadsModule = require(squadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForUnfilteredThreads)

function useIsCurrentSquadPartyVoiceEligible()
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), useCurrentSquadParentChannelIdModule (ref)
	return reactModule.useContext(squadExternalContractContextModule).useParentChannelIsPartyVoiceEligible(useCurrentSquadParentChannelIdModule() or "")
end

return if getFFlagEnablePartyVoiceOnlyForUnfilteredThreadsModule() then useIsCurrentSquadPartyVoiceEligible else function()
	return true
end