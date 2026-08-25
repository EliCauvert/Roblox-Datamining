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
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var8 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var9 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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
	onDismiss = function() end,
	openViewProfile = function() end,
	openVoiceAbuseReport = function() end
}

return function(p0)
	-- upvalues: cryo (ref), t (ref), react (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useVoiceStatus (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), useIsParticipantMutedLocally (ref), useLocalization (ref), constantsModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadPromptType (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), useParticipants (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), fFlagSquadsPresenceStoreMigration (ref), var8 (ref), useSelector (ref), var9 (ref), presenceType (ref), gameParams (ref), fFlagSquadLaunchExperienceMobileFix (ref), squadLocationEnum (ref), experienceService (ref), headphoneDeafenSmall (ref), play (ref), leave (ref), profile (ref), feedback (ref), microphoneMute (ref), microphone (ref), default (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref), focusNavigableSurfaceWrapper (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigableSurfaceIdentifierEnum (ref), modalBottomSheet (ref)
	local var14 = cryo.Dictionary.union(t, p0)
	local var15 = react.useContext(squadExternalContractContext)
	local var16 = useDispatch()
	local var17 = useLocalUserId()
	local var18 = useStore()
	local var19 = useVoiceStatus()
	local var20 = if fFlagEnableSquadUserCardHoverFix then useSquadUserDropdownMenuButtonsModule(var14.userId, var14.isInExperience) else nil
	local var21 = useIsParticipantMutedLocally(tonumber(var14.userId) or -1)
	local var22 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		reportUserText = "Feature.Chat.Action.ReportUser",
		removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
		voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible",
		muteVoiceButtonText = "Feature.Chat.Action.MuteVoice",
		unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
	})
	local var23 = var15.useGetConversationFromId(var14.parentChannelId)
	local var24 = react.useMemo(function()
		-- upvalues: var23 (ref), constantsModule (copy), var17 (ref)
		return var23 and (var23.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var23.initiator == var17)
	end, { var23, var17 })
	local var25 = react.useCallback(function()
		-- upvalues: var15 (ref), eventNamesModule (copy), var14 (ref), squadPartySheetActionEnumModule (copy), var19 (ref)
		var15.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var14.parentChannelId,
			actionType = squadPartySheetActionEnumModule.ViewProfileButtonClicked,
			voiceStatus = var19
		})
		var14.openViewProfile()
	end, {
		var14.parentChannelId,
		var14.openViewProfile,
		var15.fireSquadAnalytics,
		var19
	})
	local var26 = react.useCallback(function()
		-- upvalues: var15 (ref), eventNamesModule (copy), var14 (ref), squadPartySheetActionEnumModule (copy), var19 (ref), var18 (ref), squadPromptType (copy), var16 (ref)
		var15.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var14.parentChannelId,
			actionType = squadPartySheetActionEnumModule.RemoveUserDropDownButtonClicked,
			voiceStatus = var19
		})
		var15.setSquadPrompt(var18, {
			promptType = squadPromptType.RemoveFromChat,
			onConfirm = function()
				-- upvalues: var14 (copy), var15 (copy), eventNamesModule (copy), squadPartySheetActionEnumModule (copy), var19 (copy), var16 (copy)
				if var14.userId == "" or var14.parentChannelId == "" then
					return nil
				end
				var15.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
					parentChannelId = var14.parentChannelId,
					actionType = squadPartySheetActionEnumModule.RemoveUserDialogButtonClicked,
					voiceStatus = var19
				})
				
				return var15.removeUserFromParentChannel(var16, var14.parentChannelId, var14.userId)
			end
		})
	end, {
		var16, var14.userId, var14.parentChannelId, var15.fireSquadAnalytics,
		var15.setSquadPrompt, var15.removeUserFromParentChannel, var19
	})
	local _ = nil
	local var27 = nil
	local _ = nil
	local t_1 = {}
	local var29 = nil
	local var30 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var31 = useBackgroundExperience()
		local var32 = useParticipants() or {}
		t_1 = react.useMemo(function()
			-- upvalues: var32 (write)
			local t = {}
			
			for i, v in pairs(var32) do
				table.insert(t, v.userId)
			end
			return t
		end, { var32 })
		var29 = react.useMemo(function()
			-- upvalues: var31 (write)
			return if var31 then var31.voiceChannelId else nil
		end, { var31 })
		var30 = react.useMemo(function()
			-- upvalues: var31 (write)
			return if var31 then var31.voiceSessionId else nil
		end, { var31 })
		
		if not fFlagEnableSquadUserCardHoverFix then
			local var33 = if var14.userId then tonumber(var14.userId) else nil
			
			if var33 then
				local var34 = useIsLocalPlayerPartyVoiceEligible()
				var27 = if useIsCurrentSquadPartyVoiceEligible() == true then var34 and not useIsUserPartyVoiceEligible(var33) else useIsCurrentSquadPartyVoiceEligible() == true
			end
		end
	end
	local var35 = if fFlagSquadsPresenceStoreMigration then var8(tostring(var14.userId)) else useSelector(react.useCallback(function(p1)
		-- upvalues: var14 (ref)
		return p1.Squad.Presence.byUserId[var14.userId]
	end, { var14.userId }))
	local var36 = react.useMemo(function()
		-- upvalues: fFlagEnableSquadUserCardHoverFix (copy), var20 (ref), var35 (ref), fFlagSquadsPresenceStoreMigration (copy), var9 (copy), presenceType (copy)
		if fFlagEnableSquadUserCardHoverFix then
			local placeId = false
			
			if table.find(var20, "JoinButton") ~= nil then
				placeId = var35
				
				if placeId then
					placeId = false
					
					if var35.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var9.InGame else presenceType.InGame) then
						if fFlagSquadsPresenceStoreMigration then
							return var35.placeId ~= ""
						end
						placeId = var35.placeId
					end
				end
			end
			return placeId
		else
			local var40 = var35
			
			if var40 then
				var40 = false
				
				if var35.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var9.InGame else presenceType.InGame) then
					if fFlagSquadsPresenceStoreMigration then
						return var35.placeId ~= ""
					end
					var40 = var35.placeId
				end
			end
			return var40
		end
	end, { var35, var20 })
	local var37 = react.useCallback(function()
		-- upvalues: var36 (ref), gameParams (copy), var14 (ref), fFlagSquadsPresenceStoreMigration (copy), var35 (ref), fFlagSquadLaunchExperienceMobileFix (copy), var15 (ref), squadLocationEnum (copy), experienceService (copy)
		if var36 then
			local var41 = gameParams.fromUserId(var14.userId, if fFlagSquadsPresenceStoreMigration then var35 and var35.placeId else var35.placeId)
			
			if var14.isInExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var42 = "SquadLobby"
			
			if var15.squadLocation == squadLocationEnum.UniversalApp then
				var42 = "SquadLobbyFromUA"
			elseif var15.squadLocation == squadLocationEnum.InExperience then
				var42 = "SquadLobbyFromInExp"
			end
			experienceService:LaunchExperience(var41, var42, nil)
		end
	end, {
		var36,
		var15.squadLocation,
		var14.isInExperience,
		var14.userId,
		var35
	})
	local var38 = if fFlagEnableSquadUserCardHoverFix then react.useMemo(function()
		-- upvalues: headphoneDeafenSmall (copy), var22 (ref), play (copy), var37 (ref), leave (copy), var26 (ref), profile (copy), var25 (ref), feedback (copy), var17 (ref), var14 (ref), var29 (write), var30 (write), t_1 (write), var21 (ref), microphoneMute (copy), microphone (copy), default (copy), var20 (ref)
		local t = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var22.voiceIneligibleText
			},
			JoinButton = {
				icon = play,
				text = var22.joinButtonText,
				onActivated = var37
			},
			RemoveUserButton = {
				icon = leave,
				text = var22.removeFromGroupText,
				onActivated = var26
			},
			ViewProfileButton = {
				icon = profile,
				text = var22.viewProfileText,
				onActivated = var25
			},
			ReportButton = {
				icon = feedback,
				text = var22.reportUserText,
				onActivated = function()
					-- upvalues: var17 (copy), var14 (copy), var29 (copy), var30 (copy), t_1 (copy)
					var14.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var17),
						abuserUserId = var14.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var29,
						voiceSessionId = var30,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			},
			MuteVoiceButton = {
				icon = if var21 then microphoneMute else microphone,
				text = if var21 then var22.unmuteVoiceButtonText else var22.muteVoiceButtonText,
				onActivated = function()
					-- upvalues: var14 (copy), var21 (copy), default (copy)
					local var49 = tonumber(var14.userId)
					
					if not var49 then
						warn("Invalid userId: " .. tostring(var14.userId))
						
						return
					elseif var21 then
						default:unmuteVoiceParticipant(var49)
						
						return
					end
					default:muteVoiceParticipant(var49)
				end
			}
		}
		local t_2 = {}
		
		for i, v in var20 do
			local var48 = t[v]
			
			if var48 then
				table.insert(t_2, var48)
			end
		end
		return t_2
	end, {
		var14.userId, var14.openSquadVoiceAbuseReport, var22.joinButtonText,
		var22.removeFromGroupText, var22.reportUserText, var22.viewProfileText,
		var22.voiceIneligibleText, var22.muteVoiceButtonText,
		var22.unmuteVoiceButtonText, var17, var29, var30, t_1, var26, var20, var37,
		var25, var21
	}) else react.useMemo(function()
		-- upvalues: var17 (ref), var14 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var29 (write), var27 (write), headphoneDeafenSmall (copy), var22 (ref), var36 (ref), play (copy), var37 (ref), profile (copy), var25 (ref), feedback (copy), var30 (write), t_1 (write), var24 (ref), leave (copy), var26 (ref)
		local var43 = not var14.isInExperience
		local var44 = getFFlagEnableCrossExpVoiceAbuseReport() and (not not var29 and not (tostring(var17) == var14.userId))
		local t = {}
		
		if var27 then
			table.insert(t, {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var22.voiceIneligibleText
			})
		end
		if var36 then
			table.insert(t, {
				icon = play,
				text = var22.joinButtonText,
				onActivated = var37
			})
		end
		if var43 then
			table.insert(t, {
				icon = profile,
				text = var22.viewProfileText,
				onActivated = var25
			})
		end
		if var44 then
			table.insert(t, {
				icon = feedback,
				text = var22.reportUserText,
				onActivated = function()
					-- upvalues: var17 (copy), var14 (copy), var29 (copy), var30 (copy), t_1 (copy)
					var14.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var17),
						abuserUserId = var14.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var29,
						voiceSessionId = var30,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			})
		end
		if var24 then
			table.insert(t, {
				icon = leave,
				text = var22.removeFromGroupText,
				onActivated = var26
			})
		end
		return t
	end, {
		var14.isInExperience, var14.userId, var14.openSquadVoiceAbuseReport,
		var22.joinButtonText, var22.removeFromGroupText, var22.reportUserText,
		var22.viewProfileText, var22.voiceIneligibleText, var27, var17, var29, var30,
		t_1, var26, var36, var24, var37, var25
	})
	
	if #var38 > 0 then
		return react.createElement(focusNavigableSurfaceWrapper, {
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var14 (ref)
						var14.onDismiss()
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
				buttonModels = var38,
				onDismiss = function()
					-- upvalues: var14 (ref)
					var14.onDismiss()
				end
			})
		})
	end
	var14.onDismiss()
	
	return nil
end