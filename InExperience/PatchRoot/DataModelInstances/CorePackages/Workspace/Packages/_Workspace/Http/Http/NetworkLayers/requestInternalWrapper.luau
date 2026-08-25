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

local function _(p0)
	-- upvalues: statusCodesModule (ref), httpService (ref)
	if p0.StatusCode == statusCodesModule.NO_CONTENT then
		return true, nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p0.Body)
	
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

function t_1:start(p5, p6)
	self.resolve = p5
	self.reject = p6
	self:makeRequest()
end

function t_1:processResponse(p7)
	-- upvalues: luaAppHttpSupportNoContent (ref), statusCodesModule (ref), httpService (ref), networkProfilerModule (ref), greenlistedEndpointsForLoggingModule (ref)
	local var15, var16
	local _ = nil
	local _ = nil
	
	if luaAppHttpSupportNoContent then
		local var13, var14
		if p7.StatusCode == statusCodesModule.NO_CONTENT then
			var13 = true
			var14 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, p7.Body)
			var13 = ok
			var14 = status
		end
		var15 = var13
		var16 = var14
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, p7.Body)
		var15 = ok
		var16 = status
	end
	if not var15 then
		self.reject({ isJSONValid = false, HttpError = Enum.HttpError.OK })
		
		return
	end
	networkProfilerModule:track({
		queued = p7.Stats.DurationInQueue,
		nameLookup = p7.Stats.DurationNameLookup,
		connect = p7.Stats.DurationConnect,
		sslHandshake = p7.Stats.DurationSSLHandshake,
		makeRequest = p7.Stats.DurationMakeRequest,
		receiveResponse = p7.Stats.DurationReceiveResponse
	})
	self.resolve({
		responseCode = p7.StatusCode,
		requestUrl = self.internalOptions.Url,
		responseTimeMs = p7.Stats.RoundTripTime * 1000,
		isJSONValid = true,
		var16,
		responseBody = var16,
		responseStats = p7.Stats,
		responseSize = if p7.Body and typeof(p7.Body) == "string" then #p7.Body else 0
	})
	greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p7.StatusCode)
end

function t_1:retry(p8, p9)
	local var17 = if p8.Stats and p8.Stats.WasRequestRetried then false else true
	
	if var17 then
		self.retryCount += 1
		
		if self.maxRetryCount < self.retryCount then
			var17 = false
		end
	end
	if not var17 then
		self.reject(p8)
		
		return
	elseif self.internalOptions.Headers == nil then
		self.internalOptions.Headers = {}
	end
	self.internalOptions.Headers["X-Retry-Attempt"] = tostring(self.retryCount)
	delay(p9 or math.pow(2, self.retryCount), function()
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
	self.httpRequest:Start(function(p10, p11)
		-- upvalues: self (ref), httpCancellerModule (copy), t (copy), enableRetryOnPrefetch401 (copy), statusCodesModule (copy), greenlistedEndpointsForLoggingModule (copy)
		if self.session ~= httpCancellerModule.currentSession() then
			warn("Http request aborted", self.internalOptions.Url)
			
			return
		elseif p10 then
			if p11.StatusCode >= 200 and p11.StatusCode < 400 then
				self:processResponse(p11)
				
				return
			elseif t[p11.StatusCode] then
				self:retry(p11)
				
				return
			elseif enableRetryOnPrefetch401 and p11.IsPrefetch and p11.StatusCode == statusCodesModule.UNAUTHORIZED then
				self:retry(p11)
				
				return
			elseif p11.StatusCode ~= statusCodesModule.TOO_MANY_REQUESTS or not p11.Headers["Retry-After"] then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p11.StatusCode)
				self.reject(p11)
				
				return
			end
			local var18 = tonumber(p11.Headers["Retry-After"])
			
			if var18 == nil or var18 > 16 then
				greenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p11.StatusCode)
				self.reject(p11)
				
				return
			end
			self:retry(p11, var18)
			
			return
		elseif not self.canceled then
			self:retry({ HttpError = p11.HttpError })
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

return function(p12)
	-- upvalues: httpService (ref), t_1 (ref), promiseModule (ref)
	if not p12 then
		p12 = httpService
	end
	return function(p13, p14, p15)
		-- upvalues: t_1 (copy), p12 (write), promiseModule (copy)
		local var19 = t_1.new(p12, p13, p14, p15)
		
		return promiseModule.new(function(p16, p17)
			-- upvalues: var19 (ref)
			var19:start(p16, p17)
		end), function()
			-- upvalues: var19 (ref)
			var19:cancel()
		end
	end
end