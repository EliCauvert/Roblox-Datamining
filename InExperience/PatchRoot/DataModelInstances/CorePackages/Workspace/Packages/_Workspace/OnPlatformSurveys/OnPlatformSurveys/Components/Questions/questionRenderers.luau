local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagInlineSurveyEnhancements = sharedFlagsModule.FFlagInlineSurveyEnhancements
local fFlagInlineSurveyChoiceTextEntry = sharedFlagsModule.FFlagInlineSurveyChoiceTextEntry
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local multipleChoiceQuestionModule = require(onPlatformSurveys.Components.Questions.MultipleChoiceQuestion)
local textQuestionModule = require(onPlatformSurveys.Components.Questions.TextQuestion)
local thumbsQuestionModule = require(onPlatformSurveys.Components.Questions.ThumbsQuestion)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

local function isThumbsQuestion(p0)
	-- upvalues: inlineQuestionTypeModule (ref), fFlagInlineSurveyChoiceTextEntry (ref)
	if p0.type ~= inlineQuestionTypeModule.MultipleChoiceSingle then
		return false
	end
	local choices = p0.choices
	
	if choices == nil or #choices ~= 2 then
		return false
	elseif fFlagInlineSurveyChoiceTextEntry then
		for i, v in choices do
			if v.requiresText == true then
				return false
			end
		end
	end
	local t = {}
	
	for v, v in choices do
		t[v.id] = true
	end
	return t["1"] == true and t["2"] == true
end

return {
	renderQuestion = function(p1)
		-- upvalues: isThumbsQuestion (ref), reactModule (ref), thumbsQuestionModule (ref), fFlagInlineSurveyEnhancements (ref), inlineQuestionTypeModule (ref), textQuestionModule (ref), multipleChoiceQuestionModule (ref)
		local question = p1.question
		
		return if isThumbsQuestion(question) then reactModule.createElement(thumbsQuestionModule, p1) elseif fFlagInlineSurveyEnhancements and question.type == inlineQuestionTypeModule.Text then reactModule.createElement(textQuestionModule, {
			answer = p1.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.isDisabled,
			layoutOrder = p1.layoutOrder
		}) elseif question.type == inlineQuestionTypeModule.MultipleChoiceSingle or question.type == inlineQuestionTypeModule.MultipleChoiceMulti then reactModule.createElement(multipleChoiceQuestionModule, {
			question = question,
			answer = p1.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.isDisabled,
			layoutOrder = p1.layoutOrder
		}) else nil
	end,
	isThumbsQuestion = isThumbsQuestion
}