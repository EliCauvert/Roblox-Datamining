local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagInlineSurveyEnhancements = SharedFlagsModule.FFlagInlineSurveyEnhancements
local FFlagInlineSurveyChoiceTextEntry = SharedFlagsModule.FFlagInlineSurveyChoiceTextEntry
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local MultipleChoiceQuestionModule = require(OnPlatformSurveys.Components.Questions.MultipleChoiceQuestion)
local TextQuestionModule = require(OnPlatformSurveys.Components.Questions.TextQuestion)
local ThumbsQuestionModule = require(OnPlatformSurveys.Components.Questions.ThumbsQuestion)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)

local function isThumbsQuestion(Question): boolean --[[ Line: 35 ]]
	-- upvalues: InlineQuestionTypeModule (copy), FFlagInlineSurveyChoiceTextEntry (copy)
	if Question.type ~= InlineQuestionTypeModule.MultipleChoiceSingle then
		return false
	end
	local Choices = Question.choices
	
	if Choices == nil or #Choices ~= 2 then
		return false
	end
	if FFlagInlineSurveyChoiceTextEntry then
		for _, choice in Choices do
			if choice.requiresText == true then
				return false
			end
		end
	end
	local t = {}
	
	for _, choice1 in Choices do
		t[choice1.id] = true
	end
	return t["1"] == true and t["2"] == true
end

return {
	renderQuestion = function(p1) --[[ Line: 58 ]]
		-- upvalues: isThumbsQuestion (copy), ReactModule (copy), ThumbsQuestionModule (copy), FFlagInlineSurveyEnhancements (copy), InlineQuestionTypeModule (copy), TextQuestionModule (copy), MultipleChoiceQuestionModule (copy)
		local Question = p1.question
		
		return if isThumbsQuestion(Question) then ReactModule.createElement(ThumbsQuestionModule, p1) elseif FFlagInlineSurveyEnhancements and Question.type == InlineQuestionTypeModule.Text then ReactModule.createElement(TextQuestionModule, {
			answer = p1.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.isDisabled,
			layoutOrder = p1.layoutOrder
		}) elseif Question.type == InlineQuestionTypeModule.MultipleChoiceSingle or Question.type == InlineQuestionTypeModule.MultipleChoiceMulti then ReactModule.createElement(MultipleChoiceQuestionModule, {
			question = Question,
			answer = p1.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.isDisabled,
			layoutOrder = p1.layoutOrder
		}) else nil
	end,
	isThumbsQuestion = isThumbsQuestion
}