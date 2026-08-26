local cryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)
local httpService = game:GetService("HttpService")
local statusCodeModule = require(script.Parent.StatusCode)
local httpSessionModule = require(script.Parent.HttpSession)
local httpResponseModule = require(script.Parent.HttpResponse)
local t = {
	[statusCodeModule.REQUEST_TIMEOUT] = true,
	[statusCodeModule.SERVICE_UNAVAILABLE] = true,
	[statusCodeModule.GATEWAY_TIMEOUT] = true
}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2, p3, p4)
	-- upvalues: cryoModule (ref), httpSessionModule (ref), t_1 (ref)
	p1 = p1 or {}
	p1 = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		requestFunction = p1.requestFunction,
		postRequestFunction = p1.postRequestFunction,
		url = p2,
		requestMethod = p3,
		options = cryoModule.Dictionary.join(p1.defaultOptions or {}, p4 or {}),
		waitImpl = p1.waitImpl or delay,
		maxRetryCount = p1.maxRetryCount or 4,
		maxWaitTime = p1.maxWaitTime or 16,
		session = httpSessionModule.currentSession()
	}
	setmetatable(p1, t_1)
	
	return p1
end

function t_1:start(p1, p2)
	self.resolve = p1
	self.reject = p2
	self:makeRequest()
end

function t_1:processResponse(p1)
	-- upvalues: httpService (ref), httpResponseModule (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p1.Body)
	
	if not ok then
		self.reject(httpResponseModule.error(Enum.HttpError.OK))
		
		return
	elseif self.postRequestFunction then
		pcall(self.postRequestFunction, p1, {
			url = self.url,
			requestMethod = self.requestMethod,
			options = self.options,
			retryCount = self.retryCount
		})
	end
	self.resolve(httpResponseModule.success(p1.StatusCode, status))
end

function t_1:retry(p1, p2)
	self.retryCount += 1
	
	if self.maxRetryCount < self.retryCount then
		self.reject(p1)
		
		return
	end
	self:wait(p2 or math.pow(2, self.retryCount))
end

function t_1:wait(p1)
	self.waitImpl(p1, function()
		-- upvalues: self (ref)
		self:makeRequest()
	end)
end

function t_1:makeRequest()
	-- upvalues: httpSessionModule (ref), t (ref), statusCodeModule (ref), httpResponseModule (ref)
	if self.canceled then
		return
	end
	self.httpRequest = self.requestFunction(self.url, self.requestMethod, self.options)
	self.httpRequest:Start(function(p1, p2)
		-- upvalues: self (ref), httpSessionModule (copy), t (copy), statusCodeModule (copy), httpResponseModule (copy)
		if self.session ~= httpSessionModule.currentSession() then
			warn("Http request aborted", self.url)
			
			return
		elseif p1 then
			if p2.StatusCode >= 200 and p2.StatusCode < 400 then
				self:processResponse(p2)
				
				return
			elseif t[p2.StatusCode] then
				self:retry(p2)
				
				return
			elseif p2.StatusCode ~= statusCodeModule.TOO_MANY_REQUESTS or not p2.Headers["Retry-After"] then
				self.reject(p2)
				
				return
			end
			local var1 = tonumber(p2.Headers["Retry-After"])
			
			if var1 == nil or var1 > self.maxWaitTime then
				self.reject(p2)
				
				return
			end
			self:retry(p2, var1)
			
			return
		elseif not self.canceled then
			self:retry(httpResponseModule.error(p2.HttpError))
		end
	end)
end

function t_1:cancel()
	-- upvalues: httpResponseModule (ref)
	self.canceled = true
	self.reject(httpResponseModule.error(Enum.HttpError.Aborted))
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

return t_1