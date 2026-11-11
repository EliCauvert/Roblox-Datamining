local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local SharedFlags = DependenciesModule.SharedFlags
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local ConstantsModule = require(Parent.SquadsCore.Constants)
local HooksModule = require(Parent.SquadsCore.Hooks)
local UseIsLocalPlayerPartyVoiceEligibleFunction = HooksModule.useIsLocalPlayerPartyVoiceEligible
local UseIsUserPartyVoiceEligibleFunction = HooksModule.useIsUserPartyVoiceEligible
local UseIsCurrentSquadPartyVoiceEligibleFunction = HooksModule.useIsCurrentSquadPartyVoiceEligible
local UseBackgroundExperienceFunction = require(Parent.CrossExperienceVoice).Hooks.useBackgroundExperience
local UseCurrentSquadParentChannelIdFunction = HooksModule.useCurrentSquadParentChannelId
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagEnableCrossExpVoiceAbuseReportFunction = SharedFlags.getFFlagEnableCrossExpVoiceAbuseReport

return function(p1, p2)
	-- upvalues: UseLocalUserIdFunction (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseBackgroundExperienceFunction (copy), React (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseIsUserPartyVoiceEligibleFunction (copy), UseIsCurrentSquadPartyVoiceEligibleFunction (copy), SquadExternalContractContext (copy), UseCurrentSquadParentChannelIdFunction (copy), UseSelectorFunction (copy), PresenceType (copy), ConstantsModule (copy), GetFFlagEnableCrossExpVoiceAbuseReportFunction (copy)
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
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p3)
		-- upvalues: p1 (copy)
		return p3.Squad.Presence.byUserId[tostring(p1)]
	end, { p1 })))
	
	return React.useMemo(function()
		-- upvalues: VoiceIneligibleButton (ref), UseSelectorResult (copy), PresenceType (upval), UseGetConversationFromIdResult (copy), ConstantsModule (upval), UseLocalUserIdResult (copy), p2 (copy), GetFFlagEnableCrossExpVoiceAbuseReportFunction (upval), UseMemoResult (ref), IsTextMatch (copy), MuteVoiceButton (ref)
		local List = {}
		
		for i, value in {
			VoiceIneligibleButton = VoiceIneligibleButton,
			JoinButton = UseSelectorResult and (UseSelectorResult.userPresenceType == PresenceType.InGame and (UseSelectorResult.placeId and UseSelectorResult.gameId ~= game.JobId)),
			RemoveUserButton = UseGetConversationFromIdResult and (UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and UseGetConversationFromIdResult.initiator == UseLocalUserIdResult),
			ViewProfileButton = not p2,
			ReportButton = GetFFlagEnableCrossExpVoiceAbuseReportFunction() and (UseMemoResult and not IsTextMatch),
			MuteVoiceButton = MuteVoiceButton
		} do
			if value then
				table.insert(List, i)
			end
		end
		return List
	end, {
		VoiceIneligibleButton, p2, UseMemoResult, IsTextMatch, UseSelectorResult,
		UseGetConversationFromIdResult, UseLocalUserIdResult, MuteVoiceButton
	})
end