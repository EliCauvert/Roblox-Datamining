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

return function(p0) --[[ line: 43 ]]
	-- upvalues: reactModule (ref), squadExternalContractContextModule (ref), useLocalization (ref), useDispatch (ref), useLocalUserId (ref), cryoModule (ref), networkingPresenceModule (ref), presenceType (ref), loggerModule (ref), serializeTableModule (ref), useSelector (ref), squadRegroupPromptDebounceTimeMs (ref), dashModule (ref), squadRegroupExperimentation (ref), guiService (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStatesModule (ref), squadRegroupEntryPointModule (ref), regroupPromptNotificationStateModule (ref), squadExperienceInviteSourceModule (ref), setRegroupPromptShownModule (ref), realtimeDeliveryModule (ref), constantsModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	local var20 = reactModule.useContext(squadExternalContractContextModule)
	local var21 = useLocalization({
		RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var22 = useDispatch()
	local var23 = tonumber(useLocalUserId()) or 0
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.List.map(p0.currentSquadMembers, function(p1) --[[ line: 58 ]]
			return p1.userId
		end)
	end, { p0.currentSquadMembers })
	local var26, var27 = reactModule.useState({})
	local var28 = reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in ipairs(p0.currentSquadMembers) do
			t[tostring(v.userId)] = true
		end
		return t
	end, { p0.currentSquadMembers })
	local var29 = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var22 (ref), networkingPresenceModule (copy), var25 (ref), cryoModule (copy), presenceType (copy), var27 (ref), loggerModule (copy), serializeTableModule (copy)
		var22(networkingPresenceModule.GetPresencesFromUserIds.API(var25)):andThen(function(p3) --[[ line: 75 ]]
			-- upvalues: cryoModule (copy), presenceType (copy), var27 (copy)
			local userPresences
			if p3 then
				userPresences = p3.responseBody and (p3.responseBody.userPresences or {})
			end
			local t = {}
			
			for i, v in pairs(userPresences) do
				if v.userId and v.userPresenceType then
					t[tostring(v.userId)] = cryoModule.Dictionary.join(v, {
						userPresenceType = presenceType.fromRawValue(v.userPresenceType)
					})
				end
			end
			var27(function(p4) --[[ line: 85 ]]
				-- upvalues: cryoModule (copy), t (ref)
				return cryoModule.Dictionary.join(p4 or {}, t)
			end)
		end):catch(function(p2) --[[ line: 89 ]]
			-- upvalues: loggerModule (copy), serializeTableModule (copy)
			loggerModule:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", serializeTableModule(p2))
		end)
	end, { var22, var25, var23 })
	local var30 = reactModule.useRef(true)
	reactModule.useEffect(function() --[[ line: 98 ]]
		-- upvalues: var30 (ref), var29 (ref)
		var30.current = true
		var29()
		
		return function() --[[ line: 102 ]]
			-- upvalues: var30 (copy)
			var30.current = false
		end
	end, {})
	local var31 = reactModule.useRef(nil)
	var31.current = useSelector(reactModule.useCallback(function(p5) --[[ line: 107 ]]
		return if p5.Squad and p5.Squad.Squad then p5.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var32 = squadRegroupPromptDebounceTimeMs / 1000
	local var33 = reactModule.useRef(nil)
	
	if var33.current == nil then
		var33.current = dashModule.debounce(function(p6, p7, p8, p9) --[[ line: 120 ]]
			-- upvalues: var30 (ref), var24 (ref), var31 (ref), presenceType (copy), squadRegroupExperimentation (copy), guiService (copy), var21 (ref), var20 (ref), eventNamesModule (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), loggerModule (copy), serializeTableModule (copy), var22 (ref), squadExperienceInviteSourceModule (copy), setRegroupPromptShownModule (copy)
			if not var30.current or var24.current or var31.current ~= nil then return end
			local var37 = p6[tostring(p7)]
			
			if var37 == nil then return end
			for i, v in pairs(p6) do
				if v and (if v.userPresenceType ~= presenceType.Online then v.userPresenceType == presenceType.InGame and (var37.gameId ~= nil and (v.gameId ~= nil and var37.gameId ~= v.gameId)) else true) then
					squadRegroupExperimentation.logExposure()
					
					if not squadRegroupExperimentation.getSquadRegroupEnabled() then return end
					local var38 = nil
					var38 = guiService:SendNotification({
						Title = var21.RegroupPromptTitle,
						Text = var21.RegroupPromptBody,
						Icon = p9,
						Buttons = {
							{
								Text = var21.Dismiss,
								ButtonType = Enum.NotificationButtonType.Secondary,
								OnActivated = function() --[[ line: 166 ]]
									-- upvalues: var20 (copy), eventNamesModule (copy), p8 (ref), p7 (ref), var37 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var38 (write), var24 (copy)
									var20.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
										clientTimestamp = os.time(),
										squadId = p8,
										initiatorId = p7,
										gameInstanceId = var37.gameId,
										rootPlaceId = var37.rootPlaceId,
										placeId = var37.placeId,
										universeId = var37.universeId,
										playSessionId = rbxAnalyticsService:GetPlaySessionId(),
										button = squadToastActionsAndStatesModule.RegroupDismiss,
										entryPoint = squadRegroupEntryPointModule.ToastPrompt
									})
									regroupPromptNotificationStateModule.dismissNotification(var38)
									var24.current = false
								end
							},
							{
								Text = var21.Join,
								ButtonType = Enum.NotificationButtonType.Primary,
								OnActivated = function() --[[ line: 186 ]]
									-- upvalues: var37 (ref), var20 (copy), loggerModule (copy), serializeTableModule (copy), var22 (copy), squadExperienceInviteSourceModule (copy), eventNamesModule (copy), p8 (ref), p7 (ref), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy), regroupPromptNotificationStateModule (copy), var38 (write), var24 (copy)
									local rootPlaceId = var37.rootPlaceId
									
									if var20.createExperienceInvite == nil then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract")
									elseif rootPlaceId == nil then
										loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", serializeTableModule(var37))
									else
										var22(var20.createExperienceInvite(tostring(rootPlaceId), squadExperienceInviteSourceModule.Regroup)):andThen(function(p11) --[[ line: 204 ]]
											-- upvalues: var20 (copy), eventNamesModule (copy), p8 (copy), p7 (copy), var37 (copy), rbxAnalyticsService (copy), squadToastActionsAndStatesModule (copy), squadRegroupEntryPointModule (copy)
											var20.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptClicked, {
												clientTimestamp = os.time(),
												squadId = p8,
												initiatorId = p7,
												gameInstanceId = var37.gameId,
												rootPlaceId = var37.rootPlaceId,
												placeId = var37.placeId,
												universeId = var37.universeId,
												playSessionId = rbxAnalyticsService:GetPlaySessionId(),
												experienceInviteId = p11,
												button = squadToastActionsAndStatesModule.RegroupJoin,
												entryPoint = squadRegroupEntryPointModule.ToastPrompt
											})
										end):catch(function(p10) --[[ line: 222 ]]
											-- upvalues: loggerModule (copy), serializeTableModule (copy)
											loggerModule:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", serializeTableModule(p10))
										end)
									end
									regroupPromptNotificationStateModule.dismissNotification(var38)
									var24.current = false
								end
							}
						}
					})
					var24.current = true
					regroupPromptNotificationStateModule.setActive(var38, p8)
					var20.fireSquadAnalytics(eventNamesModule.SquadRegroupPromptShown, {
						clientTimestamp = os.time(),
						squadId = p8,
						initiatorId = p7,
						gameInstanceId = var37.gameId,
						rootPlaceId = var37.rootPlaceId,
						placeId = var37.placeId,
						universeId = var37.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						entryPoint = squadRegroupEntryPointModule.ToastPrompt
					})
					
					if p8 then
						var22(setRegroupPromptShownModule(p8))
					end
					return
				end
			end
		end, var32, { leading = false, trailing = true })
	end
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p12) --[[ line: 266 ]]
		-- upvalues: var28 (ref), presenceType (copy), var27 (ref)
		if type(p12) ~= "table" then return end
		local var39 = nil
		
		for i, v in ipairs(p12) do
			local userId = v and v.UserId
			
			if userId ~= nil then
				local var41 = tostring(userId)
				
				if var28[var41] then
					local presenceReport = v and v.PresenceReport
					
					if presenceReport ~= nil then
						presenceReport.userPresenceType = presenceType.fromRawValue(presenceReport.userPresenceType)
						var39 = var39 or {}
						var39[var41] = presenceReport
					end
				end
			end
		end
		if var39 ~= nil then
			var27(function(p13) --[[ line: 290 ]]
				-- upvalues: var39 (write)
				local cloned = table.clone(p13 or {})
				
				for i, v in pairs(var39) do
					cloned[i] = v
				end
				return cloned
			end)
		end
	end, { var22, p0.currentSquadId, var28 })
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(constantsModule.PRESENCE_BULK_RTN_NAMESPACE, function(p14, p15) --[[ line: 303 ]]
		-- upvalues: loggerModule (copy), var29 (ref)
		if p14 == Enum.ConnectionState.Connected and p15 then
			loggerModule:info("Connection re-established, fetching squad presences.")
			var29()
		end
	end, { var29 })
	reactModule.useEffect(function() --[[ line: 312 ]]
		-- upvalues: var24 (ref), var26 (ref), var23 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), var33 (ref), p0 (ref)
		if not var24.current then
			local var44 = var26[tostring(var23)]
			local universeId = var44 and (var44.universeId or (var44.gameId or nil))
			var33.current(var26, var23, p0.currentSquadId, if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 128, false))
		end
	end, { var26, var23, p0.currentSquadId })
	
	return nil
end