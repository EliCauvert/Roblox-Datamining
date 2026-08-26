local parent = script.Parent.Parent
local lib = parent.lib
local _ = parent.src
local httpService = game:GetService("HttpService")
local mimetypesModule = require(lib.mimetypes)
local b64Module = require(lib.b64)

local function randomString(p1)
	local var1 = ""
	
	for _ = 1, p1 do
		var1 ..= string.char(math.random(97, 122))
	end
	return var1
end

local t = {}
t.__index = t

function t.new(...)
	-- upvalues: t (ref), mimetypesModule (ref)
	local unknown = setmetatable({}, t)
	unknown.__IsFile = true
	unknown.name = "unknown"
	unknown.content = ""
	unknown.content_type = nil
	local list = { ... }
	
	if #list == 1 then
		unknown.content = list[1]
	elseif #list >= 2 then
		unknown.name = list[1]
		unknown.content = list[2]
		unknown.content_type = list[3]
	end
	if not unknown.content_type then
		local var2 = unknown.name:split(".")
		unknown.content_type = mimetypesModule[var2[#var2]:lower()] or "text/plain"
	end
	if type(unknown.content) ~= "string" then
		error(("[http] Invalid file content for file %s"):format(unknown.name))
	end
	return unknown
end

function t:__tostring()
	return ("File('%s', '%s')"):format(self.name, self.content_type)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p2)
	-- upvalues: t_1 (ref), randomString (ref)
	local tbl = setmetatable({}, t_1)
	tbl.__FormData = true
	p2 = p2 or {}
	tbl.boundary = "--FormBoundary-" .. randomString(28)
	tbl.content_type = "application/x-www-form-urlencoded"
	tbl.fields = {}
	
	for i, v in pairs(p2) do
		tbl:AddField(i, v)
	end
	return tbl
end

function t_1:AddField(p3, p4)
	if p4.__IsFile then
		self.content_type = "multipart/form-data; boundary=\"" .. self.boundary .. "\""
	end
	table.insert(self.fields, { Name = p3, Value = p4 })
end

function t_1:build()
	-- upvalues: httpService (ref), b64Module (ref)
	local var2 = ""
	
	if self.content_type == "application/x-www-form-urlencoded" then
		for i, v in ipairs(self.fields) do
			if v.Value.__IsFile then
				error("[http] URL encoded forms cannot contain any files")
			end
			if v.Name:find("=") or v.Name:find("&") then
				error("[http] Form field names must not contain '=' or '&'")
			end
			if type(v.Value) == "table" then
				for i_1, v_1 in ipairs(v.Value) do
					if #var2 > 0 then
						var2 ..= "&"
					end
					var2 ..= v.Name .. "=" .. httpService:UrlEncode(v_1)
				end
			elseif #var2 > 0 then
				var2 ..= "&"
			end
			var2 ..= v.Name .. "=" .. httpService:UrlEncode(v.Value)
		end
		return var2
	else
		for i, v in pairs(self.fields) do
			local value = v.Value
			var2 = (var2 .. "--" .. self.boundary .. "\r\n") .. ("Content-Disposition: form-data; name=\"%s\""):format(v.Name)
			
			if v.Value.__IsFile then
				value = v.Value.content
				var2 = (var2 .. ("; filename=\"%s\""):format(v.Value.name)) .. "\r\nContent-Type: " .. v.Value.content_type
				
				if v.Value.content_type:sub(1, 5) ~= "text/" then
					value = b64Module.encode(value)
					var2 ..= "\r\nContent-Transfer-Encoding: base64"
				end
			end
			var2 ..= "\r\n\r\n" .. value .. "\r\n"
		end
		return var2 .. "--" .. self.boundary .. "--"
	end
end

return { FormData = t_1, File = t }