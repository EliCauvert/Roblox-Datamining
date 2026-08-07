local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 37 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if type(p0) == "string" then
		t_1.body = p0
	elseif p0 == nil then
		t_1.body = nil
	else
		error(string.format("Expected string or nil as the first argument to Body.new(), but got: %s", type(p0)))
	end
	t_1.bodyUsed = false
	setmetatable(t_1, t)
	
	return t_1
end

function t.arrayBuffer(_) --[[ line: 53 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p1) --[[ line: 54 ]]
		p1("arrayBuffer not implemented")
	end)
end

function t.blob(_) --[[ line: 60 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p2) --[[ line: 61 ]]
		p2("blob not implemented")
	end)
end

function t.formData(_) --[[ line: 67 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(_, p3) --[[ line: 68 ]]
		p3("formData not implemented")
	end)
end

function t.json(p4) --[[ line: 74 ]]
	-- upvalues: promiseModule (ref), httpService (ref)
	return promiseModule.new(function(p5, p6) --[[ line: 75 ]]
		-- upvalues: p4 (ref), httpService (copy)
		if p4._json then
			p5(p4._json)
			
			return
		end
		local ok, status = pcall(function() --[[ line: 81 ]]
			-- upvalues: httpService (copy), p4 (copy)
			return httpService:JSONDecode(p4.body)
		end)
		
		if ok then
			p4._json = status
			p5(status)
			
			return
		end
		p6("Failed to decode response body as JSON. JSON decoding is only supported for Content-Type = application/json")
	end)
end

function t.text(p7) --[[ line: 97 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p8, _) --[[ line: 98 ]]
		-- upvalues: p7 (ref)
		p8(p7.body or "")
	end)
end

return { Body = t }