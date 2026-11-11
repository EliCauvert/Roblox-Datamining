local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local config = {
	runAfterInteractions = function(_, Callback: () -> ())
		Callback()
		
		return nil
	end
}
local BatchinatorModule = {}
BatchinatorModule.__index = BatchinatorModule

function BatchinatorModule.new(_callback, _delay)
	-- upvalues: BatchinatorModule (copy)
	local self = setmetatable({}, BatchinatorModule)
	self._delay = _delay
	self._callback = _callback
	
	return self
end

function BatchinatorModule:dispose(p1)
	local Config = if p1 then p1 else { abort = false }
	
	if self._taskHandle then
		self._taskHandle.cancel()
		
		if not Config.abort then
			self._callback()
		end
		self._taskHandle = nil
	end
end

function BatchinatorModule:schedule()
	-- upvalues: SetTimeoutFunction (copy), config (copy), ClearTimeoutFunction (copy)
	if not self._taskHandle then
		local SetTimeoutResult = SetTimeoutFunction(function()
			-- upvalues: self (copy), config (upval)
			self._taskHandle = config:runAfterInteractions(function()
				-- upvalues: self (upval)
				self._taskHandle = nil
				self._callback()
			end)
		end, self._delay)
		self._taskHandle = {
			cancel = function()
				-- upvalues: ClearTimeoutFunction (upval), SetTimeoutResult (copy)
				return ClearTimeoutFunction(SetTimeoutResult)
			end
		}
		
		return
	end
end

return BatchinatorModule