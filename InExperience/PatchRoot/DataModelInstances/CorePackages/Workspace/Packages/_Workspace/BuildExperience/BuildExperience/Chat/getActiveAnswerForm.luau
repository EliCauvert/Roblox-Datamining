local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)

return function(p1, p2, p3) --[[ Line: 5 | Named "getActiveAnswerForm" ]]
	-- upvalues: CreatorAgentChatModule (copy)
	if p1 == nil or p1.isDone then
		return nil
	end
	local ExtractQuestionsFromToolCallResult = nil
	for ToolCallId, value in p2.askUserByToolCallId do
		local ToolCall = p1.toolCalls[ToolCallId]
		local NoToolCall: boolean = ToolCall == nil or p3.onAnswerSelectedByToolCallId[ToolCallId] == nil
		
		if not NoToolCall then
			ExtractQuestionsFromToolCallResult = CreatorAgentChatModule.StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
			NoToolCall = ExtractQuestionsFromToolCallResult == nil or ExtractQuestionsFromToolCallResult[value.currentIndex] == nil
		end
		if not NoToolCall then
			local Selection = value.selections[value.currentIndex]
			local Draft = if value.drafts then value.drafts[ExtractQuestionsFromToolCallResult[value.currentIndex].id] else nil
			assert(Draft ~= nil, "Active answer form requires a question draft")
			
			return {
				draft = Draft,
				sessionId = p1.sessionId,
				question = ExtractQuestionsFromToolCallResult[value.currentIndex],
				toolCallId = ToolCallId,
				questionIndex = value.currentIndex,
				questionCount = #ExtractQuestionsFromToolCallResult,
				selectedOptionId = if Selection == nil then nil else Selection.selectedOptionId,
				isSubmitting = value.isSubmitting == true
			}
		end
	end
	return nil
end