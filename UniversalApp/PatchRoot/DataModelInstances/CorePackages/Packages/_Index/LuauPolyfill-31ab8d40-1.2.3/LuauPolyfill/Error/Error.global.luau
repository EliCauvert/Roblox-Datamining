local _ = require(script.Parent.Parent.Parent.ES7Types)
local Module = {}
Module.__index = Module

function Module.__tostring(p1) --[[ Line: 29 ]]
	-- upvalues: Module (copy)
	return getmetatable(Module).__tostring(p1)
end

local function _(p1) --[[ Line: 35 | Named "__createError" ]]
	-- upvalues: Module (copy)
	local self = setmetatable({ name = "Error", message = p1 or "" }, Module)
	Module.__captureStackTrace(self, 4)
	
	return self
end

function Module.new(p1) --[[ Line: 44 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({ name = "Error", message = p1 or "" }, Module)
	Module.__captureStackTrace(self, 4)
	
	return self
end

function Module.captureStackTrace(p1, p2) --[[ Line: 48 ]]
	-- upvalues: Module (copy)
	Module.__captureStackTrace(p1, 3, p2)
end

function Module:__captureStackTrace(p1, p2) --[[ Line: 52 ]]
	-- upvalues: Module (copy)
	if typeof(p2) == "function" then
		local Traceback = debug.traceback(nil, p1)
		local FoundAt: number? = string.find(Traceback, string.gsub(debug.info(p2, "s"), "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. debug.info(p2, "n"))
		local v1: number? = nil
		
		if FoundAt ~= nil then
			local _
			_, v7 = string.find(Traceback, "\n", FoundAt + 1)
		end
		if v1 ~= nil then
			Traceback = string.sub(Traceback, v1 + 1)
		end
		self.__stack = Traceback
	else
		self.__stack = debug.traceback(nil, p1)
	end
	Module.__recalculateStacktrace(self)
end

function Module:__recalculateStacktrace() --[[ Line: 76 ]]
	local Message = self.message
	self.stack = ((self.name or "Error") .. (if Message == nil or Message == "" then "" else ": " .. Message)) .. "\n" .. (if self.__stack then self.__stack else "")
end

return (setmetatable(Module, {
	__call = function(_, ...) --[[ Line: 88 ]]
		-- upvalues: Module (copy)
		local self = setmetatable({ name = "Error", message = (...) or "" }, Module)
		Module.__captureStackTrace(self, 4)
		
		return self
	end,
	__tostring = function(p1): string --[[ Line: 91 ]]
		return if p1.name == nil then tostring("Error") elseif p1.message and p1.message ~= "" then string.format("%s: %s", tostring(p1.name), (tostring(p1.message))) else tostring(p1.name)
	end
}))