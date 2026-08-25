local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local t = {
	runAfterInteractions = function(_, p0)
		p0()
		
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

function t_1:dispose(p3)
	local var4 = p3 or { abort = false }
	
	if self._taskHandle then
		self._taskHandle.cancel()
		
		if not var4.abort then
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
	local var5 = setTimeout(function()
		-- upvalues: self (ref), t (copy)
		self._taskHandle = t:runAfterInteractions(function()
			-- upvalues: self (copy)
			self._taskHandle = nil
			self._callback()
		end)
	end, self._delay)
	self._taskHandle = {
		cancel = function()
			-- upvalues: clearTimeout (copy), var5 (ref)
			return clearTimeout(var5)
		end
	}
end

return t_1