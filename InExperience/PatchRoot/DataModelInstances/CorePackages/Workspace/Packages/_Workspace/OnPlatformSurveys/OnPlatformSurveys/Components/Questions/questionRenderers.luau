local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local reactModule = require(onPlatformSurveys.Parent.React)
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local multipleChoiceQuestionModule = require(onPlatformSurveys.Components.Questions.MultipleChoiceQuestion)
local thumbsQuestionModule = require(onPlatformSurveys.Components.Questions.ThumbsQuestion)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

local function isThumbsQuestion(p0) --[[ line: 35 ]]
	-- upvalues: inlineQuestionTypeModule (ref)
	if p0.type ~= inlineQuestionTypeModule.MultipleChoiceSingle then
		return false
	end
	local choices = p0.choices
	
	if choices == nil or #choices ~= 2 then
		return false
	end
	local t = {}
	
	for i, v in choices do
		t[v.id] = true
	end
	return t["1"] == true and t["2"] == true
end

return {
	renderQuestion = function(p1) --[[ line: 50 ]]
		-- upvalues: isThumbsQuestion (ref), reactModule (ref), thumbsQuestionModule (ref), inlineQuestionTypeModule (ref), multipleChoiceQuestionModule (ref)
		local question = p1.question
		
		return if isThumbsQuestion(question) then reactModule.createElement(thumbsQuestionModule, p1) elseif question.type == inlineQuestionTypeModule.MultipleChoiceSingle or question.type == inlineQuestionTypeModule.MultipleChoiceMulti then reactModule.createElement(multipleChoiceQuestionModule, {
			question = question,
			answer = p1.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.isDisabled,
			layoutOrder = p1.layoutOrder
		}) else nil
	end,
	isThumbsQuestion = isThumbsQuestion
}