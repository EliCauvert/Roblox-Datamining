local promiseModule = require(script.Parent.Parent.Parent.Promise)

return {
	isPromise = function(p0)
		-- upvalues: promiseModule (ref)
		return promiseModule.is(p0)
	end
}