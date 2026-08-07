-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:44 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.ES7Types)
local t = {}
t.__index = t

function t:__tostring() --[[ line: 29 ]]
	-- upvalues: t (ref)
	return getmetatable(t).__tostring(self)
end

local function _(p0) --[[ line: 35 | named "__createError" ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p0 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.new(p1) --[[ line: 44 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({ name = "Error", message = p1 or "" }, t)
	t.__captureStackTrace(tbl, 4)
	
	return tbl
end

function t.captureStackTrace(p2, p3) --[[ line: 48 ]]
	-- upvalues: t (ref)
	t.__captureStackTrace(p2, 3, p3)
end

function t:__captureStackTrace(p4, p5) --[[ line: 52 ]]
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

function t:__recalculateStacktrace() --[[ line: 76 ]]
	local message = self.message
	self.stack = ((self.name or "Error") .. (if message == nil or message == "" then "" else ": " .. message)) .. "\n" .. (if self.__stack then self.__stack else "")
end

return setmetatable(t, {
	__call = function(_, ...) --[[ line: 88 ]]
		-- upvalues: t (ref)
		local tbl = setmetatable({ name = "Error", message = ... or "" }, t)
		t.__captureStackTrace(tbl, 4)
		
		return tbl
	end,
	__tostring = function(p6) --[[ line: 91 ]]
		return if p6.name == nil then tostring("Error") elseif p6.message and p6.message ~= "" then string.format("%s: %s", tostring(p6.name), tostring(p6.message)) else tostring(p6.name)
	end
})