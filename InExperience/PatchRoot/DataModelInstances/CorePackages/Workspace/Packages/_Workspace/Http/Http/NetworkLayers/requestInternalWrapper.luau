local httpService = game:GetService("HttpService")
local http = script:FindFirstAncestor("Http")
local promiseModule = require(http.Parent.Promise)
local networkProfilerModule = require(http.NetworkProfiler)
local _ = require(http.RequestTypes)
local statusCodesModule = require(http.StatusCodes)
local httpCancellerModule = require(http.NetworkLayers.HttpCanceller)
local greenlistedEndpointsForLoggingModule = require(http.Logger.GreenlistedEndpointsForLogging)
local mrRouterHeadersModule = require(http.MrRouterHeaders)
local luaAppHttpSupportNoContent = game:DefineFastFlag("LuaAppHttpSupportNoContent", false)
local enableRetryOnPrefetch401 = game:DefineFastFlag("EnableRetryOnPrefetch401", false)
local none = Enum.HttpCachePolicy.None
local t = {
	[statusCodesModule.REQUEST_TIMEOUT] = true,
	[statusCodesModule.SERVICE_UNAVAILABLE] = true,
	[statusCodesModule.GATEWAY_TIMEOUT] = true
}
local t_1 = {}
t_1.__index = t_1

local function _(p1)
	-- upvalues: statusCodesModule (ref), httpService (ref)
	if p1.StatusCode == statusCodesModule.NO_CONTENT then
		return true, nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p1.Body)
	
	return ok, status
end

function t_1.new(p1, p2, p3, p4)
	-- upvalues: httpCancellerModule (ref), none (ref), mrRouterHeadersModule (ref), t_1 (ref)
	local t = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		maxRetryCount = if p4 then p4.maxRetryCount else 4,
		httpService = p1,
		session = httpCancellerModule.currentSession(),
		internalOptions = {
			Url = p2,
			Method = p3 or "GET",
			Body = if p4 then p4.postBody else nil,
			Timeout = if p4 then p4.timeout else 15000,
			CachePolicy = if p4 then p4.cachePolicy else none,
			Priority = if p4 then p4.priority else 0,
			Headers = if p4 then p4.headers else nil,
			RequestType = if p4 then p4.requestType else nil
		}
	}
	
	if (p3 == "POST" or p3 == "PATCH") and (t.internalOptions.Headers == nil or t.internalOptions.Headers["Content-Type"] == nil) then
		t.internalOptions.Headers = t.internalOptions.Headers or {}
		t.internalOptions.Headers["Content-Type"] = "application/json"
	end
	t.internalOptions.Headers = mrRouterHeadersModule.injectMrRouterHeaders(t.internalOptions.Headers)
	setmetatable(t, t_1)
	
	return t
end

function t_1:start(p1, p2)
	self.resolve = p1
	self.reject = p2
	self:makeRequest()
end

function t_1:processResponse(p1)
	-- upvalues: luaAppHttpSupportNoContent (ref), statusCodesModule (ref), httpService (ref), networkProfilerModule (ref), greenlistedEndpointsForLoggingModule (ref)
	local var1, var2
	local _ = nil
	local _ = nil
	
	if luaAppHttpSupportNoContent then
		local var3, var4
		if p1.StatusCode == statusCodesModule.NO_CONTENT then
			var3 = true
			var4 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, p1.Body)
			var3 = ok
			var4 = status
		end
		var1 = var3
		var2 = var4
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, p1.Body)
		var1 = ok
		var2 = status
	end
	if not var1 then
		self.reject({ isJSONValid = false, HttpError = Enum.HttpError.OK })
		
		return
	end
	networkProfilerModule:track({
		queued = p1.Stats.DurationInQueue,
		nameLookup = p1.Stats.DurationNameLookup,
		connect = p1.Stats.DurationConnect,
		sslHandshake = p1.Stats.DurationSSLHandshake,
		makeRequest = p1.Stats.DurationMakeRequest,
		receiveResponse = p1.Stats.DurationReceiveResponse
	})
	self.resolve({
		responseCode = p1.StatusCode,
		requestUrl = self.internalOptions.Url,
		responseTimeMs = p1.Stats.RoundTripTime * 1000,
		isJSONValid = true,
		var2,
		responseBody = var2,
		responseStats = p1.Stats,
		responseSize = if p1.Body and typeof(p1.Body) == "string" then #p1.Body else 0
	})
	greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p1.StatusCode)
end

function t_1:retry(p1, p2)
	local var1 = if p1.Stats and p1.Stats.WasRequestRetried then false else true
	
	if var1 then
		self.retryCount += 1
		
		if self.maxRetryCount < self.retryCount then
			var1 = false
		end
	end
	if not var1 then
		self.reject(p1)
		
		return
	elseif self.internalOptions.Headers == nil then
		self.internalOptions.Headers = {}
	end
	self.internalOptions.Headers["X-Retry-Attempt"] = tostring(self.retryCount)
	delay(p2 or math.pow(2, self.retryCount), function()
		-- upvalues: self (ref)
		self:makeRequest()
	end)
end

function t_1:makeRequest()
	-- upvalues: httpCancellerModule (ref), t (ref), enableRetryOnPrefetch401 (ref), statusCodesModule (ref), greenlistedEndpointsForLoggingModule (ref)
	if self.canceled then
		return
	end
	self.httpRequest = self.httpService:RequestInternal(self.internalOptions)
	self.httpRequest:Start(function(p1, p2)
		-- upvalues: self (ref), httpCancellerModule (copy), t (copy), enableRetryOnPrefetch401 (copy), statusCodesModule (copy), greenlistedEndpointsForLoggingModule (copy)
		if self.session ~= httpCancellerModule.currentSession() then
			warn("Http request aborted", self.internalOptions.Url)
			
			return
		elseif p1 then
			if p2.StatusCode >= 200 and p2.StatusCode < 400 then
				self:processResponse(p2)
				
				return
			elseif t[p2.StatusCode] then
				self:retry(p2)
				
				return
			elseif enableRetryOnPrefetch401 and p2.IsPrefetch and p2.StatusCode == statusCodesModule.UNAUTHORIZED then
				self:retry(p2)
				
				return
			elseif p2.StatusCode ~= statusCodesModule.TOO_MANY_REQUESTS or not p2.Headers["Retry-After"] then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p2.StatusCode)
				self.reject(p2)
				
				return
			end
			local var1 = tonumber(p2.Headers["Retry-After"])
			
			if var1 == nil or var1 > 16 then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p2.StatusCode)
				self.reject(p2)
				
				return
			end
			self:retry(p2, var1)
			
			return
		elseif not self.canceled then
			self:retry({ HttpError = p2.HttpError })
		end
	end)
end

function t_1:cancel()
	self.canceled = true
	self.reject({ HttpError = Enum.HttpError.Aborted })
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

return function(p1)
	-- upvalues: httpService (ref), t_1 (ref), promiseModule (ref)
	if not p1 then
		p1 = httpService
	end
	return function(p2, p3, p4)
		-- upvalues: t_1 (copy), p1 (write), promiseModule (copy)
		local var1 = t_1.new(p1, p2, p3, p4)
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: var1 (ref)
			var1:start(p5, p6)
		end), function()
			-- upvalues: var1 (ref)
			var1:cancel()
		end
	end
end