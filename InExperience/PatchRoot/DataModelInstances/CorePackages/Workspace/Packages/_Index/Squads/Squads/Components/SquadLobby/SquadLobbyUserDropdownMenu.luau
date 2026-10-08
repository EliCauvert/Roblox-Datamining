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
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
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
	-- upvalues: cryo (ref), t (ref), react (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useVoiceStatus (ref), useSquadUserDropdownMenuButtonsModule (ref), useIsParticipantMutedLocally (ref), useLocalization (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadPromptType (ref), getFFlagEnableCrossExpVoice (ref), useBackgroundExperience (ref), useParticipants (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), useSelector (ref), var2 (ref), presenceType (ref), gameParams (ref), fFlagSquadLaunchExperienceMobileFix (ref), squadLocationEnum (ref), experienceService (ref), headphoneDeafenSmall (ref), play (ref), leave (ref), profile (ref), feedback (ref), microphoneMute (ref), microphone (ref), default (ref), focusNavigableSurfaceWrapper (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigableSurfaceIdentifierEnum (ref), modalBottomSheet (ref)
	local var3 = cryo.Dictionary.union(t, p1)
	local var4 = react.useContext(squadExternalContractContext)
	local var5 = useDispatch()
	local var6 = useLocalUserId()
	local var7 = useStore()
	local var8 = useVoiceStatus()
	local var9 = useSquadUserDropdownMenuButtonsModule(var3.userId, var3.isInExperience)
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
	local var12 = react.useCallback(function()
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
	local var13 = react.useCallback(function()
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
	local _ = nil
	local t_1 = {}
	local var14 = nil
	local var15 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var16 = useBackgroundExperience()
		local var17 = useParticipants() or {}
		t_1 = react.useMemo(function()
			-- upvalues: var17 (write)
			local t = {}
			
			for i, v in pairs(var17) do
				table.insert(t, v.userId)
			end
			return t
		end, { var17 })
		var14 = react.useMemo(function()
			-- upvalues: var16 (write)
			return if var16 then var16.voiceChannelId else nil
		end, { var16 })
		var15 = react.useMemo(function()
			-- upvalues: var16 (write)
			return if var16 then var16.voiceSessionId else nil
		end, { var16 })
	end
	local var18 = if fFlagSquadsPresenceStoreMigration then var1(tostring(var3.userId)) else useSelector(react.useCallback(function(p2)
		-- upvalues: var3 (ref)
		return p2.Squad.Presence.byUserId[var3.userId]
	end, { var3.userId }))
	local var19 = react.useMemo(function()
		-- upvalues: var9 (ref), var18 (ref), fFlagSquadsPresenceStoreMigration (copy), var2 (copy), presenceType (copy)
		local placeId = false
		
		if table.find(var9, "JoinButton") ~= nil then
			placeId = var18
			
			if placeId then
				placeId = false
				
				if var18.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame) then
					if fFlagSquadsPresenceStoreMigration then
						return var18.placeId ~= ""
					end
					placeId = var18.placeId
				end
			end
		end
		return placeId
	end, { var18, var9 })
	local var20 = react.useCallback(function()
		-- upvalues: var19 (ref), gameParams (copy), var3 (ref), fFlagSquadsPresenceStoreMigration (copy), var18 (ref), fFlagSquadLaunchExperienceMobileFix (copy), var4 (ref), squadLocationEnum (copy), experienceService (copy)
		if var19 then
			local var21 = gameParams.fromUserId(var3.userId, if fFlagSquadsPresenceStoreMigration then var18 and var18.placeId else var18.placeId)
			
			if var3.isInExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var22 = "SquadLobby"
			
			if var4.squadLocation == squadLocationEnum.UniversalApp then
				var22 = "SquadLobbyFromUA"
			elseif var4.squadLocation == squadLocationEnum.InExperience then
				var22 = "SquadLobbyFromInExp"
			end
			experienceService:LaunchExperience(var21, var22, nil)
		end
	end, {
		var19,
		var4.squadLocation,
		var3.isInExperience,
		var3.userId,
		var18
	})
	local var21 = react.useMemo(function()
		-- upvalues: headphoneDeafenSmall (copy), var11 (ref), play (copy), var20 (ref), leave (copy), var13 (ref), profile (copy), var12 (ref), feedback (copy), var6 (ref), var3 (ref), var14 (write), var15 (write), t_1 (write), var10 (ref), microphoneMute (copy), microphone (copy), default (copy), var9 (ref)
		local t = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = headphoneDeafenSmall,
				text = var11.voiceIneligibleText
			},
			JoinButton = {
				icon = play,
				text = var11.joinButtonText,
				onActivated = var20
			},
			RemoveUserButton = {
				icon = leave,
				text = var11.removeFromGroupText,
				onActivated = var13
			},
			ViewProfileButton = {
				icon = profile,
				text = var11.viewProfileText,
				onActivated = var12
			},
			ReportButton = {
				icon = feedback,
				text = var11.reportUserText,
				onActivated = function()
					-- upvalues: var6 (copy), var3 (copy), var14 (copy), var15 (copy), t_1 (copy)
					var3.openSquadVoiceAbuseReport({
						submitterUserId = tostring(var6),
						abuserUserId = var3.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = var14,
						voiceSessionId = var15,
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
					local var22 = tonumber(var3.userId)
					
					if not var22 then
						warn("Invalid userId: " .. tostring(var3.userId))
						
						return
					elseif var10 then
						default:unmuteVoiceParticipant(var22)
						
						return
					end
					default:muteVoiceParticipant(var22)
				end
			}
		}
		local t_2 = {}
		
		for i, v in var9 do
			local var22 = t[v]
			
			if var22 then
				table.insert(t_2, var22)
			end
		end
		return t_2
	end, {
		var3.userId, var3.openSquadVoiceAbuseReport, var11.joinButtonText,
		var11.removeFromGroupText, var11.reportUserText, var11.viewProfileText,
		var11.voiceIneligibleText, var11.muteVoiceButtonText,
		var11.unmuteVoiceButtonText, var6, var14, var15, t_1, var13, var9, var20,
		var12, var10
	})
	
	if #var21 > 0 then
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
				buttonModels = var21,
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