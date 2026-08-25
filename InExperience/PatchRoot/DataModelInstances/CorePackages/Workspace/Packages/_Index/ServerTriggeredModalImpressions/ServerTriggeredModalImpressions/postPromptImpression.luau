local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ServerTriggeredModalImpressions").Parent
local promiseModule = require(parent.Promise)
local var2 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(parent.UrlBuilder).UrlBase.APIS
})

return function(p0, p1, p2)
	-- upvalues: var2 (ref), httpService (ref), promiseModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), var2 (copy), httpService (copy), p1 (ref), p2 (ref)
		return p0(var2(), "POST", {
			postBody = httpService:JSONEncode({ promptType = p1, promptId = p2 })
		})
	end)
	
	return if ok then status else promiseModule.reject(status)
end