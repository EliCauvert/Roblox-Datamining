local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local _ = require(parent.RoduxSquads)
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(parent.UserLib).Utils.Constants
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local networkingPresenceModule = require(squadsCore.Http.NetworkingPresence)
local constantsModule = require(squadsCore.Common.Constants)
local cryoModule = require(parent.Cryo)
local squadRegroupExperimentation = require(parent.SocialExperiments).SquadRegroupExperimentation
local roduxPresenceModule = require(squadsCore.Http.RoduxPresence)
local squadExperienceInviteSourceModule = require(squadsCore.Enums.SquadExperienceInviteSource)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local presenceType = roduxPresenceModule.Enums.PresenceType
local squadRegroupEntryPointModule = require(squadsCore.Enums.SquadRegroupEntryPoint)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local regroupPromptNotificationStateModule = require(squadsCore.Utils.RegroupPromptNotificationState)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local setRegroupPromptShownModule = require(squadsCore.Thunks.setRegroupPromptShown)
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local squadRegroupPromptDebounceTimeMs = game:DefineFastInt("SquadRegroupPromptDebounceTimeMs", 20000)
local fFlagSquadsPresenceStoreMigrationModule = require(squadsCore.Flags.FFlagSquadsPresenceStoreMigration)
local var21 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.DataHydration) else nil
local var22 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.Signals) else nil
local var23 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.SignalsReact) else nil
local var24 = if fFlagSquadsPresenceStoreMigrationModule then var21.Presence.PresenceStore.get() else nil
local var25 = if fFlagSquadsPresenceStoreMigrationModule then var21.Presence.normalizePresenceRawData else nil
local var26 = if fFlagSquadsPresenceStoreMigrationModule then var21.Presence.PresenceEnums.PresenceType else nil
local var27 = if fFlagSquadsPresenceStoreMigrationModule then var23.useSignalState else nil

