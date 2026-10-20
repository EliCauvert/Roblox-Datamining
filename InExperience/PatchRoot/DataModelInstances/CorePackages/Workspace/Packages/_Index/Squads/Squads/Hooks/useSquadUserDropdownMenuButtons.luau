local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local FFlagSquadsPresenceStoreMigration = require(Parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local UseGetPresenceByUserId = if FFlagSquadsPresenceStoreMigration then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local PresenceType1 = if FFlagSquadsPresenceStoreMigration then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local ConstantsModule = require(Parent.SquadsCore.Constants)
local HooksModule = require(Parent.SquadsCore.Hooks)
local UseIsLocalPlayerPartyVoiceEligibleFunction = HooksModule.useIsLocalPlayerPartyVoiceEligible
local UseIsUserPartyVoiceEligibleFunction = HooksModule.useIsUserPartyVoiceEligible
local UseIsCurrentSquadPartyVoiceEligibleFunction = HooksModule.useIsCurrentSquadPartyVoiceEligible
local UseBackgroundExperienceFunction = require(Parent.CrossExperienceVoice).Hooks.useBackgroundExperience
local UseCurrentSquadParentChannelIdFunction = HooksModule.useCurrentSquadParentChannelId
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1, p2)
	-- upvalues: UseLocalUserIdFunction (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseBackgroundExperienceFunction (copy), React (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseIsUserPartyVoiceEligibleFunction (copy), UseIsCurrentSquadPartyVoiceEligibleFunction (copy), SquadExternalContractContext (copy), UseCurrentSquadParentChannelIdFunction (copy), FFlagSquadsPresenceStoreMigration (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), PresenceType1 (copy), PresenceType (copy), ConstantsModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local IsTextMatch = tostring(UseLocalUserIdResult) == tostring(p1)
	local UseBackgroundExperienceResult = nil
	local UseMemoResult = nil
	local VoiceIneligibleButton = false
	local MuteVoiceButton = false
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		local Number = if p1 then tonumber(p1) else nil
		UseBackgroundExperienceResult = UseBackgroundExperienceFunction()
		UseMemoResult = React.useMemo(function()
			-- upvalues: UseBackgroundExperienceResult (ref)
			return if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceChannelId else nil
		end, { UseBackgroundExperienceResult })
		
		if Number then
			local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
			local UseIsUserPartyVoiceEligibleResult = UseIsUserPartyVoiceEligibleFunction(Number)
			local IsUseIsCurrentSquadPartyVoiceEligibleResult = UseIsCurrentSquadPartyVoiceEligibleFunction() == true
			VoiceIneligibleButton = IsUseIsCurrentSquadPartyVoiceEligibleResult and (UseIsLocalPlayerPartyVoiceEligibleResult and not UseIsUserPartyVoiceEligibleResult)
			MuteVoiceButton = UseIsLocalPlayerPartyVoiceEligibleResult and (IsUseIsCurrentSquadPartyVoiceEligibleResult and (UseIsUserPartyVoiceEligibleResult and not IsTextMatch))
		end
	end
	local UseGetConversationFromIdResult = React.useContext(SquadExternalContractContext).useGetConversationFromId(UseCurrentSquadParentChannelIdFunction() or "")
	local UseResult = React.useCallback(function(p3)
		-- upvalues: p1 (copy)
		return p3.Squad.Presence.byUserId[tostring(p1)]
	end, { p1 })
	local UseGetPresenceByUserIdResult = if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserId((tostring(p1))) else UseSelectorFunction(UseResult)
	
	return React.useMemo(function()
		-- upvalues: VoiceIneligibleButton (ref), UseGetPresenceByUserIdResult (copy), FFlagSquadsPresenceStoreMigration (upval), PresenceType1 (upval), PresenceType (upval), UseGetConversationFromIdResult (copy), ConstantsModule (upval), UseLocalUserIdResult (copy), p2 (copy), UseMemoResult (ref), IsTextMatch (copy), MuteVoiceButton (ref)
		local List = {}
		
		for i, value in {
			VoiceIneligibleButton = VoiceIneligibleButton,
			JoinButton = UseGetPresenceByUserIdResult and (UseGetPresenceByUserIdResult.userPresenceType == (if FFlagSquadsPresenceStoreMigration then PresenceType1.InGame else PresenceType.InGame) and (if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserIdResult.placeId ~= "" and UseGetPresenceByUserIdResult.gameId ~= game.JobId else UseGetPresenceByUserIdResult.placeId and UseGetPresenceByUserIdResult.gameId ~= game.JobId)),
			RemoveUserButton = UseGetConversationFromIdResult and (UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and UseGetConversationFromIdResult.initiator == UseLocalUserIdResult),
			ViewProfileButton = not p2,
			ReportButton = UseMemoResult and not IsTextMatch,
			MuteVoiceButton = MuteVoiceButton
		} do
			if value then
				table.insert(List, i)
			end
		end
		return List
	end, {
		VoiceIneligibleButton, p2, UseMemoResult, IsTextMatch,
		UseGetPresenceByUserIdResult, UseGetConversationFromIdResult,
		UseLocalUserIdResult, MuteVoiceButton
	})
end