local Squads = script:FindFirstAncestor("Squads")
local DependenciesModule = require(Squads.dependencies)
local Parent = Squads.Parent
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local ExperienceServiceModule = require(Parent.ExperienceService)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SquadPartySheetActionEnumModule = require(Squads.Enums.SquadPartySheetActionEnum)
local _ = require(Squads.Common.ModelTypes)
local Cryo = DependenciesModule.Cryo
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local React = DependenciesModule.React
local SharedFlags = DependenciesModule.SharedFlags
local Images = UIBloxModule.App.ImageSet.Images
local ModalBottomSheet = UIBloxModule.ModalBottomSheet
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseStoreFunction = DependenciesModule.Hooks.useStore
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseBackgroundExperienceFunction = CrossExperienceVoiceModule.Hooks.useBackgroundExperience
local UseParticipantsFunction = CrossExperienceVoiceModule.Hooks.useParticipants
local UseVoiceStatusFunction = CrossExperienceVoiceModule.Hooks.useVoiceStatus
local UseSquadUserDropdownMenuButtonsModule = require(Squads.Hooks.useSquadUserDropdownMenuButtons)
local GameParams = ExperienceServiceModule.GameParams
local ExperienceService = ExperienceServiceModule.ExperienceService
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadLocationEnum = require(Parent.SquadsCore.Enums).SquadLocationEnum
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local ConstantsModule = require(Parent.SquadsCore.Constants)
local UseIsLocalPlayerPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local UseIsUserPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsUserPartyVoiceEligible
local UseIsCurrentSquadPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsCurrentSquadPartyVoiceEligible
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagEnableCrossExpVoiceAbuseReportFunction = SharedFlags.getFFlagEnableCrossExpVoiceAbuseReport
local FFlagEnableSquadUserCardHoverFix = SharedFlags.FFlagEnableSquadUserCardHoverFix
local FFlagSquadLaunchExperienceMobileFix = SharedFlags.FFlagSquadLaunchExperienceMobileFix
local UseIsParticipantMutedLocallyFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantMutedLocally
local Default = CrossExperienceVoiceModule.CrossExperienceVoiceManager.default
local IconsCommonPlay = Images["icons/common/play"]
local IconsMenuProfile = Images["icons/menu/profile"]
local IconsActionsFeedback = Images["icons/actions/feedback"]
local IconsActionsLeave = Images["icons/actions/leave"]
local IconsControlsHeadphoneDeafenSmall = Images["icons/controls/headphoneDeafen_small"]
local IconsControlsMicrophoneMute = Images["icons/controls/microphoneMute"]
local IconsControlsMicrophone = Images["icons/controls/microphone"]
local config = {
	isInExperience = false,
	parentChannelId = "",
	userId = "",
	onDismiss = function() end,
	openViewProfile = function() end,
	openVoiceAbuseReport = function() end
}

