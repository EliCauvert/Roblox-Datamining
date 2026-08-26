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

return function(p1)
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), squadRccEventManagerModule (ref), useDispatch (ref), constantsModule (ref), httpService (ref), eventNamesModule (ref), encodeUserIdsModule (ref), createConversationModule (ref), actOnPartyNudgeModule (ref), robloxReplicatedStorageService (ref)
	local var1 = reactModule.useContext(squadExternalContractContextModule)
	local var2 = var1.useIsChatEnabled()
	local var3 = var1.useIsLoadingChatSettings()
	reactModule.useEffect(function()
		-- upvalues: squadRccEventManagerModule (copy), p1 (ref), var2 (ref)
		squadRccEventManagerModule:fireSquadChangeEvent(p1.currentSquadId, var2)
	end, { p1.currentSquadId, var2 })
	local var4 = useDispatch()
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), constantsModule (copy), httpService (copy), var1 (ref), eventNamesModule (copy), encodeUserIdsModule (copy), var4 (ref), createConversationModule (copy), actOnPartyNudgeModule (copy), p1 (ref), var2 (ref)
		for i, v in ipairs(var5.current) do
			local partySourceType = v.partySourceType
			local data = v.data
			
			if partySourceType == "PartyNudge" and data.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				local var7 = httpService:GenerateGUID(false)
				var1.fireSquadAnalytics(eventNamesModule.SquadCreateOrJoinFromRCC, {
					partySourceType = partySourceType,
					nudgeType = data.nudgeType,
					nudgeId = data.nudgeId,
					partyAttemptId = var7,
					inviteeUserIds = encodeUserIdsModule({ data.inviteeId })
				})
				var4(createConversationModule({
					conversationType = "one_to_one",
					source = "createOrJoinPartyRemoteEvent",
					userIds = { tostring(data.inviteeId) },
					squadContext = var1,
					onSuccessCallback = function(p2)
						-- upvalues: var4 (copy), actOnPartyNudgeModule (copy), p1 (copy), constantsModule (copy), data (ref), var1 (copy), var2 (copy), var7 (ref)
						var4(actOnPartyNudgeModule(if p1.currentSquadId == "" then constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION else constantsModule.REJECT_START_PARTY_REQUEST_ACTION, data.nudgeId, false, var1.setSquadPrompt, var1.fireSquadAnalytics, var1.squadLocation, var2, var7, p2))
					end,
					onErrorCallback = function()
						-- upvalues: var4 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), data (ref), var1 (copy), var2 (copy), var7 (ref)
						var4(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, data.nudgeId, false, var1.setSquadPrompt, var1.fireSquadAnalytics, var1.squadLocation, var2, var7))
					end
				}))
			end
		end
		var5.current = {}
	end, {
		var2,
		var1,
		var1.setSquadPrompt,
		var1.fireSquadAnalytics,
		var1.squadLocation
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), var6 (ref), var5 (ref), robloxReplicatedStorageService (copy)
		if not var3 then
			if var2 then
				var6()
			else
				var5.current = {}
			end
		end
		local var8 = nil
		coroutine.wrap(function()
			-- upvalues: robloxReplicatedStorageService (copy), var8 (write), var3 (copy), var5 (copy), var2 (copy), var6 (copy)
			var8 = robloxReplicatedStorageService:WaitForChild("CreateOrJoinParty", 1e999).OnClientEvent:Connect(function(p2, p3)
				-- upvalues: var3 (copy), var5 (copy), var2 (copy), var6 (copy)
				if var3 then
					table.insert(var5.current, { partySourceType = p2, data = p3 })
					
					return
				elseif var2 then
					var6()
				end
			end)
		end)()
		
		return function()
			-- upvalues: var8 (write)
			if var8 then
				var8:Disconnect()
			end
		end
	end, { var3, var2, var6 })
	
	return nil
end