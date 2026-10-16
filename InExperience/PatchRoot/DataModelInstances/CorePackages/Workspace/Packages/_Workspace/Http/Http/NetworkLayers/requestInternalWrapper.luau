local HttpService = game:GetService("HttpService")
local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local PromiseModule = require(Parent.Promise)
local NetworkProfilerModule = require(Http.NetworkProfiler)
local _ = require(Http.RequestTypes)
local StatusCodesModule = require(Http.StatusCodes)
local HttpCancellerModule = require(Http.NetworkLayers.HttpCanceller)
local GreenlistedEndpointsForLoggingModule = require(Http.Logger.GreenlistedEndpointsForLogging)
local MrRouterHeadersModule = require(Parent.MrRouterHeaders)
local LuaAppHttpSupportNoContent = game:DefineFastFlag("LuaAppHttpSupportNoContent", false)
local EnableRetryOnPrefetch401 = game:DefineFastFlag("EnableRetryOnPrefetch401", false)
local None = Enum.HttpCachePolicy.None
local config = {
	[StatusCodesModule.REQUEST_TIMEOUT] = true,
	[StatusCodesModule.SERVICE_UNAVAILABLE] = true,
	[StatusCodesModule.GATEWAY_TIMEOUT] = true
}
local Module = {}
Module.__index = Module

local function _(p1) --[[ Line: 38 | Named "parseResponseBody" ]]
	-- upvalues: StatusCodesModule (copy), HttpService (copy)
	if p1.StatusCode == StatusCodesModule.NO_CONTENT then
		return true, nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1.Body)
		
		return Success, Result
	end
end

function Module.new(HttpService, Url, p1, p2) --[[ Line: 47 ]]
	-- upvalues: HttpCancellerModule (copy), None (copy), MrRouterHeadersModule (copy), Module (copy)
	local config = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		maxRetryCount = p2 and p2.maxRetryCount or 4,
		httpService = HttpService,
		session = HttpCancellerModule.currentSession(),
		internalOptions = {
			Url = Url,
			Method = p1 and p1 or "GET",
			Body = p2 and p2.postBody or nil,
			Timeout = p2 and p2.timeout or 15000,
			CachePolicy = p2 and p2.cachePolicy or None,
			Priority = p2 and p2.priority or 0,
			Headers = p2 and p2.headers or nil,
			RequestType = p2 and p2.requestType or nil
		}
	}
	
	if (p1 == "POST" or p1 == "PATCH") and (config.internalOptions.Headers == nil or config.internalOptions.Headers["Content-Type"] == nil) then
		config.internalOptions.Headers = config.internalOptions.Headers or {}
		config.internalOptions.Headers["Content-Type"] = "application/json"
	end
	config.internalOptions.Headers = MrRouterHeadersModule.injectMrRouterHeaders(config.internalOptions.Headers)
	setmetatable(config, Module)
	
	return config
end

function Module:start(Resolve, Reject) --[[ Line: 83 ]]
	self.resolve = Resolve
	self.reject = Reject
	self:makeRequest()
end

function Module:processResponse(p1) --[[ Line: 89 ]]
	-- upvalues: LuaAppHttpSupportNoContent (copy), StatusCodesModule (copy), HttpService (copy), NetworkProfilerModule (copy), GreenlistedEndpointsForLoggingModule (copy)
	local Success = nil
	local Result = nil
	if LuaAppHttpSupportNoContent then
		local v1 = nil
		local v2 = nil
		if p1.StatusCode == StatusCodesModule.NO_CONTENT then
			v1 = true
			v2 = nil
		else
			v1, v22 = pcall(HttpService.JSONDecode, HttpService, p1.Body)
		end
		Success = v1
		Result = v2
	else
		Success, Result = pcall(HttpService.JSONDecode, HttpService, p1.Body)
	end
	if Success then
		NetworkProfilerModule:track({
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
			Result,
			responseBody = Result,
			responseStats = p1.Stats,
			responseSize = if p1.Body and typeof(p1.Body) == "string" then #p1.Body else 0
		})
		GreenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p1.StatusCode)
		
		return
	else
		self.reject({ isJSONValid = false, HttpError = Enum.HttpError.OK })
	end
