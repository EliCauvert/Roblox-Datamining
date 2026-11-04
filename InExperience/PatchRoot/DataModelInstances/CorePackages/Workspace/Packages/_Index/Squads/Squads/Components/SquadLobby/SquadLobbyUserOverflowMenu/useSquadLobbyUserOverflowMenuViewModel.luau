local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ReactModule = require(Parent.React)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DependenciesModule = require(Squads.dependencies)
local _ = require(Squads.Common.ModelTypes)
local SquadPartySheetActionEnumModule = require(Squads.Enums.SquadPartySheetActionEnum)
local UseSquadUserDropdownMenuButtonsModule = require(Squads.Hooks.useSquadUserDropdownMenuButtons)
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local _ = require(script.Parent.SquadLobbyUserOverflowMenuView)
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseStoreFunction = DependenciesModule.Hooks.useStore
local UseBackgroundExperienceFunction = CrossExperienceVoiceModule.Hooks.useBackgroundExperience
local UseParticipantsFunction = CrossExperienceVoiceModule.Hooks.useParticipants
local UseVoiceStatusFunction = CrossExperienceVoiceModule.Hooks.useVoiceStatus
local UseIsParticipantMutedLocallyFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantMutedLocally
local Default = CrossExperienceVoiceModule.CrossExperienceVoiceManager.default
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local list = {
	"MuteVoiceButton",
	"ReportButton",
	"RemoveUserButton",
	"VoiceIneligibleButton"
}

