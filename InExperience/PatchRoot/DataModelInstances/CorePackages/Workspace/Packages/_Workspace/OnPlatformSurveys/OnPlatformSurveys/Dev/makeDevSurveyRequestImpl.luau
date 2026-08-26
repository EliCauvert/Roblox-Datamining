local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local promiseModule = require(onPlatformSurveys.Parent.Promise)
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local list = {
	{
		questionId = "q1",
		title = "How would you rate your experience today?",
		required = true,
		type = inlineQuestionTypeModule.MultipleChoiceSingle,
		choices = {
			{ id = "great", label = "Great" },
			{ id = "ok", label = "Okay" },
			{ id = "bad", label = "Not great" }
		}
	}
}
local list_1 = {
	{
		questionId = "rating",
		title = "How would you rate your experience today?",
		required = true,
		type = inlineQuestionTypeModule.MultipleChoiceSingle,
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
		type = inlineQuestionTypeModule.MultipleChoiceMulti,
		choices = {
			{ id = "performance", label = "Performance" },
			{ id = "bugs", label = "Bugs" },
			{ id = "confusing", label = "Confusing to use" }
		}
	},
	{
		questionId = "details",
		title = "Anything else you'd like to share?",
		type = inlineQuestionTypeModule.Text
	}
}

local function _(p1)
	return string.sub(p1, -16) == "/survey/response"
end

local _ = function(p1, p2)
	-- upvalues: promiseModule (ref)
	return function(p3, _, _)
		-- upvalues: promiseModule (copy), p1 (ref), p2 (ref)
		return promiseModule.new(function(p4)
			-- upvalues: p3 (ref), p1 (copy), p2 (copy)
			task.delay(0.4, function()
				-- upvalues: p3 (copy), p4 (ref), p1 (copy), p2 (copy)
				if string.sub(p3, -16) == "/survey/response" then
					p4({
						responseCode = 200,
						responseBody = { responseId = "dev-response" }
					})
					
					return
				end
				p4({
					responseCode = 200,
					responseBody = { shouldPromptSurvey = true, surveyId = p1, questions = p2 }
				})
			end)
		end)
	end
end

return {
	SURVEY_ID = "dev-survey",
	BRANCHING_SURVEY_ID = "dev-branching-survey",
	RESPONSE_DELAY_SECONDS = 0.4,
	makeRequestImpl = function()
		-- upvalues: list (ref), promiseModule (ref)
		local var1 = "dev-survey"
		
		return function(p1, _, _)
			-- upvalues: promiseModule (copy), var1 (ref), list (ref)
			return promiseModule.new(function(p2)
				-- upvalues: p1 (ref), var1 (copy), list (copy)
				task.delay(0.4, function()
					-- upvalues: p1 (copy), p2 (ref), var1 (copy), list (copy)
					if string.sub(p1, -16) == "/survey/response" then
						p2({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					end
					p2({
						responseCode = 200,
						responseBody = {
							shouldPromptSurvey = true,
							surveyId = var1,
							questions = list
						}
					})
				end)
			end)
		end
	end,
	makeBranchingRequestImpl = function()
		-- upvalues: list_1 (ref), promiseModule (ref)
		local var1 = "dev-branching-survey"
		
		return function(p1, _, _)
			-- upvalues: promiseModule (copy), var1 (ref), list_1 (ref)
			return promiseModule.new(function(p2)
				-- upvalues: p1 (ref), var1 (copy), list_1 (copy)
				task.delay(0.4, function()
					-- upvalues: p1 (copy), p2 (ref), var1 (copy), list_1 (copy)
					if string.sub(p1, -16) == "/survey/response" then
						p2({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					end
					p2({
						responseCode = 200,
						responseBody = {
							shouldPromptSurvey = true,
							surveyId = var1,
							questions = list_1
						}
					})
				end)
			end)
		end
	end,
	QUESTIONS = list,
	BRANCHING_QUESTIONS = list_1
}