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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local feedbackActionModule = require(buildExperience.Components.MessageUtilities.FeedbackAction)
local userFeedbackModule = require(buildExperience.Components.MessageUtilities.UserFeedback)
local feedbackIconsModule = require(buildExperience.Components.MessageUtilities.feedbackIcons)
local sendAgentTurnFeedbackModule = require(buildExperience.Components.MessageUtilities.sendAgentTurnFeedback)
local agentRollbackSnackbarModule = require(buildExperience.Components.VersionHistory.AgentRollbackSnackbar)
local restoreVersionDialogModule = require(buildExperience.Components.VersionHistory.RestoreVersionDialog)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local snackbar = foundationModule.Snackbar
local iconName = foundationModule.Enums.IconName
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var1, var2 = signalsModule.createSignal(false)
local t = { get = var1, set = var2 }
local t_1 = {}
local var3 = signalsModule.createSignal(false)

local function useAgentMessageCopy(p1)
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), default (copy), var2 (ref), var3 (ref)
		if p1 ~= nil and p1 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p1 })
		end
		var2(true)
		
		if var3.current ~= nil then
			task.cancel(var3.current)
		end
		var3.current = task.delay(2, function()
			-- upvalues: var3 (copy), var2 (copy)
			var3.current = nil
			var2(false)
		end)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			if var3.current ~= nil then
				task.cancel(var3.current)
			end
		end
	end, {})
	
	return if var1 then iconName.CheckLarge else iconName.TwoStackedSquares, var4
end

local function _(value)
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var1 = t_1[value]
	
	if var1 == nil then
		local var2, var3 = signalsModule.createSignal(false)
		var1 = { get = var2, set = var3 }
		t_1[value] = var1
	end
	return var1
end

