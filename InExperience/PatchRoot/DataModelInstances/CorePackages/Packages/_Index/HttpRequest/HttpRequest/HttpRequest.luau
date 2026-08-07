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

function t_1.new(p0, p1, p2, p3) --[[ line: 34 ]]
	-- upvalues: cryoModule (ref), httpSessionModule (ref), t_1 (ref)
	p0 = p0 or {}
	p0 = {
		resolve = nil,
		reject = nil,
		retryCount = 0,
		httpRequest = nil,
		canceled = false,
		requestFunction = p0.requestFunction,
		postRequestFunction = p0.postRequestFunction,
		url = p1,
		requestMethod = p2,
		options = cryoModule.Dictionary.join(p0.defaultOptions or {}, p3 or {}),
		waitImpl = p0.waitImpl or delay,
		maxRetryCount = p0.maxRetryCount or 4,
		maxWaitTime = p0.maxWaitTime or 16,
		session = httpSessionModule.currentSession()
	}
	setmetatable(p0, t_1)
	
	return p0
end

function t_1:start(p4, p5) --[[ line: 59 ]]
	self.resolve = p4
	self.reject = p5
	self:makeRequest()
end

function t_1:processResponse(p6) --[[ line: 65 ]]
	-- upvalues: httpService (ref), httpResponseModule (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p6.Body)
	
	if not ok then
		self.reject(httpResponseModule.error(Enum.HttpError.OK))
		
		return
	elseif self.postRequestFunction then
		pcall(self.postRequestFunction, p6, {
			url = self.url,
			requestMethod = self.requestMethod,
			options = self.options,
			retryCount = self.retryCount
		})
	end
	self.resolve(httpResponseModule.success(p6.StatusCode, status))
end

function t_1:retry(p7, p8) --[[ line: 84 ]]
	self.retryCount += 1
	
	if self.maxRetryCount < self.retryCount then
		self.reject(p7)
		
		return
	end
	self:wait(p8 or math.pow(2, self.retryCount))
end

function t_1:wait(p9) --[[ line: 94 ]]
	self.waitImpl(p9, function() --[[ line: 95 ]]
		-- upvalues: self (ref)
		self:makeRequest()
	end)
end

function t_1:makeRequest() --[[ line: 100 ]]
	-- upvalues: httpSessionModule (ref), t (ref), statusCodeModule (ref), httpResponseModule (ref)
	if self.canceled then
		return
	end
	self.httpRequest = self.requestFunction(self.url, self.requestMethod, self.options)
	self.httpRequest:Start(function(p10, p11) --[[ line: 105 ]]
		-- upvalues: self (ref), httpSessionModule (copy), t (copy), statusCodeModule (copy), httpResponseModule (copy)
		if self.session ~= httpSessionModule.currentSession() then
			warn("Http request aborted", self.url)
			
			return
		elseif p10 then
			if p11.StatusCode >= 200 and p11.StatusCode < 400 then
				self:processResponse(p11)
				
				return
			elseif t[p11.StatusCode] then
				self:retry(p11)
				
				return
			elseif p11.StatusCode ~= statusCodeModule.TOO_MANY_REQUESTS or not p11.Headers["Retry-After"] then
				self.reject(p11)
				
				return
			end
			local var8 = tonumber(p11.Headers["Retry-After"])
			
			if var8 == nil or var8 > self.maxWaitTime then
				self.reject(p11)
				
				return
			end
			self:retry(p11, var8)
			
			return
		elseif not self.canceled then
			self:retry(httpResponseModule.error(p11.HttpError))
		end
	end)
end

function t_1:cancel() --[[ line: 132 ]]
	-- upvalues: httpResponseModule (ref)
	self.canceled = true
	self.reject(httpResponseModule.error(Enum.HttpError.Aborted))
	
	if self.httpRequest then
		self.httpRequest:Cancel()
	end
end

return t_1