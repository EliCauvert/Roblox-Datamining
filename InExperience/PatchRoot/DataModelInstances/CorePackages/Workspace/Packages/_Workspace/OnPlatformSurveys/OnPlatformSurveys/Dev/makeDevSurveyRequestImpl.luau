local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local promiseModule = require(onPlatformSurveys.Parent.Promise)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local list = {
	{
		questionId = "q1",
		title = "How would you rate your experience today?",
		required = true,
		type = require(onPlatformSurveys.Enums.InlineQuestionType).MultipleChoiceSingle,
		choices = {
			{ id = "great", label = "Great" },
			{ id = "ok", label = "Okay" },
			{ id = "bad", label = "Not great" }
		}
	}
}

local function _(p0) --[[ line: 43 | named "isResponseUrl" ]]
	return string.sub(p0, -16) == "/survey/response"
end

return {
	SURVEY_ID = "dev-survey",
	RESPONSE_DELAY_SECONDS = 0.4,
	makeRequestImpl = function() --[[ line: 48 ]]
		-- upvalues: promiseModule (ref), list (ref)
		return function(p1, _, _) --[[ line: 49 ]]
			-- upvalues: promiseModule (copy), list (copy)
			return promiseModule.new(function(p2) --[[ line: 50 ]]
				-- upvalues: p1 (ref), list (copy)
				task.delay(0.4, function() --[[ line: 51 ]]
					-- upvalues: p1 (copy), p2 (ref), list (copy)
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
							surveyId = "dev-survey",
							shouldPromptSurvey = true,
							questions = list
						}
					})
				end)
			end)
		end
	end,
	QUESTIONS = list
}