local Parent = script.Parent.Parent
local Lib = Parent.lib
local _ = Parent.src
local HttpService = game:GetService("HttpService")
local MimetypesModule = require(Lib.mimetypes)
local B64Module = require(Lib.b64)

local function randomString(p1): string --[[ Line: 16 ]]
	local Text = ""
	
	for _ = 1, p1 do
		Text ..= string.char(math.random(97, 122))
	end
	return Text
end

local Module = {}
Module.__index = Module

function Module.new(...) --[[ Line: 30 ]]
	-- upvalues: Module (copy), MimetypesModule (copy)
	local self = setmetatable({}, Module)
	self.__IsFile = true
	self.name = "unknown"
	self.content = ""
	self.content_type = nil
	local list = { ... }
	
	if #list == 1 then
		self.content = list[1]
	elseif #list >= 2 then
		self.name = list[1]
		self.content = list[2]
		self.content_type = list[3]
	end
	if not self.content_type then
		local v1 = self.name:split(".")
		self.content_type = MimetypesModule[v1[#v1]:lower()] or "text/plain"
	end
	if type(self.content) ~= "string" then
		error(("[http] Invalid file content for file %s"):format(self.name))
	end
	return self
end

function Module:__tostring(): string --[[ Line: 71 ]]
	return ("File('%s', '%s')"):format(self.name, self.content_type)
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(p2) --[[ Line: 79 ]]
	-- upvalues: Module1 (copy), randomString (copy)
	local self = setmetatable({}, Module1)
	self.__FormData = true
	local P2 = p2 or {}
	self.boundary = "--FormBoundary-" .. randomString(28)
	self.content_type = "application/x-www-form-urlencoded"
	self.fields = {}
	
	for i, value in pairs(P2) do
		self:AddField(i, value)
	end
	return self
end

function Module1:AddField(Name, Value) --[[ Line: 96 ]]
	if Value.__IsFile then
		self.content_type = "multipart/form-data; boundary=\"" .. self.boundary .. "\""
	end
	table.insert(self.fields, { Name = Name, Value = Value })
end

function Module1:build(): string --[[ Line: 108 ]]
	-- upvalues: HttpService (copy), B64Module (copy)
	local Text = ""
	
	if self.content_type == "application/x-www-form-urlencoded" then
		for _, field in ipairs(self.fields) do
			if field.Value.__IsFile then
				error("[http] URL encoded forms cannot contain any files")
			end
			if field.Name:find("=") or field.Name:find("&") then
				error("[http] Form field names must not contain '=' or '&'")
			end
			if type(field.Value) == "table" then
				for _, value in ipairs(field.Value) do
					if #Text > 0 then
						Text ..= "&"
					end
					Text ..= field.Name .. "=" .. HttpService:UrlEncode(value)
				end
			else
				if #Text > 0 then
					Text ..= "&"
				end
				Text ..= field.Name .. "=" .. HttpService:UrlEncode(field.Value)
			end
		end
		return Text
	else
		for _, field1 in pairs(self.fields) do
			local Value = field1.Value
			local Text1 = (Text .. "--" .. self.boundary .. "\r\n") .. ("Content-Disposition: form-data; name=\"%s\""):format(field1.Name)
			
			if field1.Value.__IsFile then
				Value = field1.Value.content
				Text1 = (Text1 .. ("; filename=\"%s\""):format(field1.Value.name)) .. "\r\nContent-Type: " .. field1.Value.content_type
				
				if field1.Value.content_type:sub(1, 5) ~= "text/" then
					Value = B64Module.encode(Value)
					Text1 ..= "\r\nContent-Transfer-Encoding: base64"
				end
			end
			Text = Text1 .. "\r\n\r\n" .. Value .. "\r\n"
		end
		return Text .. "--" .. self.boundary .. "--"
	end
end

return { FormData = Module1, File = Module }