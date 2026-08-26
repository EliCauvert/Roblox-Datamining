local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local list = foundationModule.List
local listItemInputType = foundationModule.Enums.ListItemInputType
local textInput = foundationModule.TextInput
local view = foundationModule.View
local fFlagInlineSurveyChoiceTextEntry = require(parent.SharedFlags).FFlagInlineSurveyChoiceTextEntry
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t_1 = {}

return reactModule.memo(function(p1)
	-- upvalues: inlineQuestionTypeModule (ref), t_1 (ref), reactModule (ref), t (ref), list (ref), fFlagInlineSurveyChoiceTextEntry (ref), inlineSurveyHelpersModule (ref), listItemInputType (ref), textInput (ref), view (ref)
	local question = p1.question
	local answer = p1.answer
	local onAnswerChanged = p1.onAnswerChanged
	local var1 = p1.isDisabled == true
	local var2 = question.type == inlineQuestionTypeModule.MultipleChoiceMulti
	local choices = question.choices or t_1
	local var3 = reactModule.useMemo(function()
		-- upvalues: answer (ref), t (copy)
		local t_1 = {}
		
		for i, v in answer.choiceIds or t do
			t_1[v] = true
		end
		return t_1
	end, { answer })
	local var4 = reactModule.useRef(answer)
	var4.current = answer
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Choices = reactModule.createElement(list.Root, {
			LayoutOrder = 1,
			hasDivider = { hasDivider = true, isInset = false },
			isContained = { isContained = false, hasMargin = false }
		}, reactModule.useMemo(function()
			-- upvalues: choices (ref), reactModule (copy), list (copy), fFlagInlineSurveyChoiceTextEntry (copy), var1 (ref), onAnswerChanged (ref), inlineSurveyHelpersModule (copy), answer (ref), var2 (ref), listItemInputType (copy), var3 (ref), textInput (copy), var4 (ref)
			local t = {}
			
			for i, v in choices do
				local id = v.id
				t[string.format("Choice_%d_%s", i, id)] = reactModule.createElement(list.Item, {
					title = v.label,
					LayoutOrder = if fFlagInlineSurveyChoiceTextEntry then i * 2 else i,
					onActivated = {
						onActivated = function()
							-- upvalues: var1 (copy), onAnswerChanged (copy), inlineSurveyHelpersModule (copy), answer (copy), id (ref), var2 (copy), fFlagInlineSurveyChoiceTextEntry (copy)
							if var1 then
								return
							end
							onAnswerChanged({
								choiceIds = inlineSurveyHelpersModule.toggleChoice(answer, id, var2),
								choiceTexts = if fFlagInlineSurveyChoiceTextEntry then answer.choiceTexts else nil
							})
						end,
						inputType = if var2 then listItemInputType.Checkbox else listItemInputType.Radio,
						isChecked = var3[id] == true
					}
				})
				
				if fFlagInlineSurveyChoiceTextEntry and v.requiresText == true then
					t[string.format("ChoiceText_%d_%s", i, id)] = reactModule.createElement(textInput, {
						label = "",
						text = if answer.choiceTexts ~= nil then "" else answer.choiceTexts[id] or "",
						width = UDim.new(1, 0),
						isDisabled = var1,
						LayoutOrder = i * 2 + 1,
						onChanged = function(p2)
							-- upvalues: var1 (copy), var4 (copy), id (ref), onAnswerChanged (copy)
							if var1 then
								return
							end
							local current = var4.current
							local var5 = if current.choiceTexts ~= nil then {} else table.clone(current.choiceTexts)
							var5[id] = p2
							onAnswerChanged({ choiceIds = current.choiceIds, choiceTexts = var5 })
						end
					})
				end
			end
			return t
		end, {
			choices, answer, var3, var2, var1, onAnswerChanged
		}))
	})
end)