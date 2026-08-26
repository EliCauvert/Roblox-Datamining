local parent = script:FindFirstAncestor("DataHydration").Parent
local promiseModule = require(parent.Promise)
local httpClientModule = require(parent.HttpClient)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1)
	-- upvalues: promiseModule (ref), fetch (ref), asPromise (ref)
	local delay = p1.delay or promiseModule.delay
	
	local function postQuery(p2)
		-- upvalues: fetch (copy), p1 (ref), asPromise (copy), promiseModule (copy), delay (ref), postQuery (ref)
		return asPromise(fetch({
			method = "POST",
			network = p1.network,
			url = p1.url,
			body = p1.body,
			analyticsKey = p1.analyticsKey,
			decode = function(p3)
				return if p3 then p3.operation else {}
			end
		})):andThen(function(p3)
			-- upvalues: p2 (ref), promiseModule (copy), p1 (copy), delay (copy), postQuery (copy)
			return if p3.done == true then if p3.error == nil then promiseModule.resolve(p1.mapResult(p3)) else promiseModule.reject({
				responseCode = p3.error.code,
				errorMessage = p3.error.message
			}) elseif p2 >= 6 then promiseModule.reject({ errorMessage = p1.timeoutMessage }) else delay(2):andThen(function()
				-- upvalues: postQuery (copy), p2 (copy)
				return postQuery(p2 + 1)
			end)
		end)
	end
	
	return postQuery(1)
end