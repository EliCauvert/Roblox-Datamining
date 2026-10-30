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
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local FFlagBuildExperienceAnswerFormStableInputModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerFormStableInput)

local function useStableCustomText(Current, UseSignalStateResult)
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Current and Current.getText() or "")
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseBindingResult (copy), UseBindingResult2 (copy)
		local Text = Current and Current.getText() or ""
		
		if UseBindingResult:getValue() ~= Text then
			UseBindingResult2(Text)
		end
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), Current (copy), UseBindingResult (copy), UseBindingResult2 (copy)
		if UseSignalStateResult == nil and (Current == nil or Current.getText() == nil) and UseBindingResult:getValue() ~= "" then
			UseBindingResult2("")
		end
	end, { UseSignalStateResult, Current })
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseBindingResult2 (copy), UseRefResult (copy)
		UseBindingResult2(p1 or "")
		
		if UseRefResult.current then
			UseRefResult.current.setText(p1)
		end
	end, {})
	
	return {
		binding = UseBindingResult,
		setText = UseResult,
		onChanged = ReactModule.useCallback(function(p1)
			-- upvalues: UseBindingResult (copy), UseResult (copy)
			if p1 ~= UseBindingResult:getValue() then
				UseResult(p1)
			end
		end, {})
	}
end

return function(Frame)
	-- upvalues: ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), FFlagBuildExperienceAnswerFormModule (copy), FFlagBuildExperienceAnswerFormStableInputModule (copy), useStableCustomText (copy), FoundationModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy)
	local State = Frame.state
	local Draft = if State then State.draft else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Draft (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Draft (upval)
			return if Draft then Draft.getText(p1) else nil
		end)
	end, { Draft })))
	local UseStableCustomTextResult = if FFlagBuildExperienceAnswerFormModule and FFlagBuildExperienceAnswerFormStableInputModule then useStableCustomText(Draft, UseSignalStateResult) else nil
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
	local SetText = if UseStableCustomTextResult then UseStableCustomTextResult.setText else State.draft.setText
	local OnSubmitTextFunction = Frame.onSubmitText
	local IsIsReadOnly = Frame.isReadOnly == true
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
				-- upvalues: State (copy), IsIsReadOnly (copy), SetText (copy), Actions (copy), IsCustom (copy), Question (copy), option (copy)
				if State.isSubmitting or IsIsReadOnly then return end
				SetText(nil)
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
	local IsSubmitting = State.isSubmitting or (IsIsReadOnly or (if IsCustom then Match == "" else not v1))
	
	return {
		LayoutOrder = Frame.LayoutOrder,
		title = Question.question,
		options = Options,
		isMultiSelect = IsMultiSelect,
		isSubmitting = State.isSubmitting,
		isReadOnly = IsIsReadOnly,
		isCustom = IsCustom,
		customText = Text,
		customTextBinding = if UseStableCustomTextResult then UseStableCustomTextResult.binding else nil,
		customLabel = UseLocalizationResult.customOption,
		progressText = UseLocalizationResult.progress,
		errorText = Frame.errorText,
		showForward = IsMultiSelect or IsCustom,
		isForwardDisabled = IsSubmitting,
		footerInset = UseTokensResult.Padding.Small,
		onCustomActivated = function()
			-- upvalues: State (copy), IsIsReadOnly (copy), SetText (copy)
			if not State.isSubmitting and not IsIsReadOnly then
				SetText("")
			end
		end,
		onCustomChanged = if UseStableCustomTextResult then UseStableCustomTextResult.onChanged else function(p1)
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