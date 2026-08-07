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

function t.new(p0, p1, p2) --[[ line: 20 ]]
	-- upvalues: t (ref), nocasetableModule (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	tbl.request = p0
	tbl.response_time = p2
	tbl.timestamp = tbl.request.timestamp
	tbl.url = p0.url
	tbl.method = p0.method
	tbl.code = p1.StatusCode
	tbl.status_code = p1.StatusCode
	tbl.success = p1.Success
	tbl.ok = tbl.status_code >= 200 and tbl.status_code < 300
	tbl.message = p1.StatusMessage
	tbl.headers = nocasetableModule(p1.Headers)
	tbl.content = p1.Body
	tbl.text = p1.Body
	tbl.headers["content-type"] = tbl.headers["content-type"] or "text/plain"
	tbl.from_cache = false
	local var7 = tbl.headers["content-type"]:split(";")
	tbl.content_type = var7[1]:lower()
	tbl.encoding = if var7[2] then var7[2]:split("=")[2] else ""
	tbl.content_length = #tbl.text
	tbl.cookies = cookiesModule.new()
	
	if tbl.headers["set-cookie"] then
		tbl.cookies:SetCookie(tbl.headers["set-cookie"])
	end
	return tbl
end

function t.expand(_) --[[ line: 68 ]] end

function t:__tostring() --[[ line: 70 ]]
	return self.text
end

function t:json() --[[ line: 74 ]]
	-- upvalues: jsonModule (ref)
	local ok, status = pcall(function() --[[ line: 77 ]]
		-- upvalues: jsonModule (copy), self (ref)
		return jsonModule.dec(self.text)
	end)
	
	if not ok then
		error(("[http] Failed to convert response content to JSON:\n%s"):format(self.text))
	end
	return status
end

function t:html(p3) --[[ line: 88 ]]
	-- upvalues: list (ref), htmlModule (ref)
	if p3 or table.find(list, self.content_type) then
		return htmlModule.parse(self.text, 100000, tostring(self.url))
	end
	error("[http] Response is not specified as HTML.")
end

function t:xml(p4) --[[ line: 96 ]]
	-- upvalues: htmlModule (ref)
	if p4 or self.content_type:find("+xml") or self.content_type:find("/xml") then
		return htmlModule.parse(self.text, 100000)
	end
	error("[http] Response is not specified as XML.")
end

return t