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
local var15, var16 = signalsModule.createSignal(false)
local t = { get = var15, set = var16 }
local t_1 = {}

local function useAgentMessageCopy(p0) --[[ line: 53 ]]
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function() --[[ line: 57 ]]
		-- upvalues: p0 (ref), default (copy), var21 (ref), var22 (ref)
		if p0 ~= nil and p0 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p0 })
		end
		var21(true)
		
		if var22.current ~= nil then
			task.cancel(var22.current)
		end
		var22.current = task.delay(2, function() --[[ line: 68 ]]
			-- upvalues: var22 (copy), var21 (copy)
			var22.current = nil
			var21(false)
		end)
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var22 (ref)
		return function() --[[ line: 75 ]]
			-- upvalues: var22 (copy)
			if var22.current ~= nil then
				task.cancel(var22.current)
			end
		end
	end, {})
	
	return if var20 then iconName.CheckLarge else iconName.TwoStackedSquares, var23
end

local function _(value) --[[ line: 85 | named "getRollbackInProgressSignal" ]]
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var24 = t_1[value]
	
	if var24 == nil then
		local var25, var26 = signalsModule.createSignal(false)
		var24 = { get = var25, set = var26 }
		t_1[value] = var24
	end
	return var24
end

return function(p1) --[[ line: 102 | named "AgentTurnFeedback" ]]
	-- upvalues: feedbackIconsModule (ref), fFlagBuildLocalization (ref), reactModule (ref), localizationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), snackbar (ref), restoreVersionDialogModule (ref)
	local CHAT_REVERT_FAILURE, CHAT_REVERT_SUCCESS, CHAT_REVERT_CONFIRMATION_TITLE, CHAT_REVERT_CONFIRMATION_DESCRIPTION
	local turnFeedbackIds = p1.turnFeedbackIds
	local var27 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var28 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var29 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local var30 = if fFlagBuildLocalization then useLocalization({
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
		CHAT_REVERT_FAILURE = var30.revertFailure
		CHAT_REVERT_SUCCESS = var30.revertSuccess
		CHAT_REVERT_CONFIRMATION_TITLE = var30.revertConfirmationTitle
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = var30.revertConfirmationDescription
		
		if var28 ~= nil then
			local var31 = var29:Format(if var28 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var28 })
			
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = var29:Format(localizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = var31 })
			else
				CHAT_REVERT_CONFIRMATION_TITLE = var31
			end
		end
	else
		CHAT_REVERT_FAILURE = localizationStringsModule.CHAT_REVERT_FAILURE
		CHAT_REVERT_SUCCESS = localizationStringsModule.CHAT_REVERT_SUCCESS
		CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE
		CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION
		
		if var28 ~= nil then
			if fFlagEnableTeamTestLua then
				CHAT_REVERT_CONFIRMATION_DESCRIPTION = localizationStringsModule.formatChatRevertConfirmationDescription(var28)
			else
				CHAT_REVERT_CONFIRMATION_TITLE = localizationStringsModule.formatVersionHistoryVersionNumber(var28)
			end
		end
	end
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState("")
	local var38 = nil
	local var39 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var40, var41 = useAgentMessageCopy(p1.messageText)
		var38 = var40
		var39 = var41
	end
	local var42 = reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: var27 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var27 == nil then
			return t
		end
		local var50 = t_1[var27]
		
		if var50 == nil then
			local var51, var52 = signalsModule.createSignal(false)
			var50 = { get = var51, set = var52 }
			t_1[var27] = var50
		end
		return var50
	end, { var27 })
	local var43 = reactModule.useCallback(function(p2) --[[ line: 171 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), var27 (ref)
		return if var27 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var27)(p2) == "Loading"
	end, { var27 })
	local var44 = signalsReactModule.useSignalState(var43)
	local var45 = signalsReactModule.useSignalState(var42.get)
	local var46 = reactModule.useCallback(function() --[[ line: 180 ]]
		-- upvalues: var37 (ref)
		var37("")
	end, {})
	local var47 = reactModule.useCallback(function() --[[ line: 184 ]]
		-- upvalues: var42 (ref)
		var42.set(true)
	end, { var42 })
	local var48 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: var42 (ref), var37 (ref), CHAT_REVERT_SUCCESS (write)
		var42.set(false)
		var37(CHAT_REVERT_SUCCESS)
	end, { var42, CHAT_REVERT_SUCCESS })
	local var49 = reactModule.useCallback(function() --[[ line: 191 ]]
		-- upvalues: var42 (ref), var37 (ref), CHAT_REVERT_FAILURE (write)
		var42.set(false)
		var37(CHAT_REVERT_FAILURE)
	end, { var42, CHAT_REVERT_FAILURE })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var38 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var44 or var45
			}),
			onActivated = reactModule.useCallback(function(p3) --[[ line: 196 ]]
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var33 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var39 (write), sendAgentTurnFeedbackModule (copy), var35 (ref)
				if turnFeedbackIds == nil then return end
				if p3.action == feedbackActionModule.REVERT then
					var33(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p3.action == feedbackActionModule.COPY then
					var39()
					sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
					
					return
				end
				var35(p3.action)
				sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var39 else nil
			}),
			selectedAction = var34,
			testId = p1.testId
		}),
		RevertSnackbar = if var36 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var36,
			onClose = var46,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var32 and var28 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = CHAT_REVERT_CONFIRMATION_TITLE,
			description = CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function() --[[ line: 253 ]]
				-- upvalues: var33 (ref), var43 (ref), var42 (ref), var35 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), feedbackIconsModule (copy), var47 (ref), var48 (ref), var49 (ref)
				var33(false)
				
				if var43(false) or var42.get(false) then
					return
				end
				var35(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var47,
					onRevertSuccess = var48,
					onRevertFailure = var49
				})
			end,
			onCancel = function() --[[ line: 266 ]]
				-- upvalues: var33 (ref)
				var33(false)
			end
		}) else nil
	})
end