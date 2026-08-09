local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t_1 = {}

local function _(p0) --[[ line: 15 | named "trim" ]]
	return p0:gsub("^%s*(.-)%s*$", "%1")
end

local function buildResponse(p1, p2) --[[ line: 32 ]]
	-- upvalues: inlineQuestionTypeModule (ref)
	if p1.type == inlineQuestionTypeModule.Text then
		local var5 = (p2.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if var5 == "" then nil else { text = var5 }
	end
	local choiceIds = p2.choiceIds or {}
	
	return if #choiceIds == 0 then nil else { choiceIds = choiceIds }
end

return {
	isAnswerComplete = function(p3, p4) --[[ line: 20 ]]
		-- upvalues: inlineQuestionTypeModule (ref)
		return p3.type == inlineQuestionTypeModule.Text or (if p3.type == inlineQuestionTypeModule.MultipleChoiceSingle then p4.choiceIds ~= nil and #p4.choiceIds == 1 else p3.type == inlineQuestionTypeModule.MultipleChoiceMulti and (p4.choiceIds ~= nil and #p4.choiceIds >= 1))
	end,
	buildSubmitPayload = function(p5, p6, p7, p8) --[[ line: 49 ]]
		-- upvalues: t (ref), buildResponse (ref)
		local t_1 = {}
		
		for i, v in p6 do
			local var8 = buildResponse(v, p7[v.questionId] or t)
			
			if var8 ~= nil then
				table.insert(t_1, {
					questionId = v.questionId,
					type = v.type,
					response = var8
				})
			end
		end
		return { surveyId = p5, idempotencyKey = p8, answers = t_1 }
	end,
	canSubmitAll = function(p9, p10) --[[ line: 75 ]]
		-- upvalues: t (ref), inlineQuestionTypeModule (ref)
		for i, v in p9 do
			if v.required == true then
				local var10
				local questionId = p10[v.questionId] or t
				
				if v.type == inlineQuestionTypeModule.Text then
					var10 = true
				elseif v.type == inlineQuestionTypeModule.MultipleChoiceSingle then
					var10 = false
					
					if questionId.choiceIds ~= nil then
						var10 = #questionId.choiceIds == 1
						var10 = nil
					end
				elseif v.type == inlineQuestionTypeModule.MultipleChoiceMulti then
					var10 = false
					
					if questionId.choiceIds ~= nil then
						var10 = #questionId.choiceIds >= 1
						var10 = nil
					end
				else
					var10 = false
				end
				if not var10 then
					return false
				end
			end
		end
		return true
	end,
	mergeCurrentAnswerIntoBatch = function(p11, p12, p13) --[[ line: 88 ]]
		local cloned = table.clone(p11)
		
		if p12 ~= nil then
			cloned[p12.questionId] = p13
		end
		return cloned
	end,
	toggleChoice = function(p14, p15, p16) --[[ line: 101 ]]
		-- upvalues: t_1 (ref)
		if not p16 then
			return { p15 }
		end
		local t = {}
		local var13 = false
		
		for i, v in p14.choiceIds or t_1 do
			if v == p15 then
				var13 = true
			else
				table.insert(t, v)
			end
		end
		if not var13 then
			table.insert(t, p15)
		end
		return t
	end
}