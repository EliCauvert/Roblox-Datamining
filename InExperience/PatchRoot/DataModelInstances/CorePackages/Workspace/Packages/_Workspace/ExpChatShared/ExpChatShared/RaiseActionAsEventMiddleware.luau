local actionBindableEventModule = require(script.Parent.ActionBindableEvent)

return function(p0, _) --[[ line: 3 ]]
	-- upvalues: actionBindableEventModule (ref)
	return function(p1) --[[ line: 4 ]]
		-- upvalues: actionBindableEventModule (copy), p0 (ref)
		actionBindableEventModule:Fire(p1)
		p0(p1)
	end
end