local _warn = warn

return setmetatable({
	mock = function(p1)
		-- upvalues: _warn (write)
		_warn = p1
	end,
	unmock = function()
		-- upvalues: _warn (write)
		_warn = warn
	end
}, {
	__call = function(_, ...)
		-- upvalues: _warn (write)
		_warn(...)
	end
})