local CryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)
local HttpService = game:GetService("HttpService")
local StatusCodeModule = require(script.Parent.StatusCode)
local HttpSessionModule = require(script.Parent.HttpSession)
local HttpResponseModule = require(script.Parent.HttpResponse)
local config = {
	[StatusCodeModule.REQUEST_TIMEOUT] = true,
	[StatusCodeModule.SERVICE_UNAVAILABLE] = true,
	[StatusCodeModule.GATEWAY_TIMEOUT] = true
}
local HttpRequestModule = {}
HttpRequestModule.__index = HttpRequestModule

function HttpRequestModule.new(p1, Url, RequestMethod, p2)
	-- upvalues: CryoModule (copy), HttpSessionModule (copy), HttpRequestModule (copy)
	local P0 = p1 or {}
	local config = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		requestFunction = P0.requestFunction,
		postRequestFunction = P0.postRequestFunction,
		url = Url,
		requestMethod = RequestMethod,
		options = CryoModule.Dictionary.join(P0.defaultOptions or {}, p2 or {}),
		waitImpl = P0.waitImpl or delay,
		maxRetryCount = P0.maxRetryCount or 4,
		maxWaitTime = P0.maxWaitTime or 16,
		session = HttpSessionModule.currentSession()
	}
	setmetatable(config, HttpRequestModule)
	
	return config
end

function HttpRequestModule:start(Resolve, Reject)
	self.resolve = Resolve
	self.reject = Reject
	self:makeRequest()
end

function HttpRequestModule:processResponse(p1)
	-- upvalues: HttpService (copy), HttpResponseModule (copy)
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1.Body)
	
	if not Success then
		self.reject(HttpResponseModule.error(Enum.HttpError.OK))
		
		return
	end
	if self.postRequestFunction then
		pcall(self.postRequestFunction, p1, {
			url = self.url,
			requestMethod = self.requestMethod,
			options = self.options,
			retryCount = self.retryCount
		})
	end
	self.resolve(HttpResponseModule.success(p1.StatusCode, Result))
end

function HttpRequestModule:retry(p1, Number)
	self.retryCount += 1
	
	if self.maxRetryCount < self.retryCount then
		self.reject(p1)
		
		return
	else
		self:wait(Number or math.pow(2, self.retryCount))
	end
end

function HttpRequestModule:wait(p1)
	self.waitImpl(p1, function()
		-- upvalues: self (copy)
		self:makeRequest()
	end)
end

function HttpRequestModule:makeRequest()
	-- upvalues: HttpSessionModule (copy), config (copy), StatusCodeModule (copy), HttpResponseModule (copy)
	if not self.canceled then
		self.httpRequest = self.requestFunction(self.url, self.requestMethod, self.options)
		self.httpRequest:Start(function(p1, p2)
			-- upvalues: self (copy), HttpSessionModule (upval), config (upval), StatusCodeModule (upval), HttpResponseModule (upval)
			if self.session ~= HttpSessionModule.currentSession() then
				warn("Http request aborted", self.url)
				
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
				if p2.StatusCode ~= StatusCodeModule.TOO_MANY_REQUESTS or not p2.Headers["Retry-After"] then
					self.reject(p2)
					
					return
				end
				local Number: number? = tonumber(p2.Headers["Retry-After"])
				
				if Number == nil or Number > self.maxWaitTime then
					self.reject(p2)
					
					return
				else
					self:retry(p2, Number)
					
					return
				end
			elseif not self.canceled then
				self:retry(HttpResponseModule.error(p2.HttpError))
			end
		end)
		
		return
	end
end

function HttpRequestModule:cancel()
	-- upvalues: HttpResponseModule (copy)
	self.canceled = true
	self.reject(HttpResponseModule.error(Enum.HttpError.Aborted))
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

return HttpRequestModule