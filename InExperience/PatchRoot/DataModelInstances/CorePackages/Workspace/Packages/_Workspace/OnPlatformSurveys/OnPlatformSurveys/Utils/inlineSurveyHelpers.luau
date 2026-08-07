local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local fFlagInlineSurveyBranching = require(onPlatformSurveys.Parent.SharedFlags).FFlagInlineSurveyBranching
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local inlineSurveyTypesModule = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t_1 = {}

local function _(p0) --[[ line: 23 | named "trim" ]]
	return p0:gsub("^%s*(.-)%s*$", "%1")
end

local function isAnswerComplete(p1, p2) --[[ line: 28 ]]
	-- upvalues: inlineQuestionTypeModule (ref)
	return p1.type == inlineQuestionTypeModule.Text or (if p1.type == inlineQuestionTypeModule.MultipleChoiceSingle then p2.choiceIds ~= nil and #p2.choiceIds == 1 else p1.type == inlineQuestionTypeModule.MultipleChoiceMulti and (p2.choiceIds ~= nil and #p2.choiceIds >= 1))
end

local function buildResponse(p3, p4) --[[ line: 40 ]]
	-- upvalues: inlineQuestionTypeModule (ref)
	if p3.type == inlineQuestionTypeModule.Text then
		local var12 = (p4.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if var12 == "" then nil else { text = var12 }
	end
	local choiceIds = p4.choiceIds or {}
	
	return if #choiceIds == 0 then nil else { choiceIds = choiceIds }
end

local function buildSubmitPayload(p5, p6, p7, p8, p9) --[[ line: 57 ]]
	-- upvalues: t (ref), buildResponse (ref)
	local t_1 = {}
	
	for i, v in p6 do
		local var15 = buildResponse(v, p7[v.questionId] or t)
		
		if var15 ~= nil then
			table.insert(t_1, {
				questionId = v.questionId,
				type = v.type,
				response = var15
			})
		end
	end
	return {
		surveyId = p5,
		idempotencyKey = p8,
		answers = t_1,
		finished = if p9 ~= nil then nil else p9.finished
	}
end

local function canSubmitAll(p10, p11) --[[ line: 85 ]]
	-- upvalues: t (ref), inlineQuestionTypeModule (ref)
	for i, v in p10 do
		if v.required == true then
			local var17
			local questionId = p11[v.questionId] or t
			
			if v.type == inlineQuestionTypeModule.Text then
				var17 = true
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceSingle then
				var17 = false
				
				if questionId.choiceIds ~= nil then
					var17 = #questionId.choiceIds == 1
					var17 = nil
				end
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceMulti then
				var17 = false
				
				if questionId.choiceIds ~= nil then
					var17 = #questionId.choiceIds >= 1
					var17 = nil
				end
			else
				var17 = false
			end
			if not var17 then
				return false
			end
		end
	end
	return true
end

local function mergeCurrentAnswerIntoBatch(p12, p13, p14) --[[ line: 98 ]]
	local cloned = table.clone(p12)
	
	if p13 ~= nil then
		cloned[p13.questionId] = p14
	end
	return cloned
end

local _ = function(p15, p16) --[[ line: 110 | named "indexOfQuestion" ]]
	for i, v in p15 do
		if v.questionId == p16 then
			return i
		end
	end
	return nil
end

local function resolveNextQuestionId(p17, p18) --[[ line: 121 ]]
	local choiceIds = p18.choiceIds
	
	if p17.choices ~= nil and choiceIds ~= nil and #choiceIds > 0 then
		local var19 = choiceIds[1]
		
		for i, v in p17.choices do
			if v.id == var19 then
				return v.next or p17.next
			end
		end
	end
	return p17.next
end

local function getVisitedQuestions(p19, p20) --[[ line: 161 ]]
	-- upvalues: t (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var22 = if #p19 > 0 then 1 else nil
	while var22 ~= nil and not t_2[var22] do
		t_2[var22] = true
		local var23 = p19[var22]
		table.insert(t_1, var23)
		local var24 = var22
		local questionId = p20[var23.questionId] or t
		local var26 = p19[var24]
		
		if var26 == nil then
			var22 = nil
		else
			local var28
			local var27 = resolveNextQuestionId(var26, questionId)
			
			if var27 == nil then
				var28 = var24 + 1
				var22 = if var28 <= #p19 then var28 else nil
			elseif var27 == inlineSurveyTypesModule.NEXT_END then
				var22 = nil
			else
				for i, v in p19 do
					if v.questionId == var27 then
						var28 = i
						if var28 == nil then
						else
							var22 = var28
						end
					end
				end
				var28 = nil
			end
		end
	end
	return t_1
end

return {
	isAnswerComplete = isAnswerComplete,
	buildSubmitPayload = buildSubmitPayload,
	canSubmitAll = canSubmitAll,
	canAdvance = function(p21, p22, p23, p24) --[[ line: 187 ]]
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref), getVisitedQuestions (ref), canSubmitAll (ref), inlineQuestionTypeModule (ref)
		local var34
		local var29 = p21[p22]
		
		if var29 == nil then
			return false
		elseif fFlagInlineSurveyBranching then
			local var31
			local var30 = p21[p22]
			
			if var30 == nil then
				var31 = nil
			else
				local var33
				local var32 = resolveNextQuestionId(var30, p24)
				
				if var32 == nil then
					var33 = p22 + 1
					var31 = if var33 <= #p21 then var33 else nil
				elseif var32 == inlineSurveyTypesModule.NEXT_END then
					var31 = nil
				else
					for i, v in p21 do
						if v.questionId == var32 then
							var33 = i
							if var33 == nil then
							else
								var31 = var33
							end
						end
					end
					var33 = nil
				end
			end
			var34 = var31 == nil
		else
			local _ = #p21 <= p22
		end
		if var34 then
			local cloned = table.clone(p23)
			
			if var29 ~= nil then
				cloned[var29.questionId] = p24
			end
			local var36 = cloned
			
			return canSubmitAll(if fFlagInlineSurveyBranching then getVisitedQuestions(p21, var36) else p21, var36)
		else
			local var37 = true
			
			if var29.required == true then
				if var29.type == inlineQuestionTypeModule.Text then
					return true
				elseif var29.type == inlineQuestionTypeModule.MultipleChoiceSingle then
					var37 = false
					
					if p24.choiceIds == nil then
					else
						return #p24.choiceIds == 1
					end
				elseif var29.type == inlineQuestionTypeModule.MultipleChoiceMulti then
					var37 = false
					
					return if p24.choiceIds == nil then var37 else #p24.choiceIds >= 1
				end
				var37 = false
			end
		end
	end,
	resolveNextIndex = function(p25, p26, p27) --[[ line: 139 ]]
		-- upvalues: resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		local var38 = p25[p26]
		
		if var38 == nil then
			return nil
		end
		local var39 = resolveNextQuestionId(var38, p27)
		
		if var39 ~= nil then
			if var39 == inlineSurveyTypesModule.NEXT_END then
				return nil
			end
			local var40
			for i, v in p25 do
				if v.questionId == var39 then
					var40 = i
					if var40 ~= nil then
						return var40
					end
				end
			end
			var40 = nil
		end
		local var41 = p26 + 1
		
		return if var41 <= #p25 then var41 else nil
	end,
	getVisitedQuestions = getVisitedQuestions,
	isLastQuestion = function(p28, p29, p30) --[[ line: 179 ]]
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		if not fFlagInlineSurveyBranching then
			return #p28 <= p29
		end
		local var43
		local var42 = p28[p29]
		
		if var42 == nil then
			var43 = nil
		else
			local var45
			local var44 = resolveNextQuestionId(var42, p30)
			
			if var44 == nil then
				var45 = p29 + 1
				var43 = if var45 <= #p28 then var45 else nil
			elseif var44 == inlineSurveyTypesModule.NEXT_END then
				var43 = nil
			else
				for i, v in p28 do
					if v.questionId == var44 then
						var45 = i
						if var45 == nil then
						else
							var43 = var45
						end
					end
				end
				var45 = nil
			end
		end
		return var43 == nil
	end,
	mergeCurrentAnswerIntoBatch = mergeCurrentAnswerIntoBatch,
	toggleChoice = function(p31, p32, p33) --[[ line: 206 ]]
		-- upvalues: t_1 (ref)
		if not p33 then
			return { p32 }
		end
		local t = {}
		local var47 = false
		
		for i, v in p31.choiceIds or t_1 do
			if v == p32 then
				var47 = true
			else
				table.insert(t, v)
			end
		end
		if not var47 then
			table.insert(t, p32)
		end
		return t
	end
}