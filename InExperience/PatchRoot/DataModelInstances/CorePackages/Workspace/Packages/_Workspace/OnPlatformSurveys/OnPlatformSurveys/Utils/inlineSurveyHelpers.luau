local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local SharedFlagsModule = require(OnPlatformSurveys.Parent.SharedFlags)
local FFlagInlineSurveyBranching = SharedFlagsModule.FFlagInlineSurveyBranching
local FFlagInlineSurveyChoiceTextEntry = SharedFlagsModule.FFlagInlineSurveyChoiceTextEntry
local InlineQuestionTypeModule = require(OnPlatformSurveys.Enums.InlineQuestionType)
local InlineSurveyTypesModule = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local t = {}
local t1 = {}

local function _(Text: string): string
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

local function buildChoiceTexts(p1)
	-- upvalues: t1 (copy)
	local ChoiceTexts = p1.choiceTexts
	
	if ChoiceTexts == nil then
		return nil
	end
	local SSes = {}
	local Flag = false
	local ChoiceIds = p1.choiceIds or t1
	for _, choiceId in ChoiceIds do
		local SS = (ChoiceTexts[choiceId] or ""):gsub("^%s*(.-)%s*$", "%1")
		
		if SS ~= "" then
			SSes[choiceId] = SS
			Flag = true
		end
	end
	return if Flag then SSes else nil
end

local function buildResponse(p2, p3)
	-- upvalues: InlineQuestionTypeModule (copy), FFlagInlineSurveyChoiceTextEntry (copy), buildChoiceTexts (copy)
	if p2.type == InlineQuestionTypeModule.Text then
		local SS = (p3.text or ""):gsub("^%s*(.-)%s*$", "%1")
		
		return if SS == "" then nil else { text = SS }
	else
		local ChoiceIds = p3.choiceIds or {}
		
		return if #ChoiceIds == 0 then nil else {
			choiceIds = ChoiceIds,
			choiceTexts = if FFlagInlineSurveyChoiceTextEntry then buildChoiceTexts(p3) else nil
		}
	end
end

local function canSubmitAll(List, p2): boolean
	-- upvalues: t (copy), InlineQuestionTypeModule (copy)
	for _, value in List do
		if value.required == true then
			local v1 = p2[value.questionId] or t
			
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

local function resolveNextQuestionId(p3, p4)
	local ChoiceIds = p4.choiceIds
	
	if p3.choices ~= nil and ChoiceIds ~= nil and #ChoiceIds > 0 then
		local ChoiceId = ChoiceIds[1]
		
		for _, choice in p3.choices do
			if choice.id == ChoiceId then
				return choice.next or p3.next
			end
		end
	end
	return p3.next
end

local function getVisitedQuestions(List, p5)
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
		local v5 = p5[Entry.questionId] or t
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
	isAnswerComplete = function(p6, p7): boolean
		-- upvalues: InlineQuestionTypeModule (copy)
		return p6.type == InlineQuestionTypeModule.Text or (if p6.type == InlineQuestionTypeModule.MultipleChoiceSingle then p7.choiceIds ~= nil and #p7.choiceIds == 1 else p6.type == InlineQuestionTypeModule.MultipleChoiceMulti and (p7.choiceIds ~= nil and #p7.choiceIds >= 1))
	end,
	buildSubmitPayload = function(SurveyId, List, p6, IdempotencyKey, p7)
		-- upvalues: t (copy), buildResponse (copy)
		local Answers = {}
		
		for _, value in List do
			local Response = buildResponse(value, p6[value.questionId] or t)
			
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
			finished = if p7 == nil then nil else p7.finished
		}
	end,
	canSubmitAll = canSubmitAll,
	canAdvance = function(List, p8: number, Tbl, p9)
		-- upvalues: FFlagInlineSurveyBranching (copy), resolveNextQuestionId (copy), InlineSurveyTypesModule (copy), getVisitedQuestions (copy), canSubmitAll (copy), InlineQuestionTypeModule (copy)
		local Entry = List[p8]
		
		if Entry == nil then
			return false
		end
		local v7 = nil
		if FFlagInlineSurveyBranching then
			local Entry1 = List[p8]
			local v8 = nil
			
			if Entry1 == nil then
				v8 = nil
			else
				local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry1, p9)
				
				if ResolveNextQuestionIdResult == nil then
					local v9 = p8 + 1
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
			v7 = #List <= p8
		end
		if v7 then
			local Copy = table.clone(Tbl)
			
			if Entry ~= nil then
				Copy[Entry.questionId] = p9
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
					
					if p9.choiceIds ~= nil then
						return #p9.choiceIds == 1
					end
				elseif Entry.type == InlineQuestionTypeModule.MultipleChoiceMulti then
					Flag = false
					
					if p9.choiceIds ~= nil then
						return #p9.choiceIds >= 1
					end
				else
					Flag = false
				end
			end
			return Flag
		end
	end,
	resolveNextIndex = function(List, p10: number, p11)
		-- upvalues: resolveNextQuestionId (copy), InlineSurveyTypesModule (copy)
		local Entry = List[p10]
		
		if Entry == nil then
			return nil
		end
		local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry, p11)
		
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
		local v12 = p10 + 1
		
		return if v12 <= #List then v12 else nil
	end,
	getVisitedQuestions = getVisitedQuestions,
	isLastQuestion = function(List, p12: number, p13): boolean
		-- upvalues: FFlagInlineSurveyBranching (copy), resolveNextQuestionId (copy), InlineSurveyTypesModule (copy)
		if not FFlagInlineSurveyBranching then
			return #List <= p12
		end
		local Entry = List[p12]
		local v13 = nil
		
		if Entry == nil then
			v13 = nil
		else
			local ResolveNextQuestionIdResult = resolveNextQuestionId(Entry, p13)
			
			if ResolveNextQuestionIdResult == nil then
				local v14 = p12 + 1
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
	mergeCurrentAnswerIntoBatch = function(Tbl, p14, p15)
		local Copy = table.clone(Tbl)
		
		if p14 ~= nil then
			Copy[p14.questionId] = p15
		end
		return Copy
	end,
	toggleChoice = function(p14, p15, p16)
		-- upvalues: t2 (copy)
		if not p16 then
			return { p15 }
		end
		local List = {}
		local Flag = false
		local ChoiceIds = p14.choiceIds or t2
		for _, choiceId in ChoiceIds do
			if choiceId == p15 then
				Flag = true
			else
				table.insert(List, choiceId)
			end
		end
		if not Flag then
			table.insert(List, p15)
		end
		return List
	end
}