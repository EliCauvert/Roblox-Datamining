local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
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
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var14, var15 = signalsModule.createSignal(false)
local t = { get = var14, set = var15 }
local t_1 = {}

local function useAgentMessageCopy(p0) --[[ line: 50 ]]
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: p0 (ref), default (copy), var20 (ref), var21 (ref)
		if p0 ~= nil and p0 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p0 })
		end
		var20(true)
		
		if var21.current ~= nil then
			task.cancel(var21.current)
		end
		var21.current = task.delay(2, function() --[[ line: 65 ]]
			-- upvalues: var21 (copy), var20 (copy)
			var21.current = nil
			var20(false)
		end)
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: var21 (ref)
		return function() --[[ line: 72 ]]
			-- upvalues: var21 (copy)
			if var21.current ~= nil then
				task.cancel(var21.current)
			end
		end
	end, {})
	
	return if var19 then iconName.CheckLarge else iconName.TwoStackedSquares, var22
end

local function _(value) --[[ line: 82 | named "getRollbackInProgressSignal" ]]
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var23 = t_1[value]
	
	if var23 == nil then
		local var24, var25 = signalsModule.createSignal(false)
		var23 = { get = var24, set = var25 }
		t_1[value] = var23
	end
	return var23
end

return function(p1) --[[ line: 99 | named "AgentTurnFeedback" ]]
	-- upvalues: reactModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), feedbackIconsModule (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), localizationStringsModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), snackbar (ref), restoreVersionDialogModule (ref), fFlagEnableTeamTestLua (ref)
	local turnFeedbackIds = p1.turnFeedbackIds
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState(nil)
	local var30, var31 = reactModule.useState("")
	local var32 = nil
	local var33 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var34, var35 = useAgentMessageCopy(p1.messageText)
		var32 = var34
		var33 = var35
	end
	local var36 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var37 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var38 = reactModule.useMemo(function() --[[ line: 114 ]]
		-- upvalues: var36 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var36 == nil then
			return t
		end
		local var46 = t_1[var36]
		
		if var46 == nil then
			local var47, var48 = signalsModule.createSignal(false)
			var46 = { get = var47, set = var48 }
			t_1[var36] = var46
		end
		return var46
	end, { var36 })
	local var39 = reactModule.useCallback(function(p2) --[[ line: 117 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), var36 (ref)
		return if var36 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var36)(p2) == "Loading"
	end, { var36 })
	local var40 = signalsReactModule.useSignalState(var39)
	local var41 = signalsReactModule.useSignalState(var38.get)
	local var42 = reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: var31 (ref)
		var31("")
	end, {})
	local var43 = reactModule.useCallback(function() --[[ line: 130 ]]
		-- upvalues: var38 (ref)
		var38.set(true)
	end, { var38 })
	local var44 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var38 (ref), var31 (ref), localizationStringsModule (copy)
		var38.set(false)
		var31(localizationStringsModule.CHAT_REVERT_SUCCESS)
	end, { var38 })
	local var45 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var38 (ref), var31 (ref), localizationStringsModule (copy)
		var38.set(false)
		var31(localizationStringsModule.CHAT_REVERT_FAILURE)
	end, { var38 })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var32 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var40 or var41
			}),
			onActivated = reactModule.useCallback(function(p3) --[[ line: 142 ]]
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var27 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var33 (write), sendAgentTurnFeedbackModule (copy), var29 (ref)
				if turnFeedbackIds == nil then return end
				if p3.action == feedbackActionModule.REVERT then
					var27(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p3.action == feedbackActionModule.COPY then
					var33()
					sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
					
					return
				end
				var29(p3.action)
				sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var33 else nil
			}),
			selectedAction = var28,
			testId = p1.testId
		}),
		RevertSnackbar = if var30 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var30,
			onClose = var42,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var26 and var37 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = if fFlagEnableTeamTestLua then localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE else localizationStringsModule.formatVersionHistoryVersionNumber(var37),
			description = if fFlagEnableTeamTestLua then localizationStringsModule.formatChatRevertConfirmationDescription(var37) else localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function() --[[ line: 203 ]]
				-- upvalues: var27 (ref), var39 (ref), var38 (ref), var29 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), feedbackIconsModule (copy), var43 (ref), var44 (ref), var45 (ref)
				var27(false)
				
				if var39(false) or var38.get(false) then
					return
				end
				var29(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var43,
					onRevertSuccess = var44,
					onRevertFailure = var45
				})
			end,
			onCancel = function() --[[ line: 216 ]]
				-- upvalues: var27 (ref)
				var27(false)
			end
		}) else nil
	})
end