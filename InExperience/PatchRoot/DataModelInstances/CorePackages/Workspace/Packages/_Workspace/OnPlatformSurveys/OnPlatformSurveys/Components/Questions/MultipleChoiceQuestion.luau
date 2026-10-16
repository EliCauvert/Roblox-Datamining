local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local List = FoundationModule.List
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local FFlagInlineSurveyChoiceTextEntry = require(Parent.SharedFlags).FFlagInlineSurveyChoiceTextEntry
local InlineSurveyHelpersModule = require(OnPlatformSurveys.Utils.inlineSurveyHelpers)
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t1 = {}

return ReactModule.memo(function(p1) --[[ Line: 33 | Named "MultipleChoiceQuestion" ]]
	-- upvalues: InlineQuestionTypeModule (copy), t1 (copy), ReactModule (copy), t (copy), List (copy), FFlagInlineSurveyChoiceTextEntry (copy), InlineSurveyHelpersModule (copy), ListItemInputType (copy), TextInput (copy), View (copy)
	local Question = p1.question
	local Answer = p1.answer
	local OnAnswerChangedFunction = p1.onAnswerChanged
	local IsIsDisabled = p1.isDisabled == true
	local IsTypeMatch = Question.type == InlineQuestionTypeModule.MultipleChoiceMulti
	local Choices = Question.choices or t1
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: Answer (copy), t (upval)
		local t2 = {}
		local ChoiceIds = Answer.choiceIds or t
		for _, choiceId in ChoiceIds do
			t2[choiceId] = true
		end
		return t2
	end, { Answer })
	local UseRefResult = ReactModule.useRef(Answer)
	UseRefResult.current = Answer
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Choices = ReactModule.createElement(List.Root, {
			LayoutOrder = 1,
			hasDivider = { hasDivider = true, isInset = false },
			isContained = { isContained = false, hasMargin = false }
		}, (ReactModule.useMemo(function() --[[ Line: 53 ]]
			-- upvalues: Choices (copy), ReactModule (upval), List (upval), FFlagInlineSurveyChoiceTextEntry (upval), IsIsDisabled (copy), OnAnswerChangedFunction (copy), InlineSurveyHelpersModule (upval), Answer (copy), IsTypeMatch (copy), ListItemInputType (upval), UseMemoResult (copy), TextInput (upval), UseRefResult (copy)
			local Elements = {}
			
			for i, choice in Choices do
				local Id = choice.id
				Elements[string.format("Choice_%d_%s", i, Id)] = ReactModule.createElement(List.Item, {
					title = choice.label,
					LayoutOrder = if FFlagInlineSurveyChoiceTextEntry then i * 2 else i,
					onActivated = {
						onActivated = function() --[[ Line: 63 ]]
							-- upvalues: IsIsDisabled (upval), OnAnswerChangedFunction (upval), InlineSurveyHelpersModule (upval), Answer (upval), Id (copy), IsTypeMatch (upval), FFlagInlineSurveyChoiceTextEntry (upval)
							if not IsIsDisabled then
								OnAnswerChangedFunction({
									choiceIds = InlineSurveyHelpersModule.toggleChoice(Answer, Id, IsTypeMatch),
									choiceTexts = if FFlagInlineSurveyChoiceTextEntry then Answer.choiceTexts else nil
								})
								
								return
							end
						end,
						inputType = if IsTypeMatch then ListItemInputType.Checkbox else ListItemInputType.Radio,
						isChecked = UseMemoResult[Id] == true
					}
				})
				
				if FFlagInlineSurveyChoiceTextEntry and choice.requiresText == true then
					Elements[string.format("ChoiceText_%d_%s", i, Id)] = ReactModule.createElement(TextInput, {
						label = "",
						text = if Answer.choiceTexts == nil then "" else Answer.choiceTexts[Id] or "",
						width = UDim.new(1, 0),
						isDisabled = IsIsDisabled,
						LayoutOrder = i * 2 + 1,
						onChanged = function(p2) --[[ Line: 85 ]]
							-- upvalues: IsIsDisabled (upval), UseRefResult (upval), Id (copy), OnAnswerChangedFunction (upval)
							if not IsIsDisabled then
								local Current = UseRefResult.current
								local T = if Current.choiceTexts == nil then {} else table.clone(Current.choiceTexts)
								T[Id] = p2
								OnAnswerChangedFunction({ choiceIds = Current.choiceIds, choiceTexts = T })
								
								return
							end
						end
					})
				end
			end
			return Elements
		end, {
			Choices, Answer, UseMemoResult, IsTypeMatch, IsIsDisabled,
			OnAnswerChangedFunction
		})))
	})
end)