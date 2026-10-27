local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local PromiseModule = require(Parent.Promise)
local ChatConstantsModule = require(script.Parent.chatConstants)
local DownloadGeneratedImageAsyncModule = require(BuildExperience.utils.downloadGeneratedImageAsync)
local MonetizationFailureCausesModule = require(BuildExperience.utils.monetizationFailureCauses)

return {
	awaitRequestState = function(Callback, p1)
		while Callback(false).status == "pending" do
			if p1 <= os.clock() then
				return Callback(false)
			end
			task.wait()
		end
		return Callback(false)
	end,
	isConversationGone = function(Gone): boolean
		-- upvalues: CreatorAgentChatModule (copy)
		return Gone == CreatorAgentChatModule.ErrorCodes.NotFound or Gone == CreatorAgentChatModule.ErrorCodes.Gone
	end,
	getToolCallOrder = function(p2, ToolCallId)
		for i, activityItem in p2.activityItems do
			if activityItem.kind == "tool_call" and activityItem.toolCallId == ToolCallId then
				return i
			end
		end
		local List = {}
		
		for toolCall in p2.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		
		for i1, value in List do
			if value == ToolCallId then
				return i1
			end
		end
		return 0
	end,
	withGeneratedImage = function(p3, p4, Callback)
		-- upvalues: DownloadGeneratedImageAsyncModule (copy), ChatConstantsModule (copy), MonetizationFailureCausesModule (copy), PromiseModule (copy)
		return if p3 == nil then Callback(nil) else DownloadGeneratedImageAsyncModule(p3):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, MonetizationFailureCausesModule.MESSAGES.imagePreparing):andThen(Callback, function(p5)
			-- upvalues: MonetizationFailureCausesModule (upval), PromiseModule (upval), p4 (copy)
			return PromiseModule.reject({
				retryable = true,
				errorMessage = `{p4} {if typeof(p5) == "string" and MonetizationFailureCausesModule.classify(p5) ~= nil then p5 else MonetizationFailureCausesModule.MESSAGES.imageFailed}`
			})
		end)
	end
}