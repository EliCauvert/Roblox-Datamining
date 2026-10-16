local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local _ = require(Parent.RoduxSquads)
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(Parent.UserLib).Utils.Constants
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local NetworkingPresenceModule = require(SquadsCore.Http.NetworkingPresence)
local ConstantsModule = require(SquadsCore.Common.Constants)
local CryoModule = require(Parent.Cryo)
local SquadRegroupExperimentation = require(Parent.SocialExperiments).SquadRegroupExperimentation
local SquadExperienceInviteSourceModule = require(SquadsCore.Enums.SquadExperienceInviteSource)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local PresenceType = require(SquadsCore.Http.RoduxPresence).Enums.PresenceType
local SquadRegroupEntryPointModule = require(SquadsCore.Enums.SquadRegroupEntryPoint)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local RegroupPromptNotificationStateModule = require(SquadsCore.Utils.RegroupPromptNotificationState)
local LoggerModule = require(SquadsCore.Logger)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local SetRegroupPromptShownModule = require(SquadsCore.Thunks.setRegroupPromptShown)
local GetSquadExperienceInviteStoreModule = require(SquadsCore.Stores.GetSquadExperienceInviteStore)
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local SquadRegroupPromptDebounceTimeMs = game:DefineFastInt("SquadRegroupPromptDebounceTimeMs", 20000)
local FFlagSquadsPresenceStoreMigrationModule = require(SquadsCore.Flags.FFlagSquadsPresenceStoreMigration)
local FFlagUseSignalsForSquadExperienceInvite = require(Parent.SharedFlags).FFlagUseSignalsForSquadExperienceInvite
local DataHydrationModule = if FFlagSquadsPresenceStoreMigrationModule then require(Parent.DataHydration) else nil
local SignalsModule = if FFlagSquadsPresenceStoreMigrationModule then require(Parent.Signals) else nil
local SignalsReactModule = if FFlagSquadsPresenceStoreMigrationModule then require(Parent.SignalsReact) else nil
local GetResult = if FFlagSquadsPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
local NormalizePresenceRawData = if FFlagSquadsPresenceStoreMigrationModule then DataHydrationModule.Presence.normalizePresenceRawData else nil
local PresenceType1 = if FFlagSquadsPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local UseSignalState = if FFlagSquadsPresenceStoreMigrationModule then SignalsReactModule.useSignalState else nil

