-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local _warn = warn

return setmetatable({
	mock = function(p0) --[[ line: 4 ]]
		-- upvalues: _warn (write)
		_warn = p0
	end,
	unmock = function() --[[ line: 7 ]]
		-- upvalues: _warn (write)
		_warn = warn
	end
}, {
	__call = function(_, ...) --[[ line: 11 ]]
		-- upvalues: _warn (write)
		_warn(...)
	end
})