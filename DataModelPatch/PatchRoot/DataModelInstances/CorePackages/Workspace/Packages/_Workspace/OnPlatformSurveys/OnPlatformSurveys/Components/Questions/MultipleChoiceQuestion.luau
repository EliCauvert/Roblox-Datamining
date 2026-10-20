local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local List = FoundationModule.List
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local View = FoundationModule.View
local InlineSurveyHelpersModule = require(OnPlatformSurveys.Utils.inlineSurveyHelpers)
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t1 = {}

return ReactModule.memo(function(p1)
	-- upvalues: InlineQuestionTypeModule (copy), t1 (copy), ReactModule (copy), t (copy), List (copy), InlineSurveyHelpersModule (copy), ListItemInputType (copy), View (copy)
	local Question = p1.question
	local Answer = p1.answer
	local OnAnswerChangedFunction = p1.onAnswerChanged
	local IsIsDisabled = p1.isDisabled == true
	local IsTypeMatch = Question.type == InlineQuestionTypeModule.MultipleChoiceMulti
	local Choices = Question.choices or t1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Answer (copy), t (upval)
		local t2 = {}
		local ChoiceIds = Answer.choiceIds or t
		for _, choiceId in ChoiceIds do
			t2[choiceId] = true
		end
		return t2
	end, { Answer })
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Choices = ReactModule.createElement(List.Root, {
			LayoutOrder = 1,
			hasDivider = { hasDivider = true, isInset = false },
			isContained = { isContained = false, hasMargin = false }
		}, (ReactModule.useMemo(function()
			-- upvalues: Choices (copy), ReactModule (upval), List (upval), IsIsDisabled (copy), OnAnswerChangedFunction (copy), InlineSurveyHelpersModule (upval), Answer (copy), IsTypeMatch (copy), ListItemInputType (upval), UseMemoResult (copy)
			local Elements = {}
			
			for LayoutOrder, choice in Choices do
				local Id = choice.id
				Elements[string.format("Choice_%d_%s", LayoutOrder, Id)] = ReactModule.createElement(List.Item, {
					title = choice.label,
					LayoutOrder = LayoutOrder,
					onActivated = {
						onActivated = function()
							-- upvalues: IsIsDisabled (upval), OnAnswerChangedFunction (upval), InlineSurveyHelpersModule (upval), Answer (upval), Id (copy), IsTypeMatch (upval)
							if not IsIsDisabled then
								OnAnswerChangedFunction({
									choiceIds = InlineSurveyHelpersModule.toggleChoice(Answer, Id, IsTypeMatch)
								})
								
								return
							end
						end,
						inputType = if IsTypeMatch then ListItemInputType.Checkbox else ListItemInputType.Radio,
						isChecked = UseMemoResult[Id] == true
					}
				})
			end
			return Elements
		end, {
			Choices, Answer, UseMemoResult, IsTypeMatch, IsIsDisabled,
			OnAnswerChangedFunction
		})))
	})
end)