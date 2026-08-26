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
local var1 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.DataHydration) else nil
local var2 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.Signals) else nil
local var3 = if fFlagSquadsPresenceStoreMigrationModule then require(parent.SignalsReact) else nil
local var4 = if fFlagSquadsPresenceStoreMigrationModule then var1.Presence.PresenceStore.get() else nil
local var5 = if fFlagSquadsPresenceStoreMigrationModule then var1.Presence.normalizePresenceRawData else nil
local var6 = if fFlagSquadsPresenceStoreMigrationModule then var1.Presence.PresenceEnums.PresenceType else nil
local var7 = if fFlagSquadsPresenceStoreMigrationModule then var3.useSignalState else nil

return function(p1)
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), useLocalization (ref), useDispatch (ref), useLocalUserId (ref), cryoModule (ref), fFlagSquadsPresenceStoreMigrationModule (ref), var2 (ref), var4 (ref), var7 (ref), networkingPresenceModule (ref), presenceType (ref), loggerModule (ref), serializeTableModule (ref), useSelector (ref), squadRegroupPromptDebounceTimeMs (ref), dashModule (ref), var6 (ref), squadRegroupExperimentation (ref), guiService (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStatesModule (ref), squadRegroupEntryPointModule (ref), regroupPromptNotificationStateModule (ref), squadExperienceInviteSourceModule (ref), setRegroupPromptShownModule (ref), realtimeDeliveryModule (ref), constantsModule (ref), var5 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	local var8
	local var9 = reactModule.useContext(squadExternalContractContextModule)
	local var10 = useLocalization({
		RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var11 = useDispatch()
	local var12 = tonumber(useLocalUserId()) or 0
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.List.map(p1.currentSquadMembers, function(p2)
			return p2.userId
		end)
	end, { p1.currentSquadMembers })
	local var15 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in ipairs(p1.currentSquadMembers) do
			t[tostring(v.userId)] = true
		end
		return t
	end, { p1.currentSquadMembers })
	local var16 = if fFlagSquadsPresenceStoreMigrationModule then reactModule.useMemo(function()
		-- upvalues: var2 (copy), var14 (ref), var4 (copy)
		return var2.createComputed(function(p2)
			-- upvalues: var14 (copy), var4 (copy)
			local t = {}
			
			for i, v in ipairs(var14) do
				local var17 = tostring(v)
				t[var17] = var4.GetPresenceByUserId(var17).data(p2)
			end
			return t
		end)
	end, { var14 }) else nil
	local _ = nil
	local var17 = nil
	
	if fFlagSquadsPresenceStoreMigrationModule then
		var8 = var7(var16)
	else
		local var18, var19 = reactModule.useState({})
		var8 = var18
		var17 = var19
	end
	local var20 = reactModule.useCallback(function()
		-- upvalues: fFlagSquadsPresenceStoreMigrationModule (copy), var14 (ref), var4 (copy), var11 (ref), networkingPresenceModule (copy), cryoModule (copy), presenceType (copy), var17 (write), loggerModule (copy), serializeTableModule (copy)
		if not fFlagSquadsPresenceStoreMigrationModule then
			var11(networkingPresenceModule.GetPresencesFromUserIds.API(var14)):andThen(function(p2)
				-- upvalues: cryoModule (copy), presenceType (copy), var17 (copy)
				local userPresences
				if p2 then
					userPresences = p2.responseBody and (p2.responseBody.userPresences or {})
				end
				local t = {}
				
				for i, v in pairs(userPresences) do
					if v.userId and v.userPresenceType then
						t[tostring(v.userId)] = cryoModule.Dictionary.join(v, {
							userPresenceType = presenceType.fromRawValue(v.userPresenceType)
						})
					end
				end
				var17(function(p3)
					-- upvalues: cryoModule (copy), t (ref)
					return cryoModule.Dictionary.join(p3 or {}, t)
				end)
			end):catch(function(p3)
				-- upvalues: loggerModule (copy), serializeTableModule (copy)
				loggerModule:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", serializeTableModule(p3))
			end)
			
			return
		end
		for i, v in ipairs(var14) do
			var4.RefreshPresenceByUserId(tostring(v))
		end
	end, { var11, var14, var12 })
	local var21 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var20 (ref)
		var21.current = true
		var20()
		
		return function()
			-- upvalues: var21 (copy)
			var21.current = false
		end
	end, {})
	local var22 = reactModule.useRef(nil)
	var22.current = useSelector(reactModule.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var23 = squadRegroupPromptDebounceTimeMs / 1000
	local var24 = reactModule.useRef(nil)
	
	if var24.current == nil then
		var24.current = dashModule.debounce(function(p2, p3, p4, p5)
			-- upvalues: var21 (ref), var13 (ref), var22 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), var6 (copy), presenceType (copy), squadRegroupExperimentation (copy), guiService (copy), var10 (ref), var9 (ref), eventNamesModule (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), loggerModule (copy), serializeTableModule (copy), var11 (ref), squadExperienceInviteSourceModule (copy), setRegroupPromptShownModule (copy)
			if not var21.current or var13.current or var22.current ~= nil then return end
			local var25 = p2[tostring(p3)]
			
			if var25 == nil then return end
			for i, v in pairs(p2) do
				if v and (if v.userPresenceType ~= (if fFlagSquadsPresenceStoreMigrationModule then var6.Online else presenceType.Online) then v.userPresenceType == (if fFlagSquadsPresenceStoreMigrationModule then var6.InGame else presenceType.InGame) and (var25.gameId ~= (if fFlagSquadsPresenceStoreMigrationModule then "" else nil) and (v.gameId ~= (if fFlagSquadsPresenceStoreMigrationModule then "" else nil) and var25.gameId ~= v.gameId)) else true) then
					squadRegroupExperimentation.logExposure()
					
					if not squadRegroupExperimentation.getSquadRegroupEnabled() then return end
					local var26 = nil
					var26 = guiService:SendNotification({
						Title = var10.RegroupPromptTitle,
						Text = var10.RegroupPromptBody,
						Icon = p5,
						Buttons = {
							{
								Text = var10.Dismiss,
								ButtonType = Enum.NotificationButtonType.Secondary,
								OnActivated = function()
									-- upvalues: var9 (copy), eventNamesModule (copy), p4 (ref), p3 (ref), var25 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var26 (write), var13 (copy)
									var9.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
										clientTimestamp = os.time(),
										squadId = p4,
										initiatorId = p3,
										gameInstanceId = var25.gameId,
										rootPlaceId = var25.rootPlaceId,
										placeId = var25.placeId,
										universeId = var25.universeId,
										playSessionId = rbxAnalyticsService:GetPlaySessionId(),
										button = squadToastActionsAndStatesModule.RegroupDismiss,
										entryPoint = squadRegroupEntryPointModule.ToastPrompt
									})
									regroupPromptNotificationStateModule.dismissNotification(var26)
									var13.current = false
								end
							},
							{
								Text = var10.Join,
								ButtonType = Enum.NotificationButtonType.Primary,
								OnActivated = function()
									-- upvalues: var25 (ref), var9 (copy), loggerModule (copy), fFlagSquadsPresenceStoreMigrationModule (copy), serializeTableModule (copy), var11 (copy), squadExperienceInviteSourceModule (copy), eventNamesModule (copy), p4 (ref), p3 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var26 (write), var13 (copy)
									local rootPlaceId = var25.rootPlaceId
									
									if var9.createExperienceInvite == nil then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract")
									elseif rootPlaceId == nil or fFlagSquadsPresenceStoreMigrationModule and rootPlaceId == "" then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", serializeTableModule(var25))
									else
										var11(var9.createExperienceInvite(tostring(rootPlaceId), squadExperienceInviteSourceModule.Regroup)):andThen(function(p6)
											-- upvalues: var9 (copy), eventNamesModule (copy), p4 (copy), p3 (copy), var25 (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy)
											var9.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
												clientTimestamp = os.time(),
												squadId = p4,
												initiatorId = p3,
												gameInstanceId = var25.gameId,
												rootPlaceId = var25.rootPlaceId,
												placeId = var25.placeId,
												universeId = var25.universeId,
												playSessionId = rbxAnalyticsService:GetPlaySessionId(),
												experienceInviteId = p6,
												button = squadToastActionsAndStatesModule.RegroupJoin,
												entryPoint = squadRegroupEntryPointModule.ToastPrompt
											})
										end):catch(function(p6)
											-- upvalues: loggerModule (copy), serializeTableModule (copy)
											loggerModule:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", serializeTableModule(p6))
										end)
									end
									regroupPromptNotificationStateModule.dismissNotification(var26)
									var13.current = false
								end
							}
						}
					})
					var13.current = true
					regroupPromptNotificationStateModule.setActive(var26, p4)
					var9.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptShown, {
						clientTimestamp = os.time(),
						squadId = p4,
						initiatorId = p3,
						gameInstanceId = var25.gameId,
						rootPlaceId = var25.rootPlaceId,
						placeId = var25.placeId,
						universeId = var25.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						entryPoint = squadRegroupEntryPointModule.ToastPrompt
					})
					
					if p4 then
						var11(setRegroupPromptShownModule(p4))
					end
					return
				end
			end
		end, var23, { leading = false, trailing = true })
	end
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p2)
		-- upvalues: var15 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), var4 (copy), var5 (copy), presenceType (copy), var17 (write)
		if type(p2) ~= "table" then return end
		local var25 = nil
		
		for i, v in ipairs(p2) do
			local userId = v and v.UserId
			
			if userId ~= nil then
				local var26 = tostring(userId)
				
				if var15[var26] then
					local presenceReport = v and v.PresenceReport
					
					if presenceReport ~= nil then
						if fFlagSquadsPresenceStoreMigrationModule then
							var4.UpdateUserPresence(var26, var5(presenceReport), { isUpdatedRealtime = true })
						else
							presenceReport.userPresenceType = presenceType.fromRawValue(presenceReport.userPresenceType)
							var25 = var25 or {}
							var25[var26] = presenceReport
						end
					end
				end
			end
		end
		if not fFlagSquadsPresenceStoreMigrationModule and var25 ~= nil then
			var17(function(p3)
				-- upvalues: var25 (write)
				local cloned = table.clone(p3 or {})
				
				for i, v in pairs(var25) do
					cloned[i] = v
				end
				return cloned
			end)
		end
	end, { var11, p1.currentSquadId, var15 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p3, p4)
		-- upvalues: loggerModule (copy), var20 (ref)
		if p3 == Enum.ConnectionState.Connected and p4 then
			loggerModule:info("Connection re-established, fetching squad presences.")
			var20()
		end
	end, { var20 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var8 (write), var12 (ref), fFlagSquadsPresenceStoreMigrationModule (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), var24 (ref), p1 (ref)
		if not var13.current then
			local universeId
			local var27 = var8[tostring(var12)]
			
			if fFlagSquadsPresenceStoreMigrationModule then
				if var27 and var27.universeId ~= "" then
					universeId = var27.universeId
					
					if not universeId then
						if var27 and var27.gameId ~= "" then
							universeId = var27.gameId or nil
						end
					end
				end
			else
				universeId = var27 and (var27.universeId or (var27.gameId or nil))
			end
			var24.current(var8, var12, p1.currentSquadId, if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 128, false))
		end
	end, { var8, var12, p1.currentSquadId })
	
	return nil
end