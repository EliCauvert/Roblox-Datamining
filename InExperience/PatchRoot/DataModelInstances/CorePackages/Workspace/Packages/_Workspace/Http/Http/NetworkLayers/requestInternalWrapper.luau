local httpService = game:GetService("HttpService")
local http = script:FindFirstAncestor("Http")
local promiseModule = require(http.Parent.Promise)
local networkProfilerModule = require(http.NetworkProfiler)
local _ = require(http.RequestTypes)
local statusCodesModule = require(http.StatusCodes)
local httpCancellerModule = require(http.NetworkLayers.HttpCanceller)
local greenlistedEndpointsForLoggingModule = require(http.Logger.GreenlistedEndpointsForLogging)
local luaAppHttpSupportNoContent = game:DefineFastFlag("LuaAppHttpSupportNoContent", false)
local enableRetryOnPrefetch401 = game:DefineFastFlag("EnableRetryOnPrefetch401", false)
local mrRouterEnvName = game:DefineFastString("MrRouterEnvName", "")
local none = Enum.HttpCachePolicy.None
local t = {
	[statusCodesModule.REQUEST_TIMEOUT] = true,
	[statusCodesModule.SERVICE_UNAVAILABLE] = true,
	[statusCodesModule.GATEWAY_TIMEOUT] = true
}
local t_1 = {}
t_1.__index = t_1

local function generateTraceparent() --[[ line: 41 ]]
	-- upvalues: httpService (ref)
	return string.format("00-%s-%s-01", httpService:GenerateGUID(false):gsub("-", ""):lower(), httpService:GenerateGUID(false):gsub("-", ""):sub(1, 16):lower())
end

local function mergeMrRouterInTracestate(p0, p1) --[[ line: 47 ]]
	local text = "mrrouter-env=" .. p1
	local t = {}
	
	if p0 and #p0 > 0 then
		for i in p0:gmatch(" *([^,]+)") do
			table.insert(t, i)
		end
	end
	local function _(p2) --[[ line: 57 | named "isMrRouterEntry" ]]
		return p2:sub(1, 13) == "mrrouter-env="
	end
	
	local var16 = nil
	
	for i, v in ipairs(t) do
		if v:sub(1, 13) == "mrrouter-env=" then
			var16 = i
			break
		end
	end
	if var16 == nil then
		table.insert(t, text)
		
		return table.concat(t, ",")
	end
	local t_1 = {}
	
	for v, v_1 in ipairs(t) do
		if v_1:sub(1, 13) ~= "mrrouter-env=" then
			table.insert(t_1, v_1)
		end
	end
	table.insert(t_1, var16, text)
	
	return table.concat(t_1, ",")
end

local function _(p3) --[[ line: 84 | named "parseResponseBody" ]]
	-- upvalues: statusCodesModule (ref), httpService (ref)
	if p3.StatusCode == statusCodesModule.NO_CONTENT then
		return true, nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p3.Body)
	
	return ok, status
end

function t_1.new(p4, p5, p6, p7) --[[ line: 93 ]]
	-- upvalues: httpCancellerModule (ref), none (ref), mrRouterEnvName (ref), generateTraceparent (ref), mergeMrRouterInTracestate (ref), t_1 (ref)
	local t = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		maxRetryCount = if p7 then p7.maxRetryCount else 4,
		httpService = p4,
		session = httpCancellerModule.currentSession(),
		internalOptions = {
			Url = p5,
			Method = p6 or "GET",
			Body = if p7 then p7.postBody else nil,
			Timeout = if p7 then p7.timeout else 15000,
			CachePolicy = if p7 then p7.cachePolicy else none,
			Priority = if p7 then p7.priority else 0,
			Headers = if p7 then p7.headers else nil,
			RequestType = if p7 then p7.requestType else nil
		}
	}
	
	if (p6 == "POST" or p6 == "PATCH") and (t.internalOptions.Headers == nil or t.internalOptions.Headers["Content-Type"] == nil) then
		t.internalOptions.Headers = t.internalOptions.Headers or {}
		t.internalOptions.Headers["Content-Type"] = "application/json"
	end
	if #mrRouterEnvName > 0 then
		t.internalOptions.Headers = t.internalOptions.Headers or {}
		local headers = t.internalOptions.Headers
		
		if not headers.Traceparent then
			headers.Traceparent = generateTraceparent()
		end
		headers.Tracestate = mergeMrRouterInTracestate(headers.Tracestate, mrRouterEnvName)
	end
	setmetatable(t, t_1)
	
	return t
end

function t_1:start(p8, p9) --[[ line: 136 ]]
	self.resolve = p8
	self.reject = p9
	self:makeRequest()
end

