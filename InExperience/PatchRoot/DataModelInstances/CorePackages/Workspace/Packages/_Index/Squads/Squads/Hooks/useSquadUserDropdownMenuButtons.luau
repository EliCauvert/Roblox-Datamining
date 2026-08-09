local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local sharedFlags = dependenciesModule.SharedFlags
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local constantsModule = require(parent.SquadsCore.Constants)
local hooksModule = require(parent.SquadsCore.Hooks)
local useIsLocalPlayerPartyVoiceEligible = hooksModule.useIsLocalPlayerPartyVoiceEligible
local useIsUserPartyVoiceEligible = hooksModule.useIsUserPartyVoiceEligible
local useIsCurrentSquadPartyVoiceEligible = hooksModule.useIsCurrentSquadPartyVoiceEligible
local useBackgroundExperience = crossExperienceVoiceModule.Hooks.useBackgroundExperience
local useCurrentSquadParentChannelId = hooksModule.useCurrentSquadParentChannelId
local useSelector = dependenciesModule.Hooks.useSelector
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local getFFlagEnableCrossExpVoiceAbuseReport = sharedFlags.getFFlagEnableCrossExpVoiceAbuseReport

return function(p0, p1) --[[ line: 25 | named "useSquadUserDropdownMenuButtons" ]]
	-- upvalues: useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), react (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), useSelector (ref), presenceType (ref), constantsModule (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref)
	local var5 = useLocalUserId()
	local var6 = tostring(var5) == tostring(p0)
	local _ = nil
	local var7 = nil
	local var8 = false
	local var9 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var10 = if p0 then tonumber(p0) else nil
		local var11 = useBackgroundExperience()
		var7 = react.useMemo(function() --[[ line: 38 ]]
			-- upvalues: var11 (write)
			return if var11 then var11.voiceChannelId else nil
		end, { var11 })
		
		if var10 then
			local var12 = useIsLocalPlayerPartyVoiceEligible()
			local var13 = useIsUserPartyVoiceEligible(var10)
			local var14 = useIsCurrentSquadPartyVoiceEligible() == true
			var8 = var14 and (var12 and not var13)
			var9 = var12 and (var14 and (var13 and not var6))
		end
	end
	local var15 = react.useContext(squadExternalContractContext).useGetConversationFromId(useCurrentSquadParentChannelId() or "")
	local var16 = useSelector(react.useCallback(function(p2) --[[ line: 61 ]]
		-- upvalues: p0 (ref)
		return p2.Squad.Presence.byUserId[tostring(p0)]
	end, { p0 }))
	
	return react.useMemo(function() --[[ line: 67 ]]
		-- upvalues: var8 (write), var16 (ref), presenceType (copy), var15 (ref), constantsModule (copy), var5 (ref), p1 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var7 (write), var6 (ref), var9 (write)
		local t = {}
		
		for i, v in {
			VoiceIneligibleButton = var8,
			JoinButton = var16 and (var16.userPresenceType == presenceType.InGame and (var16.placeId and var16.gameId ~= game.JobId)),
			RemoveUserButton = var15 and (var15.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var15.initiator == var5),
			ViewProfileButton = not p1,
			ReportButton = getFFlagEnableCrossExpVoiceAbuseReport() and (var7 and not var6),
			MuteVoiceButton = var9
		} do
			if v then
				table.insert(t, i)
			end
		end
		return t
	end, {
		var8, p1, var7, var6, var16, var15, var5, var9
	})
end