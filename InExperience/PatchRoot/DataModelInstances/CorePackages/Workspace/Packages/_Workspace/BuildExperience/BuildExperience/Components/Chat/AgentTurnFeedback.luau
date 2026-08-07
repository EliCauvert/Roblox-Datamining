local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local feedbackActionModule = require(buildExperience.Components.MessageUtilities.FeedbackAction)
local userFeedbackModule = require(buildExperience.Components.MessageUtilities.UserFeedback)
local feedbackIconsModule = require(buildExperience.Components.MessageUtilities.feedbackIcons)
local sendAgentTurnFeedbackModule = require(buildExperience.Components.MessageUtilities.sendAgentTurnFeedback)
local restoreVersionDialogModule = require(buildExperience.Components.VersionHistory.RestoreVersionDialog)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local snackbar = require(parent.Foundation).Snackbar
local var11, var12 = signalsModule.createSignal(false)
local t = { get = var11, set = var12 }
local t_1 = {}

local function _(value) --[[ line: 38 | named "getRollbackInProgressSignal" ]]
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var15 = t_1[value]
	
	if var15 == nil then
		local var16, var17 = signalsModule.createSignal(false)
		var15 = { get = var16, set = var17 }
		t_1[value] = var15
	end
	return var15
end

return function(p0) --[[ line: 55 | named "AgentTurnFeedback" ]]
	-- upvalues: reactModule (ref), feedbackIconsModule (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), localizationStringsModule (ref), feedbackActionModule (ref), sendAgentTurnFeedbackModule (ref), userFeedbackModule (ref), snackbar (ref), restoreVersionDialogModule (ref)
	local turnFeedbackIds = p0.turnFeedbackIds
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(nil)
	local var22, var23 = reactModule.useState("")
	local var24 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var25 = if turnFeedbackIds ~= nil then nil else feedbackIconsModule.getRollbackTargetVersionNumber(turnFeedbackIds)
	local var26 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: var24 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var24 == nil then
			return t
		end
		local var34 = t_1[var24]
		
		if var34 == nil then
			local var35, var36 = signalsModule.createSignal(false)
			var34 = { get = var35, set = var36 }
			t_1[var24] = var34
		end
		return var34
	end, { var24 })
	local var27 = reactModule.useCallback(function(p1) --[[ line: 68 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), var24 (ref)
		return if var24 == nil then false else getPlaytestLoadingStoreModule(p1).getAgentStatusForPlaceId(var24)(p1) == "Loading"
	end, { var24 })
	local var28 = signalsReactModule.useSignalState(var27)
	local var29 = signalsReactModule.useSignalState(var26.get)
	local var30 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var23 (ref)
		var23("")
	end, {})
	local var31 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var26 (ref)
		var26.set(true)
	end, { var26 })
	local var32 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: var26 (ref), var23 (ref), localizationStringsModule (copy)
		var26.set(false)
		var23(localizationStringsModule.CHAT_REVERT_SUCCESS)
	end, { var26 })
	local var33 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var26 (ref), var23 (ref), localizationStringsModule (copy)
		var26.set(false)
		var23(localizationStringsModule.CHAT_REVERT_FAILURE)
	end, { var26 })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p0.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var28 or var29
			}),
			onActivated = reactModule.useCallback(function(p2) --[[ line: 92 ]]
				-- upvalues: turnFeedbackIds (ref), feedbackActionModule (copy), var19 (ref), var21 (ref), sendAgentTurnFeedbackModule (copy)
				if turnFeedbackIds == nil then return end
				if p2.action == feedbackActionModule.REVERT then
					var19(true)
					
					return
				end
				var21(p2.action)
				sendAgentTurnFeedbackModule(p2.action, turnFeedbackIds)
			end, { turnFeedbackIds }),
			selectedAction = var20,
			testId = p0.testId
		}),
		RevertSnackbar = if var22 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p0.LayoutOrder or 0) + 1,
			title = var22,
			onClose = var30,
			testId = `{p0.testId}.revert-snackbar`
		}),
		RevertDialog = if var18 and var25 ~= nil then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = localizationStringsModule.formatVersionHistoryVersionNumber(var25),
			description = localizationStringsModule.CHAT_REVERT_CONFIRMATION_DESCRIPTION,
			onRestore = function() --[[ line: 134 ]]
				-- upvalues: var19 (ref), var27 (ref), var26 (ref), var21 (ref), feedbackActionModule (copy), sendAgentTurnFeedbackModule (copy), turnFeedbackIds (ref), feedbackIconsModule (copy), var31 (ref), var32 (ref), var33 (ref)
				var19(false)
				
				if var27(false) or var26.get(false) then
					return
				end
				var21(feedbackActionModule.REVERT)
				sendAgentTurnFeedbackModule(feedbackActionModule.REVERT, turnFeedbackIds)
				feedbackIconsModule.rollbackPublishedVersion(turnFeedbackIds, {
					onRevertStart = var31,
					onRevertSuccess = var32,
					onRevertFailure = var33
				})
			end,
			onCancel = function() --[[ line: 147 ]]
				-- upvalues: var19 (ref)
				var19(false)
			end
		}) else nil
	})
end