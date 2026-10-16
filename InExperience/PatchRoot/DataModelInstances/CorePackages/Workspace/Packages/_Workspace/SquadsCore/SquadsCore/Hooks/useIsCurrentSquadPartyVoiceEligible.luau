local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local UseCurrentSquadParentChannelIdModule = require(SquadsCore.Hooks.useCurrentSquadParentChannelId)
local ReactModule = require(SquadsCore.Parent.React)
local GetFFlagEnablePartyVoiceOnlyForUnfilteredThreadsModule = require(SquadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForUnfilteredThreads)

function useIsCurrentSquadPartyVoiceEligible() --[[ Line: 13 ]]
	-- upvalues: ReactModule (copy), SquadExternalContractContextModule (copy), UseCurrentSquadParentChannelIdModule (copy)
	return ReactModule.useContext(SquadExternalContractContextModule).useParentChannelIsPartyVoiceEligible(UseCurrentSquadParentChannelIdModule() or "")
end

return if GetFFlagEnablePartyVoiceOnlyForUnfilteredThreadsModule() then useIsCurrentSquadPartyVoiceEligible else function(): boolean --[[ Line: 22 ]]
	return true
end