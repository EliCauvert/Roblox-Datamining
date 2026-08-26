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
local var1 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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

return function(p1)
	-- upvalues: cryo (ref), t (ref), react (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useVoiceStatus (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), useIsParticipantMutedLocally (ref), useLocalization (ref), constantsModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadPromptType (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), useParticipants (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), useSelector (ref), var2 (ref), presenceType (ref), gameParams (ref), fFlagSquadLaunchExperienceMobileFix (ref), squadLocationEnum (ref), experienceService (ref), headphoneDeafenSmall (ref), play (ref), leave (ref), profile (ref), feedback (ref), microphoneMute (ref), microphone (ref), default (ref), getFFlagEnableCrossExpVoiceAbuseReport (ref), focusNavigableSurfaceWrapper (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigableSurfaceIdentifierEnum (ref), modalBottomSheet (ref)
	local var3 = cryo.Dictionary.union(t, p1)
	local var4 = react.useContext(squadExternalContractContext)
	local var5 = useDispatch()
	local var6 = useLocalUserId()
	local var7 = useStore()
	local var8 = useVoiceStatus()
	local var9 = if fFlagEnableSquadUserCardHoverFix then useSquadUserDropdownMenuButtonsModule(var3.userId, var3.isInExperience) else nil
	local var10 = useIsParticipantMutedLocally(tonumber(var3.userId) or -1)
	local var11 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		reportUserText = "Feature.Chat.Action.ReportUser",
		removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
		voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible",
		muteVoiceButtonText = "Feature.Chat.Action.MuteVoice",
		unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
	})
	local var12 = var4.useGetConversationFromId(var3.parentChannelId)
	local var13 = react.useMemo(function()
		-- upvalues: var12 (ref), constantsModule (copy), var6 (ref)
		return var12 and (var12.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var12.initiator == var6)
	end, { var12, var6 })
	local var14 = react.useCallback(function()
		-- upvalues: var4 (ref), eventNamesModule (copy), var3 (ref), squadPartySheetActionEnumModule (copy), var8 (ref)
		var4.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var3.parentChannelId,
			actionType = squadPartySheetActionEnumModule.ViewProfileButtonClicked,
			voiceStatus = var8
		})
		var3.openViewProfile()
	end, {
		var3.parentChannelId,
		var3.openViewProfile,
		var4.fireSquadAnalytics,
		var8
	})
	local var15 = react.useCallback(function()
		-- upvalues: var4 (ref), eventNamesModule (copy), var3 (ref), squadPartySheetActionEnumModule (copy), var8 (ref), var7 (ref), squadPromptType (copy), var5 (ref)
		var4.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var3.parentChannelId,
			actionType = squadPartySheetActionEnumModule.RemoveUserDropDownButtonClicked,
			voiceStatus = var8
		})
		var4.setSquadPrompt(var7, {
			promptType = squadPromptType.RemoveFromChat,
			onConfirm = function()
				-- upvalues: var3 (copy), var4 (copy), eventNamesModule (copy), squadPartySheetActionEnumModule (copy), var8 (copy), var5 (copy)
				if var3.userId == "" or var3.parentChannelId == "" then
					return nil
				end
				var4.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
					parentChannelId = var3.parentChannelId,
					actionType = squadPartySheetActionEnumModule.RemoveUserDialogButtonClicked,
					voiceStatus = var8
				})
				
				return var4.removeUserFromParentChannel(var5, var3.parentChannelId, var3.userId)
			end
		})
	end, {
		var5, var3.userId, var3.parentChannelId, var4.fireSquadAnalytics,
		var4.setSquadPrompt, var4.removeUserFromParentChannel, var8
	})
	local _ = nil
	local var16 = nil
	local _ = nil
	local t_1 = {}
	local var17 = nil
	local var18 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var19 = useBackgroundExperience()
		local var20 = useParticipants() or {}
		t_1 = react.useMemo(function()
			-- upvalues: var20 (write)
			local t = {}
			
			for i, v in pairs(var20) do
				table.insert(t, v.userId)
			end
			return t
		end, { var20 })
		var17 = react.useMemo(function()
			-- upvalues: var19 (write)
			return if var19 then var19.voiceChannelId else nil
		end, { var19 })
		var18 = react.useMemo(function()
			-- upvalues: var19 (write)
			return if var19 then var19.voiceSessionId else nil
		end, { var19 })
		
		if not fFlagEnableSquadUserCardHoverFix then
			local var21 = if var3.userId then tonumber(var3.userId) else nil
			
			if var21 then
				local var22 = useIsLocalPlayerPartyVoiceEligible()
				var16 = if useIsCurrentSquadPartyVoiceEligible() == true then var22 and not useIsUserPartyVoiceEligible(var21) else useIsCurrentSquadPartyVoiceEligible() == true
			end
		end
	end
	local var21 = if fFlagSquadsPresenceStoreMigration then var1(tostring(var3.userId)) else useSelector(react.useCallback(function(p2)
		-- upvalues: var3 (ref)
		return p2.Squad.Presence.byUserId[var3.userId]
	end, { var3.userId }))
	local var22 = react.useMemo(function()
		-- upvalues: fFlagEnableSquadUserCardHoverFix (copy), var9 (ref), var21 (ref), fFlagSquadsPresenceStoreMigration (copy), var2 (copy), presenceType (copy)
		if fFlagEnableSquadUserCardHoverFix then
			local placeId = false
			
			if table.find(var9, "JoinButton") ~= nil then
				placeId = var21
				
				if placeId then
					placeId = false
					
					if var21.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame) then
						if fFlagSquadsPresenceStoreMigration then
							return var21.placeId ~= ""
						end
						placeId = var21.placeId
					end
				end
			end
			return placeId
		else
			local var23 = var21
			
			if var23 then
				var23 = false
				
				if var21.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame) then
					if fFlagSquadsPresenceStoreMigration then
						return var21.placeId ~= ""
					end
					var23 = var21.placeId
				end
			end
			return var23
		end
	end, { var21, var9 })
	local var23 = react.useCallback(function()
		-- upvalues: var22 (ref), gameParams (copy), var3 (ref), fFlagSquadsPresenceStoreMigration (copy), var21 (ref), fFlagSquadLaunchExperienceMobileFix (copy), var4 (ref), squadLocationEnum (copy), experienceService (copy)
		if var22 then
			local var24 = gameParams.fromUserId(var3.userId, if fFlagSquadsPresenceStoreMigration then var21 and var21.placeId else var21.placeId)
			
			if var3.isInExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var25 = "SquadLobby"
			
			if var4.squadLocation == squadLocationEnum.UniversalApp then
				var25 = "SquadLobbyFromUA"
			elseif var4.squadLocation == squadLocationEnum.InExperience then
				var25 = "SquadLobbyFromInExp"
			end
			experienceService:LaunchExperience(var24, var25, nil)
		end
	end, {
		var22,
		var4.squadLocation,
		var3.isInExperience,
		var3.userId,
		var21
	})
	local var24 = if fFlagEnableSquadUserCardHoverFix then react.useMemo(function()
		-- upvalues: headphoneDeafenSmall (copy), var11 (ref), play (copy), var23 (ref), leave (copy), var15 (ref), profile (copy), var14 (ref), feedback (copy), var6 (ref), var3 (ref), var17 (write), var18 (write), t_1 (write), var10 (ref), microphoneMute (copy), microphone (copy), default (copy), var9 (ref)
		local t = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var11.voiceIneligibleText
			},
			JoinButton = {
				icon = play,
				text = var11.joinButtonText,
				onActivated = var23
			},
			RemoveUserButton = {
				icon = leave,
				text = var11.removeFromGroupText,
				onActivated = var15
			},
			ViewProfileButton = {
				icon = profile,
				text = var11.viewProfileText,
				onActivated = var14
			},
			ReportButton = {
				icon = feedback,
				text = var11.reportUserText,
				onActivated = function()
					-- upvalues: var6 (copy), var3 (copy), var17 (copy), var18 (copy), t_1 (copy)
					var3.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var6),
						abuserUserId = var3.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var17,
						voiceSessionId = var18,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			},
			MuteVoiceButton = {
				icon = if var10 then microphoneMute else microphone,
				text = if var10 then var11.unmuteVoiceButtonText else var11.muteVoiceButtonText,
				onActivated = function()
					-- upvalues: var3 (copy), var10 (copy), default (copy)
					local var25 = tonumber(var3.userId)
					
					if not var25 then
						warn("Invalid userId: " .. tostring(var3.userId))
						
						return
					elseif var10 then
						default:unmuteVoiceParticipant(var25)
						
						return
					end
					default:muteVoiceParticipant(var25)
				end
			}
		}
		local t_2 = {}
		
		for i, v in var9 do
			local var25 = t[v]
			
			if var25 then
				table.insert(t_2, var25)
			end
		end
		return t_2
	end, {
		var3.userId, var3.openSquadVoiceAbuseReport, var11.joinButtonText,
		var11.removeFromGroupText, var11.reportUserText, var11.viewProfileText,
		var11.voiceIneligibleText, var11.muteVoiceButtonText,
		var11.unmuteVoiceButtonText, var6, var17, var18, t_1, var15, var9, var23,
		var14, var10
	}) else react.useMemo(function()
		-- upvalues: var6 (ref), var3 (ref), getFFlagEnableCrossExpVoiceAbuseReport (copy), var17 (write), var16 (write), headphoneDeafenSmall (copy), var11 (ref), var22 (ref), play (copy), var23 (ref), profile (copy), var14 (ref), feedback (copy), var18 (write), t_1 (write), var13 (ref), leave (copy), var15 (ref)
		local var26 = not var3.isInExperience
		local var27 = getFFlagEnableCrossExpVoiceAbuseReport() and (not not var17 and not (tostring(var6) == var3.userId))
		local t = {}
		
		if var16 then
			table.insert(t, {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var11.voiceIneligibleText
			})
		end
		if var22 then
			table.insert(t, {
				icon = play,
				text = var11.joinButtonText,
				onActivated = var23
			})
		end
		if var26 then
			table.insert(t, {
				icon = profile,
				text = var11.viewProfileText,
				onActivated = var14
			})
		end
		if var27 then
			table.insert(t, {
				icon = feedback,
				text = var11.reportUserText,
				onActivated = function()
					-- upvalues: var6 (copy), var3 (copy), var17 (copy), var18 (copy), t_1 (copy)
					var3.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var6),
						abuserUserId = var3.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var17,
						voiceSessionId = var18,
						voiceUserIds = t_1,
						voiceUserCount = #t_1
					})
				end
			})
		end
		if var13 then
			table.insert(t, {
				icon = leave,
				text = var11.removeFromGroupText,
				onActivated = var15
			})
		end
		return t
	end, {
		var3.isInExperience, var3.userId, var3.openSquadVoiceAbuseReport,
		var11.joinButtonText, var11.removeFromGroupText, var11.reportUserText,
		var11.viewProfileText, var11.voiceIneligibleText, var16, var6, var17, var18,
		t_1, var15, var22, var13, var23, var14
	})
	
	if #var24 > 0 then
		return react.createElement(focusNavigableSurfaceWrapper, {
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var3 (ref)
						var3.onDismiss()
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
				buttonModels = var24,
				onDismiss = function()
					-- upvalues: var3 (ref)
					var3.onDismiss()
				end
			})
		})
	end
	var3.onDismiss()
	
	return nil
end