return function(p1)
	-- upvalues: Cryo (copy), config (copy), React (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseStoreFunction (copy), UseVoiceStatusFunction (copy), FFlagEnableSquadUserCardHoverFix (copy), UseSquadUserDropdownMenuButtonsModule (copy), UseIsParticipantMutedLocallyFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), SquadPromptType (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseBackgroundExperienceFunction (copy), UseParticipantsFunction (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseIsUserPartyVoiceEligibleFunction (copy), UseIsCurrentSquadPartyVoiceEligibleFunction (copy), UseSelectorFunction (copy), PresenceType (copy), GameParams (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadLocationEnum (copy), ExperienceService (copy), IconsControlsHeadphoneDeafenSmall (copy), IconsCommonPlay (copy), IconsActionsLeave (copy), IconsMenuProfile (copy), IconsActionsFeedback (copy), IconsControlsMicrophoneMute (copy), IconsControlsMicrophone (copy), Default (copy), GetFFlagEnableCrossExpVoiceAbuseReportFunction (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), ModalBottomSheet (copy)
	local UnionResult = Cryo.Dictionary.union(config, p1)
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseStoreResult = UseStoreFunction()
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseSquadUserDropdownMenuButtonsModuleResult = if FFlagEnableSquadUserCardHoverFix then UseSquadUserDropdownMenuButtonsModule(UnionResult.userId, UnionResult.isInExperience) else nil
	local UseIsParticipantMutedLocallyResult = UseIsParticipantMutedLocallyFunction(tonumber(UnionResult.userId) or -1)
	local UseLocalizationResult = UseLocalizationFunction({
		joinButtonText = "Common.VisitGame.Label.Play",
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		reportUserText = "Feature.Chat.Action.ReportUser",
		removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
		voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible",
		muteVoiceButtonText = "Feature.Chat.Action.MuteVoice",
		unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
	})
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(UnionResult.parentChannelId)
	local UseMemoResult = React.useMemo(function(): boolean
		-- upvalues: UseGetConversationFromIdResult (copy), ConstantsModule (upval), UseLocalUserIdResult (copy)
		return UseGetConversationFromIdResult and (UseGetConversationFromIdResult.type == ConstantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and UseGetConversationFromIdResult.initiator == UseLocalUserIdResult)
	end, { UseGetConversationFromIdResult, UseLocalUserIdResult })
	local UseResult = React.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UnionResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UnionResult.parentChannelId,
			actionType = SquadPartySheetActionEnumModule.ViewProfileButtonClicked,
			voiceStatus = UseVoiceStatusResult
		})
		UnionResult.openViewProfile()
	end, {
		UnionResult.parentChannelId,
		UnionResult.openViewProfile,
		UseContextResult.fireSquadAnalytics,
		UseVoiceStatusResult
	})
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UnionResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), UseStoreResult (copy), SquadPromptType (upval), UseDispatchResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UnionResult.parentChannelId,
			actionType = SquadPartySheetActionEnumModule.RemoveUserDropDownButtonClicked,
			voiceStatus = UseVoiceStatusResult
		})
		UseContextResult.setSquadPrompt(UseStoreResult, {
			promptType = SquadPromptType.RemoveFromChat,
			onConfirm = function()
				-- upvalues: UnionResult (upval), UseContextResult (upval), EventNamesModule (upval), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (upval), UseDispatchResult (upval)
				if UnionResult.userId == "" or UnionResult.parentChannelId == "" then
					return nil
				else
					UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
						parentChannelId = UnionResult.parentChannelId,
						actionType = SquadPartySheetActionEnumModule.RemoveUserDialogButtonClicked,
						voiceStatus = UseVoiceStatusResult
					})
					
					return UseContextResult.removeUserFromParentChannel(UseDispatchResult, UnionResult.parentChannelId, UnionResult.userId)
				end
			end
		})
	end, {
		UseDispatchResult, UnionResult.userId, UnionResult.parentChannelId,
		UseContextResult.fireSquadAnalytics, UseContextResult.setSquadPrompt,
		UseContextResult.removeUserFromParentChannel, UseVoiceStatusResult
	})
	local UseBackgroundExperienceResult = nil
	local v1: boolean? = nil
	local UseParticipantsResult = nil
	local VoiceUserIds = {}
	local VoiceChannelId = nil
	local VoiceSessionId = nil
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		UseBackgroundExperienceResult = UseBackgroundExperienceFunction()
		UseParticipantsResult = UseParticipantsFunction() or {}
		VoiceUserIds = React.useMemo(function()
			-- upvalues: UseParticipantsResult (ref)
			local List = {}
			
			for _, value in pairs(UseParticipantsResult) do
				table.insert(List, value.userId)
			end
			return List
		end, { UseParticipantsResult })
		VoiceChannelId = React.useMemo(function()
			-- upvalues: UseBackgroundExperienceResult (ref)
			return if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceChannelId else nil
		end, { UseBackgroundExperienceResult })
		VoiceSessionId = React.useMemo(function()
			-- upvalues: UseBackgroundExperienceResult (ref)
			return if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceSessionId else nil
		end, { UseBackgroundExperienceResult })
		
		if not FFlagEnableSquadUserCardHoverFix then
			local Number = if UnionResult.userId then tonumber(UnionResult.userId) else nil
			
			if Number then
				local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
				local UseIsUserPartyVoiceEligibleResult = UseIsUserPartyVoiceEligibleFunction(Number)
				v1 = UseIsCurrentSquadPartyVoiceEligibleFunction() == true and (UseIsLocalPlayerPartyVoiceEligibleResult and not UseIsUserPartyVoiceEligibleResult)
			end
		end
	end
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		-- upvalues: UnionResult (copy)
		return p2.Squad.Presence.byUserId[UnionResult.userId]
	end, { UnionResult.userId })))
	local UseMemoResult1 = React.useMemo(function()
		-- upvalues: FFlagEnableSquadUserCardHoverFix (upval), UseSquadUserDropdownMenuButtonsModuleResult (copy), UseSelectorResult (copy), PresenceType (upval)
		return if FFlagEnableSquadUserCardHoverFix then table.find(UseSquadUserDropdownMenuButtonsModuleResult, "JoinButton") ~= nil and (UseSelectorResult and (UseSelectorResult.userPresenceType == PresenceType.InGame and UseSelectorResult.placeId)) else UseSelectorResult and (UseSelectorResult.userPresenceType == PresenceType.InGame and UseSelectorResult.placeId)
	end, {
		UseSelectorResult,
		UseSquadUserDropdownMenuButtonsModuleResult
	})
	local UseResult2 = React.useCallback(function()
		-- upvalues: UseMemoResult1 (copy), GameParams (upval), UnionResult (copy), UseSelectorResult (copy), FFlagSquadLaunchExperienceMobileFix (upval), UseContextResult (copy), SquadLocationEnum (upval), ExperienceService (upval)
		if UseMemoResult1 then
			local FromUserIdResult = GameParams.fromUserId(UnionResult.userId, UseSelectorResult.placeId)
			
			if UnionResult.isInExperience and FFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			ExperienceService:LaunchExperience(FromUserIdResult, if UseContextResult.squadLocation == SquadLocationEnum.UniversalApp then "SquadLobbyFromUA" elseif UseContextResult.squadLocation == SquadLocationEnum.InExperience then "SquadLobbyFromInExp" else "SquadLobby", nil)
		end
	end, {
		UseMemoResult1,
		UseContextResult.squadLocation,
		UnionResult.isInExperience,
		UnionResult.userId,
		UseSelectorResult
	})
	local UseMemoResult2 = if FFlagEnableSquadUserCardHoverFix then React.useMemo(function()
		-- upvalues: IconsControlsHeadphoneDeafenSmall (upval), UseLocalizationResult (copy), IconsCommonPlay (upval), UseResult2 (copy), IconsActionsLeave (upval), UseResult1 (copy), IconsMenuProfile (upval), UseResult (copy), IconsActionsFeedback (upval), UseLocalUserIdResult (copy), UnionResult (copy), VoiceChannelId (ref), VoiceSessionId (ref), VoiceUserIds (ref), UseIsParticipantMutedLocallyResult (copy), IconsControlsMicrophoneMute (upval), IconsControlsMicrophone (upval), Default (upval), UseSquadUserDropdownMenuButtonsModuleResult (copy)
		local config = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = IconsControlsHeadphoneDeafenSmall,
				text = UseLocalizationResult.voiceIneligibleText
			},
			JoinButton = {
				icon = IconsCommonPlay,
				text = UseLocalizationResult.joinButtonText,
				onActivated = UseResult2
			},
			RemoveUserButton = {
				icon = IconsActionsLeave,
				text = UseLocalizationResult.removeFromGroupText,
				onActivated = UseResult1
			},
			ViewProfileButton = {
				icon = IconsMenuProfile,
				text = UseLocalizationResult.viewProfileText,
				onActivated = UseResult
			},
			ReportButton = {
				icon = IconsActionsFeedback,
				text = UseLocalizationResult.reportUserText,
				onActivated = function()
					-- upvalues: UseLocalUserIdResult (upval), UnionResult (upval), VoiceChannelId (upval), VoiceSessionId (upval), VoiceUserIds (upval)
					UnionResult.openSquadVoiceAbuseReport({
						submitterUserId = tostring(UseLocalUserIdResult),
						abuserUserId = UnionResult.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = VoiceChannelId,
						voiceSessionId = VoiceSessionId,
						voiceUserIds = VoiceUserIds,
						voiceUserCount = #VoiceUserIds
					})
				end
			},
			MuteVoiceButton = {
				icon = if UseIsParticipantMutedLocallyResult then IconsControlsMicrophoneMute else IconsControlsMicrophone,
				text = if UseIsParticipantMutedLocallyResult then UseLocalizationResult.unmuteVoiceButtonText else UseLocalizationResult.muteVoiceButtonText,
				onActivated = function()
					-- upvalues: UnionResult (upval), UseIsParticipantMutedLocallyResult (upval), Default (upval)
					local Number: number? = tonumber(UnionResult.userId)
					
					if not Number then
						warn("Invalid userId: " .. tostring(UnionResult.userId))
						
						return
					end
					if UseIsParticipantMutedLocallyResult then
						Default:unmuteVoiceParticipant(Number)
						
						return
					else
						Default:muteVoiceParticipant(Number)
					end
				end
			}
		}
		local List = {}
		
		for _, value in UseSquadUserDropdownMenuButtonsModuleResult do
			local Entry = config[value]
			
			if Entry then
				table.insert(List, Entry)
			end
		end
		return List
	end, {
		UnionResult.userId, UnionResult.openSquadVoiceAbuseReport,
		UseLocalizationResult.joinButtonText,
		UseLocalizationResult.removeFromGroupText,
		UseLocalizationResult.reportUserText, UseLocalizationResult.viewProfileText,
		UseLocalizationResult.voiceIneligibleText,
		UseLocalizationResult.muteVoiceButtonText,
		UseLocalizationResult.unmuteVoiceButtonText, UseLocalUserIdResult,
		VoiceChannelId, VoiceSessionId, VoiceUserIds, UseResult1,
		UseSquadUserDropdownMenuButtonsModuleResult, UseResult2, UseResult,
		UseIsParticipantMutedLocallyResult
	}) else React.useMemo(function()
		-- upvalues: UseLocalUserIdResult (copy), UnionResult (copy), GetFFlagEnableCrossExpVoiceAbuseReportFunction (upval), VoiceChannelId (ref), v1 (ref), IconsControlsHeadphoneDeafenSmall (upval), UseLocalizationResult (copy), UseMemoResult1 (copy), IconsCommonPlay (upval), UseResult2 (copy), IconsMenuProfile (upval), UseResult (copy), IconsActionsFeedback (upval), VoiceSessionId (ref), VoiceUserIds (ref), UseMemoResult (copy), IconsActionsLeave (upval), UseResult1 (copy)
		local IsTextMatch = tostring(UseLocalUserIdResult) == UnionResult.userId
		local NoIsInExperience = not UnionResult.isInExperience
		local NoIsTextMatch: boolean = GetFFlagEnableCrossExpVoiceAbuseReportFunction() and (not not VoiceChannelId and not IsTextMatch)
		local List = {}
		
		if v1 then
			table.insert(List, {
				stayOnActivated = true,
				icon = IconsControlsHeadphoneDeafenSmall,
				text = UseLocalizationResult.voiceIneligibleText
			})
		end
		if UseMemoResult1 then
			table.insert(List, {
				icon = IconsCommonPlay,
				text = UseLocalizationResult.joinButtonText,
				onActivated = UseResult2
			})
		end
		if NoIsInExperience then
			table.insert(List, {
				icon = IconsMenuProfile,
				text = UseLocalizationResult.viewProfileText,
				onActivated = UseResult
			})
		end
		if NoIsTextMatch then
			table.insert(List, {
				icon = IconsActionsFeedback,
				text = UseLocalizationResult.reportUserText,
				onActivated = function()
					-- upvalues: UseLocalUserIdResult (upval), UnionResult (upval), VoiceChannelId (upval), VoiceSessionId (upval), VoiceUserIds (upval)
					UnionResult.openSquadVoiceAbuseReport({
						submitterUserId = tostring(UseLocalUserIdResult),
						abuserUserId = UnionResult.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = VoiceChannelId,
						voiceSessionId = VoiceSessionId,
						voiceUserIds = VoiceUserIds,
						voiceUserCount = #VoiceUserIds
					})
				end
			})
		end
		if UseMemoResult then
			table.insert(List, {
				icon = IconsActionsLeave,
				text = UseLocalizationResult.removeFromGroupText,
				onActivated = UseResult1
			})
		end
		return List
	end, {
		UnionResult.isInExperience, UnionResult.userId,
		UnionResult.openSquadVoiceAbuseReport, UseLocalizationResult.joinButtonText,
		UseLocalizationResult.removeFromGroupText,
		UseLocalizationResult.reportUserText, UseLocalizationResult.viewProfileText,
		UseLocalizationResult.voiceIneligibleText, v1, UseLocalUserIdResult,
		VoiceChannelId, VoiceSessionId, VoiceUserIds, UseResult1, UseMemoResult1,
		UseMemoResult, UseResult2, UseResult
	})
	
	if #UseMemoResult2 > 0 then
		return React.createElement(FocusNavigableSurfaceWrapper, {
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			customEventHandlers = {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UnionResult (copy)
						UnionResult.onDismiss()
						p2:cancel()
					end)
				}
			},
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}, {
			React.createElement(ModalBottomSheet, {
				bottomGap = 20,
				screenWidth = 400,
				showImages = true,
				buttonModels = UseMemoResult2,
				onDismiss = function()
					-- upvalues: UnionResult (copy)
					UnionResult.onDismiss()
				end
			})
		})
	else
		UnionResult.onDismiss()
		
		return nil
	end
end