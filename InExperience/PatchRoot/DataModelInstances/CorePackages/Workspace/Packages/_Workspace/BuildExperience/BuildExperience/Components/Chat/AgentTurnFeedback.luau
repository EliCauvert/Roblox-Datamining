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
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local snackbar = foundationModule.Snackbar
local iconName = foundationModule.Enums.IconName
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var1, var2 = signalsModule.createSignal(false)
local t = { get = var1, set = var2 }
local t_1 = {}
local var3 = signalsModule.createSignal(false)

local function useAgentMessageCopy(p1)
	-- upvalues: reactModule (ref), default (ref), iconName (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), default (copy), var5 (ref), var6 (ref)
		if p1 ~= nil and p1 ~= "" then
			default:setClipboardText({ context = "Build-AgentMessage", text = p1 })
		end
		var5(true)
		
		if var6.current ~= nil then
			task.cancel(var6.current)
		end
		var6.current = task.delay(2, function()
			-- upvalues: var6 (copy), var5 (copy)
			var6.current = nil
			var5(false)
		end)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			if var6.current ~= nil then
				task.cancel(var6.current)
			end
		end
	end, {})
	
	return if var4 then iconName.CheckLarge else iconName.TwoStackedSquares, var7
end

local function _(value)
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var4 = t_1[value]
	
	if var4 == nil then
		local var5, var6 = signalsModule.createSignal(false)
		var4 = { get = var5, set = var6 }
		t_1[value] = var4
	end
	return var4
end

