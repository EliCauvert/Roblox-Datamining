local promiseModule = require(script.Parent.Parent.Parent.Promise)

return function()
	-- upvalues: promiseModule (ref)
	return promiseModule.defer(function(p1)
		p1(nil)
	end)
end