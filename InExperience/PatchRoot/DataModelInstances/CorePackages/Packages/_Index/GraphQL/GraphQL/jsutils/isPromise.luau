local promiseModule = require(script.Parent.Parent.Parent.Promise)

return {
	isPromise = function(p1)
		-- upvalues: promiseModule (ref)
		return promiseModule.is(p1)
	end
}