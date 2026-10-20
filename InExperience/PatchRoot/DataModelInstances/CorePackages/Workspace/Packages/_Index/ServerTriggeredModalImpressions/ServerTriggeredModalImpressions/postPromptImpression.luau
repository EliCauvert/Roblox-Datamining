local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ServerTriggeredModalImpressions").Parent
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})

return function(Callback, PromptType, PromptId)
	-- upvalues: NewResult (copy), HttpService (copy), PromiseModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: Callback (copy), NewResult (upval), HttpService (upval), PromptType (copy), PromptId (copy)
		return Callback(NewResult(), "POST", {
			postBody = HttpService:JSONEncode({ promptType = PromptType, promptId = PromptId })
		})
	end)
	
	return if Success then Result else PromiseModule.reject(Result)
end