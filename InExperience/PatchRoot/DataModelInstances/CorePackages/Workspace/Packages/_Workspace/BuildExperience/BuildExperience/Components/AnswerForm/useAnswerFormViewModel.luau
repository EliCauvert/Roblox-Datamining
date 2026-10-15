local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(script.Parent.AnswerFormView)

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), signalsReactModule (ref), foundationModule (ref), useLocalization (ref), localizationStringsModule (ref)
	local state = p1.state
	local var1 = if state then state.draft else nil
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy)
			return if var1 then var1.getText(p2) else nil
		end)
	end, { var1 }))
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = useLocalization({
		customOption = localizationStringsModule.ANSWER_FORM_CUSTOM_OPTION,
		progress = {
			"CommonUI.Controls.Label.PageCount",
			["current:int"] = if state then state.questionIndex else 0,
			["total:int"] = if state then state.questionCount else 0
		}
	})
	
	if state == nil then
		return nil
	end
	assert(p1.actions ~= nil and (p1.onSubmitText ~= nil and p1.onStop ~= nil), "Active answer form requires actions")
	local actions = p1.actions
	local onSubmitText = p1.onSubmitText
	local question = state.question
	local isMultiSelect = question.responseType == "multi_select"
	local var5 = if #question.options ~= 0 then var2 ~= nil else true
	local var6 = var2 or ""
	local selectedOptionId = state.selectedOptionId
	local t = {}
	
	for i, v in question.options do
		local t_1 = { id = v.id, title = v.title, description = v.description }
		local var7 = not var5
		
		if var7 then
			if typeof(selectedOptionId) == "table" then
				var7 = table.find(selectedOptionId, v.id) ~= nil
				var7 = nil
			else
				var7 = selectedOptionId == v.id
			end
		end
		t_1.isSelected = var7
		
		function t_1.onActivated()
			-- upvalues: state (ref), actions (ref), var5 (ref), question (ref), v (ref)
			if state.isSubmitting then return end
			state.draft.setText(nil)
			local toolCallId = actions.onAnswerSelectedByToolCallId[state.toolCallId]
			
			if toolCallId ~= nil then
				if var5 then
					toolCallId(question, v, true)
					
					return
				end
				toolCallId(question, v)
			end
		end
		
		table.insert(t, t_1)
	end
	local var8 = string.match(var6, "^%s*(.-)%s*$") or ""
	local var9 = typeof(selectedOptionId) == "table" and #selectedOptionId > 0
	local isSubmitting = state.isSubmitting
	
	if not isSubmitting then
		if var5 then
			isSubmitting = var8 == ""
			isSubmitting = nil
		else
			isSubmitting = not var9
		end
	end
	return {
		LayoutOrder = p1.LayoutOrder,
		title = question.question,
		options = t,
		isMultiSelect = isMultiSelect,
		isSubmitting = state.isSubmitting,
		isCustom = var5,
		customText = var6,
		customLabel = var4.customOption,
		progressText = var4.progress,
		errorText = p1.errorText,
		showForward = isMultiSelect or var5,
		isForwardDisabled = isSubmitting,
		footerInset = var3.Padding.Small,
		onCustomActivated = function()
			-- upvalues: state (ref)
			if not state.isSubmitting then
				state.draft.setText("")
			end
		end,
		onCustomChanged = function(p2)
			-- upvalues: state (ref)
			state.draft.setText(p2)
		end,
		onForward = function()
			-- upvalues: isSubmitting (ref), var5 (ref), onSubmitText (ref), state (ref), question (ref), var8 (ref), actions (ref)
			if isSubmitting then return end
			if var5 then
				onSubmitText(state.toolCallId, question.id, var8)
				
				return
			end
			local toolCallId = actions.onAnswerConfirmedByToolCallId[state.toolCallId]
			
			if toolCallId ~= nil then
				toolCallId()
			end
		end,
		onStop = p1.onStop
	}
end