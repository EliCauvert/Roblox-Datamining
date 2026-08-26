local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local sharedFlagsModule = require(onPlatformSurveys.Parent.SharedFlags)
local fFlagInlineSurveyBranching = sharedFlagsModule.FFlagInlineSurveyBranching
local fFlagInlineSurveyChoiceTextEntry = sharedFlagsModule.FFlagInlineSurveyChoiceTextEntry
local inlineQuestionTypeModule = require(onPlatformSurveys.Enums.InlineQuestionType)
local inlineSurveyTypesModule = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t_1 = {}

local function _(p1)
	return p1:gsub("^%s*(.-)%s*$", "%1")
end

local function isAnswerComplete(p1, p2)
	-- upvalues: inlineQuestionTypeModule (ref)
	return p1.type == inlineQuestionTypeModule.Text or (if p1.type == inlineQuestionTypeModule.MultipleChoiceSingle then p2.choiceIds ~= nil and #p2.choiceIds == 1 else p1.type == inlineQuestionTypeModule.MultipleChoiceMulti and (p2.choiceIds ~= nil and #p2.choiceIds >= 1))
end

local function buildChoiceTexts(p1)
	-- upvalues: t_1 (ref)
	local choiceTexts = p1.choiceTexts
	
	if choiceTexts == nil then
		return nil
	end
	local t = {}
	local var1 = false
	
	for i, v in p1.choiceIds or t_1 do
		local var2 = (choiceTexts[v] or ""):gsub("^%s*(.-)%s*$", "%1")
		
		if var2 ~= "" then
			t[v] = var2
			var1 = true
		end
	end
	return if var1 then t else nil
end

local function buildResponse(p2, p3)
	-- upvalues: inlineQuestionTypeModule (ref), fFlagInlineSurveyChoiceTextEntry (ref), buildChoiceTexts (ref)
	if p2.type == inlineQuestionTypeModule.Text then
		local var3 = (p3.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if var3 == "" then nil else { text = var3 }
	end
	local choiceIds = p3.choiceIds or {}
	
	return if #choiceIds == 0 then nil else {
		choiceIds = choiceIds,
		choiceTexts = if fFlagInlineSurveyChoiceTextEntry then buildChoiceTexts(p3) else nil
	}
end

local function buildSubmitPayload(p2, p3, p4, p5, p6)
	-- upvalues: t (ref), buildResponse (ref)
	local t_1 = {}
	
	for i, v in p3 do
		local var3 = buildResponse(v, p4[v.questionId] or t)
		
		if var3 ~= nil then
			table.insert(t_1, {
				questionId = v.questionId,
				type = v.type,
				response = var3
			})
		end
	end
	return {
		surveyId = p2,
		idempotencyKey = p5,
		answers = t_1,
		finished = if p6 ~= nil then nil else p6.finished
	}
end

local function canSubmitAll(p7, p8)
	-- upvalues: t (ref), inlineQuestionTypeModule (ref)
	for i, v in p7 do
		if v.required == true then
			local var4
			local questionId = p8[v.questionId] or t
			
			if v.type == inlineQuestionTypeModule.Text then
				var4 = true
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceSingle then
				var4 = false
				
				if questionId.choiceIds ~= nil then
					var4 = #questionId.choiceIds == 1
					var4 = nil
				end
			elseif v.type == inlineQuestionTypeModule.MultipleChoiceMulti then
				var4 = false
				
				if questionId.choiceIds ~= nil then
					var4 = #questionId.choiceIds >= 1
					var4 = nil
				end
			else
				var4 = false
			end
			if not var4 then
				return false
			end
		end
	end
	return true
end

local function mergeCurrentAnswerIntoBatch(p9, p10, p11)
	local cloned = table.clone(p9)
	
	if p10 ~= nil then
		cloned[p10.questionId] = p11
	end
	return cloned
end

local _ = function(p9, p10)
	for i, v in p9 do
		if v.questionId == p10 then
			return i
		end
	end
	return nil
end

local function resolveNextQuestionId(p11, p12)
	local choiceIds = p12.choiceIds
	
	if p11.choices ~= nil and choiceIds ~= nil and #choiceIds > 0 then
		local var5 = choiceIds[1]
		
		for i, v in p11.choices do
			if v.id == var5 then
				return v.next or p11.next
			end
		end
	end
	return p11.next
end

local function getVisitedQuestions(p13, p14)
	-- upvalues: t (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var6 = if #p13 > 0 then 1 else nil
	while var6 ~= nil and not t_2[var6] do
		t_2[var6] = true
		local var7 = p13[var6]
		table.insert(t_1, var7)
		local var8 = var6
		local questionId = p14[var7.questionId] or t
		local var9 = p13[var8]
		
		if var9 == nil then
			var6 = nil
		else
			local var10
			local var11 = resolveNextQuestionId(var9, questionId)
			
			if var11 == nil then
				var10 = var8 + 1
				var6 = if var10 <= #p13 then var10 else nil
			elseif var11 == inlineSurveyTypesModule.NEXT_END then
				var6 = nil
			else
				for i, v in p13 do
					if v.questionId == var11 then
						var10 = i
						if var10 == nil then
						else
							var6 = var10
						end
					end
				end
				var10 = nil
			end
		end
	end
	return t_1
end

return {
	isAnswerComplete = isAnswerComplete,
	buildSubmitPayload = buildSubmitPayload,
	canSubmitAll = canSubmitAll,
	canAdvance = function(p15, p16, p17, p18)
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref), getVisitedQuestions (ref), canSubmitAll (ref), inlineQuestionTypeModule (ref)
		local var12
		local var13 = p15[p16]
		
		if var13 == nil then
			return false
		elseif fFlagInlineSurveyBranching then
			local var14
			local var15 = p15[p16]
			
			if var15 == nil then
				var14 = nil
			else
				local var16
				local var17 = resolveNextQuestionId(var15, p18)
				
				if var17 == nil then
					var16 = p16 + 1
					var14 = if var16 <= #p15 then var16 else nil
				elseif var17 == inlineSurveyTypesModule.NEXT_END then
					var14 = nil
				else
					for i, v in p15 do
						if v.questionId == var17 then
							var16 = i
							if var16 == nil then
							else
								var14 = var16
							end
						end
					end
					var16 = nil
				end
			end
			var12 = var14 == nil
		else
			local _ = #p15 <= p16
		end
		if var12 then
			local cloned = table.clone(p17)
			
			if var13 ~= nil then
				cloned[var13.questionId] = p18
			end
			local var18 = cloned
			
			return canSubmitAll(if fFlagInlineSurveyBranching then getVisitedQuestions(p15, var18) else p15, var18)
		else
			local var19 = true
			
			if var13.required == true then
				if var13.type == inlineQuestionTypeModule.Text then
					return true
				elseif var13.type == inlineQuestionTypeModule.MultipleChoiceSingle then
					var19 = false
					
					if p18.choiceIds == nil then
					else
						return #p18.choiceIds == 1
					end
				elseif var13.type == inlineQuestionTypeModule.MultipleChoiceMulti then
					var19 = false
					
					return if p18.choiceIds == nil then var19 else #p18.choiceIds >= 1
				end
				var19 = false
			end
		end
	end,
	resolveNextIndex = function(p19, p20, p21)
		-- upvalues: resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		local var20 = p19[p20]
		
		if var20 == nil then
			return nil
		end
		local var21 = resolveNextQuestionId(var20, p21)
		
		if var21 ~= nil then
			if var21 == inlineSurveyTypesModule.NEXT_END then
				return nil
			end
			local var22
			for i, v in p19 do
				if v.questionId == var21 then
					var22 = i
					if var22 ~= nil then
						return var22
					end
				end
			end
			var22 = nil
		end
		local var23 = p20 + 1
		
		return if var23 <= #p19 then var23 else nil
	end,
	getVisitedQuestions = getVisitedQuestions,
	isLastQuestion = function(p22, p23, p24)
		-- upvalues: fFlagInlineSurveyBranching (ref), resolveNextQuestionId (ref), inlineSurveyTypesModule (ref)
		if not fFlagInlineSurveyBranching then
			return #p22 <= p23
		end
		local var24
		local var25 = p22[p23]
		
		if var25 == nil then
			var24 = nil
		else
			local var26
			local var27 = resolveNextQuestionId(var25, p24)
			
			if var27 == nil then
				var26 = p23 + 1
				var24 = if var26 <= #p22 then var26 else nil
			elseif var27 == inlineSurveyTypesModule.NEXT_END then
				var24 = nil
			else
				for i, v in p22 do
					if v.questionId == var27 then
						var26 = i
						if var26 == nil then
						else
							var24 = var26
						end
					end
				end
				var26 = nil
			end
		end
		return var24 == nil
	end,
	mergeCurrentAnswerIntoBatch = mergeCurrentAnswerIntoBatch,
	toggleChoice = function(p25, p26, p27)
		-- upvalues: t_1 (ref)
		if not p27 then
			return { p26 }
		end
		local t = {}
		local var28 = false
		
		for i, v in p25.choiceIds or t_1 do
			if v == p26 then
				var28 = true
			else
				table.insert(t, v)
			end
		end
		if not var28 then
			table.insert(t, p26)
		end
		return t
	end
}