local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ChatPermissionsContextModule = require(BuildExperience.Chat.ChatPermissionsContext)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local FeedbackActionModule = require(BuildExperience.Components.MessageUtilities.FeedbackAction)
local UserFeedbackModule = require(BuildExperience.Components.MessageUtilities.UserFeedback)
local FeedbackIconsModule = require(BuildExperience.Components.MessageUtilities.feedbackIcons)
local SendAgentTurnFeedbackModule = require(BuildExperience.Components.MessageUtilities.sendAgentTurnFeedback)
local AgentRollbackSnackbarModule = require(BuildExperience.Components.VersionHistory.AgentRollbackSnackbar)
local RestoreVersionDialogModule = require(BuildExperience.Components.VersionHistory.RestoreVersionDialog)
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local IconName = require(Parent.Foundation).Enums.IconName
local FFlagEnableTeamTestLua = require(Parent.SharedFlags).FFlagEnableTeamTestLua
local Signal = require(Parent.Signals).createSignal(false)

local function useAgentMessageCopy(Text)
	-- upvalues: ReactModule (copy), Default (copy), IconName (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Text (copy), Default (upval), UseStateResult2 (copy), UseRefResult (copy)
		if Text ~= nil and Text ~= "" then
			Default:setClipboardText({ context = "Build-AgentMessage", text = Text })
		end
		UseStateResult2(true)
		
		if UseRefResult.current ~= nil then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(2, function()
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			UseRefResult.current = nil
			UseStateResult2(false)
		end)
	end, { Text })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current ~= nil then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	
	return if UseStateResult then IconName.CheckLarge else IconName.TwoStackedSquares, UseResult
end

