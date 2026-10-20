local Callback = warn

return (setmetatable({
	mock = function(p1)
		-- upvalues: Callback (ref)
		Callback = p1
	end,
	unmock = function()
		-- upvalues: Callback (ref)
		Callback = warn
	end
}, {
	__call = function(_, ...)
		-- upvalues: Callback (ref)
		Callback(...)
	end
}))