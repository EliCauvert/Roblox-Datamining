local Parent = script.Parent.Parent
local Lib = Parent.lib
local Src = Parent.src
local NocasetableModule = require(Lib.nocasetable)
local HtmlModule = require(Lib.html)
local JsonModule = require(Src.json)
local CookiesModule = require(Src.cookies)
local List = { "text/html", "application/xhtml+xml" }
local ResponseModule = {}
ResponseModule.__index = ResponseModule

function ResponseModule.new(Request, p1, Response_time)
	-- upvalues: ResponseModule (copy), NocasetableModule (copy), CookiesModule (copy)
	local self = setmetatable({}, ResponseModule)
	self.request = Request
	self.response_time = Response_time
	self.timestamp = self.request.timestamp
	self.url = Request.url
	self.method = Request.method
	self.code = p1.StatusCode
	self.status_code = p1.StatusCode
	self.success = p1.Success
	self.ok = self.status_code >= 200 and self.status_code < 300
	self.message = p1.StatusMessage
	self.headers = NocasetableModule(p1.Headers)
	self.content = p1.Body
	self.text = p1.Body
	self.headers["content-type"] = self.headers["content-type"] or "text/plain"
	self.from_cache = false
	local v1 = self.headers["content-type"]:split(";")
	self.content_type = v1[1]:lower()
	self.encoding = v1[2] and v1[2]:split("=")[2] or ""
	self.content_length = #self.text
	self.cookies = CookiesModule.new()
	
	if self.headers["set-cookie"] then
		self.cookies:SetCookie(self.headers["set-cookie"])
	end
	return self
end

function ResponseModule:expand() end

function ResponseModule:__tostring()
	return self.text
end

function ResponseModule:json()
	-- upvalues: JsonModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: JsonModule (upval), self (copy)
		return JsonModule.dec(self.text)
	end)
	
	if not Success then
		error(("[http] Failed to convert response content to JSON:\n%s"):format(self.text))
	end
	return Result
end

function ResponseModule:html(p1)
	-- upvalues: List (copy), HtmlModule (copy)
	if p1 or table.find(List, self.content_type) then
		return HtmlModule.parse(self.text, 100000, (tostring(self.url)))
	else
		error("[http] Response is not specified as HTML.")
	end
end

function ResponseModule:xml(p1)
	-- upvalues: HtmlModule (copy)
	if p1 or self.content_type:find("+xml") or self.content_type:find("/xml") then
		return HtmlModule.parse(self.text, 100000)
	else
		error("[http] Response is not specified as XML.")
	end
end

return ResponseModule