return function(Frame)
	-- upvalues: FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), ChatPermissionsContextModule (copy), FeedbackIconsModule (copy), LocalizationModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagEnableTeamTestLua (copy), useAgentMessageCopy (copy), GetPlaytestLoadingStoreModule (copy), SignalsReactModule (copy), GetAgentRollbackRequestStoreModule (copy), Signal (copy), FeedbackActionModule (copy), SendAgentTurnFeedbackModule (copy), UserFeedbackModule (copy), AgentRollbackSnackbarModule (copy), RestoreVersionDialogModule (copy)
	local NoCanEditOnBuild = false
	
	if FFlagBuildCheckGamePermissionsModule then
		local UseContextResult = ReactModule.useContext(ChatPermissionsContextModule)
		NoCanEditOnBuild = UseContextResult ~= nil and not UseContextResult.canEditOnBuild
	end
	local TurnFeedbackIds = Frame.turnFeedbackIds
	local PlaceId = if TurnFeedbackIds == nil then nil else TurnFeedbackIds.placeId
	local RollbackTargetVersionNumber = if TurnFeedbackIds == nil then nil else FeedbackIconsModule.getRollbackTargetVersionNumber(TurnFeedbackIds)
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local UseLocalizationResult = UseLocalizationFunction({
		revertConfirmationTitle = LocalizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE,
		revertConfirmationDescription = LocalizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
		revertFailure = LocalizationStringsModule.CHAT_REVERT_FAILURE
	})
	local RevertFailure = nil
	RevertFailure = UseLocalizationResult.revertFailure
	local RevertConfirmationTitle = UseLocalizationResult.revertConfirmationTitle
	local RevertConfirmationDescription = UseLocalizationResult.revertConfirmationDescription
	
	if RollbackTargetVersionNumber ~= nil then
		local FormatResult = UseContextResult:Format(if RollbackTargetVersionNumber < 10 then LocalizationStringsModule.VERSION_HISTORY_VERSION_PADDED else LocalizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = RollbackTargetVersionNumber })
		
		if FFlagEnableTeamTestLua then
			RevertConfirmationDescription = UseContextResult:Format(LocalizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = FormatResult })
		else
			RevertConfirmationTitle = FormatResult
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseAgentMessageCopyResult2 = nil
	local UseAgentMessageCopyResult
	UseAgentMessageCopyResult, UseAgentMessageCopyResult2 = useAgentMessageCopy(Frame.messageText)
	local UseResult = ReactModule.useCallback(function(p1): boolean
		-- upvalues: GetPlaytestLoadingStoreModule (upval), PlaceId (copy)
		local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule(p1)
		
		return PlaceId ~= nil and PlaytestLoadingStoreModule.getAgentStatusForPlaceId(PlaceId)(p1) == "Loading"
	end, { PlaceId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseResult)
	local Signal1 = if PlaceId == nil then Signal else GetAgentRollbackRequestStoreModule(false).getIsPendingForPlaceId(PlaceId)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Signal1)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3("")
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: TurnFeedbackIds (copy), FeedbackActionModule (upval), UseStateResult2 (copy), UseAgentMessageCopyResult2 (ref), SendAgentTurnFeedbackModule (upval), UseStateResult2_2 (copy)
		if TurnFeedbackIds == nil then return end
		if p1.action == FeedbackActionModule.REVERT then
			UseStateResult2(true)
			
			return
		end
		if p1.action == FeedbackActionModule.COPY then
			UseAgentMessageCopyResult2()
			SendAgentTurnFeedbackModule(p1.action, TurnFeedbackIds)
			
			return
		else
			UseStateResult2_2(p1.action)
			SendAgentTurnFeedbackModule(p1.action, TurnFeedbackIds)
		end
	end, { TurnFeedbackIds, UseAgentMessageCopyResult2 })
	
	return if TurnFeedbackIds == nil or TurnFeedbackIds.sequenceId == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		Feedback = ReactModule.createElement(UserFeedbackModule, {
			layoutOrder = Frame.LayoutOrder,
			icons = FeedbackIconsModule.getFeedbackIcons({
				includeCopy = Frame.messageText ~= nil and Frame.messageText ~= "",
				copyIconName = UseAgentMessageCopyResult,
				copyTestId = `{Frame.testId}-copy`,
				includeRevert = FeedbackIconsModule.canRevert(TurnFeedbackIds),
				isRevertDisabled = UseSignalStateResult or (UseSignalStateResult1 or NoCanEditOnBuild),
				isRatingDisabled = NoCanEditOnBuild
			}),
			onActivated = UseResult2,
			selectedAction = UseStateResult3,
			testId = Frame.testId
		}),
		RevertSnackbar = if UseStateResult4 == "" then nil else ReactModule.createElement(AgentRollbackSnackbarModule, { title = UseStateResult4, onClose = UseResult1 }),
		RevertDialog = if UseStateResult and RollbackTargetVersionNumber ~= nil then ReactModule.createElement(RestoreVersionDialogModule, {
			isOpen = true,
			isLoading = UseStateResult1,
			title = RevertConfirmationTitle,
			description = RevertConfirmationDescription,
			onRestore = function()
				-- upvalues: UseResult (copy), Signal1 (copy), UseStateResult2_2 (copy), FeedbackActionModule (upval), SendAgentTurnFeedbackModule (upval), TurnFeedbackIds (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), FeedbackIconsModule (upval), UseStateResult2 (copy), RevertFailure (ref)
				if UseResult(false) then return end
				if not Signal1(false) then
					UseStateResult2_2(FeedbackActionModule.REVERT)
					SendAgentTurnFeedbackModule(FeedbackActionModule.REVERT, TurnFeedbackIds)
					UseStateResult2_1(true)
					UseStateResult2_3("")
					FeedbackIconsModule.requestAgentRollback(TurnFeedbackIds):andThen(function()
						-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
						UseStateResult2_1(false)
						UseStateResult2(false)
					end):catch(function()
						-- upvalues: UseStateResult2_1 (upval), UseStateResult2_3 (upval), RevertFailure (upval)
						UseStateResult2_1(false)
						UseStateResult2_3(RevertFailure)
					end)
					
					return
				end
			end,
			onCancel = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}) else nil
	})
end