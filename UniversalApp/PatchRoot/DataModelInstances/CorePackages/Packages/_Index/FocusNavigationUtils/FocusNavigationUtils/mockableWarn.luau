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