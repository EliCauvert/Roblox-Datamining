local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local PromiseModule = require(OnPlatformSurveys.Parent.Promise)
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local list = {
	{
		questionId = "q1",
		title = "How would you rate your experience today?",
		required = true,
		type = InlineQuestionTypeModule.MultipleChoiceSingle,
		choices = {
			{ id = "great", label = "Great" },
			{ id = "ok", label = "Okay" },
			{ id = "bad", label = "Not great" }
		}
	}
}
local Questions = {
	{
		questionId = "rating",
		title = "How would you rate your experience today?",
		required = true,
		type = InlineQuestionTypeModule.MultipleChoiceSingle,
		choices = {
			{ id = "great", label = "Great", next = "details" },
			{ id = "ok", label = "Okay", next = "details" },
			{ id = "bad", label = "Not great", next = "issues" }
		}
	},
	{
		questionId = "issues",
		title = "What went wrong?",
		required = true,
		type = InlineQuestionTypeModule.MultipleChoiceMulti,
		choices = {
			{ id = "performance", label = "Performance" },
			{ id = "bugs", label = "Bugs" },
			{ id = "confusing", label = "Confusing to use" }
		}
	},
	{
		questionId = "details",
		title = "Anything else you'd like to share?",
		type = InlineQuestionTypeModule.Text
	}
}

local function _(Text: string): boolean
	return string.sub(Text, -16) == "/survey/response"
end

local _ = function(SurveyId, p1)
	-- upvalues: PromiseModule (copy)
	return function(Text, _, _)
		-- upvalues: PromiseModule (upval), SurveyId (copy), p1 (copy)
		return PromiseModule.new(function(Callback)
			-- upvalues: Text (copy), SurveyId (upval), p1 (upval)
			task.delay(0.4, function()
				-- upvalues: Text (upval), Callback (copy), SurveyId (upval), p1 (upval)
				if string.sub(Text, -16) == "/survey/response" then
					Callback({
						responseCode = 200,
						responseBody = { responseId = "dev-response" }
					})
					
					return
				else
					Callback({
						responseCode = 200,
						responseBody = {
							shouldPromptSurvey = true,
							surveyId = SurveyId,
							questions = p1
						}
					})
				end
			end)
		end)
	end
end

return {
	SURVEY_ID = "dev-survey",
	BRANCHING_SURVEY_ID = "dev-branching-survey",
	RESPONSE_DELAY_SECONDS = 0.4,
	makeRequestImpl = function()
		-- upvalues: list (copy), PromiseModule (copy)
		local SurveyId = "dev-survey"
		
		return function(Text, _, _)
			-- upvalues: PromiseModule (upval), SurveyId (copy), list (copy)
			return PromiseModule.new(function(Callback)
				-- upvalues: Text (copy), SurveyId (upval), list (upval)
				task.delay(0.4, function()
					-- upvalues: Text (upval), Callback (copy), SurveyId (upval), list (upval)
					if string.sub(Text, -16) == "/survey/response" then
						Callback({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					else
						Callback({
							responseCode = 200,
							responseBody = {
								shouldPromptSurvey = true,
								surveyId = SurveyId,
								questions = list
							}
						})
					end
				end)
			end)
		end
	end,
	makeBranchingRequestImpl = function()
		-- upvalues: Questions (copy), PromiseModule (copy)
		local SurveyId = "dev-branching-survey"
		
		return function(Text, _, _)
			-- upvalues: PromiseModule (upval), SurveyId (copy), Questions (copy)
			return PromiseModule.new(function(Callback)
				-- upvalues: Text (copy), SurveyId (upval), Questions (upval)
				task.delay(0.4, function()
					-- upvalues: Text (upval), Callback (copy), SurveyId (upval), Questions (upval)
					if string.sub(Text, -16) == "/survey/response" then
						Callback({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					else
						Callback({
							responseCode = 200,
							responseBody = {
								shouldPromptSurvey = true,
								surveyId = SurveyId,
								questions = Questions
							}
						})
					end
				end)
			end)
		end
	end,
	QUESTIONS = list,
	BRANCHING_QUESTIONS = Questions
}