local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ServerTriggeredModalImpressions").Parent
local promiseModule = require(parent.Promise)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(parent.UrlBuilder).UrlBase.APIS
})

return function(p1, p2, p3)
	-- upvalues: var1 (ref), httpService (ref), promiseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var1 (copy), httpService (copy), p2 (ref), p3 (ref)
		return p1(var1(), "POST", {
			postBody = httpService:JSONEncode({ promptType = p2, promptId = p3 })
		})
	end)
	
	return if ok then status else promiseModule.reject(status)
end