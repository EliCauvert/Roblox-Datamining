local NewResult = require(script:FindFirstAncestor("AppChat").Logger):new(script.Name)
local SeedConversationTopModalSduiPayloadModule = require(script.Parent.seedConversationTopModalSduiPayload)

return function(Promise, p1) --[[ Line: 7 | Named "seedConversationTopModalFromRequest" ]]
	-- upvalues: SeedConversationTopModalSduiPayloadModule (copy), NewResult (copy)
	return Promise:andThen(function(Result) --[[ Line: 8 ]]
		-- upvalues: SeedConversationTopModalSduiPayloadModule (upval), p1 (copy), NewResult (upval)
		local ResponseBody = Result and Result.responseBody
		local Success, Result1 = pcall(SeedConversationTopModalSduiPayloadModule, ResponseBody and ResponseBody.sdui, p1)
		
		if not Success then
			NewResult:warning(`Error seeding conversationTopModal SDUI payload: {tostring(Result1)}`)
		end
		return Result
	end)
end