return function(p0)
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), useLocalization (ref), useDispatch (ref), useLocalUserId (ref), cryoModule (ref), fFlagSquadsPresenceStoreMigrationModule (ref), var22 (ref), var24 (ref), var27 (ref), networkingPresenceModule (ref), presenceType (ref), loggerModule (ref), serializeTableModule (ref), useSelector (ref), squadRegroupPromptDebounceTimeMs (ref), dashModule (ref), var26 (ref), squadRegroupExperimentation (ref), guiService (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStatesModule (ref), squadRegroupEntryPointModule (ref), regroupPromptNotificationStateModule (ref), squadExperienceInviteSourceModule (ref), setRegroupPromptShownModule (ref), realtimeDeliveryModule (ref), constantsModule (ref), var25 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	local var39
	local var28 = reactModule.useContext(squadExternalContractContextModule)
	local var29 = useLocalization({
		RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var30 = useDispatch()
	local var31 = tonumber(useLocalUserId()) or 0
	local var32 = reactModule.useRef(false)
	local var33 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.List.map(p0.currentSquadMembers, function(p1)
			return p1.userId
		end)
	end, { p0.currentSquadMembers })
	local var34 = reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in ipairs(p0.currentSquadMembers) do
			t[tostring(v.userId)] = true
		end
		return t
	end, { p0.currentSquadMembers })
	local var35 = if fFlagSquadsPresenceStoreMigrationModule then reactModule.useMemo(function()
		-- upvalues: var22 (copy), var33 (ref), var24 (copy)
		return var22.createComputed(function(p2)
			-- upvalues: var33 (copy), var24 (copy)
			local t = {}
			
			for i, v in ipairs(var33) do
				local var47 = tostring(v)
				t[var47] = var24.GetPresenceByUserId(var47).data(p2)
			end
			return t
		end)
	end, { var33 }) else nil
	local _ = nil
	local var36 = nil
	
	if fFlagSquadsPresenceStoreMigrationModule then
		var39 = var27(var35)
	else
		local var37, var38 = reactModule.useState({})
		var39 = var37
		var36 = var38
	end
	local var40 = reactModule.useCallback(function()
		-- upvalues: fFlagSquadsPresenceStoreMigrationModule (copy), var33 (ref), var24 (copy), var30 (ref), networkingPresenceModule (copy), cryoModule (copy), presenceType (copy), var36 (write), loggerModule (copy), serializeTableModule (copy)
		if not fFlagSquadsPresenceStoreMigrationModule then
			var30(networkingPresenceModule.GetPresencesFromUserIds.API(var33)):andThen(function(p4)
				-- upvalues: cryoModule (copy), presenceType (copy), var36 (copy)
				local userPresences
				if p4 then
					userPresences = p4.responseBody and (p4.responseBody.userPresences or {})
				end
				local t = {}
				
				for i, v in pairs(userPresences) do
					if v.userId and v.userPresenceType then
						t[tostring(v.userId)] = cryoModule.Dictionary.join(v, {
							userPresenceType = presenceType.fromRawValue(v.userPresenceType)
						})
					end
				end
				var36(function(p5)
					-- upvalues: cryoModule (copy), t (ref)
					return cryoModule.Dictionary.join(p5 or {}, t)
				end)
			end):catch(function(p3)
				-- upvalues: loggerModule (copy), serializeTableModule (copy)
				loggerModule:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", serializeTableModule(p3))
			end)
			
			return
		end
		for i, v in ipairs(var33) do
			var24.RefreshPresenceByUserId(tostring(v))
		end
	end, { var30, var33, var31 })
	local var41 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var41 (ref), var40 (ref)
		var41.current = true
		var40()
		
		return function()
			-- upvalues: var41 (copy)
			var41.current = false
		end
	end, {})
	local var42 = reactModule.useRef(nil)
	var42.current = useSelector(reactModule.useCallback(function(p6)
		return if p6.Squad and p6.Squad.Squad then p6.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var43 = squadRegroupPromptDebounceTimeMs / 1000
	local var44 = reactModule.useRef(nil)
	
	if var44.current == nil then
		var44.current = dashModule.debounce(function(p7, p8, p9, p10)
			-- upvalues: var41 (ref), var32 (ref), var42 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), var26 (copy), presenceType (copy), squadRegroupExperimentation (copy), guiService (copy), var29 (ref), var28 (ref), eventNamesModule (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), loggerModule (copy), serializeTableModule (copy), var30 (ref), squadExperienceInviteSourceModule (copy), setRegroupPromptShownModule (copy)
			if not var41.current or var32.current or var42.current ~= nil then return end
			local var50 = p7[tostring(p8)]
			
			if var50 == nil then return end
			for i, v in pairs(p7) do
				if v and (if v.userPresenceType ~= (if fFlagSquadsPresenceStoreMigrationModule then var26.Online else presenceType.Online) then v.userPresenceType == (if fFlagSquadsPresenceStoreMigrationModule then var26.InGame else presenceType.InGame) and (var50.gameId ~= (if fFlagSquadsPresenceStoreMigrationModule then "" else nil) and (v.gameId ~= (if fFlagSquadsPresenceStoreMigrationModule then "" else nil) and var50.gameId ~= v.gameId)) else true) then
					squadRegroupExperimentation.logExposure()
					
					if not squadRegroupExperimentation.getSquadRegroupEnabled() then return end
					local var51 = nil
					var51 = guiService:SendNotification({
						Title = var29.RegroupPromptTitle,
						Text = var29.RegroupPromptBody,
						Icon = p10,
						Buttons = {
							{
								Text = var29.Dismiss,
								ButtonType = Enum.NotificationButtonType.Secondary,
								OnActivated = function()
									-- upvalues: var28 (copy), eventNamesModule (copy), p9 (ref), p8 (ref), var50 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var51 (write), var32 (copy)
									var28.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
										clientTimestamp = os.time(),
										squadId = p9,
										initiatorId = p8,
										gameInstanceId = var50.gameId,
										rootPlaceId = var50.rootPlaceId,
										placeId = var50.placeId,
										universeId = var50.universeId,
										playSessionId = rbxAnalyticsService:GetPlaySessionId(),
										button = squadToastActionsAndStatesModule.RegroupDismiss,
										entryPoint = squadRegroupEntryPointModule.ToastPrompt
									})
									regroupPromptNotificationStateModule.dismissNotification(var51)
									var32.current = false
								end
							},
							{
								Text = var29.Join,
								ButtonType = Enum.NotificationButtonType.Primary,
								OnActivated = function()
									-- upvalues: var50 (ref), var28 (copy), loggerModule (copy), fFlagSquadsPresenceStoreMigrationModule (copy), serializeTableModule (copy), var30 (copy), squadExperienceInviteSourceModule (copy), eventNamesModule (copy), p9 (ref), p8 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var51 (write), var32 (copy)
									local rootPlaceId = var50.rootPlaceId
									
									if var28.createExperienceInvite == nil then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract")
									elseif rootPlaceId == nil or fFlagSquadsPresenceStoreMigrationModule and rootPlaceId == "" then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", serializeTableModule(var50))
									else
										var30(var28.createExperienceInvite(tostring(rootPlaceId), squadExperienceInviteSourceModule.Regroup)):andThen(function(p12)
											-- upvalues: var28 (copy), eventNamesModule (copy), p9 (copy), p8 (copy), var50 (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy)
											var28.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
												clientTimestamp = os.time(),
												squadId = p9,
												initiatorId = p8,
												gameInstanceId = var50.gameId,
												rootPlaceId = var50.rootPlaceId,
												placeId = var50.placeId,
												universeId = var50.universeId,
												playSessionId = rbxAnalyticsService:GetPlaySessionId(),
												experienceInviteId = p12,
												button = squadToastActionsAndStatesModule.RegroupJoin,
												entryPoint = squadRegroupEntryPointModule.ToastPrompt
											})
										end):catch(function(p11)
											-- upvalues: loggerModule (copy), serializeTableModule (copy)
											loggerModule:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", serializeTableModule(p11))
										end)
									end
									regroupPromptNotificationStateModule.dismissNotification(var51)
									var32.current = false
								end
							}
						}
					})
					var32.current = true
					regroupPromptNotificationStateModule.setActive(var51, p9)
					var28.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptShown, {
						clientTimestamp = os.time(),
						squadId = p9,
						initiatorId = p8,
						gameInstanceId = var50.gameId,
						rootPlaceId = var50.rootPlaceId,
						placeId = var50.placeId,
						universeId = var50.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						entryPoint = squadRegroupEntryPointModule.ToastPrompt
					})
					
					if p9 then
						var30(setRegroupPromptShownModule(p9))
					end
					return
				end
			end
		end, var43, { leading = false, trailing = true })
	end
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p13)
		-- upvalues: var34 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), var24 (copy), var25 (copy), presenceType (copy), var36 (write)
		if type(p13) ~= "table" then return end
		local var52 = nil
		
		for i, v in ipairs(p13) do
			local userId = v and v.UserId
			
			if userId ~= nil then
				local var54 = tostring(userId)
				
				if var34[var54] then
					local presenceReport = v and v.PresenceReport
					
					if presenceReport ~= nil then
						if fFlagSquadsPresenceStoreMigrationModule then
							var24.UpdateUserPresence(var54, var25(presenceReport), { isUpdatedRealtime = true })
						else
							presenceReport.userPresenceType = presenceType.fromRawValue(presenceReport.userPresenceType)
							var52 = var52 or {}
							var52[var54] = presenceReport
						end
					end
				end
			end
		end
		if not fFlagSquadsPresenceStoreMigrationModule and var52 ~= nil then
			var36(function(p14)
				-- upvalues: var52 (write)
				local cloned = table.clone(p14 or {})
				
				for i, v in pairs(var52) do
					cloned[i] = v
				end
				return cloned
			end)
		end
	end, { var30, p0.currentSquadId, var34 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p15, p16)
		-- upvalues: loggerModule (copy), var40 (ref)
		if p15 == Enum.ConnectionState.Connected and p16 then
			loggerModule:info("Connection re-established, fetching squad presences.")
			var40()
		end
	end, { var40 })
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var39 (write), var31 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), var44 (ref), p0 (ref)
		if not var32.current then
			local universeId
			local var57 = var39[tostring(var31)]
			
			if fFlagSquadsPresenceStoreMigrationModule then
				if var57 and var57.universeId ~= "" then
					universeId = var57.universeId
					
					if not universeId then
						if var57 and var57.gameId ~= "" then
							universeId = var57.gameId or nil
						end
					end
				end
			else
				universeId = var57 and (var57.universeId or (var57.gameId or nil))
			end
			var44.current(var39, var31, p0.currentSquadId, if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 128, false))
		end
	end, { var39, var31, p0.currentSquadId })
	
	return nil
end