return function(p1)
	-- upvalues: feedbackIconsModule (ref), fFlagBuildLocalization (ref), reactModule (ref), localizationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), fFlagBuildAgentRollbackModule (ref), getAgentRollbackRequestStoreModule (ref), var3 (ref), t (ref), t_1 (ref), signalsModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), agentRollbackSnackbarModule (ref), snackbar (ref), restoreVersionDialogModule (ref)
	local CHAT_REVERT_FAILURE, CHAT_REVERT_SUCCESS, CHAT_REVERT_CONFIRMATION_TITLE, CHAT_REVERT_CONFIRMATION_DESCRIPTION
	local turnFeedbackIds = p1.turnFeedbackIds
	local var1 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var2 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var3 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local var4 = if fFlagBuildLocalization then useLocalization({
		revertConfirmationTitle = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE,
		revertConfirmationDescription = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
		revertFailure = localizationStringsModule.CHAT_REVERT_FAILURE,
		revertSuccess = localizationStringsModule.CHAT_REVERT_SUCCESS
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		CHAT_REVERT_FAILURE = var4.revertFailure
		CHAT_REVERT_SUCCESS = var4.revertSuccess
		CHAT_REVERT_CONFIRMATION_TITLE = var4.revertConfirmationTitle
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = var4.revertConfirmationDescription
		
		if var2 ~= nil then
			local var5 = var3:Format(if var2 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var2 })
			
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = var3:Format(localizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = var5 })
			else
				CHAT_REVERT_CONFIRMATION_TITLE = var5
			end
		end
	else
		CHAT_REVERT_FAILURE = localizationStringsModule.CHAT_REVERT_FAILURE
		CHAT_REVERT_SUCCESS = localizationStringsModule.CHAT_REVERT_SUCCESS
		CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION
		
		if var2 ~= nil then
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.formatChatRevertConfirmationDescription(var2)
			else
				CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.formatVersionHistoryVersionNumber(var2)
			end
		end
	end
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState("")
	local var14 = nil
	local var15 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var16, var17 = useAgentMessageCopy(p1.messageText)
		var14 = var16
		var15 = var17
	end
	local var18
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: getPlaytestLoadingStoreModule (copy), var1 (ref)
		return if var1 == nil then false else getPlaytestLoadingStoreModule(p1).getAgentStatusForPlaceId(var1)(p1) == "Loading"
	end, { var1 })
	local var1 = signalsReactModule.useSignalState(var19)
	local var2 = nil
	local var3 = nil
	local _ = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	
	if fFlagBuildAgentRollbackModule then
		var3 = if var1 ~= nil then var3 else getAgentRollbackRequestStoreModule(false).getIsPendingForPlaceId(var1)
		var18 = signalsReactModule.useSignalState(var3)
	else
		var2 = reactModule.useMemo(function()
			-- upvalues: var1 (ref), t (copy), t_1 (copy), signalsModule (copy)
			if var1 == nil then
				return t
			end
			local var1 = t_1[var1]
			
			if var1 == nil then
				local var2, var3 = signalsModule.createSignal(false)
				var1 = { get = var2, set = var3 }
				t_1[var1] = var1
			end
			return var1
		end, { var1 })
		var18 = signalsReactModule.useSignalState(var2.get)
		var4 = reactModule.useCallback(function()
			-- upvalues: var2 (write)
			var2.set(true)
		end, { var2 })
		var5 = reactModule.useCallback(function()
			-- upvalues: var2 (write), var13 (ref), CHAT_REVERT_SUCCESS (write)
			var2.set(false)
			var13(CHAT_REVERT_SUCCESS)
		end, { var2, CHAT_REVERT_SUCCESS })
		var6 = reactModule.useCallback(function()
			-- upvalues: var2 (write), var13 (ref), CHAT_REVERT_FAILURE (write)
			var2.set(false)
			var13(CHAT_REVERT_FAILURE)
		end, { var2, CHAT_REVERT_FAILURE })
	end
	local var7 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13("")
	end, {})
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var14 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var1 or var18
			}),
			onActivated = reactModule.useCallback(function(p1)
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var7 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var15 (write), sendAgentTurnFeedbackModule (copy), var11 (ref)
				if turnFeedbackIds == nil then return end
				if p1.action == feedbackActionModule.REVERT then
					var7(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p1.action == feedbackActionModule.COPY then
					var15()
					sendAgentTurnFeedbackModule(p1.action, turnFeedbackIds)
					
					return
				end
				var11(p1.action)
				sendAgentTurnFeedbackModule(p1.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var15 else nil
			}),
			selectedAction = var10,
			testId = p1.testId
		}),
		RevertSnackbar = if var12 ~= "" then nil elseif fFlagBuildAgentRollbackModule then reactModule.createElement(agentRollbackSnackbarModule, { title = var12, onClose = var7 }) else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var12,
			onClose = var7,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var6 and var2 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			isLoading = if fFlagBuildAgentRollbackModule then var8 else nil,
			title = CHAT_REVERT_CONFIRMATION_TITLE,
			description = CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function()
				-- upvalues: fFlagBuildAgentRollbackModule (copy), var7 (ref), var19 (ref), var3 (write), var2 (write), var11 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), var9 (ref), var13 (ref), feedbackIconsModule (copy), CHAT_REVERT_FAILURE (write), var4 (write), var5 (write), var6 (write)
				if not fFlagBuildAgentRollbackModule then
					var7(false)
				end
				if var19(false) then return end
				if fFlagBuildAgentRollbackModule then
					if var3(false) then return end
				elseif var2.get(false) then return end
				var11(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				
				if fFlagBuildAgentRollbackModule then
					var9(true)
					var13("")
					feedbackIconsModule.requestAgentRollback(turnFeedbackIds):andThen(function()
						-- upvalues: var9 (copy), var7 (copy)
						var9(false)
						var7(false)
					end):catch(function()
						-- upvalues: var9 (copy), var13 (copy), CHAT_REVERT_FAILURE (copy)
						var9(false)
						var13(CHAT_REVERT_FAILURE)
					end)
					
					return
				end
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var4,
					onRevertSuccess = var5,
					onRevertFailure = var6
				})
			end,
			onCancel = function()
				-- upvalues: var7 (ref)
				var7(false)
			end
		}) else nil
	})
end