return function(p1) --[[ Line: 60 ]]
	-- upvalues: ReactModule (copy), SquadExternalContractContextModule (copy), UseLocalizationFunction (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), CryoModule (copy), FFlagSquadsPresenceStoreMigrationModule (copy), SignalsModule (copy), GetResult (copy), UseSignalState (copy), NetworkingPresenceModule (copy), PresenceType (copy), LoggerModule (copy), SerializeTableModule (copy), FFlagUseSignalsForSquadExperienceInvite (copy), UseSelectorFunction (copy), SquadRegroupPromptDebounceTimeMs (copy), DashModule (copy), GetSquadExperienceInviteStoreModule (copy), PresenceType1 (copy), SquadRegroupExperimentation (copy), GuiService (copy), EventNamesModule (copy), RbxAnalyticsService (copy), SquadToastActionsAndStatesModule (copy), SquadRegroupEntryPointModule (copy), RegroupPromptNotificationStateModule (copy), SquadExperienceInviteSourceModule (copy), SetRegroupPromptShownModule (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), NormalizePresenceRawData (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseLocalizationResult = UseLocalizationFunction({
		RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 74 ]]
		-- upvalues: CryoModule (upval), p1 (copy)
		return CryoModule.List.map(p1.currentSquadMembers, function(p2) --[[ Line: 75 ]]
			return p2.userId
		end)
	end, { p1.currentSquadMembers })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 80 ]]
		-- upvalues: p1 (copy)
		local t = {}
		
		for _, currentSquadMember in ipairs(p1.currentSquadMembers) do
			t[tostring(currentSquadMember.userId)] = true
		end
		return t
	end, { p1.currentSquadMembers })
	local UseMemoResult2 = if FFlagSquadsPresenceStoreMigrationModule then ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), GetResult (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 92 ]]
			-- upvalues: UseMemoResult (upval), GetResult (upval)
			local DataResults = {}
			
			for _, value in ipairs(UseMemoResult) do
				local Text = tostring(value)
				DataResults[Text] = GetResult.GetPresenceByUserId(Text).data(p2)
			end
			return DataResults
		end)
	end, { UseMemoResult }) else nil
	local UseSignalStateResult = nil
	local Callback = nil
	
	if FFlagSquadsPresenceStoreMigrationModule then
		UseSignalStateResult = UseSignalState(UseMemoResult2)
	else
		UseSignalStateResult, Callback = ReactModule.useState({})
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 112 ]]
		-- upvalues: FFlagSquadsPresenceStoreMigrationModule (upval), UseMemoResult (copy), GetResult (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), CryoModule (upval), PresenceType (upval), Callback (ref), LoggerModule (upval), SerializeTableModule (upval)
		if not FFlagSquadsPresenceStoreMigrationModule then
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(UseMemoResult)):andThen(function(Result) --[[ Line: 119 ]]
				-- upvalues: CryoModule (upval), PresenceType (upval), Callback (upval)
				local JoinResults = {}
				
				for _, value in pairs(Result and Result.responseBody and Result.responseBody.userPresences or {}) do
					if value.userId and value.userPresenceType then
						JoinResults[tostring(value.userId)] = CryoModule.Dictionary.join(value, {
							userPresenceType = PresenceType.fromRawValue(value.userPresenceType)
						})
					end
				end
				Callback(function(p2) --[[ Line: 129 ]]
					-- upvalues: CryoModule (upval), JoinResults (copy)
					return CryoModule.Dictionary.join(p2 or {}, JoinResults)
				end)
			end):catch(function(Err) --[[ Line: 133 ]]
				-- upvalues: LoggerModule (upval), SerializeTableModule (upval)
				LoggerModule:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", SerializeTableModule(Err))
			end)
			
			return
		end
		for _, value in ipairs(UseMemoResult) do
			GetResult.RefreshPresenceByUserId((tostring(value)))
		end
	end, { UseDispatchResult, UseMemoResult, Number })
	local UseRefResult1 = ReactModule.useRef(true)
	ReactModule.useEffect(function() --[[ Line: 143 ]]
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = true
		UseResult()
		
		return function() --[[ Line: 147 ]]
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 152 ]]
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {})
	local UseRefResult2 = ReactModule.useRef(nil)
	UseRefResult2.current = if FFlagUseSignalsForSquadExperienceInvite then nil else UseSelectorFunction(UseResult1)
	local SquadRegroupPromptDebounceTimeMsRatio = SquadRegroupPromptDebounceTimeMs / 1000
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if UseRefResult3.current == nil then
		UseRefResult3.current = DashModule.debounce(function(List, InitiatorId, SquadId, Icon) --[[ Line: 167 ]]
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseRefResult2 (copy), FFlagSquadsPresenceStoreMigrationModule (upval), PresenceType1 (upval), PresenceType (upval), SquadRegroupExperimentation (upval), GuiService (upval), UseLocalizationResult (copy), UseContextResult (copy), EventNamesModule (upval), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval), RegroupPromptNotificationStateModule (upval), LoggerModule (upval), SerializeTableModule (upval), UseDispatchResult (copy), SquadExperienceInviteSourceModule (upval), SetRegroupPromptShownModule (upval)
			if not UseRefResult1.current or UseRefResult.current or (if FFlagUseSignalsForSquadExperienceInvite then GetSquadExperienceInviteStoreModule(false).getHasCurrentExperienceInvite(false) else UseRefResult2.current ~= nil) then return end
			local Entry = List[tostring(InitiatorId)]
			
			if Entry == nil then return end
			for _, value in pairs(List) do
				if value and (value.userPresenceType == (if FFlagSquadsPresenceStoreMigrationModule then PresenceType1.Online else PresenceType.Online) or value.userPresenceType == (if FFlagSquadsPresenceStoreMigrationModule then PresenceType1.InGame else PresenceType.InGame) and (Entry.gameId ~= (if FFlagSquadsPresenceStoreMigrationModule then "" else nil) and (value.gameId ~= (if FFlagSquadsPresenceStoreMigrationModule then "" else nil) and Entry.gameId ~= value.gameId))) then
					SquadRegroupExperimentation.logExposure()
					
					if not SquadRegroupExperimentation.getSquadRegroupEnabled() then break end
					local SendNotificationResult = nil
					SendNotificationResult = GuiService:SendNotification({
						Title = UseLocalizationResult.RegroupPromptTitle,
						Text = UseLocalizationResult.RegroupPromptBody,
						Icon = Icon,
						Buttons = {
							{
								Text = UseLocalizationResult.Dismiss,
								ButtonType = Enum.NotificationButtonType.Secondary,
								OnActivated = function() --[[ Line: 223 ]]
									-- upvalues: UseContextResult (upval), EventNamesModule (upval), SquadId (copy), InitiatorId (copy), Entry (copy), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval), RegroupPromptNotificationStateModule (upval), SendNotificationResult (ref), UseRefResult (upval)
									UseContextResult.fireSquadAnalytics(EventNamesModule.SquadRegroupPromptClicked, {
										clientTimestamp = os.time(),
										squadId = SquadId,
										initiatorId = InitiatorId,
										gameInstanceId = Entry.gameId,
										rootPlaceId = Entry.rootPlaceId,
										placeId = Entry.placeId,
										universeId = Entry.universeId,
										playSessionId = RbxAnalyticsService:GetPlaySessionId(),
										button = SquadToastActionsAndStatesModule.RegroupDismiss,
										entryPoint = SquadRegroupEntryPointModule.ToastPrompt
									})
									RegroupPromptNotificationStateModule.dismissNotification(SendNotificationResult)
									UseRefResult.current = false
								end
							},
							{
								Text = UseLocalizationResult.Join,
								ButtonType = Enum.NotificationButtonType.Primary,
								OnActivated = function() --[[ Line: 243 ]]
									-- upvalues: Entry (copy), UseContextResult (upval), LoggerModule (upval), FFlagSquadsPresenceStoreMigrationModule (upval), SerializeTableModule (upval), UseDispatchResult (upval), SquadExperienceInviteSourceModule (upval), EventNamesModule (upval), SquadId (copy), InitiatorId (copy), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval), RegroupPromptNotificationStateModule (upval), SendNotificationResult (ref), UseRefResult (upval)
									local RootPlaceId = Entry.rootPlaceId
									
									if UseContextResult.createExperienceInvite == nil then
										LoggerModule:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract")
									elseif RootPlaceId == nil or FFlagSquadsPresenceStoreMigrationModule and RootPlaceId == "" then
										LoggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", SerializeTableModule(Entry))
									else
										UseDispatchResult(UseContextResult.createExperienceInvite(tostring(RootPlaceId), SquadExperienceInviteSourceModule.Regroup)):andThen(function(Result) --[[ Line: 264 ]]
											-- upvalues: UseContextResult (upval), EventNamesModule (upval), SquadId (upval), InitiatorId (upval), Entry (upval), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval)
											UseContextResult.fireSquadAnalytics(EventNamesModule.SquadRegroupPromptClicked, {
												clientTimestamp = os.time(),
												squadId = SquadId,
												initiatorId = InitiatorId,
												gameInstanceId = Entry.gameId,
												rootPlaceId = Entry.rootPlaceId,
												placeId = Entry.placeId,
												universeId = Entry.universeId,
												playSessionId = RbxAnalyticsService:GetPlaySessionId(),
												experienceInviteId = Result,
												button = SquadToastActionsAndStatesModule.RegroupJoin,
												entryPoint = SquadRegroupEntryPointModule.ToastPrompt
											})
										end):catch(function(Err) --[[ Line: 282 ]]
											-- upvalues: LoggerModule (upval), SerializeTableModule (upval)
											LoggerModule:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", SerializeTableModule(Err))
										end)
									end
									RegroupPromptNotificationStateModule.dismissNotification(SendNotificationResult)
									UseRefResult.current = false
								end
							}
						}
					})
					UseRefResult.current = true
					RegroupPromptNotificationStateModule.setActive(SendNotificationResult, SquadId)
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadRegroupPromptShown, {
						clientTimestamp = os.time(),
						squadId = SquadId,
						initiatorId = InitiatorId,
						gameInstanceId = Entry.gameId,
						rootPlaceId = Entry.rootPlaceId,
						placeId = Entry.placeId,
						universeId = Entry.universeId,
						playSessionId = RbxAnalyticsService:GetPlaySessionId(),
						entryPoint = SquadRegroupEntryPointModule.ToastPrompt
					})
					
					if SquadId then
						UseDispatchResult(SetRegroupPromptShownModule(SquadId))
					end
					break
				end
			end
		end, SquadRegroupPromptDebounceTimeMsRatio, { leading = false, trailing = true })
	end
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(List) --[[ Line: 326 ]]
		-- upvalues: UseMemoResult1 (copy), FFlagSquadsPresenceStoreMigrationModule (upval), GetResult (upval), NormalizePresenceRawData (upval), PresenceType (upval), Callback (ref)
		if type(List) ~= "table" then return end
		local PresenceReports = nil
		
		for _, Player in ipairs(List) do
			local UserId = Player and Player.UserId
			
			if UserId ~= nil then
				local Text = tostring(UserId)
				
				if UseMemoResult1[Text] then
					local PresenceReport = Player and Player.PresenceReport
					
					if PresenceReport ~= nil then
						if FFlagSquadsPresenceStoreMigrationModule then
							GetResult.UpdateUserPresence(Text, NormalizePresenceRawData(PresenceReport), { isUpdatedRealtime = true })
						else
							PresenceReport.userPresenceType = PresenceType.fromRawValue(PresenceReport.userPresenceType)
							PresenceReports = PresenceReports or {}
							PresenceReports[Text] = PresenceReport
						end
					end
				end
			end
		end
		if not FFlagSquadsPresenceStoreMigrationModule and PresenceReports ~= nil then
			Callback(function(p2) --[[ Line: 358 ]]
				-- upvalues: PresenceReports (ref)
				local Copy = table.clone(p2 or {})
				
				for i, presenceReport in pairs(PresenceReports) do
					Copy[i] = presenceReport
				end
				return Copy
			end)
		end
	end, { UseDispatchResult, p1.currentSquadId, UseMemoResult1 })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged(ConstantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(ConnectionState, p2) --[[ Line: 371 ]]
		-- upvalues: LoggerModule (upval), UseResult (copy)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			LoggerModule:info("Connection re-established, fetching squad presences.")
			UseResult()
		end
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 380 ]]
		-- upvalues: UseRefResult (copy), UseSignalStateResult (ref), Number (copy), FFlagSquadsPresenceStoreMigrationModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), UseRefResult3 (copy), p1 (copy)
		if not UseRefResult.current then
			local UseSignalStateResultEntry = UseSignalStateResult[tostring(Number)]
			local UniverseId = (if FFlagSquadsPresenceStoreMigrationModule then UseSignalStateResultEntry and UseSignalStateResultEntry.universeId ~= "" and UseSignalStateResultEntry.universeId or UseSignalStateResultEntry and UseSignalStateResultEntry.gameId ~= "" and UseSignalStateResultEntry.gameId else UseSignalStateResultEntry and (UseSignalStateResultEntry.universeId or UseSignalStateResultEntry.gameId)) or nil
			UseRefResult3.current(UseSignalStateResult, Number, p1.currentSquadId, if UniverseId == nil then nil else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(UniverseId), Constants.RbxthumbTypes.GameIcon, 128, false))
		end
	end, { UseSignalStateResult, Number, p1.currentSquadId })
	
	return nil
end