return function(p1)
	-- upvalues: feedbackIconsModule (ref), reactModule (ref), localizationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), useAgentMessageCopy (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), fFlagBuildAgentRollbackModule (ref), getAgentRollbackRequestStoreModule (ref), var3 (ref), t (ref), t_1 (ref), signalsModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), agentRollbackSnackbarModule (ref), snackbar (ref), restoreVersionDialogModule (ref)
	local turnFeedbackIds = p1.turnFeedbackIds
	local var4 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var5 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var6 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local var7 = useLocalization({
		revertConfirmationTitle = localizationStringsModule.CHAT_REVERT_CONFIRMATION_TITLE,
		revertConfirmationDescription = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
		revertFailure = localizationStringsModule.CHAT_REVERT_FAILURE,
		revertSuccess = localizationStringsModule.CHAT_REVERT_SUCCESS
	})
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local revertFailure = var7.revertFailure
	local revertSuccess = var7.revertSuccess
	local revertConfirmationTitle = var7.revertConfirmationTitle
	local revertConfirmationDescription = var7.revertConfirmationDescription
	
	if var5 ~= nil then
		local var8 = var6:Format(if var5 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var5 })
		
		if fFlagEnableTeamTestLua then
			revertConfirmationDescription = var6:Format(localizationStringsModule.CHAT_REVERT_TO_VERSION, { VERSION = var8 })
		else
			revertConfirmationTitle = var8
		end
	end
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState("")
	local var17 = nil
	local var18 = nil
	
	if fFlagBuildExperienceCopyChatMessagesModule then
		local var19, var20 = useAgentMessageCopy(p1.messageText)
		var17 = var19
		var18 = var20
	end
	local var21
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: getPlaytestLoadingStoreModule (copy), var4 (ref)
		return if var4 == nil then false else getPlaytestLoadingStoreModule(p2).getAgentStatusForPlaceId(var4)(p2) == "Loading"
	end, { var4 })
	local var23 = signalsReactModule.useSignalState(var22)
	local var24 = nil
	local var25 = nil
	local _ = nil
	local var26 = nil
	local var27 = nil
	local var28 = nil
	
	if fFlagBuildAgentRollbackModule then
		var25 = if var4 ~= nil then var3 else getAgentRollbackRequestStoreModule(false).getIsPendingForPlaceId(var4)
		var21 = signalsReactModule.useSignalState(var25)
	else
		var24 = reactModule.useMemo(function()
			-- upvalues: var4 (ref), t (copy), t_1 (copy), signalsModule (copy)
			if var4 == nil then
				return t
			end
			local var29 = t_1[var4]
			
			if var29 == nil then
				local var30, var31 = signalsModule.createSignal(false)
				var29 = { get = var30, set = var31 }
				t_1[var4] = var29
			end
			return var29
		end, { var4 })
		var21 = signalsReactModule.useSignalState(var24.get)
		var26 = reactModule.useCallback(function()
			-- upvalues: var24 (write)
			var24.set(true)
		end, { var24 })
		var27 = reactModule.useCallback(function()
			-- upvalues: var24 (write), var16 (ref), revertSuccess (write)
			var24.set(false)
			var16(revertSuccess)
		end, { var24, revertSuccess })
		var28 = reactModule.useCallback(function()
			-- upvalues: var24 (write), var16 (ref), revertFailure (write)
			var24.set(false)
			var16(revertFailure)
		end, { var24, revertFailure })
	end
	local var29 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16("")
	end, {})
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p1.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeCopy = fFlagBuildExperienceCopyChatMessagesModule and (p1.messageText ~= nil and p1.messageText ~= ""),
				copyIconName = if fFlagBuildExperienceCopyChatMessagesModule then var17 else nil,
				copyTestId = if fFlagBuildExperienceCopyChatMessagesModule then `{p1.testId}-copy` else nil,
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var23 or var21
			}),
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var10 (ref), fFlagBuildExperienceCopyChatMessagesModule (copy), var18 (write), sendAgentTurnFeedbackModule (copy), var14 (ref)
				if turnFeedbackIds == nil then return end
				if p2.action == feedbackActionModule.REVERT then
					var10(true)
					
					return
				elseif fFlagBuildExperienceCopyChatMessagesModule and p2.action == feedbackActionModule.COPY then
					var18()
					sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
					
					return
				end
				var14(p2.action)
				sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
			end, {
				turnFeedbackIds,
				if fFlagBuildExperienceCopyChatMessagesModule then var18 else nil
			}),
			selectedAction = var13,
			testId = p1.testId
		}),
		RevertSnackbar = if var15 ~= "" then nil elseif fFlagBuildAgentRollbackModule then reactModule.createElement(agentRollbackSnackbarModule, { title = var15, onClose = var29 }) else reactModule.createElement(snackbar, {
			LayoutOrder = (p1.LayoutOrder or 0) + 1,
			title = var15,
			onClose = var29,
			testId = `{p1.testId}.revert-snackbar`
		}),
		RevertDialog = if var9 and var5 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			isLoading = if fFlagBuildAgentRollbackModule then var11 else nil,
			title = revertConfirmationTitle,
			description = revertConfirmationDescription,
			onRestore = function()
				-- upvalues: fFlagBuildAgentRollbackModule (copy), var10 (ref), var22 (ref), var25 (write), var24 (write), var14 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), var12 (ref), var16 (ref), feedbackIconsModule (copy), revertFailure (write), var26 (write), var27 (write), var28 (write)
				if not fFlagBuildAgentRollbackModule then
					var10(false)
				end
				if var22(false) then return end
				if fFlagBuildAgentRollbackModule then
					if var25(false) then return end
				elseif var24.get(false) then return end
				var14(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				
				if fFlagBuildAgentRollbackModule then
					var12(true)
					var16("")
					feedbackIconsModule.requestAgentRollback(turnFeedbackIds):andThen(function()
						-- upvalues: var12 (copy), var10 (copy)
						var12(false)
						var10(false)
					end):catch(function()
						-- upvalues: var12 (copy), var16 (copy), revertFailure (copy)
						var12(false)
						var16(revertFailure)
					end)
					
					return
				end
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var26,
					onRevertSuccess = var27,
					onRevertFailure = var28
				})
			end,
			onCancel = function()
				-- upvalues: var10 (ref)
				var10(false)
			end
		}) else nil
	})
end