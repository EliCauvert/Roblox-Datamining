local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local sharedFlags = dependenciesModule.SharedFlags
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var3 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var4 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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

return function(p0, p1) --[[ line: 33 | named "useSquadUserDropdownMenuButtons" ]]
	-- upvalues: useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), react (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), fFlagSquadsPresenceStoreMigration (ref), var3 (ref), useSelector (ref), var4 (ref), presenceType (ref), constantsModule (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref)
	local var7 = useLocalUserId()
	local var8 = tostring(var7) == tostring(p0)
	local _ = nil
	local var9 = nil
	local var10 = false
	local var11 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var12 = if p0 then tonumber(p0) else nil
		local var13 = useBackgroundExperience()
		var9 = react.useMemo(function() --[[ line: 46 ]]
			-- upvalues: var13 (write)
			return if var13 then var13.voiceChannelId else nil
		end, { var13 })
		
		if var12 then
			local var14 = useIsLocalPlayerPartyVoiceEligible()
			local var15 = useIsUserPartyVoiceEligible(var12)
			local var16 = useIsCurrentSquadPartyVoiceEligible() == true
			var10 = var16 and (var14 and not var15)
			var11 = var14 and (var16 and (var15 and not var8))
		end
	end
	local var17 = react.useContext(squadExternalContractContext).useGetConversationFromId(useCurrentSquadParentChannelId() or "")
	local var18 = if fFlagSquadsPresenceStoreMigration then var3(tostring(p0)) else useSelector(react.useCallback(function(p2) --[[ line: 69 ]]
		-- upvalues: p0 (ref)
		return p2.Squad.Presence.byUserId[tostring(p0)]
	end, { p0 }))
	
	return react.useMemo(function() --[[ line: 77 ]]
		-- upvalues: var10 (write), var18 (ref), fFlagSquadsPresenceStoreMigration (copy), var4 (copy), presenceType (copy), var17 (ref), constantsModule (copy), var7 (ref), p1 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var9 (write), var8 (ref), var11 (write)
		local t = { VoiceIneligibleButton = var10 }
		local var20 = var18
		
		if var20 then
			var20 = false
			
			if var18.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var4.InGame else presenceType.InGame) then
				if fFlagSquadsPresenceStoreMigration then
					var20 = var18.placeId ~= ""
					var20 = nil
				else
					var20 = var18.placeId
				end
				var20 = var20 and var18.gameId ~= game.JobId
			end
		end
		t.JoinButton = var20
		t.RemoveUserButton = var17 and (var17.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var17.initiator == var7)
		t.ViewProfileButton = not p1
		t.ReportButton = getFFlagEnableCrossExpVoiceAbuseReport() and (var9 and not var8)
		t.MuteVoiceButton = var11
		local t_1 = {}
		
		for i, v in t do
			if v then
				table.insert(t_1, i)
			end
		end
		return t_1
	end, {
		var10, p1, var9, var8, var18, var17, var7, var11
	})
end