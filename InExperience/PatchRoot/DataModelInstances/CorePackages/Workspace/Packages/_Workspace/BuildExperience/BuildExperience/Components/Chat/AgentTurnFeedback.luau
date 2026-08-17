local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
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
local var14, var15 = signalsModule.createSignal(false)
local t = { get = var14, set = var15 }
local t_1 = {}

local function useAgentMessageCopy(p0) --[[ line: 52 ]]
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useCallback(function() --[[ line: 56 ]]
		-- upvalues: p0 (ref), default (copy), var20 (ref), var21 (ref)
		if p0 ~= nil and p0 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p0 })
		end
		var20(true)
		
		if var21.current ~= nil then
			task.cancel(var21.current)
		end
		var21.current = task.delay(2, function() --[[ line: 67 ]]
			-- upvalues: var21 (copy), var20 (copy)
			var21.current = nil
			var20(false)
		end)
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var21 (ref)
		return function() --[[ line: 74 ]]
			-- upvalues: var21 (copy)
			if var21.current ~= nil then
				task.cancel(var21.current)
			end
		end
	end, {})
	
	return if var19 then iconName.CheckLarge else iconName.TwoStackedSquares, var22
end

local function _(value) --[[ line: 84 | named "getRollbackInProgressSignal" ]]
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

return function(p1) --[[ line: 101 | named "AgentTurnFeedback" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), feedbackIconsModule (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), snackbar (ref), restoreVersionDialogModule (ref), fFlagEnableTeamTestLua (ref)
	local var26 = if fFlagBuildLocalization then useLocalization({
		revertConfirmationDescription = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION
	}) else nil
	local turnFeedbackIds = p1.turnFeedbackIds
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState(nil)
	local var31, var32 = reactModule.useState("")
	local var33 = nil
	local var34 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var35, var36 = useAgentMessageCopy(p1.messageText)
		var33 = var35
		var34 = var36
	end
	local var37 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var38 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var39 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: var37 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var37 == nil then
			return t
		end
		local var47 = t_1[var37]
		
		if var47 == nil then
			local var48, var49 = signalsModule.createSignal(false)
			var47 = { get = var48, set = var49 }
			t_1[var37] = var47
		end
		return var47
	end, { var37 })
	local var40 = reactModule.useCallback(function(p2) --[[ line: 124 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), var37 (ref)
		return if var37 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var37)(p2) == "Loading"
	end, { var37 })
	local var41 = signalsReactModule.useSignalState(var40)
	local var42 = signalsReactModule.useSignalState(var39.get)
	local var43 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var32 (ref)
		var32("")
	end, {})
	local var44 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var39 (ref)
		var39.set(true)
	end, { var39 })
	local var45 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: var39 (ref), var32 (ref), localizationStringsModule (copy)
		var39.set(false)
		var32(localizationStringsModule.CHAT_REVERT_SUCCESS)
	end, { var39 })
	local var46 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var39 (ref), var32 (ref), localizationStringsModule (copy)
		var39.set(false)
		var32(localizationStringsModule.CHAT_REVERT_FAILURE)
	end, { var39 })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var33 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var41 or var42
			}),
			onActivated = reactModule.useCallback(function(p3) --[[ line: 149 ]]
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var28 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var34 (write), sendAgentTurnFeedbackModule (copy), var30 (ref)
				if turnFeedbackIds == nil then return end
				if p3.action == feedbackActionModule.REVERT then
					var28(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p3.action == feedbackActionModule.COPY then
					var34()
					sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
					
					return
				end
				var30(p3.action)
				sendAgentTurnFeedbackModule(p3.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var34 else nil
			}),
			selectedAction = var29,
			testId = p1.testId
		}),
		RevertSnackbar = if var31 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var31,
			onClose = var43,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var27 and var38 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = if fFlagEnableTeamTestLua then localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE else localizationStringsModule.formatVersionHistoryVersionNumber(var38),
			description = if fFlagEnableTeamTestLua then localizationStringsModule.formatChatRevertConfirmationDescription(var38) elseif fFlagBuildLocalization then var26.revertConfirmationDescription else localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function() --[[ line: 212 ]]
				-- upvalues: var28 (ref), var40 (ref), var39 (ref), var30 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), feedbackIconsModule (copy), var44 (ref), var45 (ref), var46 (ref)
				var28(false)
				
				if var40(false) or var39.get(false) then
					return
				end
				var30(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var44,
					onRevertSuccess = var45,
					onRevertFailure = var46
				})
			end,
			onCancel = function() --[[ line: 225 ]]
				-- upvalues: var28 (ref)
				var28(false)
			end
		}) else nil
	})
end