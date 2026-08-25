local actionBindableEventModule = require(script.Parent.ActionBindableEvent)

return function(p0, _)
	-- upvalues: actionBindableEventModule (ref)
	return function(p1)
		-- upvalues: actionBindableEventModule (copy), p0 (ref)
		actionBindableEventModule:Fire(p1)
		p0(p1)
	end
end