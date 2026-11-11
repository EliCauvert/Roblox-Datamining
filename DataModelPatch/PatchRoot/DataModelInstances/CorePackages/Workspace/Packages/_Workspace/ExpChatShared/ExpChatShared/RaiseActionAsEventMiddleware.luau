local ActionBindableEventModule = require(script.Parent.ActionBindableEvent)

return function(Callback, _)
	-- upvalues: ActionBindableEventModule (copy)
	return function(p1)
		-- upvalues: ActionBindableEventModule (upval), Callback (copy)
		ActionBindableEventModule:Fire(p1)
		Callback(p1)
	end
end