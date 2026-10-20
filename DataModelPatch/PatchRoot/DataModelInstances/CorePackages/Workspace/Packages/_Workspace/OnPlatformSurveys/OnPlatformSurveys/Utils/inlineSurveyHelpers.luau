local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local FFlagInlineSurveyBranching = require(OnPlatformSurveys.Parent.SharedFlags).FFlagInlineSurveyBranching
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local InlineSurveyTypesModule = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t1 = {}

local function _(Text: string): string
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

local function buildResponse(p1, p2)
	-- upvalues: InlineQuestionTypeModule (copy)
	if p1.type == InlineQuestionTypeModule.Text then
		local SS = (p2.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if SS == "" then nil else { text = SS }
	else
		local ChoiceIds = p2.choiceIds or {}
		
		return if #ChoiceIds == 0 then nil else { choiceIds = ChoiceIds }
	end
end

local function canSubmitAll(List, p1): boolean
	-- upvalues: t (copy), InlineQuestionTypeModule (copy)
	for _, value in List do
		if value.required == true then
			local v1 = p1[value.questionId] or t
			
			if value.type ~= InlineQuestionTypeModule.Text and not (if value.type == InlineQuestionTypeModule.MultipleChoiceSingle then v1.choiceIds ~= nil and #v1.choiceIds == 1 else value.type == InlineQuestionTypeModule.MultipleChoiceMulti and v1.choiceIds ~= nil and #v1.choiceIds >= 1) then
				return false
			end
		end
	end
	return true
end

local _ = function(List, QuestionId)
	for i, value in List do
		if value.questionId == QuestionId then
			return i
		end
	end
	return nil
end

local function resolveNextQuestionId(p2, p3)
	local ChoiceIds = p3.choiceIds
	
	if p2.choices ~= nil and ChoiceIds ~= nil and #ChoiceIds > 0 then
		local ChoiceId = ChoiceIds[1]
		
		for _, choice in p2.choices do
			if choice.id == ChoiceId then
				return choice.next or p2.next
			end
		end
	end
	return p2.next
end

local function getVisitedQuestions(List, p4)
	-- upvalues: t (copy), resolveNextQuestionId (copy), InlineSurveyTypesModule (copy)
	local List1 = {}
	local t2 = {}
	local v2 = if #List > 0 then 1 else nil
	local v3 = nil
	while v2 ~= nil and not t2[v2] do
		t2[v2] = true
		local Entry = List[v2]
		table.insert(List1, Entry)
		local v4: number = v2
		local v5 = p4[Entry.questionId] or t
		local Entry1 = List[v4]
		
		if Entry1 == nil then
			v2 = nil
		else
			local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry1, v5)
			
			if ResolveNextQuestionIdResult ~= nil then
				if ResolveNextQuestionIdResult == InlineSurveyTypesModule.NEXT_END then
					v2 = nil
					continue
				else
					v3 = nil
					
					for i, value in List do
						if value.questionId == ResolveNextQuestionIdResult then
							v3 = i
							break
						end
					end
					if v3 ~= nil then
						v2 = v3
						continue
					end
				end
			end
			local v6 = v4 + 1
			v2 = if v6 <= #List then v6 else nil
		end
	end
	return List1
end

return {
	isAnswerComplete = function(p5, p6): boolean
		-- upvalues: InlineQuestionTypeModule (copy)
		return p5.type == InlineQuestionTypeModule.Text or (if p5.type == InlineQuestionTypeModule.MultipleChoiceSingle then p6.choiceIds ~= nil and #p6.choiceIds == 1 else p5.type == InlineQuestionTypeModule.MultipleChoiceMulti and (p6.choiceIds ~= nil and #p6.choiceIds >= 1))
	end,
	buildSubmitPayload = function(SurveyId, List, p5, IdempotencyKey, p6)
		-- upvalues: t (copy), buildResponse (copy)
		local Answers = {}
		
		for _, value in List do
			local Response = buildResponse(value, p5[value.questionId] or t)
			
			if Response ~= nil then
				table.insert(Answers, {
					questionId = value.questionId,
					type = value.type,
					response = Response
				})
			end
		end
		return {
			surveyId = SurveyId,
			idempotencyKey = IdempotencyKey,
			answers = Answers,
			finished = if p6 == nil then nil else p6.finished
		}
	end,
	canSubmitAll = canSubmitAll,
	canAdvance = function(List, p7: number, Tbl, p8)
		-- upvalues: FFlagInlineSurveyBranching (copy), resolveNextQuestionId (copy), InlineSurveyTypesModule (copy), getVisitedQuestions (copy), canSubmitAll (copy), InlineQuestionTypeModule (copy)
		local Entry = List[p7]
		
		if Entry == nil then
			return false
		end
		local v7 = nil
		if FFlagInlineSurveyBranching then
			local Entry1 = List[p7]
			local v8 = nil
			
			if Entry1 == nil then
				v8 = nil
			else
				local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry1, p8)
				
				if ResolveNextQuestionIdResult == nil then
					local v9 = p7 + 1
					v8 = if v9 <= #List then v9 else nil
				elseif ResolveNextQuestionIdResult == InlineSurveyTypesModule.NEXT_END then
					v8 = nil
				else
					local v10 = nil
					
					for i, value in List do
						if value.questionId == ResolveNextQuestionIdResult then
							v10 = i
							break
						end
					end
					if v10 == nil then
					else
						v8 = v10
					end
				end
			end
			v7 = v8 == nil
		else
			v7 = #List <= p7
		end
		if v7 then
			local Copy = table.clone(Tbl)
			
			if Entry ~= nil then
				Copy[Entry.questionId] = p8
			end
			return (canSubmitAll(if FFlagInlineSurveyBranching then getVisitedQuestions(List, Copy) else List, Copy))
		else
			local Flag = true
			
			if Entry.required == true then
				if Entry.type == InlineQuestionTypeModule.Text then
					return true
				end
				if Entry.type == InlineQuestionTypeModule.MultipleChoiceSingle then
					Flag = false
					
					if p8.choiceIds ~= nil then
						return #p8.choiceIds == 1
					end
				elseif Entry.type == InlineQuestionTypeModule.MultipleChoiceMulti then
					Flag = false
					
					if p8.choiceIds ~= nil then
						return #p8.choiceIds >= 1
					end
				else
					Flag = false
				end
			end
			return Flag
		end
	end,
	resolveNextIndex = function(List, p9: number, p10)
		-- upvalues: resolveNextQuestionId (copy), InlineSurveyTypesModule (copy)
		local Entry = List[p9]
		
		if Entry == nil then
			return nil
		end
		local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry, p10)
		
		if ResolveNextQuestionIdResult ~= nil then
			if ResolveNextQuestionIdResult == InlineSurveyTypesModule.NEXT_END then
				return nil
			end
			local v11 = nil
			
			for i, value in List do
				if value.questionId == ResolveNextQuestionIdResult then
					v11 = i
					break
				end
			end
			if v11 ~= nil then
				return v11
			end
		end
		local v12 = p9 + 1
		
		return if v12 <= #List then v12 else nil
	end,
	getVisitedQuestions = getVisitedQuestions,
	isLastQuestion = function(List, p11: number, p12): boolean
		-- upvalues: FFlagInlineSurveyBranching (copy), resolveNextQuestionId (copy), InlineSurveyTypesModule (copy)
		if not FFlagInlineSurveyBranching then
			return #List <= p11
		end
		local Entry = List[p11]
		local v13 = nil
		
		if Entry == nil then
			v13 = nil
		else
			local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry, p12)
			
			if ResolveNextQuestionIdResult == nil then
				local v14 = p11 + 1
				v13 = if v14 <= #List then v14 else nil
			elseif ResolveNextQuestionIdResult == InlineSurveyTypesModule.NEXT_END then
				v13 = nil
			else
				local v15 = nil
				
				for i, value in List do
					if value.questionId == ResolveNextQuestionIdResult then
						v15 = i
						break
					end
				end
				if v15 == nil then
				else
					v13 = v15
				end
			end
		end
		return v13 == nil
	end,
	mergeCurrentAnswerIntoBatch = function(Tbl, p13, p14)
		local Copy = table.clone(Tbl)
		
		if p13 ~= nil then
			Copy[p13.questionId] = p14
		end
		return Copy
	end,
	toggleChoice = function(p13, p14, p15)
		-- upvalues: t2 (copy)
		if not p15 then
			return { p14 }
		end
		local List = {}
		local Flag = false
		local ChoiceIds = p13.choiceIds or t2
		for _, choiceId in ChoiceIds do
			if choiceId == p14 then
				Flag = true
			else
				table.insert(List, choiceId)
			end
		end
		if not Flag then
			table.insert(List, p14)
		end
		return List
	end
}