local promiseModule = require(script.Parent.Parent.Parent.Promise)

return function()
	-- upvalues: promiseModule (ref)
	return promiseModule.defer(function(p0)
		p0(nil)
	end)
end