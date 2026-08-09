local squads = script:FindFirstAncestor("Squads")
local dependenciesModule = require(squads.dependencies)
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local experienceServiceModule = require(parent.ExperienceService)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local UIBloxModule = require(parent.UIBlox)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local squadPartySheetActionEnumModule = require(squads.Enums.SquadPartySheetActionEnum)
local _ = require(squads.Common.ModelTypes)
local cryo = dependenciesModule.Cryo
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local react = dependenciesModule.React
local sharedFlags = dependenciesModule.SharedFlags
local images = UIBloxModule.App.ImageSet.Images
local modalBottomSheet = UIBloxModule.ModalBottomSheet
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local useStore = dependenciesModule.Hooks.useStore
local useSelector = dependenciesModule.Hooks.useSelector
local useBackgroundExperience = crossExperienceVoiceModule.Hooks.useBackgroundExperience
local useParticipants = crossExperienceVoiceModule.Hooks.useParticipants
local useVoiceStatus = crossExperienceVoiceModule.Hooks.useVoiceStatus
local useSquadUserDropdownMenuButtonsModule = require(squads.Hooks.useSquadUserDropdownMenuButtons)
local gameParams = experienceServiceModule.GameParams
local experienceService = experienceServiceModule.ExperienceService
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadLocationEnum = require(parent.SquadsCore.Enums).SquadLocationEnum
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local constantsModule = require(parent.SquadsCore.Constants)
local useIsLocalPlayerPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local useIsUserPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsUserPartyVoiceEligible
local useIsCurrentSquadPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsCurrentSquadPartyVoiceEligible
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local getFFlagEnableCrossExpVoiceAbuseReport = sharedFlags.getFFlagEnableCrossExpVoiceAbuseReport
local fFlagEnableSquadUserCardHoverFix = sharedFlags.FFlagEnableSquadUserCardHoverFix
local fFlagSquadLaunchExperienceMobileFix = sharedFlags.FFlagSquadLaunchExperienceMobileFix
local useIsParticipantMutedLocally = crossExperienceVoiceModule.Hooks.useIsParticipantMutedLocally
local default = crossExperienceVoiceModule.CrossExperienceVoiceManager.default
local play = images["icons/common/play"]
local profile = images["icons/menu/profile"]
local feedback = images["icons/actions/feedback"]
local leave = images["icons/actions/leave"]
local headphoneDeafenSmall = images["icons/controls/headphoneDeafen_small"]
local microphoneMute = images["icons/controls/microphoneMute"]
local microphone = images["icons/controls/microphone"]
local t = {
	isInExperience = false,
	parentChannelId = "",
	userId = "",
	onDismiss = function() --[[ line: 102 ]] end,
	openViewProfile = function() --[[ line: 103 ]] end,
	openVoiceAbuseReport = function() --[[ line: 104 ]] end
}

