local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)

return function(p1, p2, p3)
	-- upvalues: creatorAgentChatModule (ref)
	if p1 == nil or p1.isDone then
		return nil
	end
	for i, v in p2.askUserByToolCallId do
		local var1 = p1.toolCalls[i]
		
		if var1 ~= nil and p3.onAnswerSelectedByToolCallId[i] ~= nil then
			local var2 = creatorAgentChatModule.StudioAskUserTool.extractQuestionsFromToolCall(var1)
			
			if var2 ~= nil and var2[v.currentIndex] ~= nil then
				local currentIndex = v.selections[v.currentIndex]
				local var3 = if v.drafts then v.drafts[var2[v.currentIndex].id] else nil
				assert(var3 ~= nil, "Active answer form requires a question draft")
				
				return {
					draft = var3,
					sessionId = p1.sessionId,
					question = var2[v.currentIndex],
					toolCallId = i,
					questionIndex = v.currentIndex,
					questionCount = #var2,
					selectedOptionId = if currentIndex ~= nil then nil else currentIndex.selectedOptionId,
					isSubmitting = v.isSubmitting == true
				}
			end
		end
	end
	return nil
end