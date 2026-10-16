local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local BuildSduiRequestHeadersModule = require(SduiSharedUtilities.buildSduiRequestHeaders)
local FFlagSduiMrRouterHeadersModule = require(SduiSharedUtilities.Flags.FFlagSduiMrRouterHeaders)

local function _(p1) --[[ Line: 33 | Named "deadlineRejection" ]]
	return {
		stats = {},
		statusMessage = `SDUI request exceeded its {p1}s deadline`
	}
end

return function(p1) --[[ Line: 40 | Named "sendSduiHttpRequest" ]]
	-- upvalues: HttpClientModule (copy), FFlagSduiMrRouterHeadersModule (copy), BuildSduiRequestHeadersModule (copy), PromiseModule (copy)
	local Network = p1.network or HttpClientModule.createRequestInternalNetwork({ transportFailuresAsResponses = true })
	
	if p1.retry then
		Network = HttpClientModule.withRetry(Network, p1.retry)
	end
	local DeadlineSec = p1.deadlineSec
	local Flag = false
	local Delivery = p1.delivery
	local OnMessage: (any) -> () = if Delivery.mode == "streaming" then Delivery.onMessage else nil
	
	if OnMessage ~= nil and DeadlineSec ~= nil then
		OnMessage = function(p2) --[[ Line: 53 ]]
			-- upvalues: Flag (ref), OnMessage (copy)
			Flag = true
			OnMessage(p2)
		end
	end
	local v1 = HttpClientModule.asPromise((HttpClientModule.createRequest({
		networkImpl = Network,
		method = p1.method,
		url = p1.url,
		body = p1.body,
		headers = if FFlagSduiMrRouterHeadersModule then BuildSduiRequestHeadersModule(p1.accept, nil) else { Accept = p1.accept },
		encode = HttpClientModule.encodeRaw(p1.contentType or "application/json"),
		decode = function(p2) --[[ Line: 72 ]]
			if p2.statusCode >= 400 or p2.httpError ~= nil and p2.httpError ~= Enum.HttpError.OK or p2.wasTransportFailure == true then
				return nil, `Http request not successful StatusCode {p2.statusCode} HttpError {p2.httpError}`, p2.statusCode
			else
				return p2, nil, nil
			end
		end,
		analyticsKey = p1.analyticsKey,
		onMessage = OnMessage,
		priority = p1.priority
	}))):catch(function(Err) --[[ Line: 91 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(Err.response or { stats = {}, statusMessage = Err.errorMessage })
	end)
	
	return if DeadlineSec == nil then v1 elseif Delivery.mode == "streaming" then PromiseModule.race({
		PromiseModule.delay(DeadlineSec):andThen(function() --[[ Line: 108 ]]
			-- upvalues: Flag (ref), v1 (copy), PromiseModule (upval), DeadlineSec (copy)
			return if Flag then v1 else PromiseModule.reject({
				stats = {},
				statusMessage = `SDUI request exceeded its {DeadlineSec}s deadline`
			})
		end),
		v1
	}) else v1:timeout(DeadlineSec, {
		stats = {},
		statusMessage = `SDUI request exceeded its {DeadlineSec}s deadline`
	})
end