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

return reactModule.memo(function(p0)
	-- upvalues: inlineQuestionTypeModule (ref), t_1 (ref), reactModule (ref), t (ref), list (ref), fFlagInlineSurveyChoiceTextEntry (ref), inlineSurveyHelpersModule (ref), listItemInputType (ref), textInput (ref), view (ref)
	local question = p0.question
	local answer = p0.answer
	local onAnswerChanged = p0.onAnswerChanged
	local var7 = p0.isDisabled == true
	local var8 = question.type == inlineQuestionTypeModule.MultipleChoiceMulti
	local choices = question.choices or t_1
	local var10 = reactModule.useMemo(function()
		-- upvalues: answer (ref), t (copy)
		local t_1 = {}
		
		for i, v in answer.choiceIds or t do
			t_1[v] = true
		end
		return t_1
	end, { answer })
	local var11 = reactModule.useRef(answer)
	var11.current = answer
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Choices = reactModule.createElement(list.Root, {
			LayoutOrder = 1,
			hasDivider = { hasDivider = true, isInset = false },
			isContained = { isContained = false, hasMargin = false }
		}, reactModule.useMemo(function()
			-- upvalues: choices (ref), reactModule (copy), list (copy), fFlagInlineSurveyChoiceTextEntry (copy), var7 (ref), onAnswerChanged (ref), inlineSurveyHelpersModule (copy), answer (ref), var8 (ref), listItemInputType (copy), var10 (ref), textInput (copy), var11 (ref)
			local t = {}
			
			for i, v in choices do
				local id = v.id
				t[string.format("Choice_%d_%s", i, id)] = reactModule.createElement(list.Item, {
					title = v.label,
					LayoutOrder = if fFlagInlineSurveyChoiceTextEntry then i * 2 else i,
					onActivated = {
						onActivated = function()
							-- upvalues: var7 (copy), onAnswerChanged (copy), inlineSurveyHelpersModule (copy), answer (copy), id (ref), var8 (copy), fFlagInlineSurveyChoiceTextEntry (copy)
							if var7 then
								return
							end
							onAnswerChanged({
								choiceIds = inlineSurveyHelpersModule.toggleChoice(answer, id, var8),
								choiceTexts = if fFlagInlineSurveyChoiceTextEntry then answer.choiceTexts else nil
							})
						end,
						inputType = if var8 then listItemInputType.Checkbox else listItemInputType.Radio,
						isChecked = var10[id] == true
					}
				})
				
				if fFlagInlineSurveyChoiceTextEntry and v.requiresText == true then
					t[string.format("ChoiceText_%d_%s", i, id)] = reactModule.createElement(textInput, {
						label = "",
						text = if answer.choiceTexts ~= nil then "" else answer.choiceTexts[id] or "",
						width = UDim.new(1, 0),
						isDisabled = var7,
						LayoutOrder = i * 2 + 1,
						onChanged = function(p1)
							-- upvalues: var7 (copy), var11 (copy), id (ref), onAnswerChanged (copy)
							if var7 then
								return
							end
							local current = var11.current
							local var14 = if current.choiceTexts ~= nil then {} else table.clone(current.choiceTexts)
							var14[id] = p1
							onAnswerChanged({ choiceIds = current.choiceIds, choiceTexts = var14 })
						end
					})
				end
			end
			return t
		end, {
			choices, answer, var10, var8, var7, onAnswerChanged
		}))
	})
end)