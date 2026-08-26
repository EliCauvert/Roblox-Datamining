local _ = require(script.Parent.Parent.Parent.ES7Types)
local t = {}
t.__index = t

function t:__tostring()
	-- upvalues: t (ref)
	return getmetatable(t).__tostring(self)
end

local function _(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p1 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p1 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.captureStackTrace(p1, p2)
	-- upvalues: t (ref)
	t.__captureStackTrace(p1, 3, p2)
end

function t:__captureStackTrace(p1, p2)
	-- upvalues: t (ref)
	if typeof(p2) == "function" then
		local trac = debug.traceback(nil, p1)
		local matchIndex = string.find(trac, string.gsub(debug.info(p2, "s"), "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. debug.info(p2, "n"))
		local var1 = nil
		
		if matchIndex ~= nil then
			local matchIndex_1, matchIndex_2 = string.find(trac, "\n", matchIndex + 1)
			matchIndex = matchIndex_1
			var1 = matchIndex_2
		end
		if var1 ~= nil then
			trac = string.sub(trac, var1 + 1)
		end
		self.__stack = trac
	else
		self.__stack = debug.traceback(nil, p1)
	end
	t.__recalculateStacktrace(self)
end

function t:__recalculateStacktrace()
	local message = self.message
	self.stack = ((self.name or "Error") .. (if message == nil or message == "" then "" else ": " .. message)) .. "\n" .. (if self.__stack then self.__stack else "")
end

return setmetatable(t, {
	__call = function(_, ...)
		-- upvalues: t (ref)
		local tbl = setmetatable({ name = "Error", message = ... or "" }, t)
		t.__captureStackTrace(tbl, 4)
		
		return tbl
	end,
	__tostring = function(p1)
		return if p1.name == nil then tostring("Error") elseif p1.message and p1.message ~= "" then string.format("%s: %s", tostring(p1.name), tostring(p1.message)) else tostring(p1.name)
	end
})