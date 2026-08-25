local _ = require(script.Parent.Parent.Parent.ES7Types)
local t = {}
t.__index = t

function t:__tostring()
	-- upvalues: t (ref)
	return getmetatable(t).__tostring(self)
end

local function _(p0)
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p0 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p1 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.captureStackTrace(p2, p3)
	-- upvalues: t (ref)
	t.__captureStackTrace(p2, 3, p3)
end

function t:__captureStackTrace(p4, p5)
	-- upvalues: t (ref)
	if typeof(p5) == "function" then
		local trac = debug.traceback(nil, p4)
		local matchIndex = string.find(trac, string.gsub(debug.info(p5, "s"), "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. debug.info(p5, "n"))
		local var5 = nil
		
		if matchIndex ~= nil then
			local matchIndex_1, matchIndex_2 = string.find(trac, "\n", matchIndex + 1)
			matchIndex = matchIndex_1
			var5 = matchIndex_2
		end
		if var5 ~= nil then
			trac = string.sub(trac, var5 + 1)
		end
		self.__stack = trac
	else
		self.__stack = debug.traceback(nil, p4)
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
	__tostring = function(p6)
		return if p6.name == nil then tostring("Error") elseif p6.message and p6.message ~= "" then string.format("%s: %s", tostring(p6.name), tostring(p6.message)) else tostring(p6.name)
	end
})