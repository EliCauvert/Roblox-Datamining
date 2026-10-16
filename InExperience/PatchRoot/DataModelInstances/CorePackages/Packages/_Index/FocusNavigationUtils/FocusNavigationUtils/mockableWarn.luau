local Callback = warn

return (setmetatable({
	mock = function(p1) --[[ Line: 4 ]]
		-- upvalues: Callback (ref)
		Callback = p1
	end,
	unmock = function() --[[ Line: 7 ]]
		-- upvalues: Callback (ref)
		Callback = warn
	end
}, {
	__call = function(_, ...) --[[ Line: 11 ]]
		-- upvalues: Callback (ref)
		Callback(...)
	end
}))