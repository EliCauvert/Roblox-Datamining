local _ = require(script.Parent.Parent.LuauPolyfill)
local Headers = require(script.Parent.Headers).Headers
local Body = require(script.Parent.Body).Body
local self = setmetatable({}, { __index = Body })
self.__index = self

function self.new(Body1, p1) --[[ Line: 44 ]]
	-- upvalues: Body (copy), self (copy), Headers (copy)
	local P1 = p1 or {}
	local self1 = setmetatable(Body.new(Body1), self)
	self1.status = P1.status or 200
	self1.statusText = P1.statusText or ""
	self1.headers = Headers.new(P1.headers or {})
	self1.headers.guard = "response"
	self1.type = "text"
	self1.url = ""
	self1.redirected = false
	self1.ok = self1.status >= 200 and self1.status < 300
	
	return self1
end

function self.error() --[[ Line: 59 ]]
	-- upvalues: self (copy)
	local NewResult = self.new(nil, { status = 0 })
	NewResult.type = "error"
	
	return NewResult
end

function self:redirect(_) --[[ Line: 67 ]]
	error("Response.redirect not implemented")
end

function self:STATIC_json(_) --[[ Line: 75 ]]
	error("Response.json static method not implemented")
end

function self:clone() --[[ Line: 79 ]]
	-- upvalues: self (copy)
	return self.new(self.body, {
		status = self.status,
		statusText = self.statusText,
		headers = self.headers.headerList
	})
end

return { Response = self }