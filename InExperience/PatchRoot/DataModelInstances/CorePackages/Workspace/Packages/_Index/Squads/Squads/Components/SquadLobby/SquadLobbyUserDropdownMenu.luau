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
local FFlagSquadsPresenceStoreMigration = require(Parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local UseGetPresenceByUserId = if FFlagSquadsPresenceStoreMigration then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local PresenceType1 = if FFlagSquadsPresenceStoreMigration then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
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
	-- upvalues: Cryo (copy), config (copy), React (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseStoreFunction (copy), UseVoiceStatusFunction (copy), UseSquadUserDropdownMenuButtonsModule (copy), UseIsParticipantMutedLocallyFunction (copy), UseLocalizationFunction (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), SquadPromptType (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseBackgroundExperienceFunction (copy), UseParticipantsFunction (copy), FFlagSquadsPresenceStoreMigration (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), PresenceType1 (copy), PresenceType (copy), GameParams (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadLocationEnum (copy), ExperienceService (copy), IconsControlsHeadphoneDeafenSmall (copy), IconsCommonPlay (copy), IconsActionsLeave (copy), IconsMenuProfile (copy), IconsActionsFeedback (copy), IconsControlsMicrophoneMute (copy), IconsControlsMicrophone (copy), Default (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), ModalBottomSheet (copy)
	local UnionResult = Cryo.Dictionary.union(config, p1)
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseStoreResult = UseStoreFunction()
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseSquadUserDropdownMenuButtonsModuleResult = UseSquadUserDropdownMenuButtonsModule(UnionResult.userId, UnionResult.isInExperience)
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
	local UseParticipantsResult = nil
	local UseMemoResult = {}
	local UseMemoResult1 = nil
	local UseMemoResult2 = nil
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		UseBackgroundExperienceResult = UseBackgroundExperienceFunction()
		UseParticipantsResult = UseParticipantsFunction() or {}
		UseMemoResult = React.useMemo(function()
			-- upvalues: UseParticipantsResult (ref)
			local List = {}
			
			for _, value in pairs(UseParticipantsResult) do
				table.insert(List, value.userId)
			end
			return List
		end, { UseParticipantsResult })
		UseMemoResult1 = React.useMemo(function()
			-- upvalues: UseBackgroundExperienceResult (ref)
			return if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceChannelId else nil
		end, { UseBackgroundExperienceResult })
		UseMemoResult2 = React.useMemo(function()
			-- upvalues: UseBackgroundExperienceResult (ref)
			return if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceSessionId else nil
		end, { UseBackgroundExperienceResult })
	end
	local UseResult2 = React.useCallback(function(p2)
		-- upvalues: UnionResult (copy)
		return p2.Squad.Presence.byUserId[UnionResult.userId]
	end, { UnionResult.userId })
	local UseGetPresenceByUserIdResult = if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserId((tostring(UnionResult.userId))) else UseSelectorFunction(UseResult2)
	local UseMemoResult3 = React.useMemo(function()
		-- upvalues: UseSquadUserDropdownMenuButtonsModuleResult (copy), UseGetPresenceByUserIdResult (copy), FFlagSquadsPresenceStoreMigration (upval), PresenceType1 (upval), PresenceType (upval)
		local PlaceId = false
		
		if table.find(UseSquadUserDropdownMenuButtonsModuleResult, "JoinButton") ~= nil then
			PlaceId = UseGetPresenceByUserIdResult
			
			if PlaceId then
				PlaceId = false
				
				if UseGetPresenceByUserIdResult.userPresenceType == (if FFlagSquadsPresenceStoreMigration then PresenceType1.InGame else PresenceType.InGame) then
					if FFlagSquadsPresenceStoreMigration then
						return UseGetPresenceByUserIdResult.placeId ~= ""
					end
					PlaceId = UseGetPresenceByUserIdResult.placeId
				end
			end
		end
		return PlaceId
	end, {
		UseGetPresenceByUserIdResult,
		UseSquadUserDropdownMenuButtonsModuleResult
	})
	local UseResult3 = React.useCallback(function()
		-- upvalues: UseMemoResult3 (copy), GameParams (upval), UnionResult (copy), FFlagSquadsPresenceStoreMigration (upval), UseGetPresenceByUserIdResult (copy), FFlagSquadLaunchExperienceMobileFix (upval), UseContextResult (copy), SquadLocationEnum (upval), ExperienceService (upval)
		if UseMemoResult3 then
			local FromUserIdResult = GameParams.fromUserId(UnionResult.userId, if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.placeId else UseGetPresenceByUserIdResult.placeId)
			
			if UnionResult.isInExperience and FFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			ExperienceService:LaunchExperience(FromUserIdResult, if UseContextResult.squadLocation == SquadLocationEnum.UniversalApp then "SquadLobbyFromUA" elseif UseContextResult.squadLocation == SquadLocationEnum.InExperience then "SquadLobbyFromInExp" else "SquadLobby", nil)
		end
	end, {
		UseMemoResult3,
		UseContextResult.squadLocation,
		UnionResult.isInExperience,
		UnionResult.userId,
		UseGetPresenceByUserIdResult
	})
	local UseMemoResult4 = React.useMemo(function()
		-- upvalues: IconsControlsHeadphoneDeafenSmall (upval), UseLocalizationResult (copy), IconsCommonPlay (upval), UseResult3 (copy), IconsActionsLeave (upval), UseResult1 (copy), IconsMenuProfile (upval), UseResult (copy), IconsActionsFeedback (upval), UseLocalUserIdResult (copy), UnionResult (copy), UseMemoResult1 (ref), UseMemoResult2 (ref), UseMemoResult (ref), UseIsParticipantMutedLocallyResult (copy), IconsControlsMicrophoneMute (upval), IconsControlsMicrophone (upval), Default (upval), UseSquadUserDropdownMenuButtonsModuleResult (copy)
		local config = {
			VoiceIneligibleButton = {
				stayOnActivated = true,
				icon = IconsControlsHeadphoneDeafenSmall,
				text = UseLocalizationResult.voiceIneligibleText
			},
			JoinButton = {
				icon = IconsCommonPlay,
				text = UseLocalizationResult.joinButtonText,
				onActivated = UseResult3
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
					-- upvalues: UseLocalUserIdResult (upval), UnionResult (upval), UseMemoResult1 (upval), UseMemoResult2 (upval), UseMemoResult (upval)
					UnionResult.openSquadVoiceAbuseReport({
						submitterUserId = tostring(UseLocalUserIdResult),
						abuserUserId = UnionResult.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = UseMemoResult1,
						voiceSessionId = UseMemoResult2,
						voiceUserIds = UseMemoResult,
						voiceUserCount = #UseMemoResult
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
		UseMemoResult1, UseMemoResult2, UseMemoResult, UseResult1,
		UseSquadUserDropdownMenuButtonsModuleResult, UseResult3, UseResult,
		UseIsParticipantMutedLocallyResult
	})
	
	if #UseMemoResult4 > 0 then
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
				buttonModels = UseMemoResult4,
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