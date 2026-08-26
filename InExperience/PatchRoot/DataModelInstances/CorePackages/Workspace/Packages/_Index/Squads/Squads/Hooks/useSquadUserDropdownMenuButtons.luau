local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local sharedFlags = dependenciesModule.SharedFlags
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var1 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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

return function(p1, p2)
	-- upvalues: useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), react (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), useSelector (ref), var2 (ref), presenceType (ref), constantsModule (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref)
	local var3 = useLocalUserId()
	local var4 = tostring(var3) == tostring(p1)
	local _ = nil
	local var5 = nil
	local var6 = false
	local var7 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var8 = if p1 then tonumber(p1) else nil
		local var9 = useBackgroundExperience()
		var5 = react.useMemo(function()
			-- upvalues: var9 (write)
			return if var9 then var9.voiceChannelId else nil
		end, { var9 })
		
		if var8 then
			local var10 = useIsLocalPlayerPartyVoiceEligible()
			local var11 = useIsUserPartyVoiceEligible(var8)
			local var12 = useIsCurrentSquadPartyVoiceEligible() == true
			var6 = var12 and (var10 and not var11)
			var7 = var10 and (var12 and (var11 and not var4))
		end
	end
	local var13 = react.useContext(squadExternalContractContext).useGetConversationFromId(useCurrentSquadParentChannelId() or "")
	local var14 = if fFlagSquadsPresenceStoreMigration then var1(tostring(p1)) else useSelector(react.useCallback(function(p3)
		-- upvalues: p1 (ref)
		return p3.Squad.Presence.byUserId[tostring(p1)]
	end, { p1 }))
	
	return react.useMemo(function()
		-- upvalues: var6 (write), var14 (ref), fFlagSquadsPresenceStoreMigration (copy), var2 (copy), presenceType (copy), var13 (ref), constantsModule (copy), var3 (ref), p2 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var5 (write), var4 (ref), var7 (write)
		local t = { VoiceIneligibleButton = var6 }
		local var15 = var14
		
		if var15 then
			var15 = false
			
			if var14.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame) then
				if fFlagSquadsPresenceStoreMigration then
					var15 = var14.placeId ~= ""
					var15 = nil
				else
					var15 = var14.placeId
				end
				var15 = var15 and var14.gameId ~= game.JobId
			end
		end
		t.JoinButton = var15
		t.RemoveUserButton = var13 and (var13.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var13.initiator == var3)
		t.ViewProfileButton = not p2
		t.ReportButton = getFFlagEnableCrossExpVoiceAbuseReport() and (var5 and not var4)
		t.MuteVoiceButton = var7
		local t_1 = {}
		
		for i, v in t do
			if v then
				table.insert(t_1, i)
			end
		end
		return t_1
	end, {
		var6, p2, var5, var4, var14, var13, var3, var7
	})
end