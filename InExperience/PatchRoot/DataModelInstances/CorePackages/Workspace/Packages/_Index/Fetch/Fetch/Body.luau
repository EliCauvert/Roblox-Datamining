local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	
	if type(p1) == "string" then
		t_1.body = p1
	elseif p1 == nil then
		t_1.body = nil
	else
		error(string.format("Expected string or nil as the first argument to Body.new(), but got: %s", type(p1)))
	end
	t_1.bodyUsed = false
	setmetatable(t_1, t)
	
	return t_1
end

function t.arrayBuffer(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p1)
		p1("arrayBuffer not implemented")
	end)
end

function t.blob(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p1)
		p1("blob not implemented")
	end)
end

function t.formData(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p1)
		p1("formData not implemented")
	end)
end

function t.json(p1)
	-- upvalues: promiseModule (ref), httpService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), httpService (copy)
		if p1._json then
			p2(p1._json)
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (copy)
			return httpService:JSONDecode(p1.body)
		end)
		
		if ok then
			p1._json = status
			p2(status)
			
			return
		end
		p3("Failed to decode response body as JSON. JSON decoding is only supported for Content-Type = application/json")
	end)
end

function t.text(p1)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p2, _)
		-- upvalues: p1 (ref)
		p2(p1.body or "")
	end)
end

return { Body = t }