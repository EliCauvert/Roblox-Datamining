local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local sharedFlagsModule = require(onPlatformSurveys.Parent.SharedFlags)
local fFlagInlineSurveyBranching = sharedFlagsModule.FFlagInlineSurveyBranching
local fFlagInlineSurveyChoiceTextEntry = sharedFlagsModule.FFlagInlineSurveyChoiceTextEntry
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local inlineSurveyTypesModule = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t_1 = {}

local function _(p0)
	return p0:gsub("^%s*(.-)%s*$", "%1")
end

local function isAnswerComplete(p1, p2)
	-- upvalues: inlineQuestionTypeModule (ref)
	return p1.type == inlineQuestionTypeModule.Text or (if p1.type == inlineQuestionTypeModule.MultipleChoiceSingle then p2.choiceIds ~= nil and #p2.choiceIds == 1 else p1.type == inlineQuestionTypeModule.MultipleChoiceMulti and (p2.choiceIds ~= nil and #p2.choiceIds >= 1))
end

local function buildChoiceTexts(p3)
	-- upvalues: t_1 (ref)
	local choiceTexts = p3.choiceTexts
	
	if choiceTexts == nil then
		return nil
	end
	local t = {}
	local var15 = false
	
	for i, v in p3.choiceIds or t_1 do
		local var16 = (choiceTexts[v] or ""):gsub("^%s*(.-)%s*$", "%1")
		
		if var16 ~= "" then
			t[v] = var16
			var15 = true
		end
	end
	return if var15 then t else nil
end

local function buildResponse(p4, p5)
	-- upvalues: inlineQuestionTypeModule (ref), fFlagInlineSurveyChoiceTextEntry (ref), buildChoiceTexts (ref)
	if p4.type == inlineQuestionTypeModule.Text then
		local var17 = (p5.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if var17 == "" then nil else { text = var17 }
	end
	local choiceIds = p5.choiceIds or {}
	
	return if #choiceIds == 0 then nil else {
		choiceIds = choiceIds,
		choiceTexts = if fFlagInlineSurveyChoiceTextEntry then buildChoiceTexts(p5) else nil
	}
end

local function buildSubmitPayload(p6, p7, p8, p9, p10)
	-- upvalues: t (ref), buildResponse (ref)
	local t_1 = {}
	
	for i, v in p7 do
		local var20 = buildResponse(v, p8[v.questionId] or t)
		
		if var20 ~= nil then
			table.insert(t_1, {
				questionId = v.questionId,
				type = v.type,
				response = var20
			})
		end
	end
	return {
		surveyId = p6,
		idempotencyKey = p9,
		answers = t_1,
		finished = if p10 ~= nil then nil else p10.finished
	}
end

local function canSubmitAll(p11, p12)
	-- upvalues: t (ref), inlineQuestionTypeModule (ref)
	for i, v in p11 do
		if v.required == true then
			local var22
			local questionId = p12[v.questionId] or t
			
			if v.type == inlineQuestionTypeModule.Text then
				var22 = true
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceSingle then
				var22 = false
				
				if questionId.choiceIds ~= nil then
					var22 = #questionId.choiceIds == 1
					var22 = nil
				end
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceMulti then
				var22 = false
				
				if questionId.choiceIds ~= nil then
					var22 = #questionId.choiceIds >= 1
					var22 = nil
				end
			else
				var22 = false
			end
			if not var22 then
				return false
			end
		end
	end
	return true
end

local function mergeCurrentAnswerIntoBatch(p13, p14, p15)
	local cloned = table.clone(p13)
	
	if p14 ~= nil then
		cloned[p14.questionId] = p15
	end
	return cloned
end

local _ = function(p16, p17)
	for i, v in p16 do
		if v.questionId == p17 then
			return i
		end
	end
	return nil
end

local function resolveNextQuestionId(p18, p19)
	local choiceIds = p19.choiceIds
	
	if p18.choices ~= nil and choiceIds ~= nil and #choiceIds > 0 then
		local var24 = choiceIds[1]
		
		for i, v in p18.choices do
			if v.id == var24 then
				return v.next or p18.next
			end
		end
	end
	return p18.next
end

local function getVisitedQuestions(p20, p21)
	-- upvalues: t (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var27 = if #p20 > 0 then 1 else nil
	while var27 ~= nil and not t_2[var27] do
		t_2[var27] = true
		local var28 = p20[var27]
		table.insert(t_1, var28)
		local var29 = var27
		local questionId = p21[var28.questionId] or t
		local var31 = p20[var29]
		
		if var31 == nil then
			var27 = nil
		else
			local var33
			local var32 = resolveNextQuestionId(var31, questionId)
			
			if var32 == nil then
				var33 = var29 + 1
				var27 = if var33 <= #p20 then var33 else nil
			elseif var32 == inlineSurveyTypesModule.NEXT_END then
				var27 = nil
			else
				for i, v in p20 do
					if v.questionId == var32 then
						var33 = i
						if var33 == nil then
						else
							var27 = var33
						end
					end
				end
				var33 = nil
			end
		end
	end
	return t_1
end

return {
	isAnswerComplete = isAnswerComplete,
	buildSubmitPayload = buildSubmitPayload,
	canSubmitAll = canSubmitAll,
	canAdvance = function(p22, p23, p24, p25)
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref), getVisitedQuestions (ref), canSubmitAll (ref), inlineQuestionTypeModule (ref)
		local var39
		local var34 = p22[p23]
		
		if var34 == nil then
			return false
		elseif fFlagInlineSurveyBranching then
			local var36
			local var35 = p22[p23]
			
			if var35 == nil then
				var36 = nil
			else
				local var38
				local var37 = resolveNextQuestionId(var35, p25)
				
				if var37 == nil then
					var38 = p23 + 1
					var36 = if var38 <= #p22 then var38 else nil
				elseif var37 == inlineSurveyTypesModule.NEXT_END then
					var36 = nil
				else
					for i, v in p22 do
						if v.questionId == var37 then
							var38 = i
							if var38 == nil then
							else
								var36 = var38
							end
						end
					end
					var38 = nil
				end
			end
			var39 = var36 == nil
		else
			local _ = #p22 <= p23
		end
		if var39 then
			local cloned = table.clone(p24)
			
			if var34 ~= nil then
				cloned[var34.questionId] = p25
			end
			local var41 = cloned
			
			return canSubmitAll(if fFlagInlineSurveyBranching then getVisitedQuestions(p22, var41) else p22, var41)
		else
			local var42 = true
			
			if var34.required == true then
				if var34.type == inlineQuestionTypeModule.Text then
					return true
				elseif var34.type == inlineQuestionTypeModule.MultipleChoiceSingle then
					var42 = false
					
					if p25.choiceIds == nil then
					else
						return #p25.choiceIds == 1
					end
				elseif var34.type == inlineQuestionTypeModule.MultipleChoiceMulti then
					var42 = false
					
					return if p25.choiceIds == nil then var42 else #p25.choiceIds >= 1
				end
				var42 = false
			end
		end
	end,
	resolveNextIndex = function(p26, p27, p28)
		-- upvalues: resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		local var43 = p26[p27]
		
		if var43 == nil then
			return nil
		end
		local var44 = resolveNextQuestionId(var43, p28)
		
		if var44 ~= nil then
			if var44 == inlineSurveyTypesModule.NEXT_END then
				return nil
			end
			local var45
			for i, v in p26 do
				if v.questionId == var44 then
					var45 = i
					if var45 ~= nil then
						return var45
					end
				end
			end
			var45 = nil
		end
		local var46 = p27 + 1
		
		return if var46 <= #p26 then var46 else nil
	end,
	getVisitedQuestions = getVisitedQuestions,
	isLastQuestion = function(p29, p30, p31)
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		if not fFlagInlineSurveyBranching then
			return #p29 <= p30
		end
		local var48
		local var47 = p29[p30]
		
		if var47 == nil then
			var48 = nil
		else
			local var50
			local var49 = resolveNextQuestionId(var47, p31)
			
			if var49 == nil then
				var50 = p30 + 1
				var48 = if var50 <= #p29 then var50 else nil
			elseif var49 == inlineSurveyTypesModule.NEXT_END then
				var48 = nil
			else
				for i, v in p29 do
					if v.questionId == var49 then
						var50 = i
						if var50 == nil then
						else
							var48 = var50
						end
					end
				end
				var50 = nil
			end
		end
		return var48 == nil
	end,
	mergeCurrentAnswerIntoBatch = mergeCurrentAnswerIntoBatch,
	toggleChoice = function(p32, p33, p34)
		-- upvalues: t_1 (ref)
		if not p34 then
			return { p33 }
		end
		local t = {}
		local var52 = false
		
		for i, v in p32.choiceIds or t_1 do
			if v == p33 then
				var52 = true
			else
				table.insert(t, v)
			end
		end
		if not var52 then
			table.insert(t, p33)
		end
		return t
	end
}