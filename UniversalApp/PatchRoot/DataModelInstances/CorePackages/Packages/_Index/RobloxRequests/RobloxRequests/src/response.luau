local parent = script.Parent.Parent
local lib = parent.lib
local src = parent.src
local nocasetableModule = require(lib.nocasetable)
local htmlModule = require(lib.html)
local jsonModule = require(src.json)
local cookiesModule = require(src.cookies)
local list = { "text/html", "application/xhtml+xml" }
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: t (ref), nocasetableModule (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	tbl.request = p1
	tbl.response_time = p3
	tbl.timestamp = tbl.request.timestamp
	tbl.url = p1.url
	tbl.method = p1.method
	tbl.code = p2.StatusCode
	tbl.status_code = p2.StatusCode
	tbl.success = p2.Success
	tbl.ok = tbl.status_code >= 200 and tbl.status_code < 300
	tbl.message = p2.StatusMessage
	tbl.headers = nocasetableModule(p2.Headers)
	tbl.content = p2.Body
	tbl.text = p2.Body
	tbl.headers["content-type"] = tbl.headers["content-type"] or "text/plain"
	tbl.from_cache = false
	local var1 = tbl.headers["content-type"]:split(";")
	tbl.content_type = var1[1]:lower()
	tbl.encoding = if var1[2] then var1[2]:split("=")[2] else ""
	tbl.content_length = #tbl.text
	tbl.cookies = cookiesModule.new()
	
	if tbl.headers["set-cookie"] then
		tbl.cookies:SetCookie(tbl.headers["set-cookie"])
	end
	return tbl
end

function t.expand(_) end

function t:__tostring()
	return self.text
end

function t:json()
	-- upvalues: jsonModule (ref)
	local ok, status = pcall(function()
		-- upvalues: jsonModule (copy), self (ref)
		return jsonModule.dec(self.text)
	end)
	
	if not ok then
		error(("[http] Failed to convert response content to JSON:\n%s"):format(self.text))
	end
	return status
end

function t:html(p1)
	-- upvalues: list (ref), htmlModule (ref)
	if p1 or table.find(list, self.content_type) then
		return htmlModule.parse(self.text, 100000, tostring(self.url))
	end
	error("[http] Response is not specified as HTML.")
end

function t:xml(p1)
	-- upvalues: htmlModule (ref)
	if p1 or self.content_type:find("+xml") or self.content_type:find("/xml") then
		return htmlModule.parse(self.text, 100000)
	end
	error("[http] Response is not specified as XML.")
end

return t