function t_1:processResponse(p10) --[[ line: 142 ]]
	-- upvalues: luaAppHttpSupportNoContent (ref), statusCodesModule (ref), httpService (ref), networkProfilerModule (ref), greenlistedEndpointsForLoggingModule (ref)
	local var21, var22
	local _ = nil
	local _ = nil
	
	if luaAppHttpSupportNoContent then
		local var19, var20
		if p10.StatusCode == statusCodesModule.NO_CONTENT then
			var19 = true
			var20 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, p10.Body)
			var19 = ok
			var20 = status
		end
		var21 = var19
		var22 = var20
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, p10.Body)
		var21 = ok
		var22 = status
	end
	if not var21 then
		self.reject({ isJSONValid = false, HttpError = Enum.HttpError.OK })
		
		return
	end
	networkProfilerModule:track({
		queued = p10.Stats.DurationInQueue,
		nameLookup = p10.Stats.DurationNameLookup,
		connect = p10.Stats.DurationConnect,
		sslHandshake = p10.Stats.DurationSSLHandshake,
		makeRequest = p10.Stats.DurationMakeRequest,
		receiveResponse = p10.Stats.DurationReceiveResponse
	})
	self.resolve({
		responseCode = p10.StatusCode,
		requestUrl = self.internalOptions.Url,
		responseTimeMs = p10.Stats.RoundTripTime * 1000,
		isJSONValid = true,
		var22,
		responseBody = var22,
		responseStats = p10.Stats,
		responseSize = if p10.Body and typeof(p10.Body) == "string" then #p10.Body else 0
	})
	greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p10.StatusCode)
end

function t_1:retry(p11, p12) --[[ line: 179 ]]
	local var23 = if p11.Stats and p11.Stats.WasRequestRetried then false else true
	
	if var23 then
		self.retryCount += 1
		
		if self.maxRetryCount < self.retryCount then
			var23 = false
		end
	end
	if not var23 then
		self.reject(p11)
		
		return
	elseif self.internalOptions.Headers == nil then
		self.internalOptions.Headers = {}
	end
	self.internalOptions.Headers["X-Retry-Attempt"] = tostring(self.retryCount)
	delay(p12 or math.pow(2, self.retryCount), function() --[[ line: 205 ]]
		-- upvalues: self (ref)
		self:makeRequest()
	end)
end

function t_1:makeRequest() --[[ line: 210 ]]
	-- upvalues: httpCancellerModule (ref), t (ref), enableRetryOnPrefetch401 (ref), statusCodesModule (ref), greenlistedEndpointsForLoggingModule (ref)
	if self.canceled then
		return
	end
	self.httpRequest = self.httpService:RequestInternal(self.internalOptions)
	self.httpRequest:Start(function(p13, p14) --[[ line: 217 ]]
		-- upvalues: self (ref), httpCancellerModule (copy), t (copy), enableRetryOnPrefetch401 (copy), statusCodesModule (copy), greenlistedEndpointsForLoggingModule (copy)
		if self.session ~= httpCancellerModule.currentSession() then
			warn("Http request aborted", self.internalOptions.Url)
			
			return
		elseif p13 then
			if p14.StatusCode >= 200 and p14.StatusCode < 400 then
				self:processResponse(p14)
				
				return
			elseif t[p14.StatusCode] then
				self:retry(p14)
				
				return
			elseif enableRetryOnPrefetch401 and p14.IsPrefetch and p14.StatusCode == statusCodesModule.UNAUTHORIZED then
				self:retry(p14)
				
				return
			elseif p14.StatusCode ~= statusCodesModule.TOO_MANY_REQUESTS or not p14.Headers["Retry-After"] then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p14.StatusCode)
				self.reject(p14)
				
				return
			end
			local var24 = tonumber(p14.Headers["Retry-After"])
			
			if var24 == nil or var24 > 16 then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p14.StatusCode)
				self.reject(p14)
				
				return
			end
			self:retry(p14, var24)
			
			return
		elseif not self.canceled then
			self:retry({ HttpError = p14.HttpError })
		end
	end)
end

function t_1:cancel() --[[ line: 257 ]]
	self.canceled = true
	self.reject({ HttpError = Enum.HttpError.Aborted })
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

local _ = function(p15) --[[ line: 265 | named "createRequestInternalWrapper" ]]
	-- upvalues: httpService (ref), t_1 (ref), promiseModule (ref)
	if not p15 then
		p15 = httpService
	end
	return function(p16, p17, p18) --[[ line: 270 | named "makeRequest" ]]
		-- upvalues: t_1 (copy), p15 (write), promiseModule (copy)
		local var25 = t_1.new(p15, p16, p17, p18)
		
		return promiseModule.new(function(p19, p20) --[[ line: 273 ]]
			-- upvalues: var25 (ref)
			var25:start(p19, p20)
		end), function() --[[ line: 277 | named "cancel" ]]
			-- upvalues: var25 (ref)
			var25:cancel()
		end
	end
end

return setmetatable({
	_mergeMrRouterInTracestate = mergeMrRouterInTracestate,
	_generateTraceparent = generateTraceparent
}, {
	__call = function(_, ...) --[[ line: 291 ]]
		-- upvalues: httpService (ref), t_1 (ref), promiseModule (ref)
		local var26 = ... or httpService
		
		return function(p21, p22, p23) --[[ line: 270 | named "makeRequest" ]]
			-- upvalues: t_1 (copy), var26 (write), promiseModule (copy)
			local var25 = t_1.new(var26, p21, p22, p23)
			
			return promiseModule.new(function(p24, p25) --[[ line: 273 ]]
				-- upvalues: var25 (ref)
				var25:start(p24, p25)
			end), function() --[[ line: 277 | named "cancel" ]]
				-- upvalues: var25 (ref)
				var25:cancel()
			end
		end
	end
})