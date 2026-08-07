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

local function _(p0) --[[ line: 77 | named "isResponseUrl" ]]
	return string.sub(p0, -16) == "/survey/response"
end

local _ = function(p1, p2) --[[ line: 82 | named "makeRequestImplFor" ]]
	-- upvalues: promiseModule (ref)
	return function(p3, _, _) --[[ line: 83 ]]
		-- upvalues: promiseModule (copy), p1 (ref), p2 (ref)
		return promiseModule.new(function(p4) --[[ line: 84 ]]
			-- upvalues: p3 (ref), p1 (copy), p2 (copy)
			task.delay(0.4, function() --[[ line: 85 ]]
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
	makeRequestImpl = function() --[[ line: 108 ]]
		-- upvalues: list (ref), promiseModule (ref)
		local var5 = "dev-survey"
		
		return function(p5, _, _) --[[ line: 83 ]]
			-- upvalues: promiseModule (copy), var5 (ref), list (ref)
			return promiseModule.new(function(p6) --[[ line: 84 ]]
				-- upvalues: p5 (ref), var5 (copy), list (copy)
				task.delay(0.4, function() --[[ line: 85 ]]
					-- upvalues: p5 (copy), p6 (ref), var5 (copy), list (copy)
					if string.sub(p5, -16) == "/survey/response" then
						p6({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					end
					p6({
						responseCode = 200,
						responseBody = {
							shouldPromptSurvey = true,
							surveyId = var5,
							questions = list
						}
					})
				end)
			end)
		end
	end,
	makeBranchingRequestImpl = function() --[[ line: 112 ]]
		-- upvalues: list_1 (ref), promiseModule (ref)
		local var6 = "dev-branching-survey"
		
		return function(p7, _, _) --[[ line: 83 ]]
			-- upvalues: promiseModule (copy), var6 (ref), list_1 (ref)
			return promiseModule.new(function(p8) --[[ line: 84 ]]
				-- upvalues: p7 (ref), var6 (copy), list_1 (copy)
				task.delay(0.4, function() --[[ line: 85 ]]
					-- upvalues: p7 (copy), p8 (ref), var6 (copy), list_1 (copy)
					if string.sub(p7, -16) == "/survey/response" then
						p8({
							responseCode = 200,
							responseBody = { responseId = "dev-response" }
						})
						
						return
					end
					p8({
						responseCode = 200,
						responseBody = {
							shouldPromptSurvey = true,
							surveyId = var6,
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