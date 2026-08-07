local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local constantsModule = require(squadsCore.Common.Constants)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadRccEventManagerModule = require(squadsCore.ServiceManager.SquadRccEventManager)
local actOnPartyNudgeModule = require(squadsCore.Thunks.actOnPartyNudge)
local createConversationModule = require(squadsCore.Thunks.createConversation)
local encodeUserIdsModule = require(squadsCore.Common.encodeUserIds)

return function(p0) --[[ line: 24 ]]
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), squadRccEventManagerModule (ref), useDispatch (ref), constantsModule (ref), httpService (ref), eventNamesModule (ref), encodeUserIdsModule (ref), createConversationModule (ref), actOnPartyNudgeModule (ref), robloxReplicatedStorageService (ref)
	local var11 = reactModule.useContext(squadExternalContractContextModule)
	local var12 = var11.useIsChatEnabled()
	local var13 = var11.useIsLoadingChatSettings()
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: squadRccEventManagerModule (copy), p0 (ref), var12 (ref)
		squadRccEventManagerModule:fireSquadChangeEvent(p0.currentSquadId, var12)
	end, { p0.currentSquadId, var12 })
	local var14 = useDispatch()
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useCallback(function() --[[ line: 36 ]]
		-- upvalues: var15 (ref), constantsModule (copy), httpService (copy), var11 (ref), eventNamesModule (copy), encodeUserIdsModule (copy), var14 (ref), createConversationModule (copy), actOnPartyNudgeModule (copy), p0 (ref), var12 (ref)
		for i, v in ipairs(var15.current) do
			local partySourceType = v.partySourceType
			local data = v.data
			
			if partySourceType == "PartyNudge" and data.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				local var17 = httpService:GenerateGUID(false)
				var11.fireSquadAnalytics(eventNamesModule.SquadCreateOrJoinFromRCC, {
					partySourceType = partySourceType,
					nudgeType = data.nudgeType,
					nudgeId = data.nudgeId,
					partyAttemptId = var17,
					inviteeUserIds = encodeUserIdsModule({ data.inviteeId })
				})
				var14(createConversationModule({
					conversationType = "one_to_one",
					source = "createOrJoinPartyRemoteEvent",
					userIds = { tostring(data.inviteeId) },
					squadContext = var11,
					onSuccessCallback = function(p1) --[[ line: 56 ]]
						-- upvalues: var14 (copy), actOnPartyNudgeModule (copy), p0 (copy), constantsModule (copy), data (ref), var11 (copy), var12 (copy), var17 (ref)
						var14(actOnPartyNudgeModule(if p0.currentSquadId == "" then constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION else constantsModule.REJECT_START_PARTY_REQUEST_ACTION, data.nudgeId, false, var11.setSquadPrompt, var11.fireSquadAnalytics, var11.squadLocation, var12, var17, p1))
					end,
					onErrorCallback = function() --[[ line: 73 ]]
						-- upvalues: var14 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), data (ref), var11 (copy), var12 (copy), var17 (ref)
						var14(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, data.nudgeId, false, var11.setSquadPrompt, var11.fireSquadAnalytics, var11.squadLocation, var12, var17))
					end
				}))
			end
		end
		var15.current = {}
	end, {
		var12,
		var11,
		var11.setSquadPrompt,
		var11.fireSquadAnalytics,
		var11.squadLocation
	})
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: var13 (ref), var12 (ref), var16 (ref), var15 (ref), robloxReplicatedStorageService (copy)
		if not var13 then
			if var12 then
				var16()
			else
				var15.current = {}
			end
		end
		local var18 = nil
		coroutine.wrap(function() --[[ line: 111 ]]
			-- upvalues: robloxReplicatedStorageService (copy), var18 (write), var13 (copy), var15 (copy), var12 (copy), var16 (copy)
			var18 = robloxReplicatedStorageService:WaitForChild("CreateOrJoinParty", 1e999).OnClientEvent:Connect(function(p2, p3) --[[ line: 115 ]]
				-- upvalues: var13 (copy), var15 (copy), var12 (copy), var16 (copy)
				if var13 then
					table.insert(var15.current, { partySourceType = p2, data = p3 })
					
					return
				elseif var12 then
					var16()
				end
			end)
		end)()
		
		return function() --[[ line: 128 ]]
			-- upvalues: var18 (write)
			if var18 then
				var18:Disconnect()
			end
		end
	end, { var13, var12, var16 })
	
	return nil
end