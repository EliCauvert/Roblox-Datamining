local _ = require(script.Parent.Parent.LuauPolyfill)
local headers = require(script.Parent.Headers).Headers
local body = require(script.Parent.Body).Body
local tbl = setmetatable({}, { __index = body })
tbl.__index = tbl

function tbl.new(p1, p2)
	-- upvalues: body (ref), tbl (ref), headers (ref)
	p2 = p2 or {}
	local tbl_1 = setmetatable(body.new(p1), tbl)
	tbl_1.status = p2.status or 200
	tbl_1.statusText = p2.statusText or ""
	tbl_1.headers = headers.new(p2.headers or {})
	tbl_1.headers.guard = "response"
	tbl_1.type = "text"
	tbl_1.url = ""
	tbl_1.redirected = false
	tbl_1.ok = tbl_1.status >= 200 and tbl_1.status < 300
	
	return tbl_1
end

function tbl.error()
	-- upvalues: tbl (ref)
	local var1 = tbl.new(nil, { status = 0 })
	var1.type = "error"
	
	return var1
end

function tbl.redirect(_, _)
	error("Response.redirect not implemented")
end

function tbl.STATIC_json(_, _)
	error("Response.json static method not implemented")
end

function tbl:clone()
	-- upvalues: tbl (ref)
	return tbl.new(self.body, {
		status = self.status,
		statusText = self.statusText,
		headers = self.headers.headerList
	})
end

return { Response = tbl }