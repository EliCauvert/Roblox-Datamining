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
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local SquadRegroupPromptDebounceTimeMs = game:DefineFastInt("SquadRegroupPromptDebounceTimeMs", 20000)

return function(p1)
	-- upvalues: ReactModule (copy), SquadExternalContractContextModule (copy), UseLocalizationFunction (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), CryoModule (copy), NetworkingPresenceModule (copy), PresenceType (copy), LoggerModule (copy), SerializeTableModule (copy), UseSelectorFunction (copy), SquadRegroupPromptDebounceTimeMs (copy), DashModule (copy), SquadRegroupExperimentation (copy), GuiService (copy), EventNamesModule (copy), RbxAnalyticsService (copy), SquadToastActionsAndStatesModule (copy), SquadRegroupEntryPointModule (copy), RegroupPromptNotificationStateModule (copy), SquadExperienceInviteSourceModule (copy), SetRegroupPromptShownModule (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy)
		return CryoModule.List.map(p1.currentSquadMembers, function(p2)
			return p2.userId
		end)
	end, { p1.currentSquadMembers })
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local t = {}
		
		for _, currentSquadMember in ipairs(p1.currentSquadMembers) do
			t[tostring(currentSquadMember.userId)] = true
		end
		return t
	end, { p1.currentSquadMembers })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), UseMemoResult (copy), CryoModule (upval), PresenceType (upval), UseStateResult2 (copy), LoggerModule (upval), SerializeTableModule (upval)
		UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(UseMemoResult)):andThen(function(Result)
			-- upvalues: CryoModule (upval), PresenceType (upval), UseStateResult2 (upval)
			local JoinResults = {}
			
			for _, value in pairs(Result and Result.responseBody and Result.responseBody.userPresences or {}) do
				if value.userId and value.userPresenceType then
					JoinResults[tostring(value.userId)] = CryoModule.Dictionary.join(value, {
						userPresenceType = PresenceType.fromRawValue(value.userPresenceType)
					})
				end
			end
			UseStateResult2(function(p2)
				-- upvalues: CryoModule (upval), JoinResults (copy)
				return CryoModule.Dictionary.join(p2 or {}, JoinResults)
			end)
		end):catch(function(Err)
			-- upvalues: LoggerModule (upval), SerializeTableModule (upval)
			LoggerModule:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", SerializeTableModule(Err))
		end)
	end, { UseDispatchResult, UseMemoResult, Number })
	local UseRefResult1 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = true
		UseResult()
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	local UseRefResult2 = ReactModule.useRef(nil)
	UseRefResult2.current = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {})))
	local SquadRegroupPromptDebounceTimeMsRatio = SquadRegroupPromptDebounceTimeMs / 1000
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if UseRefResult3.current == nil then
		UseRefResult3.current = DashModule.debounce(function(List, InitiatorId, SquadId, Icon)
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), PresenceType (upval), SquadRegroupExperimentation (upval), GuiService (upval), UseLocalizationResult (copy), UseContextResult (copy), EventNamesModule (upval), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval), RegroupPromptNotificationStateModule (upval), LoggerModule (upval), SerializeTableModule (upval), UseDispatchResult (copy), SquadExperienceInviteSourceModule (upval), SetRegroupPromptShownModule (upval)
			if not UseRefResult1.current or UseRefResult.current or UseRefResult2.current ~= nil then return end
			local Entry = List[tostring(InitiatorId)]
			
			if Entry == nil then return end
			for _, value in pairs(List) do
				if value and (value.userPresenceType == PresenceType.Online or value.userPresenceType == PresenceType.InGame and (Entry.gameId ~= nil and (value.gameId ~= nil and Entry.gameId ~= value.gameId))) then
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
								OnActivated = function()
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
								OnActivated = function()
									-- upvalues: Entry (copy), UseContextResult (upval), LoggerModule (upval), SerializeTableModule (upval), UseDispatchResult (upval), SquadExperienceInviteSourceModule (upval), EventNamesModule (upval), SquadId (copy), InitiatorId (copy), RbxAnalyticsService (upval), SquadToastActionsAndStatesModule (upval), SquadRegroupEntryPointModule (upval), RegroupPromptNotificationStateModule (upval), SendNotificationResult (ref), UseRefResult (upval)
									local RootPlaceId = Entry.rootPlaceId
									
									if UseContextResult.createExperienceInvite == nil then
										LoggerModule:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract")
									elseif RootPlaceId == nil then
										LoggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", SerializeTableModule(Entry))
									else
										UseDispatchResult(UseContextResult.createExperienceInvite(tostring(RootPlaceId), SquadExperienceInviteSourceModule.Regroup)):andThen(function(Result)
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
										end):catch(function(Err)
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
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(List)
		-- upvalues: UseMemoResult1 (copy), PresenceType (upval), UseStateResult2 (copy)
		if type(List) ~= "table" then return end
		local PresenceReports = nil
		
		for _, Player in ipairs(List) do
			local UserId = Player and Player.UserId
			
			if UserId ~= nil then
				local Text = tostring(UserId)
				
				if UseMemoResult1[Text] then
					local PresenceReport = Player and Player.PresenceReport
					
					if PresenceReport ~= nil then
						PresenceReport.userPresenceType = PresenceType.fromRawValue(PresenceReport.userPresenceType)
						PresenceReports = PresenceReports or {}
						PresenceReports[Text] = PresenceReport
					end
				end
			end
		end
		if PresenceReports ~= nil then
			UseStateResult2(function(p2)
				-- upvalues: PresenceReports (ref)
				local Copy = table.clone(p2 or {})
				
				for i, presenceReport in pairs(PresenceReports) do
					Copy[i] = presenceReport
				end
				return Copy
			end)
		end
	end, { UseDispatchResult, p1.currentSquadId, UseMemoResult1 })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged(ConstantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(ConnectionState, p2)
		-- upvalues: LoggerModule (upval), UseResult (copy)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			LoggerModule:info("Connection re-established, fetching squad presences.")
			UseResult()
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), Number (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), UseRefResult3 (copy), p1 (copy)
		if not UseRefResult.current then
			local UseStateResultEntry = UseStateResult[tostring(Number)]
			local UniverseId = UseStateResultEntry and (UseStateResultEntry.universeId or UseStateResultEntry.gameId) or nil
			UseRefResult3.current(UseStateResult, Number, p1.currentSquadId, if UniverseId == nil then nil else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(UniverseId), Constants.RbxthumbTypes.GameIcon, 128, false))
		end
	end, { UseStateResult, Number, p1.currentSquadId })
	
	return nil
end