-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local immutableModule = require(script:FindFirstAncestor("MomentsCommon").Utils.Immutable)
local t = {}
t.__index = t

function t.new() --[[ line: 32 ]]
	-- upvalues: t (ref)
	local t_1 = { _listeners = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:connect(p0) --[[ line: 42 ]]
	-- upvalues: immutableModule (ref)
	local t = { isConnected = true, callback = p0 }
	self._listeners = immutableModule.Append(self._listeners, t)
	
	return {
		disconnect = function() --[[ line: 49 ]]
			-- upvalues: t (ref), self (ref), immutableModule (copy)
			t.isConnected = false
			self._listeners = immutableModule.RemoveValueFromList(self._listeners, t)
		end
	}
end

function t:fire(...) --[[ line: 59 ]]
	for i, v in ipairs(self._listeners) do
		if v.isConnected then
			v.callback(...)
		end
	end
end

return t