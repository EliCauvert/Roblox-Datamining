local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ConstantsModule = require(SquadsCore.Common.Constants)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadRccEventManagerModule = require(SquadsCore.ServiceManager.SquadRccEventManager)
local ActOnPartyNudgeModule = require(SquadsCore.Thunks.actOnPartyNudge)
local CreateConversationModule = require(SquadsCore.Thunks.createConversation)
local EncodeUserIdsModule = require(SquadsCore.Common.encodeUserIds)

return function(p1) --[[ Line: 24 ]]
	-- upvalues: ReactModule (copy), SquadExternalContractContextModule (copy), SquadRccEventManagerModule (copy), UseDispatchFunction (copy), ConstantsModule (copy), HttpService (copy), EventNamesModule (copy), EncodeUserIdsModule (copy), CreateConversationModule (copy), ActOnPartyNudgeModule (copy), RobloxReplicatedStorage (copy)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseIsChatEnabledResult = UseContextResult.useIsChatEnabled()
	local UseIsLoadingChatSettingsResult = UseContextResult.useIsLoadingChatSettings()
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: SquadRccEventManagerModule (upval), p1 (copy), UseIsChatEnabledResult (copy)
		SquadRccEventManagerModule:fireSquadChangeEvent(p1.currentSquadId, UseIsChatEnabledResult)
	end, { p1.currentSquadId, UseIsChatEnabledResult })
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 36 ]]
		-- upvalues: UseRefResult (copy), ConstantsModule (upval), HttpService (upval), UseContextResult (copy), EventNamesModule (upval), EncodeUserIdsModule (upval), UseDispatchResult (copy), CreateConversationModule (upval), ActOnPartyNudgeModule (upval), p1 (copy), UseIsChatEnabledResult (copy)
		for _, value in ipairs(UseRefResult.current) do
			local PartySourceType = value.partySourceType
			local Data = value.data
			
			if PartySourceType == "PartyNudge" and Data.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				local Guid = HttpService:GenerateGUID(false)
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadCreateOrJoinFromRCC, {
					partySourceType = PartySourceType,
					nudgeType = Data.nudgeType,
					nudgeId = Data.nudgeId,
					partyAttemptId = Guid,
					inviteeUserIds = EncodeUserIdsModule({ Data.inviteeId })
				})
				UseDispatchResult(CreateConversationModule({
					conversationType = "one_to_one",
					source = "createOrJoinPartyRemoteEvent",
					userIds = { (tostring(Data.inviteeId)) },
					squadContext = UseContextResult,
					onSuccessCallback = function(p2) --[[ Line: 56 ]]
						-- upvalues: UseDispatchResult (upval), ActOnPartyNudgeModule (upval), p1 (upval), ConstantsModule (upval), Data (copy), UseContextResult (upval), UseIsChatEnabledResult (upval), Guid (copy)
						UseDispatchResult(ActOnPartyNudgeModule(if p1.currentSquadId == "" then ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION else ConstantsModule.REJECT_START_PARTY_REQUEST_ACTION, Data.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult, Guid, p2))
					end,
					onErrorCallback = function() --[[ Line: 73 ]]
						-- upvalues: UseDispatchResult (upval), ActOnPartyNudgeModule (upval), ConstantsModule (upval), Data (copy), UseContextResult (upval), UseIsChatEnabledResult (upval), Guid (copy)
						UseDispatchResult(ActOnPartyNudgeModule(ConstantsModule.REJECT_START_PARTY_REQUEST_ACTION, Data.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult, Guid))
					end
				}))
			end
		end
		UseRefResult.current = {}
	end, {
		UseIsChatEnabledResult,
		UseContextResult,
		UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	ReactModule.useEffect(function() --[[ Line: 101 ]]
		-- upvalues: UseIsLoadingChatSettingsResult (copy), UseIsChatEnabledResult (copy), UseResult (copy), UseRefResult (copy), RobloxReplicatedStorage (upval)
		if not UseIsLoadingChatSettingsResult then
			if UseIsChatEnabledResult then
				UseResult()
			else
				UseRefResult.current = {}
			end
		end
		local OnClientEventConnection = nil
		coroutine.wrap(function() --[[ Line: 111 ]]
			-- upvalues: RobloxReplicatedStorage (upval), OnClientEventConnection (ref), UseIsLoadingChatSettingsResult (upval), UseRefResult (upval), UseIsChatEnabledResult (upval), UseResult (upval)
			OnClientEventConnection = RobloxReplicatedStorage:WaitForChild("CreateOrJoinParty", 1e999).OnClientEvent:Connect(function(PartySourceType, Data) --[[ Line: 115 ]]
				-- upvalues: UseIsLoadingChatSettingsResult (upval), UseRefResult (upval), UseIsChatEnabledResult (upval), UseResult (upval)
				if UseIsLoadingChatSettingsResult then
					table.insert(UseRefResult.current, { partySourceType = PartySourceType, data = Data })
					
					return
				end
				if UseIsChatEnabledResult then
					UseResult()
				end
			end)
		end)()
		
		return function() --[[ Line: 128 ]]
			-- upvalues: OnClientEventConnection (ref)
			if OnClientEventConnection then
				OnClientEventConnection:Disconnect()
			end
		end
	end, {
		UseIsLoadingChatSettingsResult,
		UseIsChatEnabledResult,
		UseResult
	})
	
	return nil
end