return function(p1)
	-- upvalues: ReactModule (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseStoreFunction (copy), UseLocalUserIdFunction (copy), UseVoiceStatusFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), UseSquadUserDropdownMenuButtonsModule (copy), UseIsParticipantMutedLocallyFunction (copy), UseLocalizationFunction (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseBackgroundExperienceFunction (copy), UseParticipantsFunction (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), SquadPromptType (copy), Default (copy), list (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy)
	local UserId = p1.userId
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction() or ""
	local UseSquadUserDropdownMenuButtonsModuleResult = UseSquadUserDropdownMenuButtonsModule(UserId, p1.isInExperience)
	local UseIsParticipantMutedLocallyResult = UseIsParticipantMutedLocallyFunction(tonumber(UserId) or -1)
	local UseLocalizationResult = UseLocalizationFunction({
		removeFromGroup = "Feature.Chat.Action.RemoveFromGroup",
		reportUser = "Feature.Chat.Action.ReportUser",
		muteVoice = "Feature.Chat.Action.MuteVoice",
		unmuteVoice = "Feature.Chat.Action.UnmuteVoice",
		voiceIneligible = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible"
	})
	local VoiceChannelId = nil
	local VoiceSessionId = nil
	local UseMemoResult = {}
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		local UseBackgroundExperienceResult = UseBackgroundExperienceFunction()
		local UseParticipantsResult = UseParticipantsFunction() or {}
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseParticipantsResult (copy)
			local List = {}
			
			for _, value in pairs(UseParticipantsResult) do
				table.insert(List, value.userId)
			end
			return List
		end, { UseParticipantsResult })
		VoiceChannelId = if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceChannelId else nil
		VoiceSessionId = if UseBackgroundExperienceResult then UseBackgroundExperienceResult.voiceSessionId else nil
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), UseStoreResult (copy), SquadPromptType (upval), UserId (copy), UseDispatchResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UseCurrentSquadParentChannelIdResult,
			actionType = SquadPartySheetActionEnumModule.RemoveUserDropDownButtonClicked,
			voiceStatus = UseVoiceStatusResult
		})
		UseContextResult.setSquadPrompt(UseStoreResult, {
			promptType = SquadPromptType.RemoveFromChat,
			onConfirm = function()
				-- upvalues: UserId (upval), UseCurrentSquadParentChannelIdResult (upval), UseContextResult (upval), EventNamesModule (upval), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (upval), UseDispatchResult (upval)
				if UserId == "" or UseCurrentSquadParentChannelIdResult == "" then
					return nil
				else
					UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
						parentChannelId = UseCurrentSquadParentChannelIdResult,
						actionType = SquadPartySheetActionEnumModule.RemoveUserDialogButtonClicked,
						voiceStatus = UseVoiceStatusResult
					})
					
					return UseContextResult.removeUserFromParentChannel(UseDispatchResult, UseCurrentSquadParentChannelIdResult, UserId)
				end
			end
		})
	end, {
		UseContextResult, UseStoreResult, UseDispatchResult,
		UseCurrentSquadParentChannelIdResult, UserId, UseVoiceStatusResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseLocalUserIdResult (copy), UserId (copy), VoiceChannelId (ref), VoiceSessionId (ref), UseMemoResult (ref)
		p1.openSquadVoiceAbuseReport({
			submitterUserId = tostring(UseLocalUserIdResult),
			abuserUserId = UserId,
			reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
			voiceChannelId = VoiceChannelId,
			voiceSessionId = VoiceSessionId,
			voiceUserIds = UseMemoResult,
			voiceUserCount = #UseMemoResult
		})
	end, {
		p1.openSquadVoiceAbuseReport, UseLocalUserIdResult, UserId, VoiceChannelId,
		VoiceSessionId, UseMemoResult
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UserId (copy), UseIsParticipantMutedLocallyResult (copy), Default (upval)
		local Number: number? = tonumber(UserId)
		
		if not Number then return end
		if UseIsParticipantMutedLocallyResult then
			Default:unmuteVoiceParticipant(Number)
			
			return
		else
			Default:muteVoiceParticipant(Number)
		end
	end, { UserId, UseIsParticipantMutedLocallyResult })
	
	return {
		isOpen = UseStateResult,
		items = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy), UseIsParticipantMutedLocallyResult (copy), UseLocalizationResult (copy), UseResult3 (copy), UseResult2 (copy), UseResult1 (copy), list (upval), UseSquadUserDropdownMenuButtonsModuleResult (copy)
			local function _(Callback)
				-- upvalues: UseResult (upval)
				return function()
					-- upvalues: UseResult (upval), Callback (copy)
					UseResult()
					Callback()
				end
			end
			
			local config = {
				MuteVoiceButton = {
					id = "MuteVoiceButton",
					text = if UseIsParticipantMutedLocallyResult then UseLocalizationResult.unmuteVoice else UseLocalizationResult.muteVoice,
					onActivated = function()
						-- upvalues: UseResult (upval), UseResult3 (copy)
						UseResult()
						UseResult3()
					end
				},
				ReportButton = {
					id = "ReportButton",
					text = UseLocalizationResult.reportUser,
					onActivated = function()
						-- upvalues: UseResult (upval), UseResult2 (copy)
						UseResult()
						UseResult2()
					end
				},
				RemoveUserButton = {
					id = "RemoveUserButton",
					text = UseLocalizationResult.removeFromGroup,
					onActivated = function()
						-- upvalues: UseResult (upval), UseResult1 (copy)
						UseResult()
						UseResult1()
					end
				},
				VoiceIneligibleButton = {
					id = "VoiceIneligibleButton",
					isDisabled = true,
					text = UseLocalizationResult.voiceIneligible
				}
			}
			local List = {}
			
			for _, value in list do
				if table.find(UseSquadUserDropdownMenuButtonsModuleResult, value) then
					table.insert(List, config[value])
				end
			end
			return List
		end, {
			UseSquadUserDropdownMenuButtonsModuleResult, UseLocalizationResult,
			UseIsParticipantMutedLocallyResult, UseResult, UseResult1, UseResult2,
			UseResult3
		}),
		onTriggerActivated = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {}),
		onClose = UseResult,
		menuRef = UseFocusRootFunction({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = UseStateResult,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: UseResult (upval)
							UseResult()
							p2:cancel()
						end)
					}
				}
			end, { UseResult })
		}),
		testId = `--social-squad-lobby-user-card-{UserId}--overflow`
	}
end