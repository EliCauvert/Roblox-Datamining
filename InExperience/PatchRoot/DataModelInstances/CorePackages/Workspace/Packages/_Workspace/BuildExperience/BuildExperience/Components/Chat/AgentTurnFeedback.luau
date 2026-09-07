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
local restoreVersionDialogModule = require(buildExperience.Components.VersionHistory.RestoreVersionDialog)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local snackbar = foundationModule.Snackbar
local iconName = foundationModule.Enums.IconName
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var1, var2 = signalsModule.createSignal(false)
local t = { get = var1, set = var2 }
local t_1 = {}

local function useAgentMessageCopy(p1)
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), default (copy), var4 (ref), var5 (ref)
		if p1 ~= nil and p1 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p1 })
		end
		var4(true)
		
		if var5.current ~= nil then
			task.cancel(var5.current)
		end
		var5.current = task.delay(2, function()
			-- upvalues: var5 (copy), var4 (copy)
			var5.current = nil
			var4(false)
		end)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return function()
			-- upvalues: var5 (copy)
			if var5.current ~= nil then
				task.cancel(var5.current)
			end
		end
	end, {})
	
	return if var3 then iconName.CheckLarge else iconName.TwoStackedSquares, var6
end

local function _(value)
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var3 = t_1[value]
	
	if var3 == nil then
		local var4, var5 = signalsModule.createSignal(false)
		var3 = { get = var4, set = var5 }
		t_1[value] = var3
	end
	return var3
end

return function(p1)
	-- upvalues: feedbackIconsModule (ref), fFlagBuildLocalization (ref), reactModule (ref), localizationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), snackbar (ref), restoreVersionDialogModule (ref)
	local CHAT_REVERT_FAILURE, CHAT_REVERT_SUCCESS, CHAT_REVERT_CONFIRMATION_TITLE, CHAT_REVERT_CONFIRMATION_DESCRIPTION
	local turnFeedbackIds = p1.turnFeedbackIds
	local var3 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var4 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var5 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local var6 = if fFlagBuildLocalization then useLocalization({
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
		CHAT_REVERT_FAILURE = var6.revertFailure
		CHAT_REVERT_SUCCESS = var6.revertSuccess
		CHAT_REVERT_CONFIRMATION_TITLE = var6.revertConfirmationTitle
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = var6.revertConfirmationDescription
		
		if var4 ~= nil then
			local var7 = var5:Format(if var4 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var4 })
			
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = var5:Format(localizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = var7 })
			else
				CHAT_REVERT_CONFIRMATION_TITLE = var7
			end
		end
	else
		CHAT_REVERT_FAILURE = localizationStringsModule.CHAT_REVERT_FAILURE
		CHAT_REVERT_SUCCESS = localizationStringsModule.CHAT_REVERT_SUCCESS
		CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION
		
		if var4 ~= nil then
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.formatChatRevertConfirmationDescription(var4)
			else
				CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.formatVersionHistoryVersionNumber(var4)
			end
		end
	end
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
	local var18 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var3 == nil then
			return t
		end
		local var19 = t_1[var3]
		
		if var19 == nil then
			local var20, var21 = signalsModule.createSignal(false)
			var19 = { get = var20, set = var21 }
			t_1[var3] = var19
		end
		return var19
	end, { var3 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: getPlaytestLoadingStoreModule (copy), var3 (ref)
		return if var3 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var3)(p2) == "Loading"
	end, { var3 })
	local var20 = signalsReactModule.useSignalState(var19)
	local var21 = signalsReactModule.useSignalState(var18.get)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13("")
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18.set(true)
	end, { var18 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var13 (ref), CHAT_REVERT_SUCCESS (write)
		var18.set(false)
		var13(CHAT_REVERT_SUCCESS)
	end, { var18, CHAT_REVERT_SUCCESS })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var13 (ref), CHAT_REVERT_FAILURE (write)
		var18.set(false)
		var13(CHAT_REVERT_FAILURE)
	end, { var18, CHAT_REVERT_FAILURE })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var14 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var20 or var21
			}),
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var9 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var15 (write), sendAgentTurnFeedbackModule (copy), var11 (ref)
				if turnFeedbackIds == nil then return end
				if p2.action == feedbackActionModule.REVERT then
					var9(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p2.action == feedbackActionModule.COPY then
					var15()
					sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
					
					return
				end
				var11(p2.action)
				sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var15 else nil
			}),
			selectedAction = var10,
			testId = p1.testId
		}),
		RevertSnackbar = if var12 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var12,
			onClose = var22,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var8 and var4 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = CHAT_REVERT_CONFIRMATION_TITLE,
			description = CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function()
				-- upvalues: var9 (ref), var19 (ref), var18 (ref), var11 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), feedbackIconsModule (copy), var23 (ref), var24 (ref), var25 (ref)
				var9(false)
				
				if var19(false) or var18.get(false) then
					return
				end
				var11(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var23,
					onRevertSuccess = var24,
					onRevertFailure = var25
				})
			end,
			onCancel = function()
				-- upvalues: var9 (ref)
				var9(false)
			end
		}) else nil
	})
end