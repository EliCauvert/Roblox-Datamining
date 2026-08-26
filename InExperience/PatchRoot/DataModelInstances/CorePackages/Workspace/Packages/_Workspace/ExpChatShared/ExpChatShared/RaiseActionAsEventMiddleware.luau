local actionBindableEventModule = require(script.Parent.ActionBindableEvent)

return function(p1, _)
	-- upvalues: actionBindableEventModule (ref)
	return function(p2)
		-- upvalues: actionBindableEventModule (copy), p1 (ref)
		actionBindableEventModule:Fire(p2)
		p1(p2)
	end
end