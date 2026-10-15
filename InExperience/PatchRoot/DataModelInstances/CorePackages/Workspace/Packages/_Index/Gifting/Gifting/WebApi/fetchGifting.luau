local httpService = game:GetService("HttpService")
local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local giftErrorModelModule = require(gifting.Models.GiftErrorModel)
local _ = require(gifting.Types)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local list = { 400, 403, 404, 503 }

local function decodeErrorBody(p1)
	-- upvalues: httpService (ref)
	local responseBody = p1.responseBody
	local var1 = if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody
	
	if var1 == nil or var1 == "" then
		return {}
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var1)
	
	return if ok and type(status) == "table" then status else {}
end

return function(p1)
	-- upvalues: giftErrorModelModule (ref), decodeErrorBody (ref), list (ref), fetch (ref), asPromise (ref), promiseModule (ref)
	local var1 = nil
	
	local function captureGiftError(p2)
		-- upvalues: var1 (write), giftErrorModelModule (copy), decodeErrorBody (copy)
		var1 = giftErrorModelModule.format(decodeErrorBody(p2), p2.statusCode)
	end
	
	local t = {}
	
	for i, v in list do
		t[v] = { captureGiftError }
	end
	return asPromise(fetch({
		retry = false,
		network = p1.network,
		method = p1.method,
		url = p1.url,
		body = p1.body,
		analyticsKey = p1.analyticsKey,
		decode = function(p2)
			-- upvalues: p1 (ref)
			local var2, var3 = p1.decode(p2)
			
			if var2 == nil then
				error(var3 or "malformed response", 0)
			end
			return var2
		end,
		statusCodeActions = t
	})):catch(function(p2)
		-- upvalues: promiseModule (copy), var1 (write), giftErrorModelModule (copy)
		return promiseModule.reject(var1 or giftErrorModelModule.format({}, p2.responseCode, p2.errorMessage))
	end)
end