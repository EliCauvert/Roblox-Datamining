local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local userFeedbackModule = require(buildExperience.Components.MessageUtilities.UserFeedback)
local feedbackIconsModule = require(buildExperience.Components.MessageUtilities.feedbackIcons)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local snackbar = require(parent.Foundation).Snackbar
local var7, var8 = signalsModule.createSignal(false)
local t = { get = var7, set = var8 }
local t_1 = {}

local function _(value) --[[ line: 38 | named "getRollbackInProgressSignal" ]]
	-- upvalues: t (ref), t_1 (ref), signalsModule (ref)
	if value == nil then
		return t
	end
	local var11 = t_1[value]
	
	if var11 == nil then
		local var12, var13 = signalsModule.createSignal(false)
		var11 = { get = var12, set = var13 }
		t_1[value] = var11
	end
	return var11
end

return function(p0) --[[ line: 55 | named "AgentTurnFeedback" ]]
	-- upvalues: reactModule (ref), t (ref), t_1 (ref), signalsModule (ref), getPlaytestLoadingStoreModule (ref), signalsReactModule (ref), feedbackIconsModule (ref), userFeedbackModule (ref), snackbar (ref)
	local turnFeedbackIds = p0.turnFeedbackIds
	local var14, var15 = reactModule.useState("")
	local var16 = if turnFeedbackIds ~= nil then nil else turnFeedbackIds.placeId
	local var17 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: var16 (ref), t (copy), t_1 (copy), signalsModule (copy)
		if var16 == nil then
			return t
		end
		local var24 = t_1[var16]
		
		if var24 == nil then
			local var25, var26 = signalsModule.createSignal(false)
			var24 = { get = var25, set = var26 }
			t_1[var16] = var24
		end
		return var24
	end, { var16 })
	local var18 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 62 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), var16 (ref)
		return var16 ~= nil and getPlaytestLoadingStoreModule(p1).getAgentStatusForPlaceId(var16)(p1) == "Loading"
	end, { var16 }))
	local var19 = signalsReactModule.useSignalState(var17.get)
	local var20 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: var15 (ref)
		var15("")
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var17 (ref)
		var17.set(true)
	end, { var17 })
	local var22 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17.set(false)
		var15("Reverted agent publish.")
	end, { var17 })
	local var23 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17.set(false)
		var15("Couldn't revert agent publish. Try again.")
	end, { var17 })
	
	return if turnFeedbackIds == nil or turnFeedbackIds.sequenceId == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(userFeedbackModule, {
			layoutOrder = p0.LayoutOrder,
			icons = feedbackIconsModule.getFeedbackIcons({
				includeRevert = feedbackIconsModule.canRevert(turnFeedbackIds),
				isRevertDisabled = var18 or var19
			}),
			onActivated = reactModule.useCallback(function(p2) --[[ line: 83 ]]
				-- upvalues: turnFeedbackIds (ref), feedbackIconsModule (copy), var21 (ref), var22 (ref), var23 (ref)
				if turnFeedbackIds == nil then
					return
				end
				feedbackIconsModule.createOnActivated(turnFeedbackIds, {
					onRevertStart = var21,
					onRevertSuccess = var22,
					onRevertFailure = var23
				})(p2)
			end, { var23, var21, var22, turnFeedbackIds }),
			testId = p0.testId
		}),
		RevertSnackbar = if var14 ~= "" then nil else reactModule.createElement(snackbar, {
			LayoutOrder = (p0.LayoutOrder or 0) + 1,
			title = var14,
			onClose = var20,
			testId = `{p0.testId}.revert-snackbar`
		})
	})
end