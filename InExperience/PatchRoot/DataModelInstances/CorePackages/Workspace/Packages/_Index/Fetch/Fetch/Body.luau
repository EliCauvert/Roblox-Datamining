local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local Module = {}
Module.__index = Module

function Module.new(Body) --[[ Line: 37 ]]
	-- upvalues: Module (copy)
	local t = {}
	
	if type(Body) == "string" then
		t.body = Body
	elseif Body == nil then
		t.body = nil
	else
		error(string.format("Expected string or nil as the first argument to Body.new(), but got: %s", (type(Body))))
	end
	t.bodyUsed = false
	setmetatable(t, Module)
	
	return t
end

function Module:arrayBuffer() --[[ Line: 53 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(_, Callback: (any) -> ()) --[[ Line: 54 ]]
		Callback("arrayBuffer not implemented")
	end)
end

function Module:blob() --[[ Line: 60 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(_, Callback: (any) -> ()) --[[ Line: 61 ]]
		Callback("blob not implemented")
	end)
end

function Module:formData() --[[ Line: 67 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(_, Callback: (any) -> ()) --[[ Line: 68 ]]
		Callback("formData not implemented")
	end)
end

function Module.json(p1) --[[ Line: 74 ]]
	-- upvalues: PromiseModule (copy), HttpService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 75 ]]
		-- upvalues: p1 (copy), HttpService (upval)
		if p1._json then
			Callback(p1._json)
			
			return
		end
		local Success, Result = pcall(function() --[[ Line: 81 ]]
			-- upvalues: HttpService (upval), p1 (upval)
			return HttpService:JSONDecode(p1.body)
		end)
		
		if Success then
			p1._json = Result
			Callback(Result)
			
			return
		else
			Callback1("Failed to decode response body as JSON. JSON decoding is only supported for Content-Type = application/json")
		end
	end)
end

function Module.text(p1) --[[ Line: 97 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 98 ]]
		-- upvalues: p1 (copy)
		Callback(p1.body or "")
	end)
end

return { Body = Module }