return function(p0) --[[ line: 109 ]]
	-- upvalues: cryo (ref), t (ref), react (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useVoiceStatus (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), useIsParticipantMutedLocally (ref), useLocalization (ref), constantsModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadPromptType (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), useParticipants (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), useSelector (ref), presenceType (ref), gameParams (ref), fFlagSquadLaunchExperienceMobileFix (ref), squadLocationEnum (ref), experienceService (ref), headphoneDeafenSmall (ref), play (ref), leave (ref), profile (ref), feedback (ref), microphoneMute (ref), microphone (ref), default (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref), focusNavigableSurfaceWrapper (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigableSurfaceIdentifierEnum (ref), modalBottomSheet (ref)
	local var12 = cryo.Dictionary.union(t, p0)
	local var13 = react.useContext(squadExternalContractContext)
	local var14 = useDispatch()
	local var15 = useLocalUserId()
	local var16 = useStore()
	local var17 = useVoiceStatus()
	local var18 = if fFlagEnableSquadUserCardHoverFix then useSquadUserDropdownMenuButtonsModule(var12.userId, var12.isInExperience) else nil
	local var19 = useIsParticipantMutedLocally(tonumber(var12.userId) or -1)
	local var20 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		reportUserText = "Feature.Chat.Action.ReportUser",
		removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
		voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible",
		muteVoiceButtonText = "Feature.Chat.Action.MuteVoice",
		unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
	})
	local var21 = var13.useGetConversationFromId(var12.parentChannelId)
	local var22 = react.useMemo(function() --[[ line: 134 ]]
		-- upvalues: var21 (ref), constantsModule (copy), var15 (ref)
		return var21 and (var21.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var21.initiator == var15)
	end, { var21, var15 })
	local var23 = react.useCallback(function() --[[ line: 140 ]]
		-- upvalues: var13 (ref), eventNamesModule (copy), var12 (ref), squadPartySheetActionEnumModule (copy), var17 (ref)
		var13.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var12.parentChannelId,
			actionType = squadPartySheetActionEnumModule.ViewProfileButtonClicked,
			voiceStatus = var17
		})
		var12.openViewProfile()
	end, {
		var12.parentChannelId,
		var12.openViewProfile,
		var13.fireSquadAnalytics,
		var17
	})
	local var24 = react.useCallback(function() --[[ line: 155 ]]
		-- upvalues: var13 (ref), eventNamesModule (copy), var12 (ref), squadPartySheetActionEnumModule (copy), var17 (ref), var16 (ref), squadPromptType (copy), var14 (ref)
		var13.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var12.parentChannelId,
			actionType = squadPartySheetActionEnumModule.RemoveUserDropDownButtonClicked,
			voiceStatus = var17
		})
		var13.setSquadPrompt(var16, {
			promptType = squadPromptType.RemoveFromChat,
			onConfirm = function() --[[ line: 164 ]]
				-- upvalues: var12 (copy), var13 (copy), eventNamesModule (copy), squadPartySheetActionEnumModule (copy), var17 (copy), var14 (copy)
				if var12.userId == "" or var12.parentChannelId == "" then
					return nil
				end
				var13.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
					parentChannelId = var12.parentChannelId,
					actionType = squadPartySheetActionEnumModule.RemoveUserDialogButtonClicked,
					voiceStatus = var17
				})
				
				return var13.removeUserFromParentChannel(var14, var12.parentChannelId, var12.userId)
			end
		})
	end, {
		var14, var12.userId, var12.parentChannelId, var13.fireSquadAnalytics,
		var13.setSquadPrompt, var13.removeUserFromParentChannel, var17
	})
	local _ = nil
	local var25 = nil
	local _ = nil
	local t_1 = {}
	local var27 = nil
	local var28 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var29 = useBackgroundExperience()
		local var30 = useParticipants() or {}
		t_1 = react.useMemo(function() --[[ line: 199 ]]
			-- upvalues: var30 (write)
			local t = {}
			
			for i, v in pairs(var30) do
				table.insert(t, v.userId)
			end
			return t
		end, { var30 })
		var27 = react.useMemo(function() --[[ line: 206 ]]
			-- upvalues: var29 (write)
			return if var29 then var29.voiceChannelId else nil
		end, { var29 })
		var28 = react.useMemo(function() --[[ line: 209 ]]
			-- upvalues: var29 (write)
			return if var29 then var29.voiceSessionId else nil
		end, { var29 })
		
		if not fFlagEnableSquadUserCardHoverFix then
			local var31 = if var12.userId then tonumber(var12.userId) else nil
			
			if var31 then
				local var32 = useIsLocalPlayerPartyVoiceEligible()
				var25 = if useIsCurrentSquadPartyVoiceEligible() == true then var32 and not useIsUserPartyVoiceEligible(var31) else useIsCurrentSquadPartyVoiceEligible() == true
			end
		end
	end
	local var33 = useSelector(react.useCallback(function(p1) --[[ line: 226 ]]
		-- upvalues: var12 (ref)
		return p1.Squad.Presence.byUserId[var12.userId]
	end, { var12.userId }))
	local var34 = react.useMemo(function() --[[ line: 231 ]]
		-- upvalues: fFlagEnableSquadUserCardHoverFix (copy), var18 (ref), var33 (ref), presenceType (copy)
		return if fFlagEnableSquadUserCardHoverFix then table.find(var18, "JoinButton") ~= nil and (var33 and (var33.userPresenceType == presenceType.InGame and var33.placeId)) else var33 and (var33.userPresenceType == presenceType.InGame and var33.placeId)
	end, { var33, var18 })
	local var35 = react.useCallback(function() --[[ line: 242 ]]
		-- upvalues: var34 (ref), gameParams (copy), var12 (ref), var33 (ref), fFlagSquadLaunchExperienceMobileFix (copy), var13 (ref), squadLocationEnum (copy), experienceService (copy)
		if var34 then
			local var38 = gameParams.fromUserId(var12.userId, var33.placeId)
			
			if var12.isInExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var39 = "SquadLobby"
			
			if var13.squadLocation == squadLocationEnum.UniversalApp then
				var39 = "SquadLobbyFromUA"
			elseif var13.squadLocation == squadLocationEnum.InExperience then
				var39 = "SquadLobbyFromInExp"
			end
			experienceService:LaunchExperience(var38, var39, nil)
		end
	end, {
		var34,
		var13.squadLocation,
		var12.isInExperience,
		var12.userId,
		var33
	})
	local var36 = if fFlagEnableSquadUserCardHoverFix then react.useMemo(function() --[[ line: 267 ]]
		-- upvalues: headphoneDeafenSmall (copy), var20 (ref), play (copy), var35 (ref), leave (copy), var24 (ref), profile (copy), var23 (ref), feedback (copy), var15 (ref), var12 (ref), var27 (write), var28 (write), t_1 (write), var19 (ref), microphoneMute (copy), microphone (copy), default (copy), var18 (ref)
		local t = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var20.voiceIneligibleText
			},
			JoinButton = {
				icon = play,
				text = var20.joinButtonText,
				onActivated = var35
			},
			RemoveUserButton = {
				icon = leave,
				text = var20.removeFromGroupText,
				onActivated = var24
			},
			ViewProfileButton = {
				icon = profile,
				text = var20.viewProfileText,
				onActivated = var23
			},
			ReportButton = {
				icon = feedback,
				text = var20.reportUserText,
				onActivated = function() --[[ line: 292 ]]
					-- upvalues: var15 (copy), var12 (copy), var27 (copy), var28 (copy), t_1 (copy)
					var12.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var15),
						abuserUserId = var12.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var27,
						voiceSessionId = var28,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			},
			MuteVoiceButton = {
				icon = if var19 then microphoneMute else microphone,
				text = if var19 then var20.unmuteVoiceButtonText else var20.muteVoiceButtonText,
				onActivated = function() --[[ line: 310 ]]
					-- upvalues: var12 (copy), var19 (copy), default (copy)
					local var46 = tonumber(var12.userId)
					
					if not var46 then
						warn("Invalid userId: " .. tostring(var12.userId))
						
						return
					elseif var19 then
						default:unmuteVoiceParticipant(var46)
						
						return
					end
					default:muteVoiceParticipant(var46)
				end
			}
		}
		local t_2 = {}
		
		for i, v in var18 do
			local var45 = t[v]
			
			if var45 then
				table.insert(t_2, var45)
			end
		end
		return t_2
	end, {
		var12.userId, var12.openSquadVoiceAbuseReport, var20.joinButtonText,
		var20.removeFromGroupText, var20.reportUserText, var20.viewProfileText,
		var20.voiceIneligibleText, var20.muteVoiceButtonText,
		var20.unmuteVoiceButtonText, var15, var27, var28, t_1, var24, var18, var35,
		var23, var19
	}) else react.useMemo(function() --[[ line: 357 ]]
		-- upvalues: var15 (ref), var12 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var27 (write), var25 (write), headphoneDeafenSmall (copy), var20 (ref), var34 (ref), play (copy), var35 (ref), profile (copy), var23 (ref), feedback (copy), var28 (write), t_1 (write), var22 (ref), leave (copy), var24 (ref)
		local var40 = not var12.isInExperience
		local var41 = getFFlagEnableCrossExpVoiceAbuseReport() and (not not var27 and not (tostring(var15) == var12.userId))
		local t = {}
		
		if var25 then
			table.insert(t, {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var20.voiceIneligibleText
			})
		end
		if var34 then
			table.insert(t, {
				icon = play,
				text = var20.joinButtonText,
				onActivated = var35
			})
		end
		if var40 then
			table.insert(t, {
				icon = profile,
				text = var20.viewProfileText,
				onActivated = var23
			})
		end
		if var41 then
			table.insert(t, {
				icon = feedback,
				text = var20.reportUserText,
				onActivated = function() --[[ line: 394 ]]
					-- upvalues: var15 (copy), var12 (copy), var27 (copy), var28 (copy), t_1 (copy)
					var12.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var15),
						abuserUserId = var12.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var27,
						voiceSessionId = var28,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			})
		end
		if var22 then
			table.insert(t, {
				icon = leave,
				text = var20.removeFromGroupText,
				onActivated = var24
			})
		end
		return t
	end, {
		var12.isInExperience, var12.userId, var12.openSquadVoiceAbuseReport,
		var20.joinButtonText, var20.removeFromGroupText, var20.reportUserText,
		var20.viewProfileText, var20.voiceIneligibleText, var25, var15, var27, var28,
		t_1, var24, var34, var22, var35, var23
	})
	
	if #var36 > 0 then
		return react.createElement(focusNavigableSurfaceWrapper, {
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2) --[[ line: 443 ]]
						-- upvalues: var12 (ref)
						var12.onDismiss()
						p2:cancel()
					end)
				}
			},
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, {
			react.createElement(modalBottomSheet, {
				bottomGap = 20,
				screenWidth = 400,
				showImages = true,
				buttonModels = var36,
				onDismiss = function() --[[ line: 457 ]]
					-- upvalues: var12 (ref)
					var12.onDismiss()
				end
			})
		})
	end
	var12.onDismiss()
	
	return nil
end