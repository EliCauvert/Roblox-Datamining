local Parent = script:FindFirstAncestor("DataHydration").Parent
local PromiseModule = require(Parent.Promise)
local HttpClientModule = require(Parent.HttpClient)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1) --[[ Line: 50 | Named "pollAnalyticsOperation" ]]
	-- upvalues: PromiseModule (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local Delay = p1.delay or PromiseModule.delay
	
	local function postQuery(p2) --[[ Line: 53 ]]
		-- upvalues: FetchFunction (upval), p1 (copy), AsPromiseFunction (upval), PromiseModule (upval), Delay (copy), postQuery (copy)
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			network = p1.network,
			url = p1.url,
			body = p1.body,
			analyticsKey = p1.analyticsKey,
			decode = function(p3) --[[ Line: 60 ]]
				return p3 and p3.operation or {}
			end
		}))):andThen(function(Result) --[[ Line: 64 ]]
			-- upvalues: p2 (copy), PromiseModule (upval), p1 (upval), Delay (upval), postQuery (upval)
			return if Result.done == true then if Result.error == nil then PromiseModule.resolve(p1.mapResult(Result)) else PromiseModule.reject({
				responseCode = Result.error.code,
				errorMessage = Result.error.message
			}) elseif p2 >= 6 then PromiseModule.reject({ errorMessage = p1.timeoutMessage }) else Delay(2):andThen(function() --[[ Line: 71 ]]
				-- upvalues: postQuery (upval), p2 (upval)
				return postQuery(p2 + 1)
			end)
		end)
	end
	
	return postQuery(1)
end