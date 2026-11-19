local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local HttpService = game:GetService("HttpService")
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "voting-api/vote/game-pass/{gamePassId}",
	base = require(Parent.Http).Url.APIS_URL
})
local ConfigResult = HttpRequestModule.config({
	maxRetryCount = 0,
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(GamePassId, p1)
	-- upvalues: NewResult (copy), ConfigResult (copy), HttpService (copy), PromiseModule (copy)
	local Result = NewResult({ gamePassId = GamePassId })
	
	if p1 ~= nil then
		Result = `{Result}?vote={tostring(p1)}`
	end
	return ConfigResult(Result, "POST", { postBody = HttpService:JSONEncode({}) }):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result and Result.responseBody
		
		if type(ResponseBody) == "table" and ResponseBody.success == false then
			return PromiseModule.reject({
				refused = true,
				reasonForNotVoteable = ResponseBody.modalType
			})
		else
			local Model = if type(ResponseBody) == "table" and ResponseBody.success == true then ResponseBody.model else nil
			local Number = if type(Model) == "table" then tonumber(Model.upVotes) else nil
			local Number1 = if type(Model) == "table" then tonumber(Model.downVotes) else nil
			
			return if Number == nil or Number1 == nil then PromiseModule.reject({}) else { upVotes = Number, downVotes = Number1 }
		end
	end)
end