end

function Module:retry(p1, Number) --[[ Line: 126 ]]
	local NoStats: boolean = not p1.Stats or not p1.Stats.WasRequestRetried
	
	if NoStats then
		self.retryCount += 1
		
		if self.maxRetryCount < self.retryCount then
			NoStats = false
		end
	end
	if not NoStats then
		self.reject(p1)
		
		return
	end
	if self.internalOptions.Headers == nil then
		self.internalOptions.Headers = {}
	end
	self.internalOptions.Headers["X-Retry-Attempt"] = tostring(self.retryCount)
	delay(Number or math.pow(2, self.retryCount), function() --[[ Line: 152 ]]
		-- upvalues: self (copy)
		self:makeRequest()
	end)
end

function Module:makeRequest() --[[ Line: 157 ]]
	-- upvalues: HttpCancellerModule (copy), config (copy), EnableRetryOnPrefetch401 (copy), StatusCodesModule (copy), GreenlistedEndpointsForLoggingModule (copy)
	if not self.canceled then
		self.httpRequest = self.httpService:RequestInternal(self.internalOptions)
		self.httpRequest:Start(function(p1, p2) --[[ Line: 164 ]]
			-- upvalues: self (copy), HttpCancellerModule (upval), config (upval), EnableRetryOnPrefetch401 (upval), StatusCodesModule (upval), GreenlistedEndpointsForLoggingModule (upval)
			if self.session ~= HttpCancellerModule.currentSession() then
				warn("Http request aborted", self.internalOptions.Url)
				
				return
			end
			if p1 then
				if p2.StatusCode >= 200 and p2.StatusCode < 400 then
					self:processResponse(p2)
					
					return
				end
				if config[p2.StatusCode] then
					self:retry(p2)
					
					return
				end
				if EnableRetryOnPrefetch401 and p2.IsPrefetch and p2.StatusCode == StatusCodesModule.UNAUTHORIZED then
					self:retry(p2)
					
					return
				end
				if p2.StatusCode ~= StatusCodesModule.TOO_MANY_REQUESTS or not p2.Headers["Retry-After"] then
					GreenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p2.StatusCode)
					self.reject(p2)
					
					return
				end
				local Number: number? = tonumber(p2.Headers["Retry-After"])
				
				if Number == nil or Number > 16 then
					GreenlistedEndpointsForLoggingModule.sendStatusCodeCounter(self.internalOptions.Url, p2.StatusCode)
					self.reject(p2)
					
					return
				else
					self:retry(p2, Number)
					
					return
				end
			elseif not self.canceled then
				self:retry({ HttpError = p2.HttpError })
			end
		end)
		
		return
	end
end

function Module:cancel() --[[ Line: 204 ]]
	self.canceled = true
	self.reject({ HttpError = Enum.HttpError.Aborted })
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

return function(HttpService1) --[[ Line: 212 | Named "createRequestInternalWrapper" ]]
	-- upvalues: HttpService (copy), Module (copy), PromiseModule (copy)
	if not HttpService1 then
		HttpService1 = HttpService
	end
	return function(Url, p1, p2) --[[ Line: 217 | Named "makeRequest" ]]
		-- upvalues: Module (upval), HttpService1 (ref), PromiseModule (upval)
		local NewModule = Module.new(HttpService1, Url, p1, p2)
		
		return PromiseModule.new(function(Resolve, Reject) --[[ Line: 220 ]]
			-- upvalues: NewModule (copy)
			NewModule:start(Resolve, Reject)
		end), function() --[[ Line: 224 | Named "cancel" ]]
			-- upvalues: NewModule (copy)
			NewModule:cancel()
		end
	end
end