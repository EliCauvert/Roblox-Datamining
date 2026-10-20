local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(script.Parent.AnswerFormView)

return function(Frame)
	-- upvalues: ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), FoundationModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy)
	local State = Frame.state
	local Draft = if State then State.draft else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Draft (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Draft (upval)
			return if Draft then Draft.getText(p1) else nil
		end)
	end, { Draft })))
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = UseLocalizationFunction({
		customOption = LocalizationStringsModule.ANSWER_FORM_CUSTOM_OPTION,
		progress = {
			"CommonUI.Controls.Label.PageCount",
			["current:int"] = if State then State.questionIndex else 0,
			["total:int"] = if State then State.questionCount else 0
		}
	})
	
	if State == nil then
		return nil
	end
	assert(Frame.actions ~= nil and (Frame.onSubmitText ~= nil and Frame.onStop ~= nil), "Active answer form requires actions")
	local Actions = Frame.actions
	local OnSubmitTextFunction = Frame.onSubmitText
	local Question = State.question
	local IsMultiSelect = Question.responseType == "multi_select"
	local IsCustom: boolean = #Question.options == 0 or UseSignalStateResult ~= nil
	local Text = UseSignalStateResult or ""
	local SelectedOptionId = State.selectedOptionId
	local Options = {}
	
	for _, option in Question.options do
		table.insert(Options, {
			id = option.id,
			title = option.title,
			description = option.description,
			isSelected = not IsCustom and (if typeof(SelectedOptionId) == "table" then table.find(SelectedOptionId, option.id) ~= nil else SelectedOptionId == option.id),
			onActivated = function()
				-- upvalues: State (copy), Actions (copy), IsCustom (copy), Question (copy), option (copy)
				if State.isSubmitting then return end
				State.draft.setText(nil)
				local OnAnswerSelectedByToolCallIdEntry: (any, any, any) -> () = Actions.onAnswerSelectedByToolCallId[State.toolCallId]
				
				if OnAnswerSelectedByToolCallIdEntry ~= nil then
					if IsCustom then
						OnAnswerSelectedByToolCallIdEntry(Question, option, true)
						
						return
					end
					OnAnswerSelectedByToolCallIdEntry(Question, option)
				end
			end
		})
	end
	local Match: string = string.match(Text, "^%s*(.-)%s*$") or ""
	local v1: boolean = typeof(SelectedOptionId) == "table" and #SelectedOptionId > 0
	local IsSubmitting = State.isSubmitting or (if IsCustom then Match == "" else not v1)
	
	return {
		LayoutOrder = Frame.LayoutOrder,
		title = Question.question,
		options = Options,
		isMultiSelect = IsMultiSelect,
		isSubmitting = State.isSubmitting,
		isCustom = IsCustom,
		customText = Text,
		customLabel = UseLocalizationResult.customOption,
		progressText = UseLocalizationResult.progress,
		errorText = Frame.errorText,
		showForward = IsMultiSelect or IsCustom,
		isForwardDisabled = IsSubmitting,
		footerInset = UseTokensResult.Padding.Small,
		onCustomActivated = function()
			-- upvalues: State (copy)
			if not State.isSubmitting then
				State.draft.setText("")
			end
		end,
		onCustomChanged = function(p1)
			-- upvalues: State (copy)
			State.draft.setText(p1)
		end,
		onForward = function()
			-- upvalues: IsSubmitting (copy), IsCustom (copy), OnSubmitTextFunction (copy), State (copy), Question (copy), Match (copy), Actions (copy)
			if IsSubmitting then return end
			if IsCustom then
				OnSubmitTextFunction(State.toolCallId, Question.id, Match)
				
				return
			end
			local OnAnswerConfirmedByToolCallIdEntry: () -> () = Actions.onAnswerConfirmedByToolCallId[State.toolCallId]
			
			if OnAnswerConfirmedByToolCallIdEntry ~= nil then
				OnAnswerConfirmedByToolCallIdEntry()
			end
		end,
		onStop = Frame.onStop
	}
end