local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local feedbackActionModule = require(buildExperience.Components.MessageUtilities.FeedbackAction)
local userFeedbackModule = require(buildExperience.Components.MessageUtilities.UserFeedback)
local feedbackIconsModule = require(buildExperience.Components.MessageUtilities.feedbackIcons)
local sendAgentTurnFeedbackModule = require(buildExperience.Components.MessageUtilities.sendAgentTurnFeedback)
local agentRollbackSnackbarModule = require(buildExperience.Components.VersionHistory.AgentRollbackSnackbar)
local restoreVersionDialogModule = require(buildExperience.Components.VersionHistory.RestoreVersionDialog)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local iconName = foundationModule.Enums.IconName
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var1 = signalsModule.createSignal(false)

local function useAgentMessageCopy(p1)
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), default (copy), var3 (ref), var4 (ref)
		if p1 ~= nil and p1 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p1 })
		end
		var3(true)
		
		if var4.current ~= nil then
			task.cancel(var4.current)
		end
		var4.current = task.delay(2, function()
			-- upvalues: var4 (copy), var3 (copy)
			var4.current = nil
			var3(false)
		end)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return function()
			-- upvalues: var4 (copy)
			if var4.current ~= nil then
				task.cancel(var4.current)
			end
		end
	end, {})
	
	return if var2 then iconName.CheckLarge else iconName.TwoStackedSquares, var5
end

return function(p1)
	-- upvalues: feedbackIconsModule (ref), reactModule (ref), localizationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), getAgentRollbackRequestStoreModule (ref), var1 (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), agentRollbackSnackbarModule (ref), restoreVersionDialogModule (ref)
	local turnFeedbackIds = p1.turnFeedbackIds
	local var2 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var3 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var4 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local var5 = useLocalization({
		revertConfirmationTitle = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE,
		revertConfirmationDescription = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
		revertFailure = localizationStringsModule.CHAT_REVERT_FAILURE
	})
	local _ = nil
	local _ = nil
	local _ = nil
	local revertFailure = var5.revertFailure
	local revertConfirmationTitle = var5.revertConfirmationTitle
	local revertConfirmationDescription = var5.revertConfirmationDescription
	
	if var3 ~= nil then
		local var6 = var4:Format(if var3 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var3 })
		
		if fFlagEnableTeamTestLua then
			revertConfirmationDescription = var4:Format(localizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = var6 })
		else
			revertConfirmationTitle = var6
		end
	end
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState("")
	local var15 = nil
	local var16 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var17, var18 = useAgentMessageCopy(p1.messageText)
		var15 = var17
		var16 = var18
	end
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: getPlaytestLoadingStoreModule (copy), var2 (ref)
		return if var2 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var2)(p2) == "Loading"
	end, { var2 })
	local var20 = if var2 ~= nil then var1 else getAgentRollbackRequestStoreModule(false).getIsPendingForPlaceId(var2)
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var15 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = signalsReactModule.useSignalState(var19) or signalsReactModule.useSignalState(var20)
			}),
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var8 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var16 (write), sendAgentTurnFeedbackModule (copy), var12 (ref)
				if turnFeedbackIds == nil then return end
				if p2.action == feedbackActionModule.REVERT then
					var8(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p2.action == feedbackActionModule.COPY then
					var16()
					sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
					
					return
				end
				var12(p2.action)
				sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var16 else nil
			}),
			selectedAction = var11,
			testId = p1.testId
		}),
		RevertSnackbar = if var13 ~= "" then nil else reactModule.createElement(agentRollbackSnackbarModule, {
			title = var13,
			onClose = reactModule.useCallback(function()
				-- upvalues: var14 (ref)
				var14("")
			end, {})
		}),
		RevertDialog = if var7 and var3 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			isLoading = var9,
			title = revertConfirmationTitle,
			description = revertConfirmationDescription,
			onRestore = function()
				-- upvalues: var19 (ref), var20 (ref), var12 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), var10 (ref), var14 (ref), feedbackIconsModule (copy), var8 (ref), revertFailure (write)
				if var19(false) then return end
				if var20(false) then
					return
				end
				var12(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				var10(true)
				var14("")
				feedbackIconsModule.requestAgentRollback(turnFeedbackIds):andThen(function()
					-- upvalues: var10 (copy), var8 (copy)
					var10(false)
					var8(false)
				end):catch(function()
					-- upvalues: var10 (copy), var14 (copy), revertFailure (copy)
					var10(false)
					var14(revertFailure)
				end)
			end,
			onCancel = function()
				-- upvalues: var8 (ref)
				var8(false)
			end
		}) else nil
	})
end