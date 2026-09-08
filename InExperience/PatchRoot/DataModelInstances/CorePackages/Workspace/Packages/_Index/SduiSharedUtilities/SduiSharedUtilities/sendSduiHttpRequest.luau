local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)

local function _(p1)
	return {
		stats = {},
		statusMessage = `SDUI request exceeded its {p1}s deadline`
	}
end

return function(p1)
	-- upvalues: httpClientModule (ref), promiseModule (ref)
	local var1 = p1.network or httpClientModule.createRequestInternalNetwork({ transportFailuresAsResponses = true })
	
	if p1.retry then
		var1 = httpClientModule.withRetry(var1, p1.retry)
	end
	local deadlineSec = p1.deadlineSec
	local var2 = false
	local delivery = p1.delivery
	local var3 = if delivery.mode == "streaming" then delivery.onMessage else nil
	
	if var3 ~= nil and deadlineSec ~= nil then
		local var4 = var3
		
		var3 = function(p2)
			-- upvalues: var2 (write), var4 (ref)
			var2 = true
			var4(p2)
		end
	end
	local var5 = httpClientModule.asPromise(httpClientModule.createRequest({
		networkImpl = var1,
		method = p1.method,
		url = p1.url,
		body = p1.body,
		headers = { Accept = p1.accept },
		encode = httpClientModule.encodeRaw(p1.contentType or "application/json"),
		decode = function(p2)
			if p2.statusCode >= 400 or p2.httpError ~= nil and p2.httpError ~= Enum.HttpError.OK or p2.wasTransportFailure == true then
				return nil, `Http request not successful StatusCode {p2.statusCode} HttpError {p2.httpError}`, p2.statusCode
			end
			return p2, nil, nil
		end,
		analyticsKey = p1.analyticsKey,
		onMessage = var3,
		priority = p1.priority
	})):catch(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p2.response or { stats = {}, statusMessage = p2.errorMessage })
	end)
	
	return if deadlineSec == nil then var5 elseif delivery.mode == "streaming" then promiseModule.race({
		promiseModule.delay(deadlineSec):andThen(function()
			-- upvalues: var2 (write), var5 (ref), promiseModule (copy), deadlineSec (ref)
			return if var2 then var5 else promiseModule.reject({
				stats = {},
				statusMessage = `SDUI request exceeded its {deadlineSec}s deadline`
			})
		end),
		var5
	}) else var5:timeout(deadlineSec, {
		stats = {},
		statusMessage = `SDUI request exceeded its {deadlineSec}s deadline`
	})
end