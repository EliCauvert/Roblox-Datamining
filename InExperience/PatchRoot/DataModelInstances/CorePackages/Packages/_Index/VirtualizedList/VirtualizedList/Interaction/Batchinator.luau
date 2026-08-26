local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local t = {
	runAfterInteractions = function(_, p1)
		p1()
		
		return nil
	end
}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl._delay = p2
	tbl._callback = p1
	
	return tbl
end

function t_1:dispose(p1)
	local var1 = p1 or { abort = false }
	
	if self._taskHandle then
		self._taskHandle.cancel()
		
		if not var1.abort then
			self._callback()
		end
		self._taskHandle = nil
	end
end

function t_1:schedule()
	-- upvalues: setTimeout (ref), t (ref), clearTimeout (ref)
	if self._taskHandle then
		return
	end
	local var1 = setTimeout(function()
		-- upvalues: self (ref), t (copy)
		self._taskHandle = t:runAfterInteractions(function()
			-- upvalues: self (copy)
			self._taskHandle = nil
			self._callback()
		end)
	end, self._delay)
	self._taskHandle = {
		cancel = function()
			-- upvalues: clearTimeout (copy), var1 (ref)
			return clearTimeout(var1)
		end